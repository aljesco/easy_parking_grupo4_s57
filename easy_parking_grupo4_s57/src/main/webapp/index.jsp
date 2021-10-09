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
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>

    </head>
    <body>
        
     
        
        
        
  <!--FORMULARIO PARQUEADEROS------------------------------------------------------------------------------------------------------------------------------------->

        
        <div  ng-app="pruebaS57" ng-controller="controladorParqueaderos"> 

            
             <!--NAV BAR------------------------------------------------------------------------------------------------------------------------------------->
       
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page"ng-click="mostrarFormulario()">Formulario</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" ng-click="mostrarMovimientos()">Movimientos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" ng-click="listarMovimientos()">Listar Movimientos</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        
     <!--NAV BAR------------------------------------------------------------------------------------------------------------------------------------->
     
        
     

            <!--TARJETA------------------------------------------------->
            <div class="card text-center" ng-show="mostrarFormularioParqueadero"> 

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
                                    <label>maxima capacidad de motos</label>

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

                                <!--FORMULARIO/----------------------------------------------------------->


                                <!--TARJETA/------------------------------------------------------------------>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <br/>
            <br/>
            <br/>


  <!--/FORMULARIO PARQUEADEROS------------------------------------------------------------------------------------------------------------------------------------->
         
            
            
   <!--MOVIMIENTOS/------------------------------------------------------------------------------------------------------------------------------------->

            <div class="container-fluid" ng-show="mostrarmovimiento">
                <h1>{{nombre}}</h1>

                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Placa" aria-label="Placa" ng-model="placa">
                    </div>
                    <div class="col">
                        <select class="form-select" aria-label="Tipo de vehiculo" ng-model="tipoVehiculo">
                              
                            <option  selected>Carro</option>
                            <option >Moto</option>

                        </select>
                    </div>
                </div>
                <br/>

                <div class="row">

                    <button class="btn btn-primary boton" type="button" ng-click="guardarMovimientos()" >GUARDAR</button>
                </div>

            </div>

   <!--MOVIMIENTOS/------------------------------------------------------------------------------------------------------------------------------------->



   <div class="container-fluid " ng-show="listarcontactos">
                <div class="row d-flex justify-content-center">
                    <div class="col-6" style="text-align: center"><h1>Lista de movimientos</h1></div>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Id movimiento</th>
                            <th scope="col">Placa</th>
                            <th scope="col">Fecha y hora entrada</th>
                            <th scope="col">Tipo de vehiculo</th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="movimiento in movimientos">
                            
                            <th scope="row">{{$index+1}}</th>
                            <td>{{movimiento.placa}}</td>
                            <td>{{movimiento.fechaHoraEntrada}}</td>
                            <td>{{movimiento.tipoVehiculo}}</td>
                           
                            <td style="cursor: pointer" ng-click="abrirModalActualizar(movimiento.idmovimiento)">actualizar</td>
                            <td style="cursor: pointer" ng-click="abrirModal(movimiento.idmovimiento)">borrar</td>
                        </tr>
                    </tbody>
                </table>
       </div>
       <!--MODAL--------------->
                       
            
   <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Borrar contacto</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Está seguro que desea eliminar el contacto?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal" ng-click="eliminarMovimiento()">Eliminar</button>
                            </div>
                        </div>
                    </div>
                </div>
         <div class="modal fade" id="modalActualizar" tabindex="-1" aria-labelledby="modalActualizar" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Actualizar Movimiento</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                 <input type="text" class="form-control" placeholder="Placa" aria-label="Placa" ng-model="placa">
                                 <select class="form-select" aria-label="Tipo de vehiculo" ng-model="tipoVehiculo">
                              
                            <option  selected>Carro</option>
                            <option >Moto</option>

                                 </select>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-danger" data-bs-dismiss="modal" ng-click="actualizarMovimient()">Actualizar</button>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
   
       
       
       
   </div>


    </body>
    <script src="logicaControler.js"></script>   
</html>
