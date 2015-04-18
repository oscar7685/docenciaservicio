/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador.docenciaservicio;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Usuario
 */
public class SubirArchivo extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();
        System.out.println("llega!!!!-----------------");
            if (!ServletFileUpload.isMultipartContent(request)) {
                throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
            }
            System.out.println("pasa1!!!!-----------------");
            ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
            PrintWriter writer = response.getWriter();

            response.setContentType("text/plain");
           
             
                List<FileItem> items;
        try {
            items = uploadHandler.parseRequest(request);
        System.out.println("pasa3!!!!-----------------");
                for (FileItem item : items) {
                    if (!item.isFormField()) {

                        FileItem actual = null;
                        actual = item;
                        String fileName = actual.getName();
                        
                          System.out.println("pasa4!!!!-----------------");
                        String str = request.getSession().getServletContext().getRealPath("/file/");
                        System.out.println("pasa5!!!!-----------------");

                        fileName = "" + fileName;
                        
                          System.out.println(str +"pasa66!!!!-----------------");
                        // nos quedamos solo con el nombre y descartamos el path
                        File fichero = new File(str + "\\" + fileName);
                        
                          System.out.println("pasa77!!!!-----------------");
                        try {
                            // escribimos el fichero colgando del nuevo path
                                 System.out.println(str +"pasa88!!!!-----------------");
                            actual.write(fichero);
                                 System.out.println(str +"pasa78!!!!-----------------");
                        } catch (Exception ex) {
                            Logger.getLogger(SubirArchivo.class.getName()).log(Level.SEVERE, null, ex);
                        }

                        

                        
                    }
                }
           } catch (FileUploadException ex) {
            Logger.getLogger(SubirArchivo.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            

        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
