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
 * @author Usuario
 */
@Entity
@Table(name = "docente", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Docente.findAll", query = "SELECT d FROM Docente d"),
    @NamedQuery(name = "Docente.findByDocenteid", query = "SELECT d FROM Docente d WHERE d.docenteid = :docenteid")})
public class Docente implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "docenteid")
    private Integer docenteid;
    @JoinColumn(name = "fuente_idUsuario", referencedColumnName = "idUsuario")
    @ManyToOne(optional = false)
    private Fuente fuenteidUsuario;
    @JoinColumn(name = "programa_idprograma", referencedColumnName = "idprograma")
    @ManyToOne(optional = false)
    private Programa programaIdprograma;

    public Docente() {
    }

    public Docente(Integer docenteid) {
        this.docenteid = docenteid;
    }

    public Integer getDocenteid() {
        return docenteid;
    }

    public void setDocenteid(Integer docenteid) {
        this.docenteid = docenteid;
    }

    public Fuente getFuenteidUsuario() {
        return fuenteidUsuario;
    }

    public void setFuenteidUsuario(Fuente fuenteidUsuario) {
        this.fuenteidUsuario = fuenteidUsuario;
    }

    public Programa getProgramaIdprograma() {
        return programaIdprograma;
    }

    public void setProgramaIdprograma(Programa programaIdprograma) {
        this.programaIdprograma = programaIdprograma;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (docenteid != null ? docenteid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Docente)) {
            return false;
        }
        Docente other = (Docente) object;
        if ((this.docenteid == null && other.docenteid != null) || (this.docenteid != null && !this.docenteid.equals(other.docenteid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.paquete.docenciaservicio.Docente[ docenteid=" + docenteid + " ]";
    }
    
}
