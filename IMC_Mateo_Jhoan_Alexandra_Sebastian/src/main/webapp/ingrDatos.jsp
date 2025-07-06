<%-- 
    Document   : ingrDatos
    Created on : 6/07/2025, 2:23:28 p. m.
    Author     : MATEO CARVAJAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>CDT</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body id="bod">
        <div class="container mt-5">
            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">Registro de Usuario y CDT</h4>
                </div>
                <div class="card-body">
                    <form action="SaludController" method="post">
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

                        <!-- Datos para calcular IMC -->
                        <h5 class="mb-3">Datos de Salud</h5>

                        <div class="mb-3">
                            <label for="peso" class="form-label">Peso (kg):</label>
                            <input type="text" id="peso" name="peso" class="form-control" />
                        </div>

                        <div class="mb-4">
                            <label for="estatura" class="form-label">Estatura (m):</label>
                            <input type="text" id="estatura" name="estatura" class="form-control" />
                        </div>

                        <!-- Mostrar IMC calculado -->
                        <div class="mb-4">
                            <label for="imc" class="form-label">Índice de Masa Corporal (IMC):</label>
                            <input type="text" id="imc" name="imc" class="form-control" readonly />
                        </div>

                        <div class="mt-3 text-danger">
                            <!-- Aquí se mostrarían mensajes de error si los hay -->
                            <%
                                String error = (String) request.getAttribute("error");
                                if (error != null) {
                                    out.print(error);
                                }
                            %>
                        </div>

                        <div class="text-center">
                            <button type="submit" name="action" value="guardar" class="btn btn-primary mx-2">Guardar Información</button>
                            <button type="submit" name="action" value="verRegistros" class="btn btn-secondary mx-2">Ver registro de anteriores consultas</button>
                        </div>

                        <div id="data-component" class="mt-4">
                            <!-- Aquí se cargarán los eventos del ajax -->
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
            $(document).ready(function () {
                function cargarFormularioAgenda() {
                    $.ajax({
                        url: 'ajax/tablaHistorialRegistros.jsp',
                        type: 'GET',
                        data: {
                            cedula: $('#cedula').val()
                        },
                        success: function (response) {
                            $('#data-component').html(response);
                        },
                        error: function () {
                            $('#data-component').html("<p class='text-danger'>Error al cargar el formulario de selección de fecha.</p>");
                        }
                    });
                }

                $('button[value="verRegistros"]').on('click', function (e) {
                    e.preventDefault(); // para evitar el submit normal
                    cargarFormularioAgenda();
                });
            });
        </script>
    </body>
</html>
