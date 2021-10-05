/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global angular */

var app = angular.module('pruebaS57', []);

app.controller('controladorParqueaderos', function ($scope, $http) {

    $scope.guardarMovimientos = function () {

        if ($scope.placa === undefined || $scope.tipoVehiculo === undefined) {
            alert('Todos los campos son obligatorios');
        } else {

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
                    $scope.listarContactos();
                } else {
                    alert('Error al guardar en la BD');
                }
            }).catch(function (error) {
                alert('Servicio no disponible, intente más tarde!');
                console.log(error);
            });
        }




    };


    $scope.GuardarParqueadero = function () {

        if ($scope.nombre === undefined || $scope.maxCarros === undefined
                || $scope.tarifaCarros === undefined || $scope.maxMotos === undefined ||
                $scope.tarifaMotos === undefined) {
            alert('Todos los campos son obligatorios');
        } else {

            $scope.mostrarmovimiento = true;
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

    }




});

