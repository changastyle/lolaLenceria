<html>
    <head>
        <%@include file="head.jsp" %> 
    </head>
    <body ng-app="app" ng-controller="ControllerDeMarcas">
        
        <%@include file="navbar.jsp" %> 
        
        <%@include file="sideBar.jsp" %> 
        <!-- wraper -->
        <div class="col-sm-9 " id="wraper">
            <div class="table-responsive panel panel-primary" >
                <div class="panel-heading">Grilla de Marcas:</div>
                <div class="panel-body">
                    
                    <!-- SEARCHING BAR -->
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                            <input class="form-control" type="search" id="buscadorProveedores" placeholder="Buscar Productos.." ng-model="filtroMarcas">
                        </div>       
                    </div>
                    
                    <!-- GRILLA -->
                    <table class="table table-hover">
                        <thead>    
                            <tr>
                                <th></th>
                                <th></th>
                                <th>Nombre Marca</th>
                                <th>Telefono 1</th>
                                <th>Telefono 2</th>
                                <th>Correo</th>
                                <th>Web</th>
                                <th>Direccion Fisica</th>
                                <th>Otros</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat=" m in marcas | filter : filtroMarcas">
                                <td><input type="checkbox" ng-click="editarMany(m)" class="checksGrid"></td>
                                <td><button class="btn btn-default" id="btnprueba" ng-click="editarOne(m)" value="Editar"><span class="glyphicon  glyphicon-pencil"></span></button></td>
                                <td>{{m.nombre}}</td>
                                <td>{{m.telefono1}}</td>
                                <td>{{m.telefono2}}</td>
                                <td>{{m.email}}</td>
                                <td>{{m.web}}</td>
                                <td>{{m.direccionFisica}}</td>
                                <td><!--{{m.arrProductos}}--></td>
                                <td><button class="btn btn-danger" ng-click="deleteOne(m)"><span class="glyphicon glyphicon-remove"></span></button></td>
                            </tr>
                        </tbody>
                    </table> 
                    <img src="res/img/ajax-loader.gif" class=" col-sm-offset-5 col-sm-2 img-thumbnail img-responsive" ng-hide="gridLoaded">
                </div>
            </div>
            
            <div class="panel panel-primary">
                <div class="panel-heading" ng-show="modoEdicionUnitaria" style="z-index: 1;">Formulario Edicion Marcas:
                    <div class="glyphicon glyphicon-remove" ng-click="closeEditMode()" style="float:right; cursor:pointer; z-index: 2;"></div>
                </div>
                <div class="panel-heading" ng-hide="modoEdicionUnitaria">
                    <span>Formulario Alta Marcas:</span>
                </div>
            
                <div class="panel panel-body">
                    <form class="form" action="{{urlFormulario}}">

                        <div class="form-group" ng-show="modoEdicionUnitaria">
                            <label for="id" class="control-label">ID:</label>
                            <input class="form-control" type="text" id="seleccionados" name="id" ng-model="marcaFormulario.id" placeholder="No tocar!"readonly disabled>
                        </div>
                        <div class="form-group">
                            <label for="nombreMarca" class="control-label">Nombre de la Marca:</label>
                            <input class="form-control" type="text" ng-model="marcaFormulario.nombre" name="nombreMarca" placeholder="Nombre Marca.." autofocus required>
                        </div>
                        <div class="form-group">
                            <label for="telefono1" class="control-label">Telefono 1:</label>
                            <input class="form-control" type="tel" name="telefono1" ng-model="marcaFormulario.telefono1" placeholder="Telefono 1..">
                        </div>
                        <div class="form-group">
                            <label for="telefono2" class="control-label">Telefono 2:</label>
                            <input class="form-control" type="tel" name="telefono2" ng-model="marcaFormulario.telefono2" placeholder="Telefono 2..">
                        </div>
                        <div class="form-group">
                            <label for="email" class="control-label">Correo Electronico:</label>
                            <input class="form-control" type="email" name="email" ng-model="marcaFormulario.email" placeholder="Correo Electronico.." >
                        </div>
                        <div class="form-group">
                            <label for="web" class="control-label">Web:</label>
                            <input class="form-control" type="url" name="web" ng-model="marcaFormulario.web" placeholder="Pagina Web.." required>
                        </div>
                        <div class="form-group">
                            <label for="direccionFisica" class="control-label">Direccion Fisica:</label>
                            <input class="form-control" type="text" name="direccionFisica" ng-model="marcaFormulario.direccionFisica" placeholder="Direccion Fisica..">
                        </div>
                            <input type="submit" class="btn btn-success col-sm-12" value="Agregar marca" ng-hide="modoEdicionUnitaria" ng-show="modoAlta">

                            <input type="submit" class="btn btn-primary col-sm-12" value="Editar marca" ng-show="modoEdicionUnitaria" ng-hide="modoEdicionMultiple || modoAlta">

                            <input type="submit" class="btn btn-primary col-sm-12" value="Editar marca" ng-show="modoEdicionMultiple" ng-hide="modoEdicionUnitaria || modoAlta">
                    </form>
                </div>
            </div>
        </div>
    </body>
<!-- Angular JS: -->
    <script>
        var app = angular.module('app', []);
        app.controller('ControllerDeMarcas', function($scope, $http) 
        {   
            urlAltas = "../WS/altaProveedores.jsp";
            urlEdit = "../WS/editProveedor.jsp";
            urlDelete = "../WS/deleteProveedor.jsp";
            urlGrid = "../WS/gridProveedores.jsp";
            urlThisPage = "proveedores.jsp";
            urlError = "error.jsp";

            $scope.gridLoaded = false;
            $scope.modoAlta= true;
            $scope.modoEdicionUnitaria = false;
            $scope.modoEdicionMultiple = false;
            $scope.urlFormulario = urlAltas;
            $http.get(urlGrid).success(function (response) 
            {
                console.log(response);
                $scope.marcas = response;
                if( $scope.marcas != null)
                {
                        $scope.gridLoaded = true;
                        console.log("$scope.gridLoaded: " +$scope.gridLoaded);
                }
            });
            
            $scope.editarOne = function(quien)
            {
                console.log("Editar One: " +  quien.nombre);
                
                if($scope.modoAlta)
                {
                    $scope.modoEdicionUnitaria=true;
                    
                    $scope.modoAlta = false;
                    
                    $scope.urlFormulario = urlEdit;

                    $scope.marcaFormulario = quien;
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
                if(confirm("Estas seguro de borrar " + quien.nombre + " ??"))
                {
                    $.ajax({url:urlDelete,data:{ 'marca' : quien.id}, success: function (resultado, textStatus, jqXHR)
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
                $scope.marcaFormulario = {};
            }
            
        });  
    </script>
</html>