package com.mycompany.sandoyorkk;

public class Equipo {
    private int id;
    private String nombreEquipo;
    private String pais;
    private String entrenador;
    private int añoFundacion;
    private String estadio;
    private String presidente;
    private String coloresPrimarios;
    private String coloresSecundarios;
    private String imagen;

    public Equipo(int id, String nombreEquipo, String pais, String entrenador, int añoFundacion, String estadio,
                  String presidente, String coloresPrimarios, String coloresSecundarios, String imagen) {
        this.id = id;
        this.nombreEquipo = nombreEquipo;
        this.pais = pais;
        this.entrenador = entrenador;
        this.añoFundacion = añoFundacion;
        this.estadio = estadio;
        this.presidente = presidente;
        this.coloresPrimarios = coloresPrimarios;
        this.coloresSecundarios = coloresSecundarios;
        this.imagen = imagen;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombreEquipo() { return nombreEquipo; }
    public void setNombreEquipo(String nombreEquipo) { this.nombreEquipo = nombreEquipo; }
    public String getPais() { return pais; }
    public void setPais(String pais) { this.pais = pais; }
    public String getEntrenador() { return entrenador; }
    public void setEntrenador(String entrenador) { this.entrenador = entrenador; }
    public int getAñoFundacion() { return añoFundacion; }
    public void setAñoFundacion(int añoFundacion) { this.añoFundacion = añoFundacion; }
    public String getEstadio() { return estadio; }
    public void setEstadio(String estadio) { this.estadio = estadio; }
    public String getPresidente() { return presidente; }
    public void setPresidente(String presidente) { this.presidente = presidente; }
    public String getColoresPrimarios() { return coloresPrimarios; }
    public void setColoresPrimarios(String coloresPrimarios) { this.coloresPrimarios = coloresPrimarios; }
    public String getColoresSecundarios() { return coloresSecundarios; }
    public void setColoresSecundarios(String coloresSecundarios) { this.coloresSecundarios = coloresSecundarios; }
    public String getImagen() { return imagen; }
    public void setImagen(String imagen) { this.imagen = imagen; }
}
