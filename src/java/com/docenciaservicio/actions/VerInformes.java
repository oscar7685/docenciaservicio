/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.entidades.Encabezado;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.sessionbeans.DocenteFacade;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ususario
 */
public class VerInformes implements Action {

    EncabezadoFacade encabezadoFacade = lookupEncabezadoFacadeBean();
    RepresentanteescenarioFacade representanteescenarioFacade = lookupRepresentanteescenarioFacadeBean();
    DocenteFacade docenteFacade = lookupDocenteFacadeBean();
    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String idProceso = request.getParameter("id");
        Proceso p = procesoFacade.find(Integer.parseInt(idProceso));
        sesion.setAttribute("Proceso", p);

        int totalEst = estudianteFacade.countByProperty("procesoIdproceso", p);
        int totalDoc = docenteFacade.countByProperty("procesoIdproceso", p);
        int totalRepre = representanteescenarioFacade.countByProperty("procesoIdproceso", p);

        int totalMuestra = totalEst + totalDoc + totalRepre;

        List<Encabezado> encabezados = encabezadoFacade.findByList("procesoIdproceso", p);

        int terminados = encabezados.size();
        int terminadosEst = 0;
        int terminadosDoc = 0;
        int terminadosRep = 0;

        for (Encabezado encabezado : encabezados) {
            if (encabezado.getCuestionarioidCuestionario().getIdCuestionario() == 1) {
                terminadosEst++;
            } else if (encabezado.getCuestionarioidCuestionario().getIdCuestionario() == 2) {
                terminadosDoc++;
            } else if (encabezado.getCuestionarioidCuestionario().getIdCuestionario() == 3) {
                terminadosRep++;
            }
        }
        sesion.setAttribute("terminadosX", terminados);
        sesion.setAttribute("totalMuestraX", totalMuestra);
        sesion.setAttribute("totalEst", totalEst);
        sesion.setAttribute("terminadosEst", terminadosEst);
        sesion.setAttribute("totalDoc", totalDoc);
        sesion.setAttribute("terminadosDoc", terminadosDoc);
        sesion.setAttribute("totalAdm", totalRepre);
        sesion.setAttribute("terminadosAdm", terminadosRep);
        
        return "/WEB-INF/vista/proceso/informe/estadoProceso.jsp";
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

    private EncabezadoFacade lookupEncabezadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EncabezadoFacade) c.lookup("java:global/docenciaservicio/EncabezadoFacade!com.docenciaservicio.sessionbeans.EncabezadoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
