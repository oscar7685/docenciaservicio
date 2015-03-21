/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans.docenciaservicio;

import com.paquete.docenciaservicio.Cuestionario;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Oscar
 */
@Stateless
public class CuestionarioFacade extends AbstractFacade<Cuestionario> {
    @PersistenceContext(unitName = "docenciaservicioPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CuestionarioFacade() {
        super(Cuestionario.class);
    }
    
}
