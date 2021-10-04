/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global angular */

var app = angular.module('pruebaS57', []);

app.controller('controladorContactos', function($scope,$http){
    
    $scope.GuardarMovimiento=function(){
        
        let Movimiento={
            proceso:"guardarMvimiento",
            placa:$scope.Placa,
            tipoVehiculo:$scope.TipoVehiculo
            
            
        };
        $http({
            method: 'POST',
            url:"peticionesParqueadero.jsp",
            params: Movimiento
            
        }).then(function(respuesta){
            console.log(respuesta);
        });
        
    };
    
    
    
    
});

