/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global angular, $scope, bootstrap */

var app = angular.module('pruebaS57', []);

app.controller('controladorParqueaderos', function ($scope, $http) {

///---------------------------------------------------MOVIMIENTOS-------------------------------------------------------
    
    $scope.mostrarFormularioParqueadero=true;
    $scope.guardarMovimientos = function () {
       let regexMinCharacter=/^.{6,}$/;
        
        if ($scope.placa === undefined || $scope.tipoVehiculo === undefined) {
            alert('Todos los campos son obligatorios');
        }else if(!regexMinCharacter.test($scope.placa)){
            alert("error al digitar la placas");
        }    
         else {

            let Movimiento = {
                proceso: "guardarMovimiento",
                placa: $scope.placa,
                tipoVehiculo: $scope.tipoVehiculo


            };
            $http({
                method: 'POST',
                url: "peticionesMovimiento.jsp",
                params: Movimiento

            }).then(function (respuesta) {
                console.log(respuesta);
                if (respuesta.data.guardarMovimiento) {
                    alert('Guardado Exitoso');
                    $scope.placa=undefined;
                    $scope.tipoVehiculo=undefined;
                } else {
                    alert('Error al guardar en la BD');
                }
            }).catch(function (error) {
                alert('Servicio no disponible, intente más tarde!');
                console.log(error);
            });
        }

    };
     $scope.listarMovimientos = function () {
       $scope.listarContactos();
        let params = {
            proceso: 'listarMovimiento'
        };

        $http({
            method:'GET',
            url: 'peticionesMovimiento.jsp',
            params: params
        }).then(function (respuesta) {
           
            $scope.movimientos = respuesta.data.Movimientos;
            console.log(respuesta);
        });
        
        
        
    };
    
    $scope.eliminarMovimiento = function () {
        let params = {
            proceso:'eliminarMovimiento',
            idmovimiento:$scope.idParaEliminar
        };
        $http({
            method: 'GET',
            url: 'peticionesMovimiento.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.eliminarMovimiento) {
                alert('contacto eliminado');
                 $scope.listarMovimientos();
            } else {
                alert('Error al eliminar contacto');
            }

        });
    };
        
        
    

///----------------------------------------------------PARQUEADERO-----------------------------------------------------------

    $scope.GuardarParqueadero = function () {

        if ($scope.nombre === undefined || $scope.maxCarros === undefined
                || $scope.tarifaCarros === undefined || $scope.maxMotos === undefined ||
                $scope.tarifaMotos === undefined) {
            alert('Todos los campos son obligatorios');
        } else {

            $scope.mostrarmovimiento= true;
            $scope.mostrarFormularioParqueadero=false;
            let parqueadero = {
                proceso: "guardarParqueadero",
                nombre: $scope.nombre,
                maxCapacidadCarros: $scope.maxCarros,
                tarifaCarros: $scope.tarifaCarros,
                maxCapacidadMotos: $scope.maxMotos,
                tarifaMotos: $scope.tarifaMotos

            };
            $http({
                method: 'POST',
                url: "peticionesParqueadero.jsp",
                params: parqueadero

            }).then(function (respuesta) {
                console.log(respuesta);
            });

        }
        ;

    };

///-----------------------------------------------------------FUNTONS--------------------------------

$scope.mostrarMovimientos=function(){
    $scope.mostrarmovimiento = true;
   $scope.listarcontactos=false;
   $scope.mostrarFormularioParqueadero=false;
};
$scope.listarContactos=function(){
    $scope.mostrarmovimiento = false;
    $scope.listarcontactos=true;
    $scope.mostrarFormularioParqueadero=false;
};

$scope.mostrarFormulario=function(){
    $scope.mostrarmovimiento = false;
    $scope.listarcontactos=false;
    $scope.mostrarFormularioParqueadero=true;
};


 $scope.abrirModal = function (idmovimiento) {
        $scope.idParaEliminar = idmovimiento;
        var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {
            keyboard: false
    
    }); 
        myModal.show();
    };

$scope.abrirModalActualizar = function (idmovimiento) {
        $scope.idParaActualizar = idmovimiento;
        var myModal = new bootstrap.Modal(document.getElementById('modalActualizar'), {
            keyboard: false
    
    }); 
        myModal.show();
    };


});

