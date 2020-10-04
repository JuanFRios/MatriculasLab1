/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udea.controller;

import com.udea.ejb.MateriaFacadeLocal;
import com.udea.ejb.MatriculaFacadeLocal;
import com.udea.modelo.Estudiante;
import com.udea.modelo.Materia;
import com.udea.modelo.Matricula;
import com.udea.modelo.MatriculaPK;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
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
public class MatriculaServlet extends HttpServlet {

    @EJB
    private MateriaFacadeLocal materiaFacade;

    @EJB
    private MatriculaFacadeLocal matriculaFacade;

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
            String action = request.getParameter("action");
            String url = "matricula.jsp";
            if (action.equals("listar")) {
                Estudiante e = (Estudiante) request.getSession().getAttribute("login");
                
                List<Materia> materias = acualizarMatricula(e.getId());
                request.getSession().setAttribute("materias", materias);
                List<Materia> oferta = materiaFacade.findAll();
                request.getSession().setAttribute("oferta", oferta);
                url = "matricula.jsp";
            } else if (action.equals("oferta")) {
                url = "oferta.jsp";
            } else if (action.equals("cancelar")) {
                String codigoString = request.getParameter("codigo");
                int codigo = Integer.parseInt(codigoString);
                Estudiante e = (Estudiante) request.getSession().getAttribute("login");
                MatriculaPK id = new MatriculaPK(e.getId(), codigo);
                matriculaFacade.remove(matriculaFacade.find(id));
                List<Materia> materias = acualizarMatricula(e.getId());
                request.getSession().setAttribute("materias", materias);
                List<Materia> oferta = materiaFacade.findAll();
                request.getSession().setAttribute("oferta", oferta);
                url = "oferta.jsp";
            }else if (action.equals("matricular")){
                String codigoString = request.getParameter("codigo");
                int codigo = Integer.parseInt(codigoString);
                Estudiante e = (Estudiante) request.getSession().getAttribute("login");
                Matricula matricula = new Matricula(e.getId(), codigo);
                matricula.setSemestre("2020-2");
                matriculaFacade.create(matricula);
                List<Materia> materias = acualizarMatricula(e.getId());
                request.getSession().setAttribute("materias", materias);
                List<Materia> oferta = materiaFacade.findAll();
                request.getSession().setAttribute("oferta", oferta);
                url = "oferta.jsp";
            }

            response.sendRedirect(url);
        } finally {
            out.close();
        }
    }

    private List acualizarMatricula(int id) {
        List<Matricula> matricula = matriculaFacade.listarPorEstudiante(id);
        Iterator iter = matricula.iterator();
        List<Materia> materias = new ArrayList<>();
        Materia materia;
        Matricula m;
        while (iter.hasNext()) {
            m = (Matricula) iter.next();
            materia = materiaFacade.find(m.getMatriculaPK().getCodigoMateria());
            materias.add(materia);
        }        
        return materias;
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
