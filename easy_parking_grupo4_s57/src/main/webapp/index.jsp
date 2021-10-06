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

     <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" ng-click="mostrarFormulario()">Guardar contacto</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link"  ng-click="listarParqueadero()">Listar Parqueaderos</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            
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
            </div>
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
            
            </div>
            
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
              ng-model="tarifaMotos"
            />
           <label>tarifa motos</label>
            
            <br>
            <br>
            <button class="btn btn-primary boton" type="button" ng-click="GuardarParqueadero()" >GUARDAR</button>
          </div>
            
          
             </div>
        </div>
      </div> 
     </div>   
        <!--FORMULARIO/----------------------------------------------------------->

     <div class="row d-flex justify-content-center">
                    <div class="col-6" style="text-align: center"><h1>Lista de contactos</h1></div>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">nombre</th>
                            <th scope="col">maxCarros</th>
                            <th scope="col">tarifaCarros</th>
                            <th scope="col">maxMotos</th>
                            <th scope="col">tarifaMotos</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="contacto in contactos">
                            <th scope="row">{{contacto.nombre}}</th>
                            
                            <td>{{contacto.maxCarros}}</td>
                            <td>{{contacto.tarifaCarros}}</td>
                            <td>{{contacto.tarifaCarros}}</td>
                            <td>{{contacto.maxMotos}}</td>
                            
                            <td style="cursor: pointer" ng-click="mostrarFormActualizar(contacto)">actualizar</td>
                            <td style="cursor: pointer" ng-click="abrirModal(contacto.identificacion)">borrar</td>
                        </tr>
                    </tbody>
                </table>

     
        
      
    
        
   </div>    
    </body>
     <script src="logicaControler.js"></script>   
</html>
