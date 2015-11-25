package model;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="marcas")
public class Marcas 
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Expose
    private int id;
    @Expose
    private String nombre;
    @Expose
    private String telefono1;
    @Expose
    private String telefono2;
    @Expose
    private String email;
    @Expose
    private String web;
    @Expose
    private String direccionFisica;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "marca" ,fetch = FetchType.EAGER)
    @Expose
    @Fetch(value = FetchMode.SUBSELECT)
    List<model.Producto> arrProductos;
    
    public Marcas() 
    {
        this.nombre = "";
        this.telefono1 = "";
        this.telefono2 = "";
        this.email = "";
        this.direccionFisica = "";
        this.web = "";
        this.arrProductos = new ArrayList<model.Producto>();
    }

    public Marcas(int id, String nombre, String telefono1, String telefono2, String email, String web, String direccionFisica, List<Producto> arrProductos) {
        this.id = id;
        this.nombre = nombre;
        this.telefono1 = telefono1;
        this.telefono2 = telefono2;
        this.email = email;
        this.web = web;
        this.direccionFisica = direccionFisica;
        this.arrProductos = arrProductos;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono1() {
        return telefono1;
    }

    public void setTelefono1(String telefono1) {
        this.telefono1 = telefono1;
    }

    public String getTelefono2() {
        return telefono2;
    }

    public void setTelefono2(String telefono2) {
        this.telefono2 = telefono2;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getWeb() {
        return web;
    }

    public void setWeb(String web) {
        this.web = web;
    }

    public String getDireccionFisica() {
        return direccionFisica;
    }

    public void setDireccionFisica(String direccionFisica) {
        this.direccionFisica = direccionFisica;
    }

    public List<Producto> getArrProductos() {
        return arrProductos;
    }

    public void setArrProductos(List<Producto> arrProductos) {
        this.arrProductos = arrProductos;
    }

    @Override
    public String toString() 
    {
        return "Marcas{" + "id=" + id + ", nombre=" + nombre + ", telefono1=" + telefono1 + ", telefono2=" + telefono2 + ", email=" + email + ", web=" + web + ", direccionFisica=" + direccionFisica + '}';
    }
    public String toJSON ()
    {
        Gson  gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
        
        String JSON = gson.toJson(this);
        
        return JSON;
    }
    
    
    
    
}
