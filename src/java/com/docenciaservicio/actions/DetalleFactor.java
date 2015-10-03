/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.entidades.Caracteristica;
import com.docenciaservicio.entidades.Criterio;
import com.docenciaservicio.entidades.Cuestionario;
import com.docenciaservicio.entidades.Documental;
import com.docenciaservicio.entidades.Factor;
import com.docenciaservicio.entidades.Pregunta;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.entidades.Respuestas;
import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.sessionbeans.DocumentalFacade;
import com.docenciaservicio.sessionbeans.FactorFacade;
import com.docenciaservicio.sessionbeans.RespuestasFacade;
import java.io.IOException;
import java.util.ArrayList;
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
public class DetalleFactor implements Action {

    DocumentalFacade documentalFacade = lookupDocumentalFacadeBean();
    RespuestasFacade respuestasFacade = lookupRespuestasFacadeBean();
    FactorFacade factorFacade = lookupFactorFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso p = (Proceso) sesion.getAttribute("Proceso");
        String idFactor = request.getParameter("id");

        float suma2;

        float calificacionNum;
        float calificacionPer;

        Factor f = factorFacade.find(idFactor);


        List<Caracteristica> caracteristicas = f.getCaracteristicaList();
        float cumplimiento2[] = new float[caracteristicas.size()];
        for (int j = 0; j < caracteristicas.size(); j++) {
            List<Criterio> criterios = caracteristicas.get(j).getCriterioList();
            float cumplimiento[] = new float[criterios.size()];
            for (int k = 0; k < criterios.size(); k++) {
                calificacionNum = 0;
                calificacionPer = 0;

                //preguntamos si el criterio se califica mediante encuesta
                if (criterios.get(k).getPreguntaList().size() > 0) {

                    //RECUPERAMOS LAS PREGUNTAS DEL ACTUAL INDICADOR
                    List<Pregunta> preguntas = criterios.get(k).getPreguntaList();

                    float promedioPregunta = (float) 0.0;
                    float suma, numP;

                    //declaramos promedio de respuestas para cada preguntas
                    float promediorespuestas[] = new float[preguntas.size()];


                    //recorremos cada pregunta
                    for (int l = 0; l < preguntas.size(); l++) {
                        Pregunta pregunta = preguntas.get(l);

                        //sacamos las encuestas asociadas a la pregunta actual
                        List<Cuestionario> cuestionarios = pregunta.getCuestionarioList();


                        int cantEn = cuestionarios.size();


                        //declaramos arreglo para tener los promedios de respuesta de la actual pregunta en cada encuesta
                        float promediorespuestasxencuesta[] = new float[cantEn];

                        //calculamos el promedio de respuesta de la pregunta actual en cada encuesta
                        for (int m = 0; m < cantEn; m++) {
                            suma = 0;
                            numP = 0;
                            List<Respuestas> respuestas = respuestasFacade.findResultadosxPreguntaxEncuestaxProceso(p, cuestionarios.get(m), pregunta);
                            for (Respuestas respuesta : respuestas) {
                                suma += respuesta.getRespuesta();
                                numP++;
                            }
                            if (suma > 0) {
                                promediorespuestasxencuesta[m] = (float) suma / numP;
                            }

                        }
                        //calculamos el promedio de respuesta por pregunta usando los promedios por encuesta
                        float promedioPreguntaAux = 0;
                        int cantidadEncuestas = cuestionarios.size();



                        int tipoDeEncuestasContestadas = 0;
                        for (int m = 0; m < cantidadEncuestas; m++) {
                            if (promediorespuestasxencuesta[m] > 0) {
                                tipoDeEncuestasContestadas++;
                            }
                            promedioPreguntaAux += promediorespuestasxencuesta[m];
                        }
                        if (tipoDeEncuestasContestadas > 0) {
                            promedioPregunta = (float) promedioPreguntaAux / tipoDeEncuestasContestadas;
                        }
                        promediorespuestas[l] = (float) (Math.rint(promedioPregunta * 10) / 10);

                    }
                    int numPre = 0;


                    for (int q = 0; q < promediorespuestas.length; q++) {
                        if (promediorespuestas[q] > 0) {
                            calificacionPer += promediorespuestas[q];
                            numPre++;
                        }
                    }
                    calificacionPer = (float) calificacionPer / numPre;
                } else { //si no se contesta por encuesta sino x documento
                    Documental Doc = documentalFacade.findBySingle2("criterioidCriterio", criterios.get(k), "procesoIdproceso", p);
                    if (Doc != null && Doc.getEvaluacion() != null && Doc.getEvaluacion() != 0.0) {
                        calificacionNum = (float) Doc.getEvaluacion();
                    }

                }



                if (calificacionPer != 0) {
                    cumplimiento[k] = calificacionPer;
                } else if (calificacionNum != 0) {
                    cumplimiento[k] = calificacionNum;
                }

            }

            float sumaCumplimientoCriterios = 0;
            int calificados = 0;
            for (int i = 0; i < cumplimiento.length; i++) {
                if (cumplimiento[i] > 0.0) {
                    sumaCumplimientoCriterios += cumplimiento[i];
                    calificados++;
                }
            }
            if (sumaCumplimientoCriterios > 0) {
                cumplimiento2[j] = (float) sumaCumplimientoCriterios / calificados;
                cumplimiento2[j] = (float) (Math.rint(cumplimiento2[j] * 10) / 10);
            }
        }
        sesion.setAttribute("factor", f);
        sesion.setAttribute("caracteristicasDF", caracteristicas);
        sesion.setAttribute("cumplimientoDF", cumplimiento2);

        return "/WEB-INF/vista/proceso/informe/detalleFactor.jsp";
    }

    private FactorFacade lookupFactorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (FactorFacade) c.lookup("java:global/docenciaservicio/FactorFacade!com.docenciaservicio.sessionbeans.FactorFacade");
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

    private DocumentalFacade lookupDocumentalFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DocumentalFacade) c.lookup("java:global/docenciaservicio/DocumentalFacade!com.docenciaservicio.sessionbeans.DocumentalFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
