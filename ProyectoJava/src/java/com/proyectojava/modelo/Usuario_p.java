package com.proyectojava.modelo;
import com.proyectojava.conectar.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Usuario_p {
    private int idUsuario;
    private String Primer_nombre;
    private String Segundo_nombre;
    private String Primer_apellido;
    private String Segundo_apellido;
    private String Documento;
    private String Correo;
    private String Telefono;
   
    
    public boolean identificarTipoUsuario () {
    return false;
    }
    
    public boolean registrarCliente(Usuario_p usuario_p) {
        boolean r = false;
    Connection con=Conexion.getConexion();
    String sql = "INSERT INTO `proyecto`.`usuario_p` (`primer_nombre`, `segundo_nombre`, `primer_apellido`, "
            + "`segundo_apellido`, `documento`, `telefono`, `correo`) "
            + "VALUES (?, ?, ?, ?, ?, ?,?);";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,usuario_p.getPrimer_nombre());
            ps.setString(2,usuario_p.getSegundo_nombre());
            ps.setString(3,usuario_p.getPrimer_apellido());
            ps.setString(4,usuario_p.getSegundo_apellido());
            ps.setString(5,usuario_p.getDocumento());
            ps.setString(6,usuario_p.getTelefono());
            ps.setString(7,usuario_p.getCorreo());
           
            
            
             r=ps.execute();
            
        } catch (SQLException ex) {
            Logger.getLogger(Cliente.class.getName()).log(Level.SEVERE, null, ex);
        }
     return r;
    
    }
    
    public boolean existeCliente(String documento){
        return false;
    }
    

    public String getPrimer_nombre() {
        return Primer_nombre;
    }

    public void setPrimer_nombre(String Primer_nombre) {
        this.Primer_nombre = Primer_nombre;
    }

    public String getSegundo_nombre() {
        return Segundo_nombre;
    }

    public void setSegundo_nombre(String Segundo_nombre) {
        this.Segundo_nombre = Segundo_nombre;
    }

    public String getPrimer_apellido() {
        return Primer_apellido;
    }

    public void setPrimer_apellido(String Primer_apellido) {
        this.Primer_apellido = Primer_apellido;
    }

    public String getSegundo_apellido() {
        return Segundo_apellido;
    }

    public void setSegundo_apellido(String Segundo_apellido) {
        this.Segundo_apellido = Segundo_apellido;
    }
    
       
    public void actualizarDatos() {
        
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    

    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

}
