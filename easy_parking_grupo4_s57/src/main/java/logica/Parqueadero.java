/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ajeo
 */
public class Parqueadero {
    private int idParqueadero;
    private String nombre;
    private int maxCapacidadCarros;
    private int maxCapacidadMotos;
    private int tarifaCarros;
    private int tarifaMotos;

    public Parqueadero() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getMaxCapacidadCarros() {
        return maxCapacidadCarros;
    }

    public void setMaxCapacidadCarros(int maxCapacidadCarros) {
        this.maxCapacidadCarros = maxCapacidadCarros;
    }

    public int getMaxCapacidadMotos() {
        return maxCapacidadMotos;
    }

    public void setMaxCapacidadMotos(int maxCapacidadMotos) {
        this.maxCapacidadMotos = maxCapacidadMotos;
    }

    public int getTarifaCarros() {
        return tarifaCarros;
    }

    public void setTarifaCarros(int tarifaCarros) {
        this.tarifaCarros = tarifaCarros;
    }

    public int getTarifaMotos() {
        return tarifaMotos;
    }

    public void setTarifaMotos(int tarifaMotos) {
        this.tarifaMotos = tarifaMotos;
    }

    public void setIdParqueadero(int idParqueadero) {
        this.idParqueadero = idParqueadero;
    }
    
    // CRUD de parqueaderos
    public boolean guardarParqueadero(){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "INSERT INTO parqueaderos(nombre, maxCapacidadCarros, maxCapacidadMotos, tarifaCarros, tarifaMotos)"
                + " VALUES ( '" + this.nombre + "',"
                + "'" + this.maxCapacidadCarros + "','" + this.maxCapacidadMotos + "',"
                + "'" + this.tarifaCarros + "','" + this.tarifaMotos +  "');";

        // Configurar setAutocommit de conexionBD como FALSE
        if(conexion.setAutoCommitBD(false)){
            if(conexion.insertarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else{
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        } else{
            conexion.closeConnection();
            return false;
        }
    }
    
    public boolean borrarParqueadero(int id){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "DELETE from parqueaderos WHERE idParqueadero = '" + id + "'";

        // Configurar setAutocommit de conexionBD como FALSE
        if(conexion.setAutoCommitBD(false)){
            if(conexion.borrarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else{
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        } else{
            conexion.closeConnection();
            return false;
        }
    }

    public boolean actualizarParqueadero(){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE `parqueaderos` SET nombre = '" + this.nombre
                + "',maxCapacidadCarros = '" + this.maxCapacidadCarros
                + "',maxCapacidadMotos = '" + this.maxCapacidadMotos
                + "',tarifaCarros = '" + this.tarifaCarros
                + "',tarifaMotos = '" + this.tarifaMotos
                +  "' WHERE idParqueadero = " + this.idParqueadero + ";";

        // Configurar setAutocommit de conexionBD como FALSE
        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else{
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        } else{
            conexion.closeConnection();
            return false;
        }
    }

    public List<Parqueadero> listarParqueaderos() throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM parqueaderos ORDER BY idParqueadero ASC;";
        List<Parqueadero> listaParqueaderos = new ArrayList<>();
        ResultSet datos = conexion.consultarBD(sentencia);
        Parqueadero parqueadero;
        while (datos.next()) {
            parqueadero = new Parqueadero();
            parqueadero.setIdParqueadero(Integer.parseInt(datos.getString("idParqueadero")));
            parqueadero.setNombre(datos.getString("nombre"));
            parqueadero.setMaxCapacidadCarros(Integer.parseInt(datos.getString("maxCapacidadCarros")));
            parqueadero.setMaxCapacidadMotos(Integer.parseInt(datos.getString("maxCapacidadMotos")));
            parqueadero.setTarifaCarros(Integer.parseInt(datos.getString("tarifaCarros")));
            parqueadero.setTarifaMotos(Integer.parseInt(datos.getString("tarifaMotos")));
            listaParqueaderos.add(parqueadero);
        }
        conexion.closeConnection();
        return listaParqueaderos;
    }

    public Parqueadero obtenerParqueadero(int id) throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM parqueaderos WHERE idParqueadero = '" + id + "';";
        ResultSet datos = conexion.consultarBD(sentencia);
        Parqueadero parqueadero;
        if (datos.next()) {
            parqueadero = new Parqueadero();
            parqueadero.setNombre(datos.getString("nombre"));
            parqueadero.setMaxCapacidadCarros(Integer.parseInt(datos.getString("maxCapacidadCarros")));
            parqueadero.setMaxCapacidadMotos(Integer.parseInt(datos.getString("maxCapacidadMotos")));
            parqueadero.setTarifaCarros(Integer.parseInt(datos.getString("tarifaCarros")));
            parqueadero.setTarifaMotos(Integer.parseInt(datos.getString("tarifaMotos")));
            return parqueadero;
        }
        else {
        conexion.closeConnection();
        return null;
        }
    }
}
