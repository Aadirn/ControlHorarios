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
public class Empleado {
    
    //private int codEmpleado;
    private String dni;
    private String nombre;
    private String apellido1;
    private String apellido2;
    private String naf;
    private String email;
    private long telefono;
    private int tipoContrato;
    
    

    public Empleado( String nombre, String apellido1, String apellido2, String dni,String naf, String email, long telefono, int tipoContrato) {
        
        this.dni = dni;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.naf = naf;
        this.email = email;
        this.telefono = telefono;
        this.tipoContrato = tipoContrato;
    }

    public Empleado() {
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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

    public String getNaf() {
        return naf;
    }

    public void setNaf(String naf) {
        this.naf = naf;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public long getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public int getTipoContrato() {
        return tipoContrato;
    }

    public void setTipoContrato(int tipoContrato) {
        this.tipoContrato = tipoContrato;
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
        final Empleado other = (Empleado) obj;
        if (this.telefono != other.telefono) {
            return false;
        }
        if (this.tipoContrato != other.tipoContrato) {
            return false;
        }
        if (!Objects.equals(this.dni, other.dni)) {
            return false;
        }
        if (!Objects.equals(this.nombre, other.nombre)) {
            return false;
        }
        if (!Objects.equals(this.apellido1, other.apellido1)) {
            return false;
        }
        if (!Objects.equals(this.apellido2, other.apellido2)) {
            return false;
        }
        if (!Objects.equals(this.naf, other.naf)) {
            return false;
        }
        return Objects.equals(this.email, other.email);
    }

    @Override
    public String toString() {
        return nombre+", "+apellido1+", "+apellido2+", "+dni+", "+naf+", "+email+", "+telefono+", "+tipoContrato;
    } //TODO: Dependiendo de la necesidad que haya en el programa modificar el toString
    
    public String[] toArray(){
        String[] array={this.nombre,this.apellido1,this.apellido2,this.dni,this.naf,this.email,String.valueOf(this.telefono),String.valueOf(this.tipoContrato)};
        return array;
    }
    
}

