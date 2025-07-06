<%-- 
    Document   : historialDatos
    Created on : 6/07/2025, 2:24:58 p. m.
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

        <form action="SaludController" method="post">
            <div class="mb-3">
                <label for="cedula" class="form-label">Cédula:</label>
                <input type="text" id="cedula" name="cedula" class="form-control" />
            </div>
            <div class="text-center">
                <button type="submit" name="action" value="verRegistros" class="btn btn-primary mx-2">Ver registro de anteriores consultas</button>
            </div>
        </form>

        <div id="data-component" class="mt-4">
            <!-- Aquí se cargarán los eventos del ajax -->
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
                    e.preventDefault(); // evitar submit normal
                    cargarFormularioAgenda();
                });
            });
        </script>
    </body>
</html>
