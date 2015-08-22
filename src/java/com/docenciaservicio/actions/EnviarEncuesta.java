/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.entidades.Cuestionario;
import com.docenciaservicio.entidades.Encabezado;
import com.docenciaservicio.entidades.Fuente;
import com.docenciaservicio.sessionbeans.ProcesoFacade;
import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.sessionbeans.EncabezadoFacade;
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
 * @author Usuario
 */
public class EnviarEncuesta implements Action {

    EncabezadoFacade encabezadoFacade = lookupEncabezadoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();

        Proceso proceso = (Proceso) sesion.getAttribute("proceso");
        Fuente fuente = (Fuente) sesion.getAttribute("fuente");
        Cuestionario cuestionario = (Cuestionario) sesion.getAttribute("cuestionario");
        List<Encabezado> encabExistentes = encabezadoFacade.findByList3("procesoIdproceso", proceso, "cuestionarioidCuestionario", cuestionario, "fuenteidUsuario", fuente);


        return "/WEB-INF/vista/proceso/editar.jsp";
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
