/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.entidades.Cuestionario;
import com.docenciaservicio.entidades.Encabezado;
import com.docenciaservicio.entidades.Fuente;
import com.docenciaservicio.entidades.Pregunta;
import com.docenciaservicio.sessionbeans.ProcesoFacade;
import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.entidades.Respuestas;
import com.docenciaservicio.sessionbeans.CuestionarioFacade;
import com.docenciaservicio.sessionbeans.EncabezadoFacade;
import com.docenciaservicio.sessionbeans.RespuestasFacade;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Usuario
 */
public class EnviarEncuesta implements Action {

    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();
    CuestionarioFacade cuestionarioFacade = lookupCuestionarioFacadeBean();
    RespuestasFacade respuestasFacade = lookupRespuestasFacadeBean();
    EncabezadoFacade encabezadoFacade = lookupEncabezadoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();

        Proceso proceso = (Proceso) sesion.getAttribute("proceso");
        Fuente fuente = (Fuente) sesion.getAttribute("fuente");
        Cuestionario cuestionario = (Cuestionario) sesion.getAttribute("cuestionario");

        String debilidades = (String) request.getParameter("debilidades");
        String fortalezas = (String) request.getParameter("fortalezas");
        String recomendaciones = (String) request.getParameter("recomendaciones");


        List<Pregunta> preguntas = cuestionario.getPreguntaList();
        String estado = "terminado";

        List<Encabezado> encabExistentes = encabezadoFacade.findByList3("procesoIdproceso", proceso, "cuestionarioidCuestionario", cuestionario, "fuenteidUsuario", fuente);
        Encabezado enc = null;
        if (encabExistentes != null && encabExistentes.size() == 1) {//encabExistentes.size() debe ser 1
            enc = encabExistentes.get(0);
        }

        if (enc == null) {
            enc = new Encabezado();
            enc.setProcesoIdproceso(proceso);
            enc.setCuestionarioidCuestionario(cuestionario);
            enc.setEstado(estado);
            enc.setFuenteidUsuario(fuente);
            enc.setDebilidades(debilidades);
            enc.setFortalezas(fortalezas);
            enc.setRecomendaciones(recomendaciones);
            enc.setFecha(new Date(new java.util.Date().getTime()));
            encabezadoFacade.create(enc);

            Encabezado recienCreado = encabezadoFacade.findUltimo("idEncabezado");
            try {
                for (Pregunta pregunta : preguntas) {
                    Respuestas re = new Respuestas();
                    re.setEncabezadoidEncabezado(recienCreado);
                    re.setPreguntaidPregunta(pregunta);
                    String respuesta1 = (String) request.getParameter("pregunta" + pregunta.getIdPregunta());
                    if (pregunta.getTipo().equals("0a5")) {
                        re.setRespuesta(Integer.parseInt(respuesta1));
                    }
                    respuestasFacade.create(re);
                }
            } catch (Exception e) {
                System.out.println("Ha ocurrido un error guardando las repuestas: ");
            }

            recienCreado.setRespuestasList(respuestasFacade.findByList("encabezadoidEncabezado", recienCreado));
            encabezadoFacade.edit(recienCreado);

            sesion.setAttribute("cuestionario", null);


        }
        return "NA";
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

    private RespuestasFacade lookupRespuestasFacadeBean() {
        try {
            Context c = new InitialContext();
            return (RespuestasFacade) c.lookup("java:global/docenciaservicio/RespuestasFacade!com.docenciaservicio.sessionbeans.RespuestasFacade");
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
