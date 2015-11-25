<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%    
    
    response.setHeader("Cache-Control","no-cache"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", -1); 

    Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
    
    out.print(gson.toJson(daos.MarcasDAO.findAll()));

%>
