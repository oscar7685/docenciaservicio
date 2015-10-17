/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.entidades.Criterio;
import com.docenciaservicio.entidades.Cuestionario;
import com.docenciaservicio.entidades.Documental;
import com.docenciaservicio.entidades.Encabezado;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.sessionbeans.CriterioFacade;
import com.docenciaservicio.sessionbeans.CuestionarioFacade;
import com.docenciaservicio.sessionbeans.DocenteFacade;
import com.docenciaservicio.sessionbeans.DocumentalFacade;
import com.docenciaservicio.sessionbeans.EncabezadoFacade;
import com.docenciaservicio.sessionbeans.EstudianteFacade;
import com.docenciaservicio.sessionbeans.ProcesoFacade;
import com.docenciaservicio.sessionbeans.RepresentanteescenarioFacade;
import java.io.IOException;
import java.util.List;
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
public class FinalizarProceso implements Action {

    CuestionarioFacade cuestionarioFacade = lookupCuestionarioFacadeBean();
    EncabezadoFacade encabezadoFacade = lookupEncabezadoFacadeBean();
    DocumentalFacade documentalFacade = lookupDocumentalFacadeBean();
    CriterioFacade criterioFacade = lookupCriterioFacadeBean();
    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();
    RepresentanteescenarioFacade representanteescenarioFacade = lookupRepresentanteescenarioFacadeBean();
    DocenteFacade docenteFacade = lookupDocenteFacadeBean();
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        String idP = request.getParameter("id");
        boolean problemas = false;
        Proceso p = procesoFacade.find(Integer.parseInt(idP));
        List<Criterio> criterios = criterioFacade.findAll();

        for (Criterio criterio : criterios) {
            if (criterio.getPreguntaList().size() > 0) {
            } else {
                Documental d = documentalFacade.findBySingle2("criterioidCriterio", criterio, "procesoIdproceso", p);
                if (d != null && d.getEvaluacion() != null) {
                } else {
                    problemas = true;
                    break;
                }
            }
        }
        Cuestionario c1 = cuestionarioFacade.find(1);
        Cuestionario c2 = cuestionarioFacade.find(2);
        Cuestionario c3 = cuestionarioFacade.find(3);

        List<Encabezado> enca1 = encabezadoFacade.findByList2("cuestionarioidCuestionario", c1, "procesoIdproceso", p);
        List<Encabezado> enca2 = encabezadoFacade.findByList2("cuestionarioidCuestionario", c2, "procesoIdproceso", p);
        List<Encabezado> enca3 = encabezadoFacade.findByList2("cuestionarioidCuestionario", c3, "procesoIdproceso", p);

        if (enca1.isEmpty() || enca2.isEmpty() || enca3.isEmpty()) {
            problemas = true;
        }

        if (!problemas) {
            p.setEstado("Finalizado");
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
}
