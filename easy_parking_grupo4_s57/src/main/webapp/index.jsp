<%-- 
    Document   : index
    Created on : 17/09/2021, 08:49:18 PM
    Author     : ajeo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="estilos.css" />
        <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>  

    </head>
    <body>

        <div  ng-app="pruebaS57" ng-controller="controladorContactos">

            <div class="container-fluid">


                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Placa" aria-label="Placa" ng-model="Placa">
                    </div>
                    <div class="col">
                        <select class="form-select" aria-label="Tipo de vehiculo" ng-model="TipoVehiculo">
                        
                            <option value="1">Carro</option>
                            <option value="2">Moto</option>
                            
                        </select>
                    </div>
                </div>
                <br/>
                    
                <div class="row">
                    <div class="col-5"></div>
                    <div class="col-2">
                         <button type="button" class="btn btn-success">Guardar</button>
                    </div>
                    <div class="col-5"></div>
                </div>
                
                
                
            </div>




        </div>


    </body>
    <script src="logicaControler.js"></script>   
</html>
