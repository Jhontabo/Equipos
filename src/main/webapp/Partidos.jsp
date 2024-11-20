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
        <title>Equipos Destacados</title>
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
            <h1>Equipos Destacados</h1>
            <p>Descubre los mejores equipos de la Champions League esta temporada.</p>
        </header>
        <nav>
            <a href="index.jsp">Inicio</a>
            <a href="CalendarioPartidos.jsp">Calendario de Partidos</a>
            <a href="EstadisticasDeCampeonto.jsp">Estadísticas de la Temporada</a>
        </nav>
        <main>
            <section>
                <h2>Estadísticas de los Equipos</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Equipo</th>
                            <th>Goles Anotados</th>
                            <th>Partidos Jugados</th>
                            <th>Puntos</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Real Madrid</td>
                            <td>15</td>
                            <td>6</td>
                            <td>18</td>
                        </tr>
                        <tr>
                            <td>Manchester City</td>
                            <td>12</td>
                            <td>6</td>
                            <td>16</td>
                        </tr>
                        <tr>
                            <td>Bayern Múnich</td>
                            <td>10</td>
                            <td>6</td>
                            <td>15</td>
                        </tr>
                        <tr>
                            <td>Barcelona</td>
                            <td>9</td>
                            <td>6</td>
                            <td>14</td>
                        </tr>
                        <tr>
                            <td>PSG</td>
                            <td>8</td>
                            <td>6</td>
                            <td>13</td>
                        </tr>
                    </tbody>
                </table>
                <div class="actions">
                    <a href="AgregarEquipos.jsp" class="btn">Añadir Equipo</a>
                    <a href="ActualizarEquipos.jsp" class="btn">Actualizar Equipo</a>
                    <a href="EliminarEquipos.jsp" class="btn">Eliminar Equipo</a>
                </div>
            </section>
        </main>
        <footer>
            <p>&copy; 2024 Sandoyork. Todos los derechos reservados.</p>
        </footer>
    </body>
</html>