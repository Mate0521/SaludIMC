/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import modelo.Salud;
import modelo.Usuario;

/**
 *
 * @author MATEO CARVAJAL
 */

@WebServlet(name = "FormController", urlPatterns = {"/FormController"})
public class FormController extends HttpServlet {
    Usuario user = new Usuario();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Configurar respuesta como JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // 2. Leer parámetro "cedula" de la petición
        String cedula = request.getParameter("cedula");
        String resultado = "error"; // Valor por defecto si algo falla

        if (cedula != null && !cedula.trim().isEmpty()) {
            try {
                // 3. Crear instancia de Usuario y consultar
                Usuario user = new Usuario();
                Usuario usuario = user.obtenerUser(cedula);

                // 4. Determinar el resultado
                if (usuario != null) {
                    resultado = "existe";
                } else {
                    resultado = "nuevo";
                }

            } catch (Exception e) {
                e.printStackTrace(); // Log para debugging
            }
        } else {
            resultado = "sin_cedula";
        }

        // 5. Construir y enviar la respuesta JSON
        String json = String.format("{\"resultado\":\"%s\"}", resultado);
        response.getWriter().print(json);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fechaNacStr = request.getParameter("fecha_nac_usuario");
        Date fechaNac = null;

        if (fechaNacStr != null && !fechaNacStr.isEmpty()) {
            try {
                SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                fechaNac = formato.parse(fechaNacStr);
            } catch (Exception e) {
                e.printStackTrace();
                // Maneja el error: formato inválido o null
            }
        }

        // Configura encoding para caracteres latinos y UTF-8
        request.setCharacterEncoding("UTF-8");

        // 1. Obtener todos los parámetros posibles

        // Datos de Usuario
        String cedula = request.getParameter("cedula_usuario");
        String nombre = request.getParameter("nombre_usuario");
        String apellidos = request.getParameter("apellidos_usuario");
        String nacionalidad = request.getParameter("nacionalidad_usuario");

        // Datos de Salud
        String pesoStr = request.getParameter("peso_salud");
        String estaturaStr = request.getParameter("estatura_salud");

        // 2. Procesar lógica dependiendo de qué datos llegaron

        try {
            if (cedula != null && nombre != null) {
                // Registro de nuevo usuario
                Usuario nuevoUsuario = new Usuario(cedula, nombre, apellidos, fechaNac, nacionalidad);
                // Llama a tu DAO para guardar

                user.guardar(nuevoUsuario);
            }

            if (pesoStr != null && estaturaStr != null) {
                // Registro de datos de salud
                double peso = Double.parseDouble(pesoStr);
                double estatura = Double.parseDouble(estaturaStr);
                LocalDate fechaActual = java.time.LocalDate.now();
                

                Salud salud;//Salud(Date fecha_reg, double peso, int edad, double estatura)
                salud = new Salud(fechaActual,peso, , estatura);
                
                salud.guardar(salud);
            }

            // 3. Respuesta: redirigir o devolver JSON de éxito
            response.sendRedirect("exito.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    
}
