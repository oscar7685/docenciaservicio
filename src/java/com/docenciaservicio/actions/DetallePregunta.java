/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.entidades.Cuestionario;
import com.docenciaservicio.entidades.Pregunta;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.entidades.Respuestas;
import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.sessionbeans.PreguntaFacade;
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
 * @author acreditacion
 */
public class DetallePregunta implements Action {

    RespuestasFacade respuestasFacade = lookupRespuestasFacadeBean();
    PreguntaFacade preguntaFacade = lookupPreguntaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso p = (Proceso) sesion.getAttribute("Proceso");

        float suma;
        float numP;

        String idPregunta = request.getParameter("id");
        Pregunta pre = preguntaFacade.find(idPregunta);

        List<Cuestionario> cuestionarios = pre.getCuestionarioList();
        int ceros[] = new int[cuestionarios.size()];
        int unos[] = new int[cuestionarios.size()];
        int dos[] = new int[cuestionarios.size()];
        int tres[] = new int[cuestionarios.size()];
        int cuatros[] = new int[cuestionarios.size()];
        int cincos[] = new int[cuestionarios.size()];

        //aqui va la cosa
        int cantEn = cuestionarios.size();
        //declaramos arreglo para tener los promedios de respuesta de la actual pregunta en cada encuesta
        float promediorespuestasxencuesta[] = new float[cantEn];

        //calculamos el promedio de respuesta de la pregunta actual en cada encuesta
        for (int m = 0; m < cantEn; m++) {
            suma = 0;
            numP = 0;
            List<Respuestas> respuestas = respuestasFacade.findResultadosxPreguntaxEncuestaxProceso(p, cuestionarios.get(m), pre);
            for (Respuestas respuesta : respuestas) {
                suma += respuesta.getRespuesta();
                numP++;
            }
            if (suma > 0) {
                promediorespuestasxencuesta[m] = (float) (Math.rint((suma / numP) * 10) / 10);
            }

            //contamos cuantos 5,4,3,2,1,0 se respondieron sin importar las encuestas
            BigDecimal valor5 = (BigDecimal) respuestasFacade.findResultadosxPreguntaxEncuestaxProcesoxValor6(p, pre, cuestionarios.get(m),  5);
            BigDecimal valor4 = (BigDecimal) respuestasFacade.findResultadosxPreguntaxEncuestaxProcesoxValor6(p, pre, cuestionarios.get(m),  4);
            BigDecimal valor3 = (BigDecimal) respuestasFacade.findResultadosxPreguntaxEncuestaxProcesoxValor6(p, pre, cuestionarios.get(m), 3);
            BigDecimal valor2 = (BigDecimal) respuestasFacade.findResultadosxPreguntaxEncuestaxProcesoxValor6(p, pre,cuestionarios.get(m),  2);
            BigDecimal valor1 = (BigDecimal) respuestasFacade.findResultadosxPreguntaxEncuestaxProcesoxValor6(p, pre, cuestionarios.get(m), 1);
            BigDecimal valor0 = (BigDecimal) respuestasFacade.findResultadosxPreguntaxEncuestaxProcesoxValor6(p, pre, cuestionarios.get(m), 0);
            ceros[m] = valor0.intValue();
            cincos[m] = valor5.intValue();
            cuatros[m] = valor4.intValue();
            tres[m] = valor3.intValue();
            dos[m] = valor2.intValue();
            unos[m] = valor1.intValue();


        }


        sesion.setAttribute("promediorepuestasE", promediorespuestasxencuesta);
        sesion.setAttribute("cerosE", ceros);
        sesion.setAttribute("unosE", unos);
        sesion.setAttribute("dosE", dos);
        sesion.setAttribute("tresE", tres);
        sesion.setAttribute("cuatrosE", cuatros);
        sesion.setAttribute("cincosE", cincos);
        sesion.setAttribute("pregunta", pre);
        sesion.setAttribute("encuestas", cuestionarios);

        return "/WEB-INF/vista/proceso/informe/detallePregunta.jsp";
    }

    private PreguntaFacade lookupPreguntaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PreguntaFacade) c.lookup("java:global/docenciaservicio/PreguntaFacade!com.docenciaservicio.sessionbeans.PreguntaFacade");
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
