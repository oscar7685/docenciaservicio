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

/**
 *
 * @author Usuario
 */
public class CrearEscenario2 implements Action {
    EscenarioFacade escenarioFacade = lookupEscenarioFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        String idescenario = (String) request.getParameter("idescenario");
        String nombre = (String) request.getParameter("nombre");
        String dire = (String) request.getParameter("dire");
        String nit = (String) request.getParameter("nit");
        String tele = (String) request.getParameter("tele");
        
        Escenario e = new Escenario();
        e.setIdEscenario(Integer.parseInt(idescenario));
        e.setTelefono(tele);
        e.setNit(nit);
        e.setNombre(nombre);
        e.setDireccion(dire);
        escenarioFacade.create(e);
        
        return "NA";
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
