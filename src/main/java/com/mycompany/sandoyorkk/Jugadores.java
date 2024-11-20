package com.mycompany.sandoyorkk;

public class Jugadores {

    private int ID;
    private String nombre;
    private String posicion;
    private int fecha_nacimiento;
    private String altura;
    private String peso;
    private int numero_camiseta;
    private String equipo;
    private String estado;
    private String image;

    public Jugadores(int ID, String nombre, String posicion, int fecha_nacimiento, String altura, String peso, int numero_camiseta, String equipo, String estado, String image) {
        this.ID = ID;
        this.nombre = nombre;
        this.posicion = posicion;
        this.fecha_nacimiento = fecha_nacimiento;
        this.altura = altura;
        this.peso = peso;
        this.numero_camiseta = numero_camiseta;
        this.equipo = equipo;
        this.estado = estado;
        this.image = image;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPosicion() {
        return posicion;
    }

    public void setPosicion(String posicion) {
        this.posicion = posicion;
    }

    public int getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(int fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getAltura() {
        return altura;
    }

    public void setAltura(String altura) {
        this.altura = altura;
    }

    public String getPeso() {
        return peso;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }

    public int getNumero_camiseta() {
        return numero_camiseta;
    }

    public void setNumero_camiseta(int numero_camiseta) {
        this.numero_camiseta = numero_camiseta;
    }

    public String getEquipo() {
        return equipo;
    }

    public void setEquipo(String equipo) {
        this.equipo = equipo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
