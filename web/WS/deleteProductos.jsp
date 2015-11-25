<%

    String strID = request.getParameter("id");
    if(strID != null)
    {
        int id = Integer.parseInt(strID);
        
        out.print(daos.ProductosDAO.remove(id));
    }
    else
    {
        out.print(false);
    }
    
%>