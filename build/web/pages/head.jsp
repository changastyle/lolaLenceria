<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
%>

<title>Lola Lenceria | Sistema Control Stock </title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="res/img/bra.png"/>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<!-- Angular JS: -->
<!--<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>-->
<script src="frameworks/angular.min.js"></script>

<link rel="stylesheet" href="res/css/home.css">

<script>
    $(document).ready(function ()
    {
        console.log("home page - ready!");
        
        activarSideBar();
    });
    function activarSideBar()
    {
        url = window.location.href;
        /*console.log(url.length);console.log(url.split("/"));console.log(url.split("/").length);*/
        
        array = url.split("/");
        pageActual = array[(array.length - 1)];
        pageActual = pageActual.trim();
        console.log("pageActual: " + pageActual);
        
        console.log("----------");
        
        $(".sideBarItems").each(function(index,element)
        {
            //console.log( $(element).attr("href"));
            
            if( $(element).attr("href").trim() == pageActual )
            {
                 //console.log("ESTA ES!.");
                 $(element).addClass("active");
            }
        });
    }
    function checkAll(agrupacion, quien)
    {
        console.log(agrupacion + " | " + $(quien).is(":checked") );
        if($(quien).is(":checked"))
        {
            $(agrupacion).prop("checked", true);
            ids= "";
            $(agrupacion).each(function(index,element)
            {
                ids += $(element).data("bind").id + " - ";
                
            });
            $("#idss").val(ids);
            $scope.modoEdicion = true;
        }
        else
        {
            $(agrupacion).prop("checked", false);
            $scope.modoEdicion = false;
        }
        
    }
</script>
<style>
    html
    {
        /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#eeeeee+0,cccccc+100 */
        background: #eeeeee; /* Old browsers */
        background: -moz-linear-gradient(top,  #eeeeee 0%, #cccccc 100%); /* FF3.6-15 */
        background: -webkit-linear-gradient(top,  #eeeeee 0%,#cccccc 100%); /* Chrome10-25,Safari5.1-6 */
        background: linear-gradient(to bottom,  #eeeeee 0%,#cccccc 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#eeeeee', endColorstr='#cccccc',GradientType=0 ); /* IE6-9 */
        height: 100%;
        margin: 0;
        background-repeat: no-repeat;
        background-attachment: fixed;
    }
</style>

