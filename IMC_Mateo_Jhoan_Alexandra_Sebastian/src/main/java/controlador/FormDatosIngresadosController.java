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

        // 1. Obtener los datos del formulario
        String cedula = request.getParameter("cedula");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String fechaRegStr = request.getParameter("fecha_reg");
        String nacionalidad = request.getParameter("nacionaldad");
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
