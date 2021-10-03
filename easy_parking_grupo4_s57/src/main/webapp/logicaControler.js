/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global angular */

var app = angular.module('pruebaS57', []);

app.controller('controladorContactos', function($scope,$http){
    
    $scope.GuardarParqueadero=function(){
        
        let parqueadero={
            proceso:"guardarMvimiento",
            nombre:$scope.nombre,
            maxCapacidadCarros:$scope.maxCarros,
            tarifaCarros:$scope.tarifaCarros,
            maxCapacidadMotos:$scope.maxMotos,
            tarifaMotos:$scope.tarifaMotosu
            
        };
        $http({
            method: 'POST',
            url:"peticionesParqueadero.jsp",
            params: parqueadero
            
        }).then(function(respuesta){
            console.log(respuesta);
        });
        
    };
    
    
    
    
});

