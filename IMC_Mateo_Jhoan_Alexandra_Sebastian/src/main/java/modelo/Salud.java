/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import conexion.Conexion;
import dao.SaludDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author MATEO CARVAJAL
 */
public class Salud {
    private Date fecha_reg;
    private double peso;
    private int  edad;
    private double estatura; 
    private double imc;
    
    

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
        return this.edad;
    }
    
    public void  setEdad(int edad){
        this.edad=edad;
    }

    public double getEstatura() {
        return estatura;
    }

    public void setEstatura(double estatura) {
        this.estatura = estatura;
    }

    public double getImc() {
        return imc;
    }

    public void setImc(double imc) {
        this.imc = imc;
    }
    
    
    public void guardar(String cedula, Date fecha_reg, double peso, double estatura, int edad, double imc) throws Exception {
        SaludDAO saludDAO = new SaludDAO();

        try {
            int filasAfectadas = Conexion.ejecutarActualizacion(
                saludDAO.insertar(),
                cedula,
                new java.sql.Date(fecha_reg.getTime()),
                peso,
                estatura,
                edad,
                imc
            );

            if (filasAfectadas == 0) {
                throw new Exception("No se insertó ninguna fila en la base de datos.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error al insertar datos de salud: " + e.getMessage());
        }
    }

    
    public List<Salud> obtenerHistorial(String cedula) throws Exception {
        
        SaludDAO saludDAO =new SaludDAO();
        
        List<Salud> lista = new ArrayList<>();
        ResultSet rs = Conexion.ejecutarConsulta(saludDAO.mostrar(cedula));

        while (rs.next()) {
            Salud salud = new Salud();
            salud.setFecha_reg(rs.getDate("fecha_reg"));
            salud.setPeso(rs.getDouble("peso"));
            salud.setEstatura(rs.getDouble("estatura"));
            salud.setEdad(rs.getInt("edad"));
            salud.setImc(rs.getDouble("imc"));
            lista.add(salud);
        }
        return lista;
    }
    public double calcularIMC(double peso, double estatura) {
        double imc = peso / (estatura * estatura);
        return imc;
    }


    
    
}
