/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.paquete.docenciaservicio;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
@Table(name = "cuestionario", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cuestionario.findAll", query = "SELECT c FROM Cuestionario c"),
    @NamedQuery(name = "Cuestionario.findByIdCuestionario", query = "SELECT c FROM Cuestionario c WHERE c.idCuestionario = :idCuestionario"),
    @NamedQuery(name = "Cuestionario.findByNombre", query = "SELECT c FROM Cuestionario c WHERE c.nombre = :nombre")})
public class Cuestionario implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idCuestionario")
    private Integer idCuestionario;
    @Size(max = 255)
    @Column(name = "nombre")
    private String nombre;
    @JoinTable(name = "cuestionario_has_pregunta", joinColumns = {
        @JoinColumn(name = "Cuestionario_idCuestionario", referencedColumnName = "idCuestionario")}, inverseJoinColumns = {
        @JoinColumn(name = "Pregunta_idPregunta", referencedColumnName = "idPregunta")})
    @ManyToMany
    private List<Pregunta> preguntaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cuestionarioidCuestionario")
    private List<Resultados> resultadosList;

    public Cuestionario() {
    }

    public Cuestionario(Integer idCuestionario) {
        this.idCuestionario = idCuestionario;
    }

    public Integer getIdCuestionario() {
        return idCuestionario;
    }

    public void setIdCuestionario(Integer idCuestionario) {
        this.idCuestionario = idCuestionario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @XmlTransient
    public List<Pregunta> getPreguntaList() {
        return preguntaList;
    }

    public void setPreguntaList(List<Pregunta> preguntaList) {
        this.preguntaList = preguntaList;
    }

    @XmlTransient
    public List<Resultados> getResultadosList() {
        return resultadosList;
    }

    public void setResultadosList(List<Resultados> resultadosList) {
        this.resultadosList = resultadosList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCuestionario != null ? idCuestionario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cuestionario)) {
            return false;
        }
        Cuestionario other = (Cuestionario) object;
        if ((this.idCuestionario == null && other.idCuestionario != null) || (this.idCuestionario != null && !this.idCuestionario.equals(other.idCuestionario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.paquete.docenciaservicio.Cuestionario[ idCuestionario=" + idCuestionario + " ]";
    }
    
}
