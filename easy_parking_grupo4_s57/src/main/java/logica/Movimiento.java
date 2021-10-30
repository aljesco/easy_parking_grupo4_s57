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
import java.sql.Timestamp;




/**
 *
 *
 */
public class Movimiento {
    private int idmovimiento; 
    private String placa;
    private Timestamp fechaHoraEntrada;
    private String tipoVehiculo ;
    private int valorPago; 
    
    public Movimiento() {
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }
    public int getidmovimiento() {
        return idmovimiento;
    }
    public void setidmovimiento(int idmovimiento) {
        this.idmovimiento = idmovimiento;
    }

    public Timestamp getFechaHoraEntrada() {
        return fechaHoraEntrada;
    }

    public void setFechaHoraEntrada(Timestamp fechaHoraEntrada) {
        this.fechaHoraEntrada = fechaHoraEntrada;
    }
   
   
    
    
     public int getvalorPago() {
        return valorPago;
    }
    public void setvalorPago(int valorPago) {
        this.valorPago = valorPago;
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
        String sentencia = "INSERT INTO movimientos(placa, tipoVehiculo)"
                + " VALUES ( '" + this.placa + "',"
                + "'" + this.tipoVehiculo + "');";

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
    
    public boolean borrarMovimiento(int idmovimiento){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "DELETE from movimientos WHERE idmovimiento = '" + idmovimiento + "'";

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
    
    public boolean actualizarMovimiento(){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE `movimientos` SET placa='" + this.placa + "',tipoVehiculo='" + this.tipoVehiculo + "' WHERE idmovimiento=" + this.idmovimiento +";";
        System.out.println(sentencia);
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

    

    public List<Movimiento> listarMovimiento () throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM movimientos ORDER BY idmovimiento ASC;";
        List<Movimiento> listaMovimiento = new ArrayList<>();
        ResultSet datos = conexion.consultarBD(sentencia);
        Movimiento movimiento;
        while (datos.next()) {
            movimiento = new Movimiento();
            movimiento.setidmovimiento(datos.getInt("idmovimiento"));
            movimiento.setPlaca(datos.getString("placa"));
            movimiento.setFechaHoraEntrada(datos.getTimestamp("fechaHoraEntrada"));
            movimiento.settipoVehiculo(datos.getString("tipoVehiculo"));
            movimiento.setvalorPago(datos.getInt("valorPago"));
            listaMovimiento.add(movimiento);
            
        }
        conexion.closeConnection();
        return listaMovimiento;
    }
    
    

    @SuppressWarnings("empty-statement")
    public Movimiento obtenerMovimiento(String idplaca) throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM movimientos WHERE placa = '" + idplaca + "';";
        ResultSet datos = conexion.consultarBD(sentencia);
        Movimiento movimiento;
        if (datos.next()) {
            movimiento = new Movimiento();
           
            movimiento.setPlaca(datos.getString("placa"));
           
            movimiento.setPlaca(datos.getString("tipoVehiculo"));
            
        }
        else {
        conexion.closeConnection();
        return null;
        }
        ;
        return null;
    }
}


