/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.sessionbeans.DocenteFacade;
import com.docenciaservicio.sessionbeans.EstudianteFacade;
import com.docenciaservicio.sessionbeans.ProcesoFacade;
import com.docenciaservicio.sessionbeans.RepresentanteescenarioFacade;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Usuario
 */
public class EjecutarProceso implements Action {
    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();
    RepresentanteescenarioFacade representanteescenarioFacade = lookupRepresentanteescenarioFacadeBean();
    DocenteFacade docenteFacade = lookupDocenteFacadeBean();
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();
    

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        String idP = request.getParameter("id");
        
        Proceso p = procesoFacade.find(Integer.parseInt(idP));

        if (!docenteFacade.findByList("procesoIdproceso", p).isEmpty() || !estudianteFacade.findByList("procesoIdproceso", p).isEmpty() || !representanteescenarioFacade.findByList("procesoIdproceso", p).isEmpty() ) {
            p.setEstado("En Ejecución");
            procesoFacade.edit(p);
            return "1";
        } else {
            return "0";
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

    private DocenteFacade lookupDocenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DocenteFacade) c.lookup("java:global/docenciaservicio/DocenteFacade!com.docenciaservicio.sessionbeans.DocenteFacade");
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
