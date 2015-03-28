/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.beans.docenciaservicio.EscenarioFacade;
import com.beans.docenciaservicio.ProcesoFacade;
import com.docenciaservicio.interfaz.Action;
import com.paquete.docenciaservicio.Escenario;
import com.paquete.docenciaservicio.Proceso;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class CrearProceso2 implements Action {

    EscenarioFacade escenarioFacade = lookupEscenarioFacadeBean();
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        String descripcion = (String) request.getParameter("descripcion");
        String escenario = (String) request.getParameter("escenario");
        String fechainicio = (String) request.getParameter("fechai");
        String fechafinal = (String) request.getParameter("fechaf");

        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
        Date fechaI = null;
        try {

            fechaI = formatoDelTexto.parse(fechainicio);

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        Date fechaF = null;
        try {

            fechaF = formatoDelTexto.parse(fechafinal);

        } catch (Exception ex) {

            ex.printStackTrace();

        }



        Escenario e = escenarioFacade.find(Integer.parseInt(escenario));
        Proceso p = new Proceso();
        p.setDescripcionp(descripcion);
        p.setEscenarioidEscenario(e);
        p.setFechai(fechaI);
        p.setFechaf(fechaF);

        procesoFacade.create(p);

        return "NA";
    }

    private ProcesoFacade lookupProcesoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProcesoFacade) c.lookup("java:global/docenciaservicio/ProcesoFacade!com.beans.docenciaservicio.ProcesoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
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
