
import daos.MarcasDAO;
import daos.ProductosDAO;
import model.DetalleProducto;
import model.Producto;

public class Test 
{
    public static void main(String args[])
    {
        System.out.println("PRoductos:");
        for(Producto producto : daos.ProductosDAO.findAll())
        {
            System.out.println("producto:" + producto);
            if(producto.getId() == 12)
            {
                producto.setMarca(daos.MarcasDAO.getOne(7));
                System.out.println("marca: " + daos.MarcasDAO.getOne(7));
                System.out.println("updateo :" + daos.ProductosDAO.updateOne(producto.getId(), producto));
            }
        }
        System.out.println("-------");
        for(Producto producto : daos.ProductosDAO.findAll())
        {
            System.out.println("producto:" + producto);
            
        }
        
        
        /*for(model.Marcas marca : MarcasDAO.findAll())
        {
            System.out.println("" + marca.toJSON());
        }*/
        /*for(model.Producto producto : ProductosDAO.findAll())
        {
            System.out.println("" + producto.toJSON());
        }
        
        Producto p = new Producto();
        p.setNombreProducto("product");
        p.setNumeroSerie(12345);
        p.setMarca(daos.MarcasDAO.getOne(7));
        
        daos.ProductosDAO.updateOne(37,p);
        /*System.out.println("-----------");
        for(Object detalleProducto: daos.AbstractDAO.findAll(DetalleProducto.class))
        {
            System.out.println( detalleProducto  );
        }*/
    }
    
}
