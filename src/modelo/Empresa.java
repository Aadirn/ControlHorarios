/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Objects;

/**
 *
 * @author VSPC-ETERNALSTORM2V5
 */
public class Empresa {
    private String nombreEmpresa;
    private String cif;
    private String dni;
    private String apellido1;
    private String apellido2;
    private String nombre;
    private String razonSocial;
    private int domSocial;
    private int domFiscal;
    private int domNotificaciones;

    public Empresa(String nombreEmpresa, String cif, String dni, String apellido1, String apellido2, String nombre, String razonSocial, int domSocial, int domFiscal, int domNotificaciones) {
        this.nombreEmpresa = nombreEmpresa;
        this.cif = cif;
        this.dni = dni;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.nombre = nombre;
        this.razonSocial = razonSocial;
        this.domSocial = domSocial;
        this.domFiscal = domFiscal;
        this.domNotificaciones = domNotificaciones;
    }

    public Empresa() {
    }

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getCif() {
        return cif;
    }

    public void setCif(String cif) {
        this.cif = cif;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRazonSocial() {
        return razonSocial;
    }

    public void setRazonSocial(String razonSocial) {
        this.razonSocial = razonSocial;
    }

    public int getDomSocial() {
        return domSocial;
    }

    public void setDomSocial(int domSocial) {
        this.domSocial = domSocial;
    }

    public int getDomFiscal() {
        return domFiscal;
    }

    public void setDomFiscal(int domFiscal) {
        this.domFiscal = domFiscal;
    }

    public int getDomNotificaciones() {
        return domNotificaciones;
    }

    public void setDomNotificaciones(int domNotificaciones) {
        this.domNotificaciones = domNotificaciones;
    }

    @Override
    public int hashCode() {
        int hash = 5;
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
        final Empresa other = (Empresa) obj;
        if (this.domSocial != other.domSocial) {
            return false;
        }
        if (this.domFiscal != other.domFiscal) {
            return false;
        }
        if (this.domNotificaciones != other.domNotificaciones) {
            return false;
        }
        if (!Objects.equals(this.nombreEmpresa, other.nombreEmpresa)) {
            return false;
        }
        if (!Objects.equals(this.cif, other.cif)) {
            return false;
        }
        if (!Objects.equals(this.dni, other.dni)) {
            return false;
        }
        if (!Objects.equals(this.apellido1, other.apellido1)) {
            return false;
        }
        if (!Objects.equals(this.apellido2, other.apellido2)) {
            return false;
        }
        if (!Objects.equals(this.nombre, other.nombre)) {
            return false;
        }
        if (!Objects.equals(this.razonSocial, other.razonSocial)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Empresa{" + "nombreEmpresa=" + nombreEmpresa + ", cif=" + cif + ", dni=" + dni + ", apellido1=" + apellido1 + ", apellido2=" + apellido2 + ", nombre=" + nombre + ", razonSocial=" + razonSocial + ", domSocial=" + domSocial + ", domFiscal=" + domFiscal + ", domNotificaciones=" + domNotificaciones + '}';
    }
    
    
}
