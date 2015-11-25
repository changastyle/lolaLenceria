package daos;

public class MarcasDAO 
{
    public static java.util.ArrayList<model.Marcas> findAll()
    {
        java.util.ArrayList<model.Marcas> arr = new java.util.ArrayList<model.Marcas>();
        
        for(Object o : daos.AbstractDAO.findAll(model.Marcas.class))
        {
            model.Marcas aux = (model.Marcas) o;
            arr.add(aux);
        }
        return arr;
    }
    public static boolean save(model.Marcas aux)
    {
        return daos.AbstractDAO.saveOneNew(aux);
    }
    public static boolean remove(int id)
    {
        boolean respuesta = false;
        model.Producto p = null;
        
        for(model.Marcas marca : findAll())
        {
            if(id == marca.getId())
            {
                respuesta = daos.AbstractDAO.deleteOne(marca);
            }
        }
        return respuesta;     
    }
    public static model.Marcas getOne(int id)
    {
       return (model.Marcas) daos.AbstractDAO.get(model.Marcas.class, id);
    }
    public static boolean updateOne(int id, model.Marcas nuevo)
    {
        boolean respuesta = false;
        
        model.Marcas auxDB = getOne(id);
        
        //Reemplazo valores:
        auxDB.setNombre(nuevo.getNombre());
        auxDB.setTelefono1(nuevo.getTelefono1());
        auxDB.setTelefono2(nuevo.getTelefono2());
        auxDB.setEmail(nuevo.getEmail());
        auxDB.setWeb(nuevo.getWeb());
        auxDB.setDireccionFisica(nuevo.getDireccionFisica());
        
        //Inserto en DB:
        respuesta = daos.AbstractDAO.updateOne(auxDB);
        
        return respuesta;
    }
    public static boolean updateMany(String[] ids, model.Marcas nuevo)
    {
        boolean respuesta = false;
        /*
        //Creo un array donde meter los productos actualizados:
        java.util.ArrayList<Object> arrDeProductosActualizados = new java.util.ArrayList<Object>();
        
        for(String id : ids)
        {
            model.Marcas productoEnDB = getOne(Integer.parseInt(id));
        
            //Reemplazo valores:
            productoEnDB.setNombreProducto(productoActualizado.getNombreProducto());
            //productoEnDB.setNumeroSerie(productoActualizado.getNumeroSerie());
            productoEnDB.setMarca(productoEnDB.getMarca());

            //Agrego el producto actualizado al array de productos actualizados:
            arrDeProductosActualizados.add(productoEnDB);
            
        }
        //Inserto Todos en DB:
        respuesta = daos.AbstractDAO.updateAll(arrDeProductosActualizados);*/
        return respuesta;
    }
}
