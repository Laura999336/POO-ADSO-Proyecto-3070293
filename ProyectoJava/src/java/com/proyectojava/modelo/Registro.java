package com.proyectojava.modelo;

import com.proyectojava.conectar.Conexion;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Registro extends Usuario_p {
    private int fecha;
    private String usuario;
    private String clave;
    private String descripcion;
    private int tipou;
    
    
    public Registro iniciarSesion(Registro registro) {
        
        ResultSet r= null;
        
        Connection con =Conexion.getConexion();        
        String sql = "select id_tipou from registro where usuario=? and clave=?";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,registro.getUsuario());
            ps.setString(2,registro.getClave());
            
            r=ps.executeQuery();
            
            if (r.next()){
                registro.setTipou(r.getInt(1));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return registro;
    }
 
        
        
        
        
        
        
    

    
    public int getFecha() {
        return fecha;
    }

    public void setFecha(int fecha) {
        this.fecha = fecha;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

  
    
    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
   public void CrearUsuario(){
   
   }
   
   public void EliminarUsuario(){
       
   }
   
   public boolean ConsultarUsuario(){
       return false;
   }

    public int getTipou() {
        return tipou;
    }

    public void setTipou(int tipou) {
        this.tipou = tipou;
    }

 
}
