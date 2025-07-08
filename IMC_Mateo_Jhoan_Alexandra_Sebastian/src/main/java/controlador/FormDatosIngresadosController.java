/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import modelo.Salud;
import modelo.Usuario;

/**
 *
 * @author MATEO CARVAJAL
 */
@WebServlet(name = "FormDatosIngresadosController", urlPatterns = {"/FormDatosIngresadosController"})
public class FormDatosIngresadosController extends HttpServlet{
    Usuario user = new Usuario();
    Salud salud = new Salud();
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 1. Obtener parámetros comunes
        String cedula = request.getParameter("cedula");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String fechaNacStr = request.getParameter("fecha_nac"); // fecha nacimiento usuario
        String nacionalidad = request.getParameter("nacionalidad");

        String pesoStr = request.getParameter("peso");
        String estaturaStr = request.getParameter("estatura");


        try {
            // Validar cedula obligatoria
            if (cedula == null || cedula.trim().isEmpty()) {
                response.sendRedirect("index.jsp");
                return;
            }

            // Inicializar variables
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");

            // 2. Registrar usuario si se enviaron sus datos
            if (nombre != null && apellidos != null && fechaNacStr != null && nacionalidad != null) {
                Date fechaNac = formato.parse(fechaNacStr);
                Usuario nuevoUsuario = new Usuario(cedula, nombre, apellidos, fechaNac, nacionalidad);

                user.guardar(nuevoUsuario); // asegúrate que tu DAO tenga este método

                System.out.println("Usuario registrado correctamente: " + cedula);
            } 

            // 3. Registrar datos de salud si se enviaron
            if (pesoStr != null && estaturaStr != null ) {
                
                Usuario usuario = user.obtenerUser (cedula);
                
                Date fechaReg = new Date();

                double peso = Double.parseDouble(pesoStr);
                double estatura = Double.parseDouble(estaturaStr);
                int edad = usuario.edad();

                // Calcular IMC
                double imc = salud.calcularIMC(peso, estatura);

                // Guardar en base de datos
                salud.guardar(cedula, fechaReg, peso, estatura, edad, imc);

                System.out.println("Datos de salud registrados correctamente para cédula: " + cedula);

                // Redirigir a historial
               response.sendRedirect("historialDatos.jsp");
            } else {
                System.out.println("No se enviaron datos de salud completos");
                response.sendRedirect("index.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }

    }


    
}
