/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.controlador.sqlConnection;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class sqlConnection {

    private Connection conexion = null;
    private String error = "";
    private StackTraceElement[] ste = null;

    public Connection getConnection() {
        return conexion;
    }

    public String getError() {
        return error;
    }

    public StackTraceElement[] getStackTraceElement() {
        return ste;
    }

    /**
     * Crea un objeto ConexionBD necesario para realizar la conexion y otras tareas sencillas.
     */
    public sqlConnection() {
        super();
    }

    /**
     * Crea un objeto ConexionBD necesario para realizar la conexion,
     * es necesario de que se le pase como parametro un interface Connection.
     * @param con  Variable de interface necesaria.
     */
    public sqlConnection(Connection con) {
        super();
        this.conexion = con;
    }

    //Realiza la conexiÃ³n a una BD MySQL.  Debe recordar aÃ±adir al proyecto el archivo '.jar' de MySQL.
    // * @param maquina  Nombre o direccion de la maquina donde se encuentra la BD MySQL.
    //* @param nombreBD  Nombre de la BD.
    // * @param usuario  Nombre de usuario.
    // * @param clave  Clave de la BD MySQL.
    //+
    public void conectarMySQL() {
        String maquina = "192.168.8.2";
        String nombreBD = "docencia?allowMultiQueries=true";
        String usuario = "root";
        String clave = "institucional";
       
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            error = "'conectarMySQL()' [Error al intentar cargar Driver. "
                    + (String) e.getMessage() + "]";
            System.err.println(error);
            ste = e.getStackTrace();
            e.printStackTrace();
        }
        try {
            String url = "jdbc:mysql://" + maquina + ":3307/" + nombreBD;
            conexion = (Connection) DriverManager.getConnection(url, usuario, clave);
           // System.out.println("conectado a " + bd);
        } catch (SQLException e) {
            error = "'conectarMySQL()' [Error al intentar conectarse. "
                    + (String) e.getMessage() + "]";
            System.err.println(error);
            ste = e.getStackTrace();
            e.printStackTrace();
            System.out.println("Error al Conectarse a la Bd./n" + "Verificar Datos Ingresados");
            
        }
    }

    /**
     * libera la memoria usada por el objeto.  Ademas libera cualquier otro recurso de la BD que se este utilizando.
     */
    public void cerrarConexion() {
        if (conexion != null) {
            try {
                conexion.close();
            } catch (SQLException ex) {
                error =
                        "'cerrarConexion()' [Error al intentar cerrar conexion. " + (String) ex.getSQLState() + "]";

                System.err.println(error);
                ste = ex.getStackTrace();
                ex.printStackTrace();
            } finally {
                conexion = null;
                System.out.println("Conexion cerrada con exito!!");
            }
        }
    } //Fin Desconectar

    //para  comprobar si esta conectado
    public boolean isConnect() {
        if (conexion == null) {
            return false;
        } else {
            return true;
        }
    } //Fin de Verificacion

    /**
     * Da informacion basica acerca de la conexion.  La informacion la arroja por consola.
     */
    public void informacionConexion() {
        try {
            System.out.println("Conexion cerrada:" + conexion.isClosed());
            System.out.println("Conexion de solo lectura:"+ conexion.isReadOnly());
        } catch (SQLException e) {
            error = "'informacionConexion()' [Error al intentar dar informacion basica acerca de la conexion. "
                    + (String) e.getMessage() + "]";
            System.err.println(error);
            ste = e.getStackTrace();
            e.printStackTrace();
        }
    }
}