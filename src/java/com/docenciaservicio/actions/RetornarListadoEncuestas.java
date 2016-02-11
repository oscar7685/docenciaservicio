/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.entidades.Cuestionario;
import com.docenciaservicio.entidades.Docente;
import com.docenciaservicio.entidades.Encabezado;
import com.docenciaservicio.sessionbeans.EscenarioFacade;
import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.entidades.Escenario;
import com.docenciaservicio.entidades.Estudiante;
import com.docenciaservicio.entidades.Fuente;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.entidades.Programa;
import com.docenciaservicio.entidades.Representanteescenario;
import com.docenciaservicio.sessionbeans.CuestionarioFacade;
import com.docenciaservicio.sessionbeans.DocenteFacade;
import com.docenciaservicio.sessionbeans.EncabezadoFacade;
import com.docenciaservicio.sessionbeans.EstudianteFacade;
import com.docenciaservicio.sessionbeans.FuenteFacade;
import com.docenciaservicio.sessionbeans.ProcesoFacade;
import com.docenciaservicio.sessionbeans.ProgramaFacade;
import com.docenciaservicio.sessionbeans.RepresentanteescenarioFacade;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Usuario
 */
public class RetornarListadoEncuestas implements Action {
    RepresentanteescenarioFacade representanteescenarioFacade = lookupRepresentanteescenarioFacadeBean();
    CuestionarioFacade cuestionarioFacade = lookupCuestionarioFacadeBean();
    EncabezadoFacade encabezadoFacade = lookupEncabezadoFacadeBean();
    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();
    DocenteFacade docenteFacade = lookupDocenteFacadeBean();
    FuenteFacade fuenteFacade = lookupFuenteFacadeBean();
    
    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession session = request.getSession();
        Fuente f = (Fuente) session.getAttribute("fuente");
        Cuestionario cuestionarioEstudiantes = cuestionarioFacade.find(Integer.parseInt("1"));
        Cuestionario cuestionarioDocentes = cuestionarioFacade.find(Integer.parseInt("2"));
        Cuestionario cuestionarioRepresentantes = cuestionarioFacade.find(Integer.parseInt("3"));

        //cuestionarios para estudiantes    
        List<Estudiante> estudiantes = estudianteFacade.findByList("fuenteidUsuario", f);
        List<Estudiante> aux = new ArrayList<Estudiante>();
        for (Estudiante estudiante : estudiantes) {
            if (estudiante.getProcesoIdproceso().getEstado().equals("En Ejecución")) {
                List<Encabezado> enc1 = encabezadoFacade.findByList3("procesoIdproceso", estudiante.getProcesoIdproceso(), "cuestionarioidCuestionario", cuestionarioEstudiantes, "fuenteidUsuario", f);
                if (enc1 == null || enc1.size() == 0) {
                    aux.add(estudiante);
                }
            }
        }

        if (aux.size() > 0) {
            session.setAttribute("cuestionarioEstudiantes", cuestionarioEstudiantes);
        }
        session.setAttribute("estudiantesConEncuesta", aux);


        //cuestionarios para docentes    
        List<Docente> docentes = docenteFacade.findByList("fuenteidUsuario", f);
        List<Docente> aux2 = new ArrayList<Docente>();
        for (Docente docente : docentes) {
            if (docente.getProcesoIdproceso().getEstado().equals("En Ejecución")) {
                List<Encabezado> enc2 = encabezadoFacade.findByList3("procesoIdproceso", docente.getProcesoIdproceso(), "cuestionarioidCuestionario", cuestionarioDocentes, "fuenteidUsuario", f);
                if (enc2 == null || enc2.size() == 0) {
                    aux2.add(docente);
                }
            }
        }

        if (aux2.size() > 0) {

            session.setAttribute("cuestionarioDocentes", cuestionarioDocentes);
        }
        session.setAttribute("docentesConEncuesta", aux2);

        //cuestionarios para Representanteescenario    
        List<Representanteescenario> representantes = representanteescenarioFacade.findByList("fuenteidUsuario", f);
        List<Representanteescenario> aux3 = new ArrayList<Representanteescenario>();
        for (Representanteescenario representante : representantes) {
            if (representante.getProcesoIdproceso().getEstado().equals("En Ejecución")) {
                List<Encabezado> enc3 = encabezadoFacade.findByList3("procesoIdproceso", representante.getProcesoIdproceso(), "cuestionarioidCuestionario", cuestionarioRepresentantes, "fuenteidUsuario", f);
                if (enc3 == null || enc3.size() == 0) {
                    aux3.add(representante);
                }
            }
        }

        if (aux3.size() > 0) {
            session.setAttribute("cuestionarioRepresentantes", cuestionarioRepresentantes);
        }
        session.setAttribute("representantesConEncuesta", aux3);

        return "/WEB-INF/vista/evaluador/inicio2.jsp";


    }

    private FuenteFacade lookupFuenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (FuenteFacade) c.lookup("java:global/docenciaservicio/FuenteFacade!com.docenciaservicio.sessionbeans.FuenteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private DocenteFacade lookupDocenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DocenteFacade) c.lookup("java:global/docenciaservicio/DocenteFacade!com.docenciaservicio.sessionbeans.DocenteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EstudianteFacade lookupEstudianteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EstudianteFacade) c.lookup("java:global/docenciaservicio/EstudianteFacade!com.docenciaservicio.sessionbeans.EstudianteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EncabezadoFacade lookupEncabezadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EncabezadoFacade) c.lookup("java:global/docenciaservicio/EncabezadoFacade!com.docenciaservicio.sessionbeans.EncabezadoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private CuestionarioFacade lookupCuestionarioFacadeBean() {
        try {
            Context c = new InitialContext();
            return (CuestionarioFacade) c.lookup("java:global/docenciaservicio/CuestionarioFacade!com.docenciaservicio.sessionbeans.CuestionarioFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private RepresentanteescenarioFacade lookupRepresentanteescenarioFacadeBean() {
        try {
            Context c = new InitialContext();
            return (RepresentanteescenarioFacade) c.lookup("java:global/docenciaservicio/RepresentanteescenarioFacade!com.docenciaservicio.sessionbeans.RepresentanteescenarioFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
