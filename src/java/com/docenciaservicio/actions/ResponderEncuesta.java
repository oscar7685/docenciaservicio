/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.entidades.Cuestionario;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.sessionbeans.CuestionarioFacade;
import com.docenciaservicio.sessionbeans.ProcesoFacade;
import java.io.IOException;
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
public class ResponderEncuesta implements Action {
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();

    CuestionarioFacade cuestionarioFacade = lookupCuestionarioFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String idCuestionario = (String) request.getParameter("cuestionario");
        Cuestionario c = cuestionarioFacade.find(Integer.parseInt(idCuestionario));
        String idProceso = (String) request.getParameter("proceso");
        Proceso p = procesoFacade.find(Integer.parseInt(idProceso));

        sesion.setAttribute("cuestionario", c);
        sesion.setAttribute("proceso", p);
        sesion.setAttribute("preguntas", c.getPreguntaList());
        return "/WEB-INF/vista/evaluador/responderEncuesta.jsp";
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
