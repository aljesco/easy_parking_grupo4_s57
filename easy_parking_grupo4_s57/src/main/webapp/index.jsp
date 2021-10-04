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

            <div class="col-6">
      <!--TARJETA------------------------------------------------->
      <div class="card text-center">
      
        <h1>Formulario Parqueadero </h1>
        
        <br>
        <br>
        <!--FORMULARIO------------------------------------------------->
        <div class="card-body tarjeta">
            
                
            
            
          
          <div class="form-floating ">
            <input
              type="text"
              class="form-control txt"
              id="floatingPassword"
              placeholder="nombre"
              ng-model="nombre"
            />
            <label>nombre del parqueadero</label>
            
            <br>
            
             <div class="form-floating ">
            <input
              type="text"
              class="form-control txt"
              id="floatingPassword"
              placeholder="maxCarros"
              ng-model="maxCarros"
            />
            <label>maxima capacidad de carros</label>
            
            <br>
            
            
            
             <div class="form-floating ">
            <input
              type="text"
              class="form-control txt"
              id="floatingPassword"
              placeholder="tarifaCarros"
              ng-model="tarifaCarros"
            />
            <label>tarifa de carros</label>
            
            <br>
            
             <div class="form-floating ">
            <input
              type="text"
              class="form-control txt"
              id="floatingPassword"
              placeholder="maxMotos"
              ng-model="maxMotos"
            />
           <label>hmaxima capacidad de motos</label>
            
            <br>
            
              <div class="form-floating ">
            <input
              type="text"
              class="form-control txt"
              id="floatingPassword"
              placeholder="tarifaMotosu"
              ng-model="tarifaMotosu"
            />
           <label>tarifa motos</label>
            
            <br>
            <br>
            <button class="btn btn-primary boton" type="button" ng-click="GuardarParqueadero()" >GUARDAR</button>
          </div>
            
          

        </div>

        <!--FORMULARIO/----------------------------------------------------------->

     
        <!--TARJETA/------------------------------------------------------------------>
      </div>
        
      </div>
            
            
            
            
            
            
            
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
                        <button type="submit" class="btn btn-success" ng-click="GuardarMovimiento()">Guardar</button>
                    </div>
                    <div class="col-5"></div>
                </div>
                
                
                
            </div>




        </div>


    </body>
    <script src="logicaControler.js"></script>   
</html>
