/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;


/**
 *
 *
 */
public class Movimiento {
    
    private String placa;
    
    private Timestamp fechaHoraEntrada;
    private String tipoVehiculo ;
    

    public Movimiento() {
    }

    public String getPlaca() {
        return placa;
    }

    public void setplaca(String placa) {
        this.placa = placa;
    }

    public Timestamp getfechaHoraEntrada() {
        return fechaHoraEntrada;
    }

    public void setfechaHoraEntrada(Timestamp FechaHoraEntrada) {
        this.fechaHoraEntrada = FechaHoraEntrada;
    }

    public String gettipoVehiculo() {
        return tipoVehiculo;
    }

    public void settipoVehiculo(String TipoVehiculo) {
        this.tipoVehiculo = TipoVehiculo;
    }

    
    
    // CRUD de parqueaderos
    public boolean guardarMovimiento(){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "INSERT INTO movimientos(placa, fechaHoraEntrada, tipoVehiculo)"
                + " VALUES ( '" + this.placa + "',"
                + "'" + this.fechaHoraEntrada + "','" + this.tipoVehiculo  +  "');";

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
    
    public boolean borrarMovimiento(String idplaca){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "DELETE from movimientos WHERE placa = '" + idplaca + "'";

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

    

    public List<Movimiento> listarMovimiento() throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM movimientos ORDER BY idmovimiento ASC;";
        List<Movimiento> listaMovimiento = new ArrayList<>();
        ResultSet datos = conexion.consultarBD(sentencia);
        Movimiento movimiento;
        while (datos.next()) {
            movimiento = new Movimiento();
           
            movimiento.setplaca(datos.getString("placa"));
            movimiento.setfechaHoraEntrada(datos.getTimestamp("fechaHoraEntrada"));
            movimiento.setplaca(datos.getString("tipoVehiculo"));
            
        }
        conexion.closeConnection();
        return listaMovimiento;
    }

    public Movimiento obtenerMovimiento(String idplaca) throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM movimientos WHERE placa = '" + idplaca + "';";
        ResultSet datos = conexion.consultarBD(sentencia);
        Movimiento movimiento;
        if (datos.next()) {
            movimiento = new Movimiento();
           
            movimiento.setplaca(datos.getString("placa"));
            movimiento.setfechaHoraEntrada(datos.getTimestamp("fechaHoraEntrada"));
            movimiento.setplaca(datos.getString("tipoVehiculo"));
        }
        else {
        conexion.closeConnection();
        return null;
        }
        ;
        return null;
    }
}


