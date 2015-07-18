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
import com.docenciaservicio.entidades.Representanteescenario;
import com.docenciaservicio.sessionbeans.DocenteFacade;
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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Usuario
 */
public class CrearRepresentante2 implements Action {
    RepresentanteescenarioFacade representanteescenarioFacade = lookupRepresentanteescenarioFacadeBean();
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();
    FuenteFacade fuenteFacade = lookupFuenteFacadeBean();
    
    
    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("proceso");

        String identificacion = (String) request.getParameter("identificacionR");
        String nombre = (String) request.getParameter("nombreR");
        String apellido = (String) request.getParameter("apellidoR");
        String cargo = (String) request.getParameter("cargo");
        


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
        
        Representanteescenario repre = new Representanteescenario();
        repre.setCargo(cargo);
        repre.setEscenarioidEscenario(proceso.getEscenarioidEscenario());
        repre.setFuenteidUsuario(aux);
        representanteescenarioFacade.create(repre);
        
       
        sesion.setAttribute("listaRepresentantes", representanteescenarioFacade.findByList("escenarioidEscenario", proceso.getEscenarioidEscenario()));

        return "/WEB-INF/vista/muestra/agregarRepresentante.jsp";
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

 

     private ProcesoFacade lookupProcesoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProcesoFacade) c.lookup("java:global/docenciaservicio/ProcesoFacade!com.docenciaservicio.sessionbeans.ProcesoFacade");
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
