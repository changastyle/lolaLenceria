<%@page import="model.Producto"%>
<%
    String fkMarca = request.getParameter("fkMarca");
    String numeroSerie = request.getParameter("numeroSerie");
    String nombreProducto = request.getParameter("nombreProducto");
    
    if(/*fkMarca != null &&*/ numeroSerie  != null && nombreProducto != null)
    {
        Producto producto = new Producto();
        producto.setMarca(daos.MarcasDAO.getOne(Integer.parseInt(fkMarca)));
        producto.setNumeroSerie(Integer.parseInt(numeroSerie));
        producto.setNombreProducto(nombreProducto);

        out.print(producto.toString());
        
        if(daos.ProductosDAO.save(producto))
        {
            response.sendRedirect("../pages/productos.jsp");
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