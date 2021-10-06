<%-- 
    Document   : peticiones
    Created on : 22/09/2021, 08:16:52 PM
    Author     : eleme
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="logica.Parqueadero"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>

<%
    String respuesta = "";
    String proceso = request.getParameter("proceso");
    Parqueadero parqueadero = new Parqueadero();
    switch(proceso){
        case "guardarParqueadero":
            System.out.println("Guardar parqueadero.");
            parqueadero.setNombre(request.getParameter("nombre"));
            parqueadero.setMaxCapacidadCarros(Integer.parseInt(request.getParameter("maxCapacidadCarros")));
            parqueadero.setMaxCapacidadMotos(Integer.parseInt(request.getParameter("maxCapacidadMotos")));
            parqueadero.setTarifaCarros(Integer.parseInt(request.getParameter("tarifaCarros")));
            parqueadero.setTarifaMotos(Integer.parseInt(request.getParameter("tarifaMotos")));
            if(parqueadero.guardarParqueadero()) {
                respuesta += "\"" + proceso + "\": true";
            }
            else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;
        case "actualizarParqueadero":
            System.out.println("Actualizar parqueadero.");
            parqueadero.setIdParqueadero(Integer.parseInt(request.getParameter("idParqueadero")));
            parqueadero.setNombre(request.getParameter("nombre"));
            parqueadero.setMaxCapacidadCarros(Integer.parseInt(request.getParameter("maxCapacidadCarros")));
            parqueadero.setMaxCapacidadMotos(Integer.parseInt(request.getParameter("maxCapacidadMotos")));
            parqueadero.setTarifaCarros(Integer.parseInt(request.getParameter("tarifaCarros")));
            parqueadero.setTarifaMotos(Integer.parseInt(request.getParameter("tarifaMotos")));
            if(parqueadero.actualizarParqueadero()) {
                respuesta += "\"" + proceso + "\": true";
            }
            else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;
        case "eliminarParqueadero":
            System.out.println("Eliminar parqueadero.");
            int id = Integer.parseInt(request.getParameter("identificacion"));
            if(parqueadero.borrarParqueadero(id)) {
                respuesta += "\"" + proceso + "\": true";
            }
            else {
                respuesta += "\"" + proceso + "\": false";
            }
            break;
        case "listarParqueaderos":
            System.out.println("Mostrar parqueadero.");
            List<Parqueadero> listaParqueaderos = parqueadero.listarParqueaderos();
            if(listaParqueaderos.isEmpty()) {
                respuesta += "\"" + proceso + "\": true, \"Parqueaderos\":[]";
            }
            else {
                respuesta += "\"" + proceso + "\": true,\"Parqueadero\":" + new Gson().toJson(listaParqueaderos);
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
