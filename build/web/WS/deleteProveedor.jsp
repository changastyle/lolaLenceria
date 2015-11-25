<%@page import="model.Marcas"%>
<%@page import="com.google.gson.Gson"%>
<%

    String strIDMarca = request.getParameter("marca");

    if( strIDMarca != null)
    {   
        out.print(daos.MarcasDAO.remove(Integer.parseInt(strIDMarca)));
    }
    else
    {
        out.print(false);
    }
    
%>