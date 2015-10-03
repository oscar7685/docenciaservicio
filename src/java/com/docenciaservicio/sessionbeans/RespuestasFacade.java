/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.sessionbeans;

import com.docenciaservicio.entidades.Cuestionario;
import com.docenciaservicio.entidades.Pregunta;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.entidades.Respuestas;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Ususario
 */
@Stateless
public class RespuestasFacade extends AbstractFacade<Respuestas> {

    @PersistenceContext(unitName = "docenciaservicioPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RespuestasFacade() {
        super(Respuestas.class);
    }

    public List findResultadosxPreguntaxEncuestaxProceso(Proceso p, Cuestionario c, Pregunta pre) {
        Query q = em.createNamedQuery("Respuestas.findResultadosxPreguntaxEncuestaxProceso");
        q.setParameter("pregunta", pre);
        q.setParameter("cuestionario", c);
        q.setParameter("proceso", p);
        return q.getResultList();
    }

    public List findResultadosxPreguntaxEncuestaxProcesoxValor1(Proceso p, Pregunta pre) {
        Query q = em.createNamedQuery("Respuestas.findResultadosxPreguntaxEncuestaxProcesoxValor1");
        q.setParameter("pregunta", pre);
        q.setParameter("proceso", p);
        return q.getResultList();
    }
}
