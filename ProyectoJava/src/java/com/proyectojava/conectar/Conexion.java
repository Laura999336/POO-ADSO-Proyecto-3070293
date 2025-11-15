
package com.proyectojava.conectar;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion {

    

    // Parámetros de conexión
    private static final String url = "jdbc:mysql://localhost:3306/proyecto"; // Cambia "proyecto" por el nombre de tu BD
    private static final String usuario = "root";
    private static final String clave = "";
    private static Connection conexion=null;
    

    // Constructor privado
    private Conexion() {}

    
    // Método para obtener la conexión
    public static Connection getConexion() {
        if(conexion == null){
        try {
            // Cargar el driver de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establecer la conexión
            conexion = DriverManager.getConnection(url, usuario, clave); 
           
        } catch (ClassNotFoundException e) {
            System.out.println("❌ Error: No se encontró el driver de MySQL.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ Error al conectar con la base de datos.");
            e.printStackTrace();
        }}
        return conexion;
    }

    // Método para cerrar la conexión
    public void cerrarConexion() {
        try {
            if (conexion != null && !conexion.isClosed()) {
                conexion.close();
                System.out.println("🔒 Conexión cerrada correctamente.");
            }
        } catch (SQLException e) {
            System.out.println("⚠️ Error al cerrar la conexión.");
            e.printStackTrace();
        }
    }
}