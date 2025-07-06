/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import dao.SaludDAO;
import java.util.Date;

/**
 *
 * @author MATEO CARVAJAL
 */
public class Salud {
    private Date fecha_reg;
    private double peso;
    private int  edad;
    private double estatura; 
    

    public Salud() {
    }

    public Salud(Date fecha_reg, double peso, int edad, double estatura) {
        this.fecha_reg = fecha_reg;
        this.peso = peso;
        this.edad = edad;
        this.estatura = estatura;
    }

    public Date getFecha_reg() {
        return fecha_reg;
    }

    public void setFecha_reg(Date fecha_reg) {
        this.fecha_reg = fecha_reg;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public int getEdad() {
        //coloque la logica para calcular la edad y guardar depende del aptributo fecha_nac de usuario
    return 0;
    }

    public void setEdad(int edad) {
       //coloque la logica para calcular la edad y guardar lo mismo como lo quieran aplicar 
    }

    public double getEstatura() {
        return estatura;
    }

    public void setEstatura(double estatura) {
        this.estatura = estatura;
    }
    
    public void guardar(){
        //aqui pa guardar utice el dao que corresponde
    }
    public String mostrar(){
        return "";
        
    }
    
}
