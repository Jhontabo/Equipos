<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.sandoyorkk.Jugadores" %>
<%
    Jugadores jugadorEditado = (Jugadores) request.getAttribute("jugador");
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (jugadorEditado == null) {
        throw new IllegalStateException("No se encontró el jugador para editar.");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Jugador</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #007bff;
            margin-top: 20px;
        }

        form {
            max-width: 600px;
            margin: 20px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        input[type="text"], input[type="number"], input[type="file"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        img {
            max-width: 150px;
            height: auto;
            margin-top: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        button {
            width: 100%;
            padding: 10px 15px;
            background-color: #28a745;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #218838;
        }

        @media (max-width: 768px) {
            form {
                padding: 15px;
            }

            button {
                font-size: 14px;
            }
        }

        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h1>Editar Jugador</h1>

    <% if (errorMessage != null) { %>
        <div class="error-message">
            <%= errorMessage %>
        </div>
    <% } %>

    <form action="JugadoresServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="editar">
        <input type="hidden" name="id" value="<%= jugadorEditado.getID() %>">

        <label>Nombre del Jugador:</label>
        <input type="text" name="nombre" value="<%= jugadorEditado.getNombre() %>" required>

        <label>Posición:</label>
        <input type="text" name="posicion" value="<%= jugadorEditado.getPosicion() %>" required>

        <label>Fecha de Nacimiento (YYYY):</label>
        <input type="number" name="fecha_nacimiento" value="<%= jugadorEditado.getFecha_nacimiento() %>" min="1900" max="2100" required>

        <label>Altura (cm):</label>
        <input type="text" name="altura" value="<%= jugadorEditado.getAltura() %>" required>

        <label>Peso (kg):</label>
        <input type="text" name="peso" value="<%= jugadorEditado.getPeso() %>" required>

        <label>Número de Camiseta:</label>
        <input type="number" name="numero_camiseta" value="<%= jugadorEditado.getNumero_camiseta() %>" required>

        <label>Equipo:</label>
        <input type="text" name="equipo" value="<%= jugadorEditado.getEquipo() %>" required>

        <label>Estado:</label>
        <input type="text" name="estado" value="<%= jugadorEditado.getEstado() %>" required>

        <label>Imagen:</label>
        <input type="file" name="image" accept="image/*">
        <p>Imagen actual:</p>
        <img src="imagenes/<%= jugadorEditado.getImage() %>" alt="Imagen del jugador">

        <button type="submit">Guardar Cambios</button>
    </form>
</body>
</html>
