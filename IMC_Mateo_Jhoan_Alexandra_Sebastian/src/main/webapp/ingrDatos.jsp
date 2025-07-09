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
                    <h4 class="mb-0">Registro de Usuario y IMC</h4>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label for="cedula" class="form-label">Cédula:</label>
                        <input type="text" id="cedula" name="cedula" class="form-control" />
                    </div>

                    <div class="text-center">
                        <button id="siguiente" type="submit" name="action" value="siguiente" class="btn btn-primary mx-2">Siguiente</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#siguiente').on('click', function () {
                    const cedula = $("#cedula").val();

                    if (cedula === "") {
                        alert("Por favor ingresa una cédula antes de continuar.");
                        return;
                    }

                    // Redirecciona a formulario.jsp enviando la cédula como parámetro
                    window.location.href = "formulario.jsp?cedula=" + cedula;
                });
            });

        </script>
    </body>
    </body>
</html>
