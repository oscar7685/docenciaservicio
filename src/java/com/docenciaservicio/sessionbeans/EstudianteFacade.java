/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.sessionbeans;

import com.docenciaservicio.entidades.Estudiante;
import com.docenciaservicio.entidades.Proceso;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
        




/**
 *
 * @author Ususario
 */
@Stateless
public class EstudianteFacade extends AbstractFacade<Estudiante> {

    @PersistenceContext(unitName = "docenciaservicioPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EstudianteFacade() {
        super(Estudiante.class);
    }

    public List<Estudiante> listaEstudiantes(Proceso p) {
        em.createNamedQuery("Estudiante.findByProceso").setParameter("parametroProceso", p).setHint("javax.persistence.cache.storeMode", "REFRESH").getResultList();
        return null;
    }
}
