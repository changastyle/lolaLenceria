package daos;

import model.Producto;

public class ProductosDAO 
{
    public static java.util.ArrayList<model.Producto> findAll()
    {
        java.util.ArrayList<model.Producto> arr = new java.util.ArrayList<model.Producto>();
        
        for(Object o : daos.AbstractDAO.findAll(model.Producto.class))
        {
            model.Producto aux = (model.Producto) o;
            arr.add(aux);
        }
        
        
        return arr;
    }
    public static boolean save(model.Producto producto)
    {
        return daos.AbstractDAO.saveOneNew(producto);
    }
    public static boolean remove(int id)
    {
        boolean respuesta = false;
        model.Producto p = null;
        
        for(model.Producto producto : findAll())
        {
            if(id == producto.getId())
            {
                respuesta = daos.AbstractDAO.deleteOne(producto);
            }
        }
        return respuesta;     
    }
    public static model.Producto getOne(int id)
    {
       return (model.Producto) daos.AbstractDAO.get(model.Producto.class, id);
    }
    public static boolean updateOne(int id, model.Producto productoNuevo)
    {
        boolean respuesta = false;
        
        model.Producto productoEnDB = getOne(id);
        
        //Reemplazo valores:
        productoEnDB.setNombreProducto(productoNuevo.getNombreProducto());
        productoEnDB.setNumeroSerie(productoNuevo.getNumeroSerie());
        productoEnDB.setMarca(productoNuevo.getMarca());
        
        
        //Inserto en DB:
        respuesta = daos.AbstractDAO.updateOne(productoEnDB);
        
        return respuesta;
    }
    public static boolean updateMany(String[] ids, model.Producto productoActualizado)
    {
        boolean respuesta = false;
        
        //Creo un array donde meter los productos actualizados:
        java.util.ArrayList<Object> arrDeProductosActualizados = new java.util.ArrayList<Object>();
        
        for(String id : ids)
        {
            model.Producto productoEnDB = getOne(Integer.parseInt(id));
        
            //Reemplazo valores:
            productoEnDB.setNombreProducto(productoActualizado.getNombreProducto());
            //productoEnDB.setNumeroSerie(productoActualizado.getNumeroSerie());
            productoEnDB.setMarca(productoEnDB.getMarca());

            //Agrego el producto actualizado al array de productos actualizados:
            arrDeProductosActualizados.add(productoEnDB);
            
        }
        //Inserto Todos en DB:
        respuesta = daos.AbstractDAO.updateAll(arrDeProductosActualizados);
        return respuesta;
    }
}
