/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.sql.*;

/**
 *
 * @author ajeo
 */
public class ConexionBD {
    private String DB_driver = "";
    private String url = "";
    private String db = "";
    private String host = "";
    private String username = "";
    private String password = "";
    private ResultSet resultset = null;
    public Connection conexion = null;
    private Statement stmt = null;

    public ConexionBD() {
        DB_driver = "com.mysql.jdbc.Driver";
        host = "localhost:3306";
        db = "easy_parking_bd";
        url = "jdbc:mysql://" + host + "/" + db;
        username = "root";
        password = "root";
        try {
            // Asignación del driver
            Class.forName(DB_driver);
        }
        catch(ClassNotFoundException ex){
            System.out.println("Error asignación driver.");
        }
        try {
            // Crear conexión
            conexion = DriverManager.getConnection(url, username, password);
            System.out.println("Conexión exitosa.");
        }
        catch(SQLException ex){
            System.out.println("Error en crear conexión.");
        }
    }

    // Retornar conexión
    public Connection getConnection(){
        return conexion;
    }
    
    // Cerrar conexión
    public void closeConnection(){
        if(conexion != null){
            try {
                conexion.close();
            }
            catch(SQLException ex) {
                System.out.println("Error al cerrar la conexión.");
            }
        }
    }
    
    public ResultSet consultarBD(String sentencia){
        try {
            stmt = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultset = stmt.executeQuery(sentencia);
        }
        catch (SQLException ex) {
            System.out.println("Error al consultar la BD.");
        }
        return resultset;
    }
    
    public boolean insertarBD(String sentencia){
        try {
            stmt = conexion.createStatement();
            stmt.execute(sentencia);
            return true;
        }
        catch (SQLException ex) {
            System.out.println("Error al insertar en la BD.");
            return false;
        }
    }
    
    public boolean borrarBD(String sentencia){
        try {
            stmt = conexion.createStatement();
            stmt.execute(sentencia);
            return true;
        }
        catch (SQLException ex) {
            System.out.println("Error al borrar en la BD.");
            return false;
        }
    }

    public boolean actualizarBD(String sentencia){
        try {
            stmt = conexion.createStatement();
            stmt.execute(sentencia);
            return true;
        }
        catch (SQLException ex) {
            System.out.println("Error al actualizar en la BD.");
            return false;
        }        
    }

    public boolean setAutoCommitBD(boolean commit){
        try {
            conexion.setAutoCommit(commit);
            return true;
        }
        catch (SQLException ex) {
            System.out.println("Error en setAutoCommit.");
            return false;
        }
    }

    public boolean commitBD(){
        try {
            conexion.commit();
            return true;
        }
        catch (SQLException ex) {
            System.out.println("Error en Commit.");
            return false;
        }
    }

    public boolean rollbackBD(){
        try {
            conexion.rollback();
            return true;
        }
        catch (SQLException ex) {
            System.out.println("Error en Rollback.");
            return false;
        }    
    }
}