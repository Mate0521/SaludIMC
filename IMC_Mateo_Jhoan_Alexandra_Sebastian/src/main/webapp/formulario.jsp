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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <div id="data-component" class="mt-4">
            <!-- Aquí se cargarán los eventos del ajax -->
        </div>
        
        <div class="text-center">
        <button type="submit" name="action" value="guardar" class="btn btn-primary mx-2">Guardar Información</button>
        <button type="submit" name="action" value="verRegistros" class="btn btn-secondary mx-2">Ver registro de anteriores consultas</button>
        </div>
    
    </body>


    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function () {

            function getParameterByName(name) {
                const url = window.location.href;
                const paramName = name.replace(/[\[\]]/g, '\\$&');
                const regex = new RegExp('[?&]' + paramName + '(=([^&#]*)|&|#|$)');
                const results = regex.exec(url);
                if (!results) return null;
                if (!results[2]) return '';
                return decodeURIComponent(results[2].replace(/\+/g, ' '));
            }

            function cargarFormularios(cedula) {
                $.ajax({
                    url: "FormController",
                    type: "GET",
                    data: { cedula: cedula },
                    dataType: "json",
                    success: function(response) {
                        if (response.resultado === "existe") {
                            // Usuario existe: cargar solo salud
                            $.ajax({
                                url: "SaludForm.jsp",
                                type: "GET",
                                success: function(data) {
                                    $("#data-component").html(data);
                                }
                            });
                        } else {
                            // Usuario no existe: cargar ambos formularios
                            $.ajax({
                                url: "UsuarioForm.jsp",
                                type: "GET",
                                success: function(dataUsuario) {
                                    $("#data-component").html(dataUsuario);
                                    $.ajax({
                                        url: "SaludForm.jsp",
                                        type: "GET",
                                        success: function(dataSalud) {
                                            $("#data-component").append(dataSalud);
                                        }
                                    });
                                }
                            });
                        }
                    },
                    error: function() {
                        alert("Error al verificar la cédula.");
                    }
                });
            }

            // Obtener parámetro cedula al cargar la página
            const cedulaParam = getParameterByName('cedula');
            if (cedulaParam) {
                // Llamar función que decide qué formularios cargar
                cargarFormularios(cedulaParam);
            }

        });
    </script>

</html>
