
//Dependencias
//peticion get y peticion post
var app=angular.module("appManual",[]);
app.controller("primerControlador",["$scope", "$http",function(escope, http){

    escope.listaJson=[];
    

    http.get("https://my-json-server.typicode.com/Hyperyor/hibernate/db")
    .then(function(response){//el parametro recibido es lo que retorna el servidor
        
        console.log(response.data.compatibilidad);
        escope.listaJson=response.data.compatibilidad;

    });
    
    escope.nuevoLista={};
}]);



