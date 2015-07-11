/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "estudiante", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Estudiante.findAll", query = "SELECT e FROM Estudiante e"),
    @NamedQuery(name = "Estudiante.findById", query = "SELECT e FROM Estudiante e WHERE e.id = :id"),
    @NamedQuery(name = "Estudiante.findByIdEstudiante", query = "SELECT e FROM Estudiante e WHERE e.idEstudiante = :idEstudiante"),
    @NamedQuery(name = "Estudiante.findByProceso", query = "SELECT e FROM Estudiante e WHERE e.procesoIdproceso = :parametroProceso"),
    @NamedQuery(name = "Estudiante.findBySemestre", query = "SELECT e FROM Estudiante e WHERE e.semestre = :semestre")})
public class Estudiante implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idEstudiante")
    private int idEstudiante;
    @Size(max = 45)
    @Basic(optional = false)
    @NotNull
    @Column(name = "semestre")
    private String semestre;
    @JoinColumn(name = "fuente_idUsuario", referencedColumnName = "idUsuario")
    @ManyToOne(optional = false)
    private Fuente fuenteidUsuario;
    @JoinColumn(name = "proceso_idproceso", referencedColumnName = "idproceso")
    @ManyToOne(optional = false)
    private Proceso procesoIdproceso;
    @JoinColumn(name = "programa_idprograma", referencedColumnName = "idprograma")
    @ManyToOne(optional = false)
    private Programa programaIdprograma;

    public Estudiante() {
    }

    public Estudiante(Integer id) {
        this.id = id;
    }

    public Estudiante(Integer id, int idEstudiante) {
        this.id = id;
        this.idEstudiante = idEstudiante;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public String getSemestre() {
        return semestre;
    }

    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }

    public Fuente getFuenteidUsuario() {
        return fuenteidUsuario;
    }

    public void setFuenteidUsuario(Fuente fuenteidUsuario) {
        this.fuenteidUsuario = fuenteidUsuario;
    }

    public Proceso getProcesoIdproceso() {
        return procesoIdproceso;
    }

    public void setProcesoIdproceso(Proceso procesoIdproceso) {
        this.procesoIdproceso = procesoIdproceso;
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
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Estudiante)) {
            return false;
        }
        Estudiante other = (Estudiante) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.docenciaservicio.entidades.Estudiante[ id=" + id + " ]";
    }
}
