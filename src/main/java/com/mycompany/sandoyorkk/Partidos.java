package com.mycompany.sandoyorkk;

public class Partidos {

    private int ID;
    private String local;
    private String visitante;
    private String fecha_partido;
    private int marcador_finl;
    private int marcador_inicial;
    private String estadio;
    private String arbitro;
    private double asistencia_tribuna;
    private String image;

    public Partidos(int ID, String local, String visitante, String fecha_partido, int marcador_finl, int marcador_inicial, String estadio, String arbitro, double asistencia_tribuna, String image) {
        this.ID = ID;
        this.local = local;
        this.visitante = visitante;
        this.fecha_partido = fecha_partido;
        this.marcador_finl = marcador_finl;
        this.marcador_inicial = marcador_inicial;
        this.estadio = estadio;
        this.arbitro = arbitro;
        this.asistencia_tribuna = asistencia_tribuna;
        this.image = image;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public String getVisitante() {
        return visitante;
    }

    public void setVisitante(String visitante) {
        this.visitante = visitante;
    }

    public String getFecha_partido() {
        return fecha_partido;
    }

    public void setFecha_partido(String fecha_partido) {
        this.fecha_partido = fecha_partido;
    }

    public int getMarcador_finl() {
        return marcador_finl;
    }

    public void setMarcador_finl(int marcador_finl) {
        this.marcador_finl = marcador_finl;
    }

    public int getMarcador_inicial() {
        return marcador_inicial;
    }

    public void setMarcador_inicial(int marcador_inicial) {
        this.marcador_inicial = marcador_inicial;
    }

    public String getEstadio() {
        return estadio;
    }

    public void setEstadio(String estadio) {
        this.estadio = estadio;
    }

    public String getArbitro() {
        return arbitro;
    }

    public void setArbitro(String arbitro) {
        this.arbitro = arbitro;
    }

    public double getAsistencia_tribuna() {
        return asistencia_tribuna;
    }

    public void setAsistencia_tribuna(double asistencia_tribuna) {
        this.asistencia_tribuna = asistencia_tribuna;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}