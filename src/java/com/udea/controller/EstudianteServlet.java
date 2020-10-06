/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udea.controller;

import com.udea.ejb.EstudianteFacadeLocal;
import com.udea.ejb.MateriaFacadeLocal;
import com.udea.ejb.MatriculaFacadeLocal;
import com.udea.modelo.Estudiante;
import com.udea.modelo.Materia;
import com.udea.modelo.Matricula;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author juan
 */
@MultipartConfig
public class EstudianteServlet extends HttpServlet {

    @EJB
    private MatriculaFacadeLocal matriculaFacade;

    @EJB
    private MateriaFacadeLocal materiaFacade;

    @EJB
    private EstudianteFacadeLocal estudianteFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        try {
            String action = request.getParameter("action");
            String url = "index.jsp";

            if ("list".equals(action)) {
                List<Estudiante> findAll = estudianteFacade.findAll();
                request.getSession().setAttribute("accounts", findAll);
                url = "listAccounts.jsp";
            } else if ("login".equals(action)) {
                String u = request.getParameter("username");
                String p = request.getParameter("password");
                System.out.println("tomaparamerr");
                boolean checklogin = estudianteFacade.checkLogin(Integer.parseInt(u), p);
                if (checklogin) {
                    Estudiante est = estudianteFacade.find(Integer.parseInt(u));
                    request.getSession().setAttribute("login", est);
                    url = "principal.jsp";
                } else {
                    url = "login.jsp?error=1";
                }
            } else if ("insert".equals(action)) {
                Estudiante a = new Estudiante();
                a.setId(Integer.parseInt(request.getParameter("id")));
                a.setNombre(request.getParameter("username"));
                a.setContrasena(request.getParameter("password"));
                a.setCorreo(request.getParameter("email"));
                a.setImagen("img/nopicture.png");
                if (estudianteFacade.find(a.getId()) != null) {
                    url = "nuevaCuenta.jsp?err=1";
                } else {
                    estudianteFacade.create(a);
                    url = "login.jsp";
                }

            } else if ("delete".equals(action)) {
                String id = request.getParameter("id");
                Estudiante a = estudianteFacade.find(Integer.valueOf(id));
                estudianteFacade.remove(a);
                url = "EstudianteServlet?action=list";

            } else if ("logout".equals(action)) {
                request.getSession().removeAttribute("login");
                url = "login.jsp";

            } else if ("editar".equals(action)) {
                int id = Integer.parseInt(request.getParameter("txtId"));
                String nombre = request.getParameter("txtNombre");
                String correo = request.getParameter("txtCorreo");
                String contrasena = request.getParameter("txtContrasena");
                //  Upload photo
                boolean succs, notEmpty = false;
                Estudiante a = estudianteFacade.find(id);

                if (request.getPart("imgPhoto").getSize() > 0) {
                    notEmpty = true;
                    Part filePart = request.getPart("imgPhoto");

                    String photoExt = getExt(filePart.getSubmittedFileName());
                    String photoName = "photo" + Integer.toString(id) + "." + photoExt;
                    String photoPath = getServletContext().getRealPath("/" + "img" + File.separator);

                    succs = uploadPhoto(filePart, photoPath, photoName);

                    a.setImagen("img" + File.separator + photoName);
                }
                a.setContrasena(contrasena);
                a.setNombre(nombre);
                a.setCorreo(correo);
                request.getSession().removeAttribute("login");
                estudianteFacade.edit(a);
                request.getSession().setAttribute("login", a);
                url = "principal.jsp";
            } else if ("Buscar".equals(action)) {
                String idString = request.getParameter("id");
                if (!idString.equals("")) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Estudiante e = estudianteFacade.find(id);
                    if (e != null) {
                        request.getSession().setAttribute("estudiante", e);
                        List<Matricula> matricula = matriculaFacade.listarPorEstudiante(e.getId());
                        Iterator iter = matricula.iterator();
                        List<Materia> materias = new ArrayList<>();
                        Materia materia;
                        Matricula m = null;
                        while (iter.hasNext()) {
                            m = (Matricula) iter.next();
                            materia = materiaFacade.find(m.getMatriculaPK().getCodigoMateria());
                            materias.add(materia);
                            System.out.println(materia.getNombre());
                        }
                        if (!materias.isEmpty()) {
                            request.getSession().setAttribute("materias", materias);
                            
                        } else {
                            url = "index.jsp?banderita=1";
                        }
                    } else {
                        request.getSession().removeAttribute("estudiante");
                        url = "index.jsp?bandera=1";
                    }
                } else {
                    url = "index.jsp";
                }
            }
            response.sendRedirect(url);
        } finally {
            writer.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private boolean uploadPhoto(Part filePart, String photoPath, String photoName) throws IOException {

        boolean exit;

        InputStream filecontent = null;
        OutputStream outs = null;

        try {
            outs = new FileOutputStream(new File(photoPath + File.separator + photoName));
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                outs.write(bytes, 0, read);
            }

            exit = true;

        } catch (FileNotFoundException fne) {
            exit = false;
        } finally {
            if (outs != null) {
                outs.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }
        }
        return exit;
    }

    private String getExt(String nombreArchivo) {
        String extension = "";
        int i = nombreArchivo.lastIndexOf('.');
        if (i > 0) {
            extension = nombreArchivo.substring(i + 1);
        }
        return extension;
    }

}
