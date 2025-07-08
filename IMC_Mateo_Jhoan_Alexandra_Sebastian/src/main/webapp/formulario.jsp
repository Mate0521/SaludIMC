<%-- 
    Document   : formulario
    Created on : 7/07/2025, 11:08:22 p. m.
    Author     : MATEO CARVAJAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <h1>Formulario IMC</h1>
        
        <form action="action" id="formularioCompleto" method="POST">

            <div id="data-component" class="mt-4">
                <!-- Aquí se cargarán los formularios vía AJAX -->
            </div>

            <div class="text-center">
                <button type="submit" name="action" value="guardar" class="btn btn-primary mx-2">Guardar Información</button>
                <button type="submit" name="action" value="verRegistros" class="btn btn-secondary mx-2">Ver registro de anteriores consultas</button>
            </div>
        </form>
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
            // Función para obtener parámetros GET desde la URL
            function getParameterByName(name, url = window.location.href) {
                name = name.replace(/[\[\]]/g, '\\$&');
                const regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
                      results = regex.exec(url);
                if (!results) return null;
                if (!results[2]) return '';
                return decodeURIComponent(results[2].replace(/\+/g, ' '));
            }

            $(document).ready(function () {
                const cedulaParam = getParameterByName('cedula');

                if (cedulaParam) {
                    // AJAX principal al FormController
                    $.ajax({
                        url: "FormController",
                        type: "GET",
                        data: { cedula: cedulaParam },
                        dataType: "json",
                        success: function(response) {
                            if (response.resultado === "existe") {
                                // Usuario existe: cargar solo SaludForm.jsp
                                $.ajax({
                                    url: "ajax/formularioSalud.jsp",
                                    type: "GET",
                                    success: function(data) {
                                        $("#data-component").html(data);
                                    },
                                    error: function() {
                                        alert("Error cargando SaludForm.jsp");
                                    }
                                });
                            } else {
                                // Usuario no existe: cargar UsuarioForm.jsp y luego SaludForm.jsp
                                $.ajax({
                                    url: "ajax/formularioUsuario.jsp",
                                    type: "GET",
                                    success: function(dataUsuario) {
                                        $("#data-component").html(dataUsuario);
                                        $.ajax({
                                            url: "ajax/formularioSalud.jsp",
                                            type: "GET",
                                            success: function(dataSalud) {
                                                $("#data-component").append(dataSalud);
                                            },
                                            error: function() {
                                                alert("Error cargando SaludForm.jsp");
                                            }
                                        });
                                    },
                                    error: function() {
                                        alert("Error cargando UsuarioForm.jsp");
                                    }
                                });
                            }
                        },
                        error: function(xhr, status, error) {
                            console.error("Error AJAX FormController:", status, error);
                            alert("Error al verificar la cédula en FormController.");
                        }
                    });
                } else {
                    alert("No se encontró el parámetro 'cedula' en la URL.");
                }
            });
        </script>
    </body>
</html>
