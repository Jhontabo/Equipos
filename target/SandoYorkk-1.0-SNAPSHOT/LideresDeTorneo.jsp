<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.mycompany.sandoyorkk.Equipos" %>
<%@ page import="com.mycompany.sandoyorkk.Partidos" %>
<%@ page import="com.mycompany.sandoyorkk.Jugadores" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Líderes de Goleo</title>
        <link rel="stylesheet" href="style.css">
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
            }
            nav a:hover {
                color: #00b300;
            }
            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
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
            .actions {
                text-align: center;
                margin: 20px;
            }
            .btn {
                background-color: #00b300;
                color: white;
                padding: 10px 15px;
                text-decoration: none;
                border-radius: 5px;
                margin: 5px;
                display: inline-block;
            }
            .btn:hover {
                background-color: #008000;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>Líderes de Goleo</h1>
            <p>Descubre los jugadores con más goles en esta temporada de la Champions League.</p>
        </header>
        <nav>
            <a href="index.jsp">Inicio</a>
            <a href="CalendarioPartidos.jsp">Calendario de Partidos</a>
            <a href="EstadisticasDeCampeonato.jsp">Estadísticas de la Temporada</a>
        </nav>
        <main>
            <section>
                <h2>Máximos Goleadores</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Jugador</th>
                            <th>Goles</th>
                            <th>Asistencias</th>
                            <th>Partidos Jugados</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Karim Benzema</td>
                            <td>10</td>
                            <td>5</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <td>Erling Haaland</td>
                            <td>9</td>
                            <td>2</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <td>Kylian Mbappé</td>
                            <td>8</td>
                            <td>4</td>
                            <td>6</td>
                        </tr>
                        <tr>
                            <td>Robert Lewandowski</td>
                            <td>7</td>
                            <td>3</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td>Vinícius Jr.</td>
                            <td>6</td>
                            <td>6</td>
                            <td>6</td>
                        </tr>
                    </tbody>
                </table>
                <div class="actions">
                    <a href="AgregarJugadores.jsp" class="btn">Añadir Jugador</a>
                    <a href="ActualizarJugadores.jsp" class="btn">Actualizar Jugador</a>
                    <a href="EliminarJugadores.jsp" class="btn">Eliminar Jugador</a>
                </div>
            </section>
        </main>
        <footer>
            <p>&copy; 2024 Sandoyork. Todos los derechos reservados.</p>
        </footer>
    </body>
</html>