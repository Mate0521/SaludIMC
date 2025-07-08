/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import dao.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import modelo.Usuario;

/**
 *
 * @author MATEO CARVAJAL
 */
@WebServlet(name = "/SaludController")
public class SaludController extends HttpServlet{
    Usuario user = new Usuario();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cedula = request.getParameter("cedula");
        boolean existe = false;

        try {
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            Usuario usuario = user.obtenerUser(cedula);

            if (usuario != null) {
                existe = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Configura la respuesta como JSON para Ajax
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String jsonResponse;

        if (existe) {
            // Si existe, devuelve que solo muestre el formulario de salud
            jsonResponse = "{\"resultado\":\"existe\"}";
        } else {
            // Si NO existe, devuelve que muestre ambos formularios
            jsonResponse = "{\"resultado\":\"no_existe\"}";
        }

        response.getWriter().write(jsonResponse);
    }

    

    
}
