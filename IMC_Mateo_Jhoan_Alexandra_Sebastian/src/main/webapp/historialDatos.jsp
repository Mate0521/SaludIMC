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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body id="bod">

        <form action="SaludController" method="get">
            <div class="mb-3">
                <label for="cedula" class="form-label">Cédula:</label>
                <input type="text" id="cedula" name="cedula" class="form-control" />
            </div>
            <div class="text-center">
                <button type="button" name="action" value="verRegistros" class="btn btn-primary mx-2" id="verRegistros">Ver registro de anteriores consultas</button>
            </div>
        </form>

        <div id="data-component" class="mt-4">
            <!-- Aquí se cargarán los eventos del ajax -->
        </div>

        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
            $(document).ready(function () {
                function cargarFormularioAgenda() {
                    $.ajax({
                        url: 'HistorialController', // Cambia la URL para llamar al servlet
                        type: 'GET',
                        data: { 
                            cedula: $('#cedula').val() 
                        },
                        success: function(response) {
                            $('#data-component').html(response);
                        },
                        error: function() {
                            alert('Error al consultar historial');
                        }
                    });
                }

                $('#verRegistros').on('click', function (e) {
                    e.preventDefault(); // evitar submit normal
                    cargarFormularioAgenda();
                });
            });
        </script>
    </body>
</html>
