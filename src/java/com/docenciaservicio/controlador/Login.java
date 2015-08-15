/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.controlador;

import com.docenciaservicio.entidades.Cuestionario;
import com.docenciaservicio.entidades.Estudiante;
import com.docenciaservicio.sessionbeans.FuenteFacade;
import com.docenciaservicio.entidades.Fuente;
import com.docenciaservicio.sessionbeans.CuestionarioFacade;
import com.docenciaservicio.sessionbeans.EstudianteFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Oscar
 */
public class Login extends HttpServlet {

    @EJB
    private CuestionarioFacade cuestionarioFacade;
    @EJB
    private EstudianteFacade estudianteFacade;
    @EJB
    private FuenteFacade fuenteFacade;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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

        HttpSession session = request.getSession();

        try {
            String action = request.getParameter("action");
            if (action != null && action.equals("CerrarSesion")) {
                session.invalidate();
            } else {
                String usuario = request.getParameter("parametroA");
                String pass = request.getParameter("parametroB");
                //String tipoIngreso = request.getParameter("parametroC");
                Fuente f = fuenteFacade.find(usuario);

                if (f != null && f.getPassword().equals(pass)) {
                    if (f.getTipo() != null && f.getTipo().equals("Administrador")) {
                        session.setAttribute("Usuario", "Admin");
                        session.setAttribute("tipoLogin", "Admin");
                        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/vista/index.html");
                        rd.forward(request, response);
                    } else {
                        session.setAttribute("fuente", f);
                        session.setAttribute("tipoLogin", "fuente");
                        List<Estudiante> estudiantes = estudianteFacade.findByList("fuenteidUsuario", f);
                        List<Estudiante> aux = new ArrayList<>();
                        for (Estudiante estudiante : estudiantes) {
                            if (estudiante.getProcesoIdproceso().getEstado().equals("En Ejecución")) {
                                aux.add(estudiante);
                            }
                        }

                        if (aux.size() > 0) {
                            Cuestionario cuestionarioEstudiantes = cuestionarioFacade.find(Integer.parseInt("1"));
                            session.setAttribute("cuestionarioEstudiantes", cuestionarioEstudiantes);
                        }

                        session.setAttribute("estudiantesConEncuesta", aux);
                        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/vista/evaluador/inicio.jsp");
                        rd.forward(request, response);
                    }

                } else {
                    System.out.println("ERROR de Login!!!");
                }
            }

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
