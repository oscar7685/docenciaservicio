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
 * @author Usuario
 */
public class CrearDocente implements Action{

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        System.out.println("paso x aca!!");
        return "/WEB-INF/vista/muestra/formularioAgregarDocente.jsp";
    }
    
}
