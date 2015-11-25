<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %> 
    </head>
    <body ng-app="app" ng-controller="ControllerDeProductos">
        
        <!-- NAV BAR -->
        <%@include file="navbar.jsp" %> 
        
        <%@include file="sideBar.jsp" %> 
       
        <!--  WRAPPER -->
        <div class="col-md-9" id="wraper">
            
            <div class="table-responsive panel panel-primary" >
                <div class="panel-heading">Grilla de Productos</div>
                <div class="panel-body">
                    
                    <!-- SEARCHING BAR -->
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                            <input class="form-control" type="search" id="buscadorProveedores" placeholder="Buscar Productos.." ng-model="filtroProductos">
                        </div>       
                    </div>
                    
                    <!-- GRILLA -->
                    <table class="table table-hover">
                        <thead>    
                            <tr>
                                <th></th>
                                <th></th>
                                <th>Nombre Marca</th>
                                <th>Numero Serie</th>
                                <th>Nombre Producto</th>
                                <th>Detalles</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat=" p in productos | filter : filtroProductos">
                                <td><input type="checkbox" ng-click="editarMany(p)" class="checksGrid"></td>
                                <td><button class="btn btn-default" id="btnprueba" ng-click="editarOne(p)" value="Editar"><span class="glyphicon  glyphicon-pencil"></span></button></td>
                                <td>{{p.nombreProducto}}</td>
                                <td>{{p.numeroSerie}}</td>
                                <td>{{p.telefono2}}</td>
                                <td>{{p.detalles}}</td>
                                <td><button class="btn btn-danger" ng-click="deleteOne(p)"><span class="glyphicon glyphicon-remove"></span></button></td>
                            </tr>
                        </tbody>
                    </table> 
                    <img src="res/img/ajax-loader.gif" class=" col-sm-offset-5 col-sm-2 img-thumbnail img-responsive" ng-hide="gridLoaded">
                </div>
            </div>
            
            <!-- FORMULARIO : -->
            <div class="panel panel-primary">
                <div class="panel-heading" ng-show="modoEdicionUnitaria">Formulario Edicion Productos:
                    <div class="glyphicon glyphicon-remove" ng-click="closeEditMode()" style="float:right; cursor:pointer; z-index: 2;"></div>
                </div>
                <div class="panel-heading" ng-hide="modoEdicionUnitaria">
                    <span>Formulario Alta Productos:</span>
                </div>
                
                <div class="panel-body">
                    <form class="form-horizontal" action="{{urlFormulario}}">
                        <div class="form-group" ng-show="modoEdicionUnitaria">
                            <label for="id" class="control-label">ID:</label>
                            <input type="text" name="identificador" ng-model="productoFormulario.id" placeholder="No tocar!">
                        </div>
                        <div class="form-group">
                            <label for="fkMarca" class="col-sm-2 control-label">Marca:</label>
                            <div class="col-sm-9">
                                <select class="form-control" id="fkMarca" name="fkMarca">  
                                    <option ng-repeat="proveedor in proveedores " value="{{proveedor.id}}">{{proveedor.nombre}}</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="numeroSerie" class="col-sm-2 control-label">Numero de Serie:</label>
                            <div class="col-sm-9">
                                <input type="number" class="form-control" id="numeroSerie" name="numeroSerie" ng-model="productoFormulario.numeroSerie">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nombreProducto" class="col-sm-2 control-label">Nombre del Producto:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="nombreProducto" name="nombreProducto" ng-model="productoFormulario.nombreProducto">
                            </div>
                        </div>

                        <input type="submit" class="btn btn-success col-sm-12" value="Agregar Producto" ng-hide="modoEdicionUnitaria" ng-show="modoAlta">

                        <input type="submit" class="btn btn-primary col-sm-12" value="Editar Producto" ng-show="modoEdicionUnitaria" ng-hide="modoEdicionMultiple || modoAlta">

                        <input type="submit" class="btn btn-primary col-sm-12" value="Editar marca" ng-show="modoEdicionMultiple" ng-hide="modoEdicionUnitaria || modoAlta">
                    </form>
                </div>
           </div>
        </div>
    </body>
    
                 
    <!-- Angular JS: -->
    <script>
        urlAltas = "../WS/altaProductos.jsp";
        urlEdit = "../WS/editProducto.jsp";
        urlDelete = "../WS/deleteProductos.jsp";
        urlGrid = "../WS/gridProductos.jsp";
        urlThisPage = "productos.jsp";
        urlError = "error.jsp";
        urlComboProveedores = "../WS/gridProveedores.jsp";
        var app = angular.module('app', []);
        app.controller('ControllerDeProductos', function($scope, $http) 
        { 
            $scope.gridLoaded = false;
            $scope.modoAlta= true;
            $scope.modoEdicionUnitaria = false;
            $scope.modoEdicionMultiple = false;
            $scope.urlFormulario = urlAltas;
            $http.get(urlGrid).success(function (response) 
            {
                console.log(response);
                $scope.productos = response;
                if( $scope.productos != null)
                {
                        $scope.gridLoaded = true;
                        console.log("$scope.gridLoaded: " +$scope.gridLoaded);
                        
                        //Cargo combo de Proveedores:
                        $http.get(urlComboProveedores).success(function (response) 
                        {
                            console.log(response);
                             $scope.proveedores = response;
                        });
                }
            });
            
            
            $scope.editarOne = function(quien)
            {
                console.log("Editar One: " +  quien.nombreProducto);
                
                if($scope.modoAlta)
                {
                    $scope.modoEdicionUnitaria=true;
                    
                    $scope.modoAlta = false;
                    
                    $scope.urlFormulario = urlEdit;

                    $scope.productoFormulario = quien;
                }
                else if($scope.modoEdicionUnitaria)
                {
                    $scope.modoEdicionUnitaria=false;
                    
                    $scope.modoAlta = true;
                    
                    $scope.urlFormulario = urlAltas;

                    $scope.marcaFormulario = {};
                }
            }
            $scope.deleteOne = function(quien)
            {
                console.log("DeleteOne: " + quien.id);
                if(confirm("Estas seguro de borrar " + quien.nombreProducto + " ??"))
                {
                    $.ajax({url:urlDelete,data:{ 'id' : quien.id}, success: function (resultado, textStatus, jqXHR)
                        {
                            console.log(resultado.trim());
                            if(resultado.trim() == "true")
                            {
                                console.log("Elminado con exito!.");
                                window.location= urlThisPage;
                            }
                            else
                            {
                                console.log("Error.");
                                window.location= urlError;
                            }
                            
                            
                        }});
                }
            }
            $scope.editarMany = function(quien)
            {
                $scope.modoEdicionUnitaria = false;
                $scope.modoEdicionMultiple = true;
                console.log("Editar Many: " + quien.nombre);
                /*
                console.log($(".checksGrid:checked").size());
                textSeleccionados = $("#seleccionados").val();
                $("#seleccionados").val(  quien.id + " - " + textSeleccionados );
                if($(".checksGrid:checked").size() > 0 )
                {
                    console.log("Edicion en Modo multiple..");
                }
                else
                {
                    console.log("Edicion en Modo unitario..");
                }
                
                $scope.marcaFormulario = quien;*/
            }
            $scope.closeEditMode = function()
            {
                console.log("cerrarModoEdicion: ");
                $scope.modoAlta= true;
                $scope.modoEdicionUnitaria = false;
                $scope.urlFormulario = urlAltas;
                $scope.productoFormulario = {};
            }
        });
    </script>
    
    
</html>
