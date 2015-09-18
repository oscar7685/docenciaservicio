/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.entidades.Cuestionario;
import com.docenciaservicio.entidades.Encabezado;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.sessionbeans.CuestionarioFacade;
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
 * @author Ususario
 */
public class Fortalezas implements Action {

    CuestionarioFacade cuestionarioFacade = lookupCuestionarioFacadeBean();
    EncabezadoFacade encabezadoFacade = lookupEncabezadoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {

        HttpSession sesion = request.getSession();
        Proceso pro = (Proceso) sesion.getAttribute("Proceso");
        Cuestionario est = cuestionarioFacade.find(1);
        Cuestionario docen = cuestionarioFacade.find(2);
        Cuestionario ips = cuestionarioFacade.find(3);

        List<Encabezado> estudiantes = encabezadoFacade.findByList2yNO3("cuestionarioidCuestionario", est, "procesoIdproceso", pro, "fortalezas");
        List<Encabezado> docentes = encabezadoFacade.findByList2yNO3("cuestionarioidCuestionario", docen, "procesoIdproceso", pro, "fortalezas");
        List<Encabezado> ipeses = encabezadoFacade.findByList2yNO3("cuestionarioidCuestionario", ips, "procesoIdproceso", pro, "fortalezas");


        sesion.setAttribute("estudiantes", estudiantes);
        sesion.setAttribute("docentes", docentes);
        sesion.setAttribute("ipeses", ipeses);


        return "/WEB-INF/vista/proceso/informe/fortalezas.jsp";
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
