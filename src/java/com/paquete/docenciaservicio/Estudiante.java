/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.paquete.docenciaservicio;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Oscar
 */
@Entity
@Table(name = "estudiante", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Estudiante.findAll", query = "SELECT e FROM Estudiante e"),
    @NamedQuery(name = "Estudiante.findByIdEstudiante", query = "SELECT e FROM Estudiante e WHERE e.idEstudiante = :idEstudiante"),
    @NamedQuery(name = "Estudiante.findBySemestre", query = "SELECT e FROM Estudiante e WHERE e.semestre = :semestre")})
public class Estudiante implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idEstudiante")
    private Integer idEstudiante;
    @Size(max = 45)
    @Column(name = "semestre")
    private String semestre;
    @JoinTable(name = "estudiante_has_proceso", joinColumns = {
        @JoinColumn(name = "Estudiante_idEstudiante", referencedColumnName = "idEstudiante")}, inverseJoinColumns = {
        @JoinColumn(name = "proceso_idproceso", referencedColumnName = "idproceso")})
    @ManyToMany
    private List<Proceso> procesoList;
    @JoinColumn(name = "programa_idprograma", referencedColumnName = "idprograma")
    @ManyToOne(optional = false)
    private Programa programaIdprograma;
    @JoinColumn(name = "Usuario_idUsuario", referencedColumnName = "idUsuario")
    @ManyToOne(optional = false)
    private Fuente usuarioidUsuario;

    public Estudiante() {
    }

    public Estudiante(Integer idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public Integer getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(Integer idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public String getSemestre() {
        return semestre;
    }

    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }

    @XmlTransient
    public List<Proceso> getProcesoList() {
        return procesoList;
    }

    public void setProcesoList(List<Proceso> procesoList) {
        this.procesoList = procesoList;
    }

    public Programa getProgramaIdprograma() {
        return programaIdprograma;
    }

    public void setProgramaIdprograma(Programa programaIdprograma) {
        this.programaIdprograma = programaIdprograma;
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
        hash += (idEstudiante != null ? idEstudiante.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Estudiante)) {
            return false;
        }
        Estudiante other = (Estudiante) object;
        if ((this.idEstudiante == null && other.idEstudiante != null) || (this.idEstudiante != null && !this.idEstudiante.equals(other.idEstudiante))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.paquete.docenciaservicio.Estudiante[ idEstudiante=" + idEstudiante + " ]";
    }
    
}
