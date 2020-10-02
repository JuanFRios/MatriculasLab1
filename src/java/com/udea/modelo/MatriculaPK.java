/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udea.modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author juan
 */
@Embeddable
public class MatriculaPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "idEstudiante")
    private int idEstudiante;
    @Basic(optional = false)
    @NotNull
    @Column(name = "codigoMateria")
    private int codigoMateria;

    public MatriculaPK() {
    }

    public MatriculaPK(int idEstudiante, int codigoMateria) {
        this.idEstudiante = idEstudiante;
        this.codigoMateria = codigoMateria;
    }

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public int getCodigoMateria() {
        return codigoMateria;
    }

    public void setCodigoMateria(int codigoMateria) {
        this.codigoMateria = codigoMateria;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idEstudiante;
        hash += (int) codigoMateria;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MatriculaPK)) {
            return false;
        }
        MatriculaPK other = (MatriculaPK) object;
        if (this.idEstudiante != other.idEstudiante) {
            return false;
        }
        if (this.codigoMateria != other.codigoMateria) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.udea.modelo.MatriculaPK[ idEstudiante=" + idEstudiante + ", codigoMateria=" + codigoMateria + " ]";
    }
    
}
