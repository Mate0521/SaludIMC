/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import modelo.Usuario;

/**
 *
 * @author MATEO CARVAJAL
 */
public class UsuarioDAO {
    public String insertar(Usuario user){
        return "INSERT INTO `usuario`(`cedula`, `nombre`, `apellidos`, `fecha_nac`, `nacionalidad`) "
             + "VALUES ('"+user.getCedula()+"','"+user.getNombre()+"','"+user.getApellidos()+"','"+user.getFecha_nac()+"','"+user.getNacionalidad()+"')";
    }
    
    public String mostrar(String cedula){
        return "SELECT `cedula`, `nombre`, `apellidos`, `fecha_nac`, `nacionalidad` FROM `usuario` WHERE cedula=" + cedula;
    }
    
}
