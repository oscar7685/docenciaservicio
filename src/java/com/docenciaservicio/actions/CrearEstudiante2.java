/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.entidades.Docente;
import com.docenciaservicio.sessionbeans.EscenarioFacade;
import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.entidades.Escenario;
import com.docenciaservicio.entidades.Estudiante;
import com.docenciaservicio.entidades.Fuente;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.entidades.Programa;
import com.docenciaservicio.sessionbeans.DocenteFacade;
import com.docenciaservicio.sessionbeans.EstudianteFacade;
import com.docenciaservicio.sessionbeans.FuenteFacade;
import com.docenciaservicio.sessionbeans.ProcesoFacade;
import com.docenciaservicio.sessionbeans.ProgramaFacade;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Usuario
 */
public class CrearEstudiante2 implements Action {
    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();

    ProgramaFacade programaFacade = lookupProgramaFacadeBean();
    
    FuenteFacade fuenteFacade = lookupFuenteFacadeBean();
    
    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("proceso");

        String identificacion = (String) request.getParameter("identificacionE");
        String codigo = (String) request.getParameter("codigoE");
        String nombre = (String) request.getParameter("nombreE");
        String apellido = (String) request.getParameter("apellidoE");
        String programa = (String) request.getParameter("programaE");
        String semestre = (String) request.getParameter("semestreE");


        Fuente aux1 = fuenteFacade.find(identificacion);
        if (aux1 == null) {
            List<Proceso> listP = new ArrayList<Proceso>();
            listP.add(proceso);
            Fuente f = new Fuente();
            f.setApellido(apellido);
            f.setNombre(nombre);
            f.setIdUsuario(identificacion);
            f.setPassword(identificacion);
            fuenteFacade.create(f);
        } 

        Fuente aux = fuenteFacade.find(identificacion);
        
        
        Programa paux = programaFacade.find(Integer.parseInt(programa));
        Estudiante e = new Estudiante();
        e.setProgramaIdprograma(paux);
        e.setIdEstudiante(Integer.parseInt(codigo));
        e.setSemestre(semestre);
        e.setFuenteidUsuario(aux);
        e.setProcesoIdproceso(proceso);

        estudianteFacade.create(e);
        sesion.setAttribute("listaEstudiantes", estudianteFacade.findByList("procesoIdproceso", proceso));

        return "/WEB-INF/vista/muestra/agregarEstudiante.jsp";
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

    private ProgramaFacade lookupProgramaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProgramaFacade) c.lookup("java:global/docenciaservicio/ProgramaFacade!com.docenciaservicio.sessionbeans.ProgramaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private ProcesoFacade lookupProcesoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProcesoFacade) c.lookup("java:global/docenciaservicio/ProcesoFacade!com.docenciaservicio.sessionbeans.ProcesoFacade");
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
}
