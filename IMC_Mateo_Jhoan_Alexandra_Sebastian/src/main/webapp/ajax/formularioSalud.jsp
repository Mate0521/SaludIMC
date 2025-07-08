<%-- 
    Document   : formularioSalud
    Created on : 7/07/2025, 9:53:52?p.?m.
    Author     : MATEO CARVAJAL
--%>

<!-- Fragmento: Datos de Salud -->
<h5 class="mb-3">Datos de Salud</h5>

<div class="mb-3">
    <label for="peso_salud" class="form-label">Peso (kg):</label>
    <input type="text" id="peso_salud" name="peso" class="form-control" />
</div>

<div class="mb-3">
    <label for="estatura_salud" class="form-label">Estatura (m):</label>
    <input type="text" id="estatura_salud" name="estatura" class="form-control" />
</div>

<!-- Resultado del IMC -->
<div class="mb-3">
    <label class="form-label">IMC Calculado:</label>
    <input type="text" id="resultado_imc" class="form-control" readonly />
</div>

<!-- Clasificación -->
<div class="mb-3">
    <label class="form-label">Clasificación:</label>
    <input type="text" id="clasificacion_imc" class="form-control" readonly />
</div>

<script>
    function calcularIMC() {
        const peso = parseFloat(document.getElementById("peso_salud").value);
        const estatura = parseFloat(document.getElementById("estatura_salud").value);

        if (!isNaN(peso) && !isNaN(estatura) && estatura > 0) {
            const imc = peso / (estatura * estatura);
            const imcRedondeado = imc.toFixed(2);
            document.getElementById("resultado_imc").value = imcRedondeado;

            let clasificacion = "";
            if (imc < 18.5) {
                clasificacion = "Bajo peso";
            } else if (imc < 24.9) {
                clasificacion = "Normal";
            } else if (imc < 29.9) {
                clasificacion = "Sobrepeso";
            } else {
                clasificacion = "Obesidad";
            }

            document.getElementById("clasificacion_imc").value = clasificacion;
        } else {
            document.getElementById("resultado_imc").value = "";
            document.getElementById("clasificacion_imc").value = "";
        }
    }

    // Ejecutar al escribir en los campos
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("peso_salud").addEventListener("input", calcularIMC);
        document.getElementById("estatura_salud").addEventListener("input", calcularIMC);
    });
</script>
