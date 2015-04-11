/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Usuario
 */
public class EditarProceso2 implements Action{
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        //String idescenario = (String) request.getParameter("idescenario");
        String descripcion = (String) request.getParameter("descripcion");
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
        
        
        Proceso p = (Proceso) sesion.getAttribute("proceso");
        //e.setIdEscenario(Integer.parseInt(idescenario));
        p.setDescripcionp(descripcion);
        p.setFechai(fechaI);
        p.setFechaf(fechaF);
        
        procesoFacade.edit(p);
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
    
}
