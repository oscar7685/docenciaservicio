/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.entidades.Criterio;
import com.docenciaservicio.entidades.Documental;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.sessionbeans.CriterioFacade;
import com.docenciaservicio.sessionbeans.DocumentalFacade;
import com.docenciaservicio.sessionbeans.PreguntaFacade;
import com.docenciaservicio.sessionbeans.ProcesoFacade;
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
public class CalificarDocumentos implements Action {

    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();
    DocumentalFacade documentalFacade = lookupDocumentalFacadeBean();
    CriterioFacade criterioFacade = lookupCriterioFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String idProceso = request.getParameter("id");
        Proceso p = procesoFacade.find(Integer.parseInt(idProceso));
        List<Criterio> criterios = criterioFacade.findAll();
        List<Criterio> aux = new ArrayList<Criterio>();
        for (Criterio criterio : criterios) {
            if (criterio.getPreguntaList().isEmpty()) {
                aux.add(criterio);
            }
        }

        List<Documental> listaCriteriosCalificados = documentalFacade.findByList("procesoIdproceso", p);
        sesion.setAttribute("criteriosCalificados", listaCriteriosCalificados);
        sesion.setAttribute("Proceso", p);

        sesion.setAttribute("listaCriterios", aux);
        return "/WEB-INF/vista/proceso/documental/calificarDocumentos.jsp";
    }

    private CriterioFacade lookupCriterioFacadeBean() {
        try {
            Context c = new InitialContext();
            return (CriterioFacade) c.lookup("java:global/docenciaservicio/CriterioFacade!com.docenciaservicio.sessionbeans.CriterioFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private DocumentalFacade lookupDocumentalFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DocumentalFacade) c.lookup("java:global/docenciaservicio/DocumentalFacade!com.docenciaservicio.sessionbeans.DocumentalFacade");
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
