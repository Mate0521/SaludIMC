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
import java.util.List;
import modelo.Salud;
import modelo.Usuario;

/**
 *
 * @author MATEO CARVAJAL
 */
@WebServlet(name = "/HistorialController")
public class HistorialController extends HttpServlet{
    private final Usuario user = new Usuario();
    private final Salud salud = new Salud();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cedula = request.getParameter("cedula");
        if (cedula != null && !cedula.isEmpty()) {
            try {
                // Obtener el usuario
                Usuario usuario = user.obtenerUser (cedula);
                request.setAttribute("usuario", usuario);
                // Obtener el historial de salud
                List<Salud> listaHistorial = salud.obtenerHistorial(cedula);
                request.setAttribute("listaHistorial", listaHistorial);
                // Redirigir a la página JSP
                RequestDispatcher dispatcher = request.getRequestDispatcher("/ajax/tablaHistorialRegistros.jsp");
                dispatcher.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error al obtener los datos del usuario.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp"); // Redirige a una página de error
                dispatcher.forward(request, response);
            }
        } else {
            request.setAttribute("error", "No se proporcionó cédula.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp"); // Redirige a una página de error
            dispatcher.forward(request, response);
        }
    }
}