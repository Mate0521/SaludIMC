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
import modelo.Usuario;

/**
 *
 * @author MATEO CARVAJAL
 */
@WebServlet(name = "/FormController")
public class formContrller extends HttpServlet{
    Usuario user = new Usuario();
    
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String cedula = request.getParameter("cedula");
        Usuario usuario = null;

        try {
            usuario = user.obtenerUser(cedula);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (usuario != null) {
            response.getWriter().write("{\"resultado\":\"existe\"}");
        } else {
            response.getWriter().write("{\"resultado\":\"nuevo\"}");
        }
    }
    
 
    
}
