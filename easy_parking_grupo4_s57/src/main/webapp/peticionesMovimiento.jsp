<%-- 
    Document   : peticionesMovimiento
    Created on : 4/10/2021, 04:18:17 AM
    Author     : eleme
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="logica.Movimiento"%>
<%@page import="java.util.List"%>>
<%@page import="java.sql.Date"%>>

<%
    String respuesta = "";
    
    String proceso = request.getParameter("proceso");
    Movimiento movimiento = new Movimiento();
    switch (proceso) {
        case "guardarMovimiento":
            System.out.println("Guardar movimiento.");
            movimiento.setPlaca(request.getParameter("placa"));
          
            movimiento.settipoVehiculo(request.getParameter("tipoVehiculo"));

            if (movimiento.guardarMovimiento()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;
        
        case "eliminarMovimiento":
            System.out.println("Eliminar Movimiento.");
            String id = request.getParameter("placa");
            if (movimiento.borrarMovimiento(id)) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;
        case "listarMovimiento":
            System.out.println("Mostrar Movimientos.");
            List<Movimiento> listaMovimiento = movimiento.listarMovimiento();
            if (listaMovimiento.isEmpty()) {
                respuesta += "\"" + proceso + "\": true, \"Movimientos\":[]";
            } else {
                respuesta += "\"" + proceso + "\": true,\"Movimientos\":" + new Gson().toJson(listaMovimiento);
            }
            break;
        default:
            respuesta += "\"ok\": false,";
            respuesta += "\"error\": \"INVALID\",";
            respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                    + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>