/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.actions;



import com.docenciaservicio.interfaz.Action;
import com.docenciaservicio.entidades.Estudiante;
import com.docenciaservicio.entidades.Proceso;
import com.docenciaservicio.sessionbeans.EstudianteFacade;
import com.docenciaservicio.sessionbeans.FuenteFacade;
import com.docenciaservicio.sessionbeans.ProcesoFacade;
import com.docenciaservicio.sessionbeans.ProgramaFacade;
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
 * @author Usuario
 */
public class EliminarEstudiante implements Action {
    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();

    
    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("proceso");

        String identificacion = (String) request.getParameter("identificacionElim");
        
        Estudiante aux = estudianteFacade.find(identificacion);

        estudianteFacade.remove(aux);
        sesion.setAttribute("listaEstudiantes", estudianteFacade.findByList("procesoIdproceso", proceso));

        return "NA";
    }


    private EstudianteFacade lookupEstudianteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EstudianteFacade) c.lookup("java:global/docenciaservicio/EstudianteFacade!com.docenciaservicio.sessionbeans.EstudianteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
