<%-- 
    Document   : error
    Created on : 21/11/2015, 16:59:01
    Author     : nicog
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        <style>
            body
            {
                background-color: #ff3333;
            }
            #mensajeError
            {
                background-color: #c13333;
                text-align: center;
                height: 20%;
                position:absolute;
                top:40%;
                
            }
            h3
            {
                text-align: center;
                vertical-align: middle;
            }
            #botonHome
            {
                position: absolute;
                bottom: 10px;
                left: 10%;
                right: 10%;
                width: 80%;
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %> 
        <div class="col-sm-8 col-sm-offset-2" id="mensajeError">
            <h3>Error procesando la solicitud</h3>
            <button id="botonHome" class="btn btn-danger" onclick="javascript:window.location='home.jsp'">Volver al home</button>
        </div>
    </body>
</html>
