package servlets;

import com.mycompany.sandoyorkk.Jugadores;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/JugadoresServlet")
@MultipartConfig
public class JugadoresServlet extends HttpServlet {
    private static int contadorID = 1;
    private static List<Jugadores> listaJugadores = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        super.init();
        if (listaJugadores.isEmpty()) {
            // Agregar algunos jugadores de ejemplo
            listaJugadores.add(new Jugadores(contadorID++, "Lionel Messi", "Delantero", 1987, "170 cm", "72 kg", 10, "Paris Saint-Germain", "Activo", "messi.jpg"));
            listaJugadores.add(new Jugadores(contadorID++, "Cristiano Ronaldo", "Delantero", 1985, "187 cm", "83 kg", 7, "Al Nassr", "Activo", "cristiano.jpg"));
            listaJugadores.add(new Jugadores(contadorID++, "Neymar Jr", "Delantero", 1992, "175 cm", "68 kg", 11, "Al Hilal", "Activo", "neymar.jpg"));
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("editar".equalsIgnoreCase(action)) {
            cargarDatosEdicion(request, response);
        } else {
            request.setAttribute("jugadores", listaJugadores);
            request.getRequestDispatcher("Jugadores.jsp").forward(request, response);
        }
    }

    private void cargarDatosEdicion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Buscar el jugador por ID en la lista de jugadores
        Jugadores jugadorEditado = buscarJugadorPorId(id);

        if (jugadorEditado == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Jugador no encontrado");
            return;
        }

        // Pasar los datos del jugador a la página de edición
        request.setAttribute("jugador", jugadorEditado);
        request.getRequestDispatcher("EditarJugador.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("agregar".equalsIgnoreCase(action)) {
                agregarJugador(request);
            } else if ("editar".equalsIgnoreCase(action)) {
                editarJugador(request, response);
            } else if ("eliminar".equalsIgnoreCase(action)) {
                eliminarJugador(request);
            }
            response.sendRedirect("JugadoresServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private void agregarJugador(HttpServletRequest request) throws IOException, ServletException {
        String nombre = request.getParameter("nombre");
        String posicion = request.getParameter("posicion");
        int fechaNacimiento = Integer.parseInt(request.getParameter("fecha_nacimiento"));
        String altura = request.getParameter("altura");
        String peso = request.getParameter("peso");
        int numeroCamiseta = Integer.parseInt(request.getParameter("numero_camiseta"));
        String equipo = request.getParameter("equipo");
        String estado = request.getParameter("estado");
        Part filePart = request.getPart("image");

        String fileName = null;
        if (filePart != null && filePart.getSize() > 0) {
            fileName = guardarImagen(filePart);
        }

        Jugadores nuevoJugador = new Jugadores(contadorID++, nombre, posicion, fechaNacimiento, altura, peso, numeroCamiseta, equipo, estado, fileName);
        listaJugadores.add(nuevoJugador);
    }

    private void editarJugador(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String posicion = request.getParameter("posicion");
        int fechaNacimiento = Integer.parseInt(request.getParameter("fecha_nacimiento"));
        String altura = request.getParameter("altura");
        String peso = request.getParameter("peso");
        int numeroCamiseta = Integer.parseInt(request.getParameter("numero_camiseta"));
        String equipo = request.getParameter("equipo");
        String estado = request.getParameter("estado");
        Part filePart = request.getPart("image");

        Jugadores jugador = buscarJugadorPorId(id);
        if (jugador != null) {
            jugador.setNombre(nombre);
            jugador.setPosicion(posicion);
            jugador.setFecha_nacimiento(fechaNacimiento);
            jugador.setAltura(altura);
            jugador.setPeso(peso);
            jugador.setNumero_camiseta(numeroCamiseta);
            jugador.setEquipo(equipo);
            jugador.setEstado(estado);

            if (filePart != null && filePart.getSize() > 0) {
                String fileName = guardarImagen(filePart);
                jugador.setImage(fileName);
            }
        } else {
            request.setAttribute("errorMessage", "Jugador no encontrado para editar.");
            request.getRequestDispatcher("Jugadores.jsp").forward(request, response);
        }
    }

    private void eliminarJugador(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        listaJugadores.removeIf(jugador -> jugador.getID() == id);
    }

    private Jugadores buscarJugadorPorId(int id) {
        return listaJugadores.stream().filter(jugador -> jugador.getID() == id).findFirst().orElse(null);
    }

    private String guardarImagen(Part filePart) throws IOException {
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "imagenes";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        File file = new File(uploadDir, fileName);
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }
        return fileName;
    }
}
