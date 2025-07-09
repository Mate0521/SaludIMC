/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author MATEO CARVAJAL
 */
public class SaludDAO {
    public String insertar(){
        return "INSERT INTO salud (cedula, fecha_reg, peso, estatura, edad, imc) VALUES (?, ?, ?, ?, ?, ?)";
    }
    
    public String mostrar(String cedula){
        return "SELECT cedula, fecha_reg, peso, estatura, edad, imc FROM salud WHERE cedula = " + cedula;
    }
    
}
