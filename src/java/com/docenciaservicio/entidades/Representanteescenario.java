/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Usuario
 */
@Entity
@Table(name = "representanteescenario", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Representanteescenario.findAll", query = "SELECT r FROM Representanteescenario r"),
    @NamedQuery(name = "Representanteescenario.findByIdRepresentanteEscenario", query = "SELECT r FROM Representanteescenario r WHERE r.idRepresentanteEscenario = :idRepresentanteEscenario"),
    @NamedQuery(name = "Representanteescenario.findByCargo", query = "SELECT r FROM Representanteescenario r WHERE r.cargo = :cargo")})
public class Representanteescenario implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idRepresentanteEscenario")
    private Integer idRepresentanteEscenario;
    @Size(max = 255)
    @Column(name = "cargo")
    private String cargo;
    @JoinColumn(name = "fuente_idUsuario", referencedColumnName = "idUsuario")
    @ManyToOne(optional = false)
    private Fuente fuenteidUsuario;
    @JoinColumn(name = "Escenario_idEscenario", referencedColumnName = "idEscenario")
    @ManyToOne(optional = false)
    private Escenario escenarioidEscenario;

    public Representanteescenario() {
    }

    public Representanteescenario(Integer idRepresentanteEscenario) {
        this.idRepresentanteEscenario = idRepresentanteEscenario;
    }

    public Integer getIdRepresentanteEscenario() {
        return idRepresentanteEscenario;
    }

    public void setIdRepresentanteEscenario(Integer idRepresentanteEscenario) {
        this.idRepresentanteEscenario = idRepresentanteEscenario;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public Fuente getFuenteidUsuario() {
        return fuenteidUsuario;
    }

    public void setFuenteidUsuario(Fuente fuenteidUsuario) {
        this.fuenteidUsuario = fuenteidUsuario;
    }

    public Escenario getEscenarioidEscenario() {
        return escenarioidEscenario;
    }

    public void setEscenarioidEscenario(Escenario escenarioidEscenario) {
        this.escenarioidEscenario = escenarioidEscenario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idRepresentanteEscenario != null ? idRepresentanteEscenario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Representanteescenario)) {
            return false;
        }
        Representanteescenario other = (Representanteescenario) object;
        if ((this.idRepresentanteEscenario == null && other.idRepresentanteEscenario != null) || (this.idRepresentanteEscenario != null && !this.idRepresentanteEscenario.equals(other.idRepresentanteEscenario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.docenciaservicio.entidades.Representanteescenario[ idRepresentanteEscenario=" + idRepresentanteEscenario + " ]";
    }
    
}
