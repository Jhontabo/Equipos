package servlets;

import com.mycompany.sandoyorkk.Equipo;
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

@WebServlet("/EquipoServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 50    // 50 MB
)
public class EquipoServlet extends HttpServlet {
    private static int nextId = 1;

    @Override
    public void init() throws ServletException {
        super.init();

        // Inicializar la lista de equipos si no existe en el contexto de la aplicación
        List<Equipo> equipos = (List<Equipo>) getServletContext().getAttribute("equipos");

        if (equipos == null) {
            equipos = new ArrayList<>();
            equipos.add(new Equipo(nextId++, "Real Madrid", "España", "Ancelotti", 1902, "Santiago Bernabéu", "Florentino Pérez", "Blanco", "Morado", "real-madrid.jpg"));
            equipos.add(new Equipo(nextId++, "FC Barcelona", "España", "Xavi Hernández", 1899, "Camp Nou", "Joan Laporta", "Azul", "Grana", "barcelona.jpg"));

            getServletContext().setAttribute("equipos", equipos);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obtener la lista de equipos desde el contexto de la aplicación
        List<Equipo> equipos = (List<Equipo>) getServletContext().getAttribute("equipos");

        // Pasar la lista de equipos al JSP
        req.setAttribute("equipos", equipos);
        req.getRequestDispatcher("/Equipos.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if ("agregar".equalsIgnoreCase(action)) {
                agregarEquipo(req);
                resp.sendRedirect("EquipoServlet");
            } else if ("editar".equalsIgnoreCase(action)) {
                cargarDatosEdicion(req, resp);
            } else if ("guardarEdicion".equalsIgnoreCase(action)) {
                editarEquipo(req);
                resp.sendRedirect("EquipoServlet");
            } else if ("eliminar".equalsIgnoreCase(action)) {
                eliminarEquipo(req);
                resp.sendRedirect("EquipoServlet");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
    private void cargarDatosEdicion(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        // Buscar el equipo por ID
        List<Equipo> equipos = (List<Equipo>) getServletContext().getAttribute("equipos");
        Equipo equipoEditado = null;

        for (Equipo equipo : equipos) {
            if (equipo.getId() == id) {
                equipoEditado = equipo;
                break;
            }
        }

        if (equipoEditado == null) {
            throw new IllegalArgumentException("El equipo con el ID proporcionado no existe.");
        }

        // Pasar los datos del equipo a la página de edición
        req.setAttribute("equipo", equipoEditado);
        req.getRequestDispatcher("EditarEquipo.jsp").forward(req, resp);
    }

    private void agregarEquipo(HttpServletRequest req) throws IOException, ServletException {
        // Obtener datos del formulario
        String nombreEquipo = req.getParameter("nombreEquipo");
        String pais = req.getParameter("pais");
        String entrenador = req.getParameter("entrenador");
        int añoFundacion = Integer.parseInt(req.getParameter("añoFundacion"));
        String estadio = req.getParameter("estadio");
        String presidente = req.getParameter("presidente");
        String coloresPrimarios = req.getParameter("coloresPrimarios");
        String coloresSecundarios = req.getParameter("coloresSecundarios");

        // Manejar imagen
        String imagen = procesarImagen(req.getPart("image"));

        // Crear y agregar el equipo
        List<Equipo> equipos = (List<Equipo>) getServletContext().getAttribute("equipos");
        Equipo nuevoEquipo = new Equipo(nextId++, nombreEquipo, pais, entrenador, añoFundacion, estadio, presidente, coloresPrimarios, coloresSecundarios, imagen);
        equipos.add(nuevoEquipo);
    }

    private void editarEquipo(HttpServletRequest req) throws IOException, ServletException {
        // Obtener el ID del equipo a editar
        int id = Integer.parseInt(req.getParameter("id"));

        // Obtener datos del formulario
        String nombreEquipo = req.getParameter("nombreEquipo");
        String pais = req.getParameter("pais");
        String entrenador = req.getParameter("entrenador");
        int añoFundacion = Integer.parseInt(req.getParameter("añoFundacion"));
        String estadio = req.getParameter("estadio");
        String presidente = req.getParameter("presidente");
        String coloresPrimarios = req.getParameter("coloresPrimarios");
        String coloresSecundarios = req.getParameter("coloresSecundarios");

        // Manejar imagen (opcional)
        Part filePart = req.getPart("image");
        String imagen = null;
        if (filePart != null && filePart.getSize() > 0) {
            imagen = procesarImagen(filePart);
        }

        // Actualizar el equipo
        List<Equipo> equipos = (List<Equipo>) getServletContext().getAttribute("equipos");
        for (Equipo equipo : equipos) {
            if (equipo.getId() == id) {
                equipo.setNombreEquipo(nombreEquipo);
                equipo.setPais(pais);
                equipo.setEntrenador(entrenador);
                equipo.setAñoFundacion(añoFundacion);
                equipo.setEstadio(estadio);
                equipo.setPresidente(presidente);
                equipo.setColoresPrimarios(coloresPrimarios);
                equipo.setColoresSecundarios(coloresSecundarios);
                if (imagen != null) {
                    equipo.setImagen(imagen);
                }
                break;
            }
        }
    }

    private void eliminarEquipo(HttpServletRequest req) {
        // Obtener el ID del equipo a eliminar
        int id = Integer.parseInt(req.getParameter("id"));

        // Eliminar el equipo de la lista
        List<Equipo> equipos = (List<Equipo>) getServletContext().getAttribute("equipos");
        equipos.removeIf(equipo -> equipo.getId() == id);
    }

    private String procesarImagen(Part filePart) throws IOException {
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("/") + "imagenes";
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
