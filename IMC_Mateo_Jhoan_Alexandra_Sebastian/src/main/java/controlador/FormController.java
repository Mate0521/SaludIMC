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
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 1. Obtener los datos del formulario
        String cedula = request.getParameter("cedula");
        String fechaRegStr = request.getParameter("fecha_reg");
        String pesoStr = request.getParameter("peso");
        String estaturaStr = request.getParameter("estatura");
        String edadStr = request.getParameter("edad");

        try {
            if (cedula != null && fechaRegStr != null && pesoStr != null && estaturaStr != null && edadStr != null) {

                // 2. Convertir a tipos correctos
                SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                Date fechaReg = formato.parse(fechaRegStr);

                double peso = Double.parseDouble(pesoStr);
                double estatura = Double.parseDouble(estaturaStr);
                int edad = Integer.parseInt(edadStr);


                // 3. Calcular IMC
                double imc =salud.calcularIMC(peso, estatura);

                // 4. Insertar en base de datos
                salud.guardar(cedula, fechaReg, peso, estatura, edad, imc);

                // 5. Redireccionar a página de éxito
                response.sendRedirect("exito.jsp");

            } else {
                // Datos incompletos
                response.sendRedirect("error.jsp");

            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    
}
