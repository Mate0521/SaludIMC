<%-- 
    Document   : tablaHistorialRegistros
    Created on : 6/07/2025, 2:30:34 p. m.
    Author     : MATEO CARVAJAL
--%>
<%@page import="java.util.List"%>
<%@ page import="modelo.Usuario" %>
<%@ page import="modelo.Salud" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<%
    Usuario usuario = (Usuario) request.getAttribute("usuario");
    List<Salud> listaHistorial = (List<Salud>) request.getAttribute("listaHistorial");
%>

<div class="container mt-3">
    <h3>Datos del Usuario</h3>
    <table class="table table-bordered">
        <tr>
            <th>Cédula</th>
            <td><%= usuario != null ? usuario.getCedula() : "No disponible" %></td>
        </tr>
        <tr>
            <th>Nombre</th>
            <td><%= usuario != null ? usuario.getNombre() + " " + usuario.getApellidos() : "No disponible" %></td>
        </tr>
        <tr>
            <th>Fecha de Nacimiento</th>
            <td><%= usuario != null ? usuario.getFecha_nac() : "No disponible" %></td>
        </tr>
        <tr>
            <th>Nacionalidad</th>
            <td><%= usuario != null ? usuario.getNacionalidad() : "No disponible" %></td>
        </tr>
    </table>

    <div class="container mt-3">
        <h3>Historial de Salud del Usuario</h3>
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Fecha Registro</th>
                    <th>Peso (kg)</th>
                    <th>Estatura (m)</th>
                    <th>Edad</th>
                    <th>IMC</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (listaHistorial != null && !listaHistorial.isEmpty()) {
                        for (Salud s : listaHistorial) {
                            double imc = s.getImc();
                            String estado = "";
                            String idCss = "";

                            if (imc < 18.5) {
                                estado = "Desnutrición";
                                idCss = "bajo";
                            } else if (imc < 25) {
                                estado = "Normal";
                                idCss = "normal";
                            } else if (imc < 30) {
                                estado = "Sobrepeso";
                                idCss = "sobrepeso";
                            } else if (imc < 35) {
                                estado = "Obesidad Grado 1";
                                idCss = "obesidad1";
                            } else if (imc < 40) {
                                estado = "Obesidad Grado 2";
                                idCss = "obesidad2";
                            } else {
                                estado = "Obesidad Grado 3";
                                idCss = "obesidad3";
                            }
                %>
                <tr>
                    <td><%= s.getFecha_reg() %></td>
                    <td><%= s.getPeso() %></td>
                    <td><%= s.getEstatura() %></td>
                    <td><%= s.getEdad() %></td>
                    <td><%= s.getImc() %></td>
                    <td id="<%= idCss %>"><%= estado %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6">No hay registros de salud disponibles.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

