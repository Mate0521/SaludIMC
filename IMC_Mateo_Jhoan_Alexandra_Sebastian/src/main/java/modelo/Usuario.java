/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import conexion.Conexion;
import dao.UsuarioDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;



/**
 *
 * @author MATEO CARVAJAL
 */
public class Usuario {
    private String cedula;
    private String nombre;
    private String apellidos;
    private Date fecha_nac;
    private String nacionalidad;

    public Usuario() {
    }

    public Usuario(String cedula, String nombre, String apellidos, Date fecha_nac, String nacionalidad) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.fecha_nac = fecha_nac;
        this.nacionalidad = nacionalidad;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public Date getFecha_nac() {
        return fecha_nac;
    }

    public void setFecha_nac(Date fecha_nac) {
        this.fecha_nac = fecha_nac;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }
    
    public void guardar(Usuario user){
        //aqui pa guardar utice el dao que corresponde
    }
    public Usuario obtenerUser(String cedula) throws Exception {
        Usuario usuarioObj = null;
        UsuarioDAO userDAO = new UsuarioDAO();

        String sql = userDAO.mostrar(cedula);

        try (Connection conn = Conexion.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                usuarioObj = new Usuario();
                usuarioObj.setCedula(rs.getString("cedula"));
                usuarioObj.setNombre(rs.getString("nombre"));
                usuarioObj.setApellidos(rs.getString("apellidos"));
                usuarioObj.setFecha_nac(rs.getDate("fecha_nac"));
                usuarioObj.setNacionalidad(rs.getString("nacionalidad"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error al obtener usuario: " + e.getMessage());
        }

        return usuarioObj;
    }

    public int edad() {
        Calendar fechaActual = Calendar.getInstance();
        Calendar fechaNacimiento = Calendar.getInstance();
        fechaNacimiento.setTime(this.getFecha_nac());

        int edad = fechaActual.get(Calendar.YEAR) - fechaNacimiento.get(Calendar.YEAR);

        if (fechaActual.get(Calendar.MONTH) + 1 == fechaNacimiento.get(Calendar.MONTH) + 1 &&
            fechaNacimiento.get(Calendar.DAY_OF_MONTH) > fechaActual.get(Calendar.DAY_OF_MONTH)) {
            edad--;
        } else if (fechaActual.get(Calendar.MONTH) + 1 < fechaNacimiento.get(Calendar.MONTH) + 1) {
            edad--;
        }
        return edad;
    }

    
    
    
}
