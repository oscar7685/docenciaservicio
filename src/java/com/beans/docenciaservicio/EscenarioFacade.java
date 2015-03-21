/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans.docenciaservicio;

import com.paquete.docenciaservicio.Escenario;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Oscar
 */
@Stateless
public class EscenarioFacade extends AbstractFacade<Escenario> {
    @PersistenceContext(unitName = "docenciaservicioPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EscenarioFacade() {
        super(Escenario.class);
    }
    
}
