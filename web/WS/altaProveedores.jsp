<%@page import="model.Marcas"%>
<%
    String strID = request.getParameter("id");
    String nombreMarca = request.getParameter("nombreMarca");
    String telefono1 = request.getParameter("telefono1");
    String telefono2 = request.getParameter("telefono2");
    String email = request.getParameter("email");
    String web = request.getParameter("web");
    String direccionFisica = request.getParameter("direccionFisica");

    if( nombreMarca != null && telefono1 != null && telefono2 != null && email != null && web != null && direccionFisica != null)
    {
        Marcas marcaNueva = new Marcas();
        marcaNueva.setNombre(nombreMarca);
        marcaNueva.setTelefono1(telefono1);
        marcaNueva.setTelefono2(telefono2);
        marcaNueva.setEmail(email);
        marcaNueva.setWeb(web);
        marcaNueva.setDireccionFisica(direccionFisica);
        
        if(daos.MarcasDAO.save(marcaNueva))
        {
            response.sendRedirect("../pages/proveedores.jsp");
        }
        else
        {
            response.sendRedirect("../pages/error.jsp");
        }
    }
    else
    {   
        response.sendRedirect("../pages/error.jsp");
    }
%>