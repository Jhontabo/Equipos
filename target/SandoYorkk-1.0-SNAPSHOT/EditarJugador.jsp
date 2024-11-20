<%@ page import="com.mycompany.sandoyorkk.Jugadores" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Jugador</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333;
            margin: 0;
            padding: 0;
        }
        header, footer {
            background-color: #1d3557;
            color: white;
            text-align: center;
            padding: 10px 0;
        }
        form {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        form label {
            display: block;
            font-weight: bold;
            margin: 10px 0 5px;
        }
        form input, form select, form button {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        form button {
            background-color: #00b300;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }
        form button:hover {
            background-color: #008000;
        }
    </style>
</head>
<body>
    <header>
        <h1>Editar Jugador</h1>
    </header>

    <form action="JugadoresServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="editar">
        <input type="hidden" name="id" value="<%= request.getAttribute("jugador").getID() %>">

        <label>Nombre del Jugador:</label>
        <input type="text" name="nombre" value="<%= request.getAttribute("jugador").getNombre() %>" required>

        <label>Posición:</label>
        <input type="text" name="posicion" value="<%= request.getAttribute("jugador").getPosicion() %>" required>

        <label>Equipo:</label>
        <input type="text" name="equipo" value="<%= request.getAttribute("jugador").getEquipo() %>" required>

        <label>Estado:</label>
        <input type="text" name="estado" value="<%= request.getAttribute("jugador").getEstado() %>" required>

        <label>Imagen:</label>
        <input type="file" name="image" accept="image/*">

        <button type="submit">Guardar Cambios</button>
    </form>

    <footer>
        <p>&copy; 2024 Sandoyork. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
