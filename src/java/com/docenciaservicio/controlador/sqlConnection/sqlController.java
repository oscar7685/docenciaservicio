/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.controlador.sqlConnection;

import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.jsp.jstl.sql.Result;
import javax.servlet.jsp.jstl.sql.ResultSupport;

public class sqlController {

    private sqlConnection linkDB = null;
    private Connection con = null;

    //////////////////////////////////////////////////////////////////////
    public void setConexion(sqlConnection conex) {
        linkDB = conex;
        con = linkDB.getConnection();
        System.out.println("[CONEXION RECIBIDA]");
    }

    ///////////////////////////////////////////////////////////////////////
    public boolean isConected() {
        boolean result = false;
        if ((linkDB != null) && (linkDB.isConnect())) {
            result = true;
        }
        return result;
    }

    public void cerrarConexion() {

        if (this.isConected()) {
            linkDB.cerrarConexion();
        }
    }

    public ResultSet CargarSql(String sql) {


        ResultSet rs = null;
        Connection con = null;
        sqlConnection sqlCon = new sqlConnection();

        try {

            sqlCon.conectarMySQL();
            con = (Connection) sqlCon.getConnection();

            Statement st = (Statement) con.createStatement();
            // System.out.println("Se ha realizado con exito la conexion a MySQL");
            //el resultSet es el encargado de traer los datos de la consulta
            rs = st.executeQuery(sql);


        } catch (SQLException ex) {
            System.out.println(ex);
        } catch (Error ex) {
            System.out.println(ex);
        }
        return rs;
    }

    public Result CargarSql2(String sql) {


        ResultSet rs = null;
        Result result = null;
        Connection con = null;
        sqlConnection sqlCon = new sqlConnection();

        try {

            sqlCon.conectarMySQL();


            con = (Connection) sqlCon.getConnection();

            Statement st = (Statement) con.createStatement();

            rs = st.executeQuery(sql);
            result = ResultSupport.toResult(rs);


        } catch (SQLException ex) {
            System.out.println(ex);
        } catch (Error ex) {
            System.out.println(ex);
        }
        return result;
    }

    public String UpdateSql(String sql) {

        String aux = "";
        String id = "";
        Connection con = null;
        sqlConnection sqlCon = new sqlConnection();

        try {
            sqlCon.conectarMySQL();
            con = (Connection) sqlCon.getConnection();
            con.setAutoCommit(false);

            Statement st = (Statement) con.createStatement();
            // System.out.println("Se ha realizado con exito la conexion a MySQL");

            st.executeUpdate(sql);
            con.commit();

        } catch (SQLException ex) {
            try {
                con.rollback();
                //aux = false;
                aux += "<br/>" + ex.getMessage();
                // System.err.println("SQLState: " + ((SQLException) ex).getSQLState());
                //System.err.println("Codigo del error: " + ((SQLException) ex).getErrorCode());
                //System.err.println("Mensaje: " + ex.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    //   System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            } catch (SQLException ex1) {
                Logger.getLogger(sqlController.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } catch (Exception ex) {
            aux = "Excepcion deconocida";
            //System.out.println(ex);
        } finally {
            try {
                con.close();
                //System.out.println("sqlConnection Cerrada con Exito...");
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        }
        return aux;
    }
}