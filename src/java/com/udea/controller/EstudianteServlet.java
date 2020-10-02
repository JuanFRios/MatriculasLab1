/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udea.controller;

import com.udea.ejb.EstudianteFacadeLocal;
import com.udea.modelo.Estudiante;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author juan
 */
public class EstudianteServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
        try {
            String action= request.getParameter("action");
            String url= "index.jsp";
            if("list".equals(action)){
                List<Estudiante> findAll= estudianteFacade.findAll();
                request.getSession().setAttribute("accounts", findAll);
                url="listAccounts.jsp";
            }else if("login".equals(action)){
                String u = request.getParameter("username");
                String p = request.getParameter("password");
                System.out.println("tomaparamerr");
                boolean checklogin = estudianteFacade.checkLogin(Integer.parseInt(u), p);
                if(checklogin){
                    Estudiante est = estudianteFacade.find(Integer.parseInt(u));
                    request.getSession().setAttribute("login", est);
                    url="principal.jsp";
                }else{
                    url = "login.jsp?error=1";
                }
            }else if("insert".equals(action)){
                Estudiante a = new Estudiante();
                a.setId(Integer.parseInt(request.getParameter("id")));
                a.setNombre(request.getParameter("username"));
                a.setContrasena(request.getParameter("password"));
                a.setCorreo(request.getParameter("email"));
                estudianteFacade.create(a);
                url = "login.jsp";
                
            }else if("delete".equals(action)){
                String id = request.getParameter("id");
                Estudiante a = estudianteFacade.find(Integer.valueOf(id));
                estudianteFacade.remove(a);
                url="EstudianteServlet?action=list";
            }else if("logout".equals(action)){
                request.getSession().removeAttribute("login");
                url= "login.jsp";
            }else if("editar".equals(action)){
                int id = Integer.parseInt(request.getParameter("txtId"));
                String nombre = request.getParameter("txtNombre");
                String correo = request.getParameter("txtCorreo");
                String contrasena = request.getParameter("txtContrasena");
                Estudiante a = estudianteFacade.find(id);
                
            }
            
            response.sendRedirect(url);
            
        } finally{
            out.close();
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

}
