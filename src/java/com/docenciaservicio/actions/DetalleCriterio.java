/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.entidades.Criterio;
import com.docenciaservicio.entidades.Cuestionario;
import com.docenciaservicio.entidades.Documental;
import com.docenciaservicio.entidades.Pregunta;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.entidades.Respuestas;
import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.sessionbeans.CriterioFacade;
import com.docenciaservicio.sessionbeans.DocumentalFacade;
import com.docenciaservicio.sessionbeans.RespuestasFacade;
import java.io.IOException;
import java.math.BigDecimal;
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
public class DetalleCriterio implements Action {

    RespuestasFacade respuestasFacade = lookupRespuestasFacadeBean();
    DocumentalFacade documentalFacade = lookupDocumentalFacadeBean();
    CriterioFacade criterioFacade = lookupCriterioFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();

        sesion.setAttribute("documental", null);


        //RECUPERAMOS EL CRITERIO
        String idCriterio = request.getParameter("id");
        Criterio in = criterioFacade.find(idCriterio);
        Proceso p = (Proceso) sesion.getAttribute("Proceso");
        sesion.setAttribute("documental", null);




        //preguntamos si el criterio se califica mediante encuesta
        if (in.getPreguntaList().size() > 0) {

            //RECUPERAMOS LAS PREGUNTAS
            List<Pregunta> preguntas = in.getPreguntaList();
            float promedioPregunta = (float) 0.0;
            float suma;

            //declaramos promedio de respuestas para cada preguntas
            float promediorespuestas[] = new float[preguntas.size()];

            //declaramos cantidades x respuesta por opcion de respuesta
            int ceros[] = new int[preguntas.size()];
            int unos[] = new int[preguntas.size()];
            int dos[] = new int[preguntas.size()];
            int tres[] = new int[preguntas.size()];
            int cuatros[] = new int[preguntas.size()];
            int cincos[] = new int[preguntas.size()];

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

                    List<Respuestas> respuestas = respuestasFacade.findResultadosxPreguntaxEncuestaxProceso(p, cuestionarios.get(m), pregunta);
                    for (Respuestas respuesta : respuestas) {
                        suma += respuesta.getRespuesta();
                    }
                    if (suma > 0) {
                        promediorespuestasxencuesta[m] = (float) suma / respuestas.size();
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


                //contamos cuantos 5,4,3,2,1,0 se respondieron sin importar las encuestas
                BigDecimal valor5 = (BigDecimal) respuestasFacade.findResultadosxPreguntaxEncuestaxProcesoxValor5(p, pregunta, 5);
                BigDecimal valor4 = (BigDecimal) respuestasFacade.findResultadosxPreguntaxEncuestaxProcesoxValor5(p, pregunta, 4);
                BigDecimal valor3 = (BigDecimal) respuestasFacade.findResultadosxPreguntaxEncuestaxProcesoxValor5(p, pregunta, 3);
                BigDecimal valor2 = (BigDecimal) respuestasFacade.findResultadosxPreguntaxEncuestaxProcesoxValor5(p, pregunta, 2);
                BigDecimal valor1 = (BigDecimal) respuestasFacade.findResultadosxPreguntaxEncuestaxProcesoxValor5(p, pregunta, 1);
                BigDecimal valor0 = (BigDecimal) respuestasFacade.findResultadosxPreguntaxEncuestaxProcesoxValor5(p, pregunta, 0);
                ceros[l] = valor0.intValue();
                cincos[l] = valor5.intValue();
                cuatros[l] = valor4.intValue();
                tres[l] = valor3.intValue();
                dos[l] = valor2.intValue();
                unos[l] = valor1.intValue();


               
            }

            //enviamos los datos relevantes
            sesion.setAttribute("promediorepuestas", promediorespuestas);
            sesion.setAttribute("ceros", ceros);
            sesion.setAttribute("unos", unos);
            sesion.setAttribute("dos", dos);
            sesion.setAttribute("tres", tres);
            sesion.setAttribute("cuatros", cuatros);
            sesion.setAttribute("cincos", cincos);
        } else {  //si no se contesta por encuesta sino x documento
            Documental Doc = documentalFacade.findBySingle2("criterioidCriterio", in, "procesoIdproceso", p);
            if (Doc != null && Doc.getEvaluacion() != null && Doc.getEvaluacion() != 0.0) {
                sesion.setAttribute("documental", Doc);
            }
        }

        sesion.setAttribute("criterio", in);



        return "/WEB-INF/vista/proceso/informe/detalleCriterio.jsp";
    }

    private CriterioFacade lookupCriterioFacadeBean() {
        try {
            Context c = new InitialContext();
            return (CriterioFacade) c.lookup("java:global/docenciaservicio/CriterioFacade!com.docenciaservicio.sessionbeans.CriterioFacade");
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

    private RespuestasFacade lookupRespuestasFacadeBean() {
        try {
            Context c = new InitialContext();
            return (RespuestasFacade) c.lookup("java:global/docenciaservicio/RespuestasFacade!com.docenciaservicio.sessionbeans.RespuestasFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
