/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.entidades.Docente;
import com.docenciaservicio.sessionbeans.EscenarioFacade;
import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.entidades.Escenario;
import com.docenciaservicio.entidades.Fuente;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.entidades.Programa;
import com.docenciaservicio.sessionbeans.DocenteFacade;
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
public class CrearDocente2 implements Action {
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();

    ProgramaFacade programaFacade = lookupProgramaFacadeBean();
    DocenteFacade docenteFacade = lookupDocenteFacadeBean();
    FuenteFacade fuenteFacade = lookupFuenteFacadeBean();
    
    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("proceso");

        String identificacion = (String) request.getParameter("identificacion");
        String nombre = (String) request.getParameter("nombre");
        String apellido = (String) request.getParameter("apellido");
        String programa = (String) request.getParameter("programa");
        String tipoContrato = (String) request.getParameter("tipoContrato");


        Fuente aux1 = fuenteFacade.find(identificacion);
        if (aux1 == null) {
            List<Proceso> listP = new ArrayList<Proceso>();
            listP.add(proceso);
            Fuente f = new Fuente();
            f.setApellido(apellido);
            f.setNombre(nombre);
            f.setIdUsuario(identificacion);
            f.setPassword(identificacion);
            f.setProcesoList(listP);
            fuenteFacade.create(f);
        } else {
            List<Proceso> listP2 = aux1.getProcesoList();
            listP2.add(proceso);
            aux1.setProcesoList(listP2);
            fuenteFacade.edit(aux1);
        }

        Fuente aux = fuenteFacade.find(identificacion);
        List<Fuente> listF =  proceso.getFuenteList();
        listF.add(aux);
        proceso.setFuenteList(listF);
        procesoFacade.edit(proceso);
        
        
        Programa paux = programaFacade.find(Integer.parseInt(programa));
        Docente d = new Docente();
        d.setProgramaIdprograma(paux);
        d.setTipoContrato(tipoContrato);
        d.setFuenteidUsuario(aux);
        d.setProcesoIdproceso(proceso);

        docenteFacade.create(d);
        sesion.setAttribute("listaDocentes", docenteFacade.findAll());

        return "/WEB-INF/vista/muestra/agregarDocente.jsp";
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
}
