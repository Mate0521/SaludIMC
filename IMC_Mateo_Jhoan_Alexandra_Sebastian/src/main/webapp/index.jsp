<%-- 
    Document   : index
    Created on : 6/07/2025, 1:55:02 p. m.
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
    <body id="b">

        <div class="text-center mt-5">
            <form action="ingrDatos.jsp" method="post">
                <button type="submit" class="btn btn-primary mx-2">Ingresar Nuevos Datos</button>
            </form>

            <form action="historialDatos.jsp" method="post">
                <button type="submit" class="btn btn-secondary mx-2">Ver registro de anteriores consultas</button>
            </form>
        </div>

        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
