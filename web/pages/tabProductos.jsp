        
<head>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        
    <!-- Angular JS: -->
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
</head>
<body ng-app="myApp" ng-controller="customersCtrl">
    <div class="form-group">
        <div class="input-group">
            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span><input class="form-control" type="search" id="buscadorProveedores" placeholder="Buscar Proveedores.." ng-model="busquedaProductos">
        </div>       
    </div>
            
    <table class="table table-responsive">
        <thead>
            <tr>
                <th>Nombre Proveedor</th>
                <th>Telefono 1</th>
                <th>Telefono 2</th>
                <th>Direccion Fisica</th>
                <th>Correo Electronico</th>
                <th>Sitio web</th>
            </tr>
        </thead>
        <tbody>
            <tr ng-repeat="p in productos| filter : busquedaProductos ">
                <td>{{ p.id }}</td>
                <td>{{ p.fkMarca }}</td>
                <td>{{ p.numeroSerie }}</td>
                <td>{{ p.nombreProducto }}</td>
                <td>nico.grossi4@gmail.com</td>
                <td>ngrossi.ddns.net</td>                       
            </tr>
        </tbody>
    </table>
            
    <!-- FORMULARIO : -->

    <div class="formulario jumbotron">
        <form class="form-horizontal" action="../WS/altaProductos.jsp">
           <div class="form-group">
               <label for="fkMarca" class="col-sm-2 control-label">Marca:</label>
               <div class="col-sm-9">
                   <select class="form-control" id="fkMarca" name="fkMarca">  
                       <option>1</option>
                       <option>2</option>
                       <option>3</option>
                       <option>4</option>
                   </select>
               </div>

           </div>
           <div class="form-group">
               <label for="numeroSerie" class="col-sm-2 control-label">Numero de Serie:</label>
               <div class="col-sm-9">
                   <input type="number" class="form-control" id="numeroSerie" name="numeroSerie">
               </div>
           </div>
           <div class="form-group">
               <label for="nombreProducto" class="col-sm-2 control-label">Nombre del Producto:</label>
               <div class="col-sm-9">
                   <input type="text" class="form-control" id="nombreProducto" name="nombreProducto">
               </div>
           </div>

           <div class="col-sm-4 col-sm-offset-4">
               <input type="submit" class="btn btn-primary col-sm-4 col-sm-offset-1" value="Agregar">
               <button class="btn btn-default col-sm-4 col-sm-offset-1">Cancelar</button>
           </div>
           <!--
               <div class="col-sm-10">
                 <input type="email" class="form-control" id="marca" placeholder="Email">
               </div>
           </div>
           <div class="form-group">
               <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
               <div class="col-sm-10">
                   <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
               </div>
           </div>
           <div class="form-group">
               <div class="col-sm-offset-2 col-sm-10">
                   <div class="checkbox">
                       <label>
                           <input type="checkbox"> Remember me
                       </label>
                   </div>
               </div>
           </div>
           <div class="form-group">
               <div class="col-sm-offset-2 col-sm-10">
                   <button type="submit" class="btn btn-default">Sign in</button>
               </div>
           </div>-->
       </form>
   </div>
             
                 <!-- Angular JS: -->
    <script>
var app = angular.module('myApp', []);
app.controller('customersCtrl', function($scope, $http) {
    $http.get("../WS/productos.jsp")
    .success(function (response) 
    {
        console.log(response);
        $scope.productos = response;
    });
});
    </script>