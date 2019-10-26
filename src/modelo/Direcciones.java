/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Objects;


public class Direcciones {
    private int numero;
    private int piso;
    private int codPostal;
    private String calle;
    private String escalera;
    private String letra;
    private String localidad;
    private String provincia;

    public Direcciones(int numero, int piso, int codPostal, String calle, String escalera, String letra, String localidad, String provincia) {
        this.numero = numero;
        this.piso = piso;
        this.codPostal = codPostal;
        this.calle = calle;
        this.escalera = escalera;
        this.letra = letra;
        this.localidad = localidad;
        this.provincia = provincia;
    }

    public Direcciones() {
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getPiso() {
        return piso;
    }

    public void setPiso(int piso) {
        this.piso = piso;
    }

    public int getCodPostal() {
        return codPostal;
    }

    public void setCodPostal(int codPostal) {
        this.codPostal = codPostal;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getEscalera() {
        return escalera;
    }

    public void setEscalera(String escalera) {
        this.escalera = escalera;
    }

    public String getLetra() {
        return letra;
    }

    public void setLetra(String letra) {
        this.letra = letra;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Direcciones other = (Direcciones) obj;
        if (this.numero != other.numero) {
            return false;
        }
        if (this.piso != other.piso) {
            return false;
        }
        if (this.codPostal != other.codPostal) {
            return false;
        }
        if (!Objects.equals(this.calle, other.calle)) {
            return false;
        }
        if (!Objects.equals(this.escalera, other.escalera)) {
            return false;
        }
        if (!Objects.equals(this.letra, other.letra)) {
            return false;
        }
        if (!Objects.equals(this.localidad, other.localidad)) {
            return false;
        }
        if (!Objects.equals(this.provincia, other.provincia)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Direcciones{" + "numero=" + numero + ", piso=" + piso + ", codPostal=" + codPostal + ", calle=" + calle + ", escalera=" + escalera + ", letra=" + letra + ", localidad=" + localidad + ", provincia=" + provincia + '}';
    }
    
} 
