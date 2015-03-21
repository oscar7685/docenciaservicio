/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.paquete.docenciaservicio;

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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Oscar
 */
@Entity
@Table(name = "representanteescenario", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Representanteescenario.findAll", query = "SELECT r FROM Representanteescenario r"),
    @NamedQuery(name = "Representanteescenario.findByIdRepresentanteEscenario", query = "SELECT r FROM Representanteescenario r WHERE r.idRepresentanteEscenario = :idRepresentanteEscenario")})
public class Representanteescenario implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idRepresentanteEscenario")
    private Integer idRepresentanteEscenario;
    @JoinColumn(name = "Escenario_idEscenario", referencedColumnName = "idEscenario")
    @ManyToOne(optional = false)
    private Escenario escenarioidEscenario;
    @JoinColumn(name = "Usuario_idUsuario", referencedColumnName = "idUsuario")
    @ManyToOne(optional = false)
    private Fuente usuarioidUsuario;

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

    public Escenario getEscenarioidEscenario() {
        return escenarioidEscenario;
    }

    public void setEscenarioidEscenario(Escenario escenarioidEscenario) {
        this.escenarioidEscenario = escenarioidEscenario;
    }

    public Fuente getUsuarioidUsuario() {
        return usuarioidUsuario;
    }

    public void setUsuarioidUsuario(Fuente usuarioidUsuario) {
        this.usuarioidUsuario = usuarioidUsuario;
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
        return "com.paquete.docenciaservicio.Representanteescenario[ idRepresentanteEscenario=" + idRepresentanteEscenario + " ]";
    }
    
}
