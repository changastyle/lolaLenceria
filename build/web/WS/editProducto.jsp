<%@page import="model.Marcas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Producto"%>
<%
    String identificador = request.getParameter("identificador");
    String fkMarca = request.getParameter("fkMarca");
    String numeroSerie = request.getParameter("numeroSerie");
    String nombreProducto = request.getParameter("nombreProducto");
    
    Producto producto = new Producto();
    producto.setMarca(daos.MarcasDAO.getOne(Integer.parseInt(fkMarca)));
    producto.setNumeroSerie(Integer.parseInt(numeroSerie));
    producto.setNombreProducto(nombreProducto);
    
    //out.print("identificador: " + identificador );
    
    boolean updateo = daos.ProductosDAO.updateOne(Integer.parseInt(identificador), producto);
    if(updateo)
    {
        out.print("ok");
        //response.sendRedirect("../pages/productos.jsp");
    }
    else if(updateo == false)
    {
        out.print("not");
        //response.sendRedirect("../pages/error.jsp");
    }
%>