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
        <title>Calendario de Partidos</title>
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
                width: 90%;
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
            <h1>Calendario de Partidos</h1>
            <p>Consulta los próximos partidos de la Champions League.</p>
        </header>
        <nav>
            <a href="index.jsp">Inicio</a>
            <a href="LideresDeTorneo.jsp">Equipos Destacados</a>
            <a href="EstadisticasDeCampeonato.jsp">Estadísticas de la Temporada</a>
        </nav>
        <main>
            <section class="schedule">
                <h2>Próximos Partidos</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Equipos</th>
                            <th>Ubicación</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2024-11-25</td>
                            <td>21:00 CET</td>
                            <td>Real Madrid vs PSG</td>
                            <td>Santiago Bernabéu</td>
                        </tr>
                        <tr>
                            <td>2024-11-27</td>
                            <td>20:45 CET</td>
                            <td>Manchester City vs Bayern Múnich</td>
                            <td>Etihad Stadium</td>
                        </tr>
                        <tr>
                            <td>2024-11-29</td>
                            <td>19:30 CET</td>
                            <td>Barcelona vs Inter</td>
                            <td>Camp Nou</td>
                        </tr>
                        <tr>
                            <td>2024-12-01</td>
                            <td>21:00 CET</td>
                            <td>Juventus vs Chelsea</td>
                            <td>Allianz Stadium</td>
                        </tr>
                        <tr>
                            <td>2024-12-03</td>
                            <td>19:45 CET</td>
                            <td>Napoli vs Dortmund</td>
                            <td>Diego Armando Maradona Stadium</td>
                        </tr>
                    </tbody>
                </table>
                <div class="actions">
                    <a href="AgregarPartidos.jsp" class="btn">Añadir Partido</a>
                    <a href="ActualizarPartidos.jsp" class="btn">Actualizar Partido</a>
                    <a href="EliminarPartidos.jsp" class="btn">Eliminar Partido</a>
                </div>
            </section>
        </main>
        <footer>
            <p>&copy; 2024 Sandoyork. Todos los derechos reservados.</p>
        </footer>
    </body>
</html>