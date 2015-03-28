/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.beans.docenciaservicio.EscenarioFacade;
import com.docenciaservicio.interfaz.Action;
import com.paquete.docenciaservicio.Escenario;
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
public class EditarEscenario implements Action {
    EscenarioFacade escenarioFacade = lookupEscenarioFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String escenarioId = (String) request.getParameter("id");
        Escenario e = escenarioFacade.find(Integer.parseInt(escenarioId));
        sesion.setAttribute("escenario", e);
        
        return "/WEB-INF/vista/escenario/editar.jsp";
    }

    private EscenarioFacade lookupEscenarioFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EscenarioFacade) c.lookup("java:global/docenciaservicio/EscenarioFacade!com.beans.docenciaservicio.EscenarioFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
