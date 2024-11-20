<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mycompany.sandoyorkk.Jugadores" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jugadores - Líderes de Goleo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333;
            margin: 0;
            padding: 0;
        }

        header, nav, footer {
            background-color: #1d3557;
            color: white;
            text-align: center;
            padding: 10px 0;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
        }

        nav a:hover {
            color: #00b300;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #1d3557;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e9f5e9;
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

        footer {
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <header>
        <h1>Jugadores - Líderes de Goleo</h1>
        <p>Descubre los jugadores destacados de esta temporada.</p>
    </header>

    <nav>
        <a href="index.jsp">Inicio</a>
        <a href="Jugadores.jsp">Jugadores</a>
        <a href="Partidos.jsp">Partidos</a>
        <a href="Equipos.jsp">Equipos</a>
    </nav>

    <main>
        <!-- Formulario para agregar un nuevo jugador -->
        <form action="JugadoresServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="agregar">
            <label>Nombre del Jugador:</label>
            <input type="text" name="nombre" required>

            <label>Posición:</label>
            <input type="text" name="posicion" required>

            <label>Fecha de Nacimiento (YYYY):</label>
            <input type="number" name="fecha_nacimiento" required min="1900" max="2100">

            <label>Altura (cm):</label>
            <input type="text" name="altura" required>

            <label>Peso (kg):</label>
            <input type="text" name="peso" required>

            <label>Número de Camiseta:</label>
            <input type="number" name="numero_camiseta" required>

            <label>Equipo:</label>
            <input type="text" name="equipo" required>

            <label>Estado:</label>
            <input type="text" name="estado" required>

            <label>Imagen:</label>
            <input type="file" name="image" accept="image/*">

            <button type="submit">Añadir Jugador</button>
        </form>

        <!-- Tabla de jugadores -->
        <section>
            <h2>Jugadores Destacados</h2>
            <table>
                <thead>
                    <tr>
                        <th>Jugador</th>
                        <th>Posición</th>
                        <th>Equipo</th>
                        <th>Estado</th>
                        <th>Imagen</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Jugadores> jugadores = (ArrayList<Jugadores>) request.getAttribute("jugadores");
                        if (jugadores != null) {
                            for (Jugadores jugador : jugadores) {
                    %>
                    <tr>
                        <td><%= jugador.getNombre() %></td>
                        <td><%= jugador.getPosicion() %></td>
                        <td><%= jugador.getEquipo() %></td>
                        <td><%= jugador.getEstado() %></td>
                        <td>
                            <% if (jugador.getImage() != null && !jugador.getImage().isEmpty()) { %>
                                <img src="imagenes/<%= jugador.getImage() %>" alt="<%= jugador.getNombre() %>" width="50">
                            <% } else { %>
                                Sin Imagen
                            <% } %>
                        </td>
                        <td>
                            <div class="actions">
                                <form action="JugadoresServlet" method="get" style="display:inline;">
                                    <input type="hidden" name="action" value="editar">
                                    <input type="hidden" name="id" value="<%= jugador.getID() %>">
                                    <button type="submit" class="btn">Editar</button>
                                </form>

                                <form action="JugadoresServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="eliminar">
                                    <input type="hidden" name="id" value="<%= jugador.getID() %>">
                                    <button type="submit" class="btn" onclick="return confirm('¿Seguro que deseas eliminar este jugador?')">Eliminar</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="6">No hay jugadores registrados.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Sandoyork. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
