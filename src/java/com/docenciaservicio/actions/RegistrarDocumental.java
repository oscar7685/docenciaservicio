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
public class RegistrarDocumental implements Action {

    DocumentalFacade documentalFacade = lookupDocumentalFacadeBean();
    CriterioFacade criterioFacade = lookupCriterioFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso p = (Proceso) sesion.getAttribute("Proceso");
        String idCriterio = request.getParameter("indicador");
        String columna = request.getParameter("columna");
        String valor = request.getParameter("valor");


        Criterio aux = criterioFacade.find(idCriterio);


        Documental documental = documentalFacade.findBySingle2("procesoIdproceso", p, "criterioidCriterio", aux);

        if (documental == null) {
            Documental documental3 = new Documental();
            documental3.setProcesoIdproceso(p);
            documental3.setCriterioidCriterio(aux);


            if (columna.equals("1")) {
                documental3.setDocumento(valor);
            } else if (columna.equals("2")) {
                documental3.setResponsable(valor);
            } else if (columna.equals("3")) {
                documental3.setMedio(valor);
            } else if (columna.equals("4")) {
                documental3.setLugar(valor);
            } else if (columna.equals("5")) {
                documental3.setEvaluacion(Integer.parseInt(valor));
            } else if (columna.equals("6")) {
                documental3.setAccion(valor);
            }
            documentalFacade.create(documental3);
        } else {
            if (columna.equals("1")) {
                documental.setDocumento(valor);
            } else if (columna.equals("2")) {
                documental.setResponsable(valor);
            } else if (columna.equals("3")) {
                documental.setMedio(valor);
            } else if (columna.equals("4")) {
                documental.setLugar(valor);
            } else if (columna.equals("5")) {
                documental.setEvaluacion(Integer.parseInt(valor));
            } else if (columna.equals("6")) {
                documental.setAccion(valor);
            }
            documentalFacade.edit(documental);
        }
        return "NA";
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
}
