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
    Salud salud = new Salud();
    

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
    
}
