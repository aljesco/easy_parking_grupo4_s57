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
        
        let parqueadero={
            proceso:"guardarParqueadero",
            nombre:$scope.nombre,
            maxCapacidadCarros:$scope.maxCarros,
            tarifaCarros:$scope.tarifaCarros,
            maxCapacidadMotos:$scope.maxMotos,
            tarifaMotos:$scope.tarifaMotos
            
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
        
   $scope.actualizarMovimiento = function () {
        let params = {
           proceso: "actualizarMovimiento",
           placa: $scope.placa,
           tipoVehiculo: $scope.tipoVehiculo,
           idmovimiento:$scope.idParaActualizar
        };

        $http({
            method: 'GET',
            url: 'peticionesMovimiento.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.actualizarMovimiento) {
                alert('Actualización exitosa');
                $scope.listarMovimientos();
            } else {
                alert('No se pudo actualizar');
            }
            console.log(respuesta);
        });
    };     
    
    $scope.listarParqueadero=function(){
        
        let parametros={
            proceso:"listarParqueaderos"
        };
        
        $http({
            method: 'GET',
            url:"peticionesParqueadero.jsp",
            params: parametros
        }).then(function(respuesta){
            console.log(respuesta);
        });
    };
    
    }); 
        myModal.show();
    };


});

