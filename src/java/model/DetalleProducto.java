package model;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="detalleproducto")
public class DetalleProducto 
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) 
    @Expose
    private int id;
    @ManyToOne(/*fetch = FetchType.EAGER*/)
    @JoinColumn(name="fkProducto")
    private Producto producto;
    @Column(name="entradaOSalida")
    @Expose
    private boolean positivo;
    @Expose
    private int cantidad;
    @Expose
    private Date timestamp;

    public DetalleProducto() 
    {
        this.producto = null;
        this.positivo = false;
        this.cantidad = 0;
        this.timestamp = new Date();
        this.producto = new Producto();
    }

    public DetalleProducto(int id, Producto producto, boolean positivo, int cantidad, Date timestamp) {
        this.id = id;
        this.producto = producto;
        this.positivo = positivo;
        this.cantidad = cantidad;
        this.timestamp = timestamp;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public boolean isPositivo() {
        return positivo;
    }

    public void setPositivo(boolean positivo) {
        this.positivo = positivo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    @Override
    public String toString() 
    {
        return "DetalleProducto{" + "id=" + id + ", producto=" + producto + ", positivo=" + positivo + ", cantidad=" + cantidad + ", timestamp=" + timestamp + '}';
    }
    
    public String toJSON ()
    {
        Gson  gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
        
        String JSON = gson.toJson(this);
        
        return JSON;
    }
    
    
    
    

    
}
