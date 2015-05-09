/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.sessionbeans;

import com.docenciaservicio.entidades.Fuente;
import java.util.List;
import javax.annotation.Resource;
import javax.ejb.EJBContext;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.UserTransaction;

/**
 *
 * @author Oscar
 */
@Stateless
public class FuenteFacade extends AbstractFacade<Fuente> {

    @PersistenceContext(unitName = "docenciaservicioPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public FuenteFacade() {
        super(Fuente.class);
    }
    

    public void insertarFuente(List<Fuente> fuente) {
        for (Fuente fuente1 : fuente) {
            create(fuente1);
        }
    }

    public void eliminarFuente(List<Fuente> fuente) {
        for (Fuente fuente1 : fuente) {
            remove(fuente1);
        }
    }
}
