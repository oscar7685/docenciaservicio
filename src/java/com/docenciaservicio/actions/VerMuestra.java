/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.sessionbeans.ProcesoFacade;
import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.entidades.Proceso;
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
public class VerMuestra implements Action{
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String idProceso = (String) request.getParameter("id");
        Proceso p = procesoFacade.find(Integer.parseInt(idProceso));
        sesion.setAttribute("proceso", p);
        sesion.setAttribute("estudiantesMuestra", p.getEstudianteList());
        sesion.setAttribute("docentesMuestra", p.getDocenteList());
        sesion.setAttribute("representanteMuestra", p.getEscenarioidEscenario().getRepresentanteescenarioList());
        return "/WEB-INF/vista/muestra/verMuestra.jsp";
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
