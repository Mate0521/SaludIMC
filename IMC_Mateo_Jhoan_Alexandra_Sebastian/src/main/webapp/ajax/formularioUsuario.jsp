<%-- 
    Document   : formularioUsuario
    Created on : 7/07/2025, 9:42:09 p. m.
    Author     : MATEO CARVAJAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <!-- Registro de Usuario -->
    <h5 class="mb-3">Registro de Usuario</h5>

    <div class="mb-3">
        <label for="cedula" class="form-label">Cédula:</label>
        <input type="text" id="cedula" name="cedula" class="form-control" />
    </div>

    <div class="mb-3">
        <label for="nombre" class="form-label">Nombre:</label>
        <input type="text" id="nombre" name="nombre" class="form-control" />
    </div>

    <div class="mb-3">
        <label for="apellidos" class="form-label">Apellidos:</label>
        <input type="text" id="apellidos" name="apellidos" class="form-control" />
    </div>

    <div class="mb-3">
        <label for="fecha_nac" class="form-label">Fecha de nacimiento:</label>
        <input type="date" id="fecha_nac" name="fecha_nac" class="form-control" />
    </div>

    <div class="mb-3">
        <label for="nacionalidad" class="form-label">Nacionalidad:</label>
        <input type="text" id="nacionalidad" name="nacionalidad" class="form-control" />
    </div>
