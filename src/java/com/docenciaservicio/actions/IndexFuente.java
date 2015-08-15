/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;

import com.docenciaservicio.interfaz.Action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

/**
 *
 */
public class IndexFuente implements Action{

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        return "/WEB-INF/vista/evaluador/inicio.jsp";
    }
    
}
