<%@page import="model.Marcas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Producto"%>
<%
    String strID = request.getParameter("id");
    String nombreMarca = request.getParameter("nombreMarca");
    String telefono1 = request.getParameter("telefono1");
    String telefono2 = request.getParameter("telefono2");
    String email = request.getParameter("email");
    String web = request.getParameter("web");
    String direccionFisica = request.getParameter("direccionFisica");
    //String strIDss = request.getParameter("idss");
    
    
   /* String fkMarca = request.getParameter("fkMarca");
    String numeroSerie = request.getParameter("numeroSerie");
    String nombreProducto = request.getParameter("nombreProducto");*/
    
    Marcas marca = new Marcas();
    marca.setId(Integer.parseInt(strID));
    marca.setNombre(nombreMarca);
    marca.setTelefono1(telefono1);
    marca.setTelefono2(telefono2);
    marca.setEmail(email);
    marca.setWeb(web);
    marca.setDireccionFisica(direccionFisica);
    
    
    out.print(marca.toJSON());
    
    if(daos.MarcasDAO.updateOne(Integer.parseInt(strID), marca))
    {
        response.sendRedirect("../pages/proveedores.jsp");
    }
    else
    {
        response.sendRedirect("../pages/error.jsp");
    }
    
    //Si tengo mas de un id: UpdateMany
    /*if(strIDss != null && !strIDss.trim().equalsIgnoreCase(""))
    {
        strIDss = strIDss.substring(0,strIDss.length()-2);
        out.print("Recibí: " + strIDss + " | procesé: " + strIDss.split("|").length +"<br>");
        String vec[] = strIDss.split("-");
        for(int i = 0 ; i < vec.length ;i++)
        {
            int id = Integer.parseInt(vec[i].trim());
            vec[i] = String.valueOf(id);
            out.print("indice["+ i + "]:" + id+ "<br>");
            
            
        }
        model.Producto productoActualizado = new Producto();
        productoActualizado.setFkMarca(Integer.parseInt(fkMarca));
        productoActualizado.setNombreProducto(nombreProducto);
        productoActualizado.setNumeroSerie(Integer.parseInt(numeroSerie));
        if(daos.ProductosDAO.updateMany(vec, productoActualizado))
        {
            response.sendRedirect("../pages/home.jsp");
        }
    }
    else    
    {
        //Si tengo solo un id: UpdateOne
        if(strID != null && !strID.trim().equalsIgnoreCase(""))
        {
            int id = Integer.parseInt(strID);
            model.Producto productoActualizado = new Producto();
            productoActualizado.setFkMarca(Integer.parseInt(fkMarca));
            productoActualizado.setNombreProducto(nombreProducto);
            productoActualizado.setNumeroSerie(Integer.parseInt(numeroSerie));
            
            if(daos.ProductosDAO.updateOne(id, productoActualizado))
            {
                response.sendRedirect("../pages/home.jsp");
            }
            else
            {
                response.sendRedirect("#");
            }
        }
        else
        {
            out.print("null");
        }
    }    */
%>