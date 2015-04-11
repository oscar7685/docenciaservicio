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
import javax.persistence.ManyToOne;
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
 * @author Usuario
 */
@Entity
@Table(name = "criterio", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Criterio.findAll", query = "SELECT c FROM Criterio c"),
    @NamedQuery(name = "Criterio.findByIdCriterio", query = "SELECT c FROM Criterio c WHERE c.idCriterio = :idCriterio"),
    @NamedQuery(name = "Criterio.findByDescripcion", query = "SELECT c FROM Criterio c WHERE c.descripcion = :descripcion")})
public class Criterio implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "idCriterio")
    private String idCriterio;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1000)
    @Column(name = "descripcion")
    private String descripcion;
    @OneToMany(mappedBy = "criterioidCriterio")
    private List<Pregunta> preguntaList;
    @JoinColumn(name = "Caracteristica_idCaracteristica", referencedColumnName = "idCaracteristica")
    @ManyToOne(optional = false)
    private Caracteristica caracteristicaidCaracteristica;

    public Criterio() {
    }

    public Criterio(String idCriterio) {
        this.idCriterio = idCriterio;
    }

    public Criterio(String idCriterio, String descripcion) {
        this.idCriterio = idCriterio;
        this.descripcion = descripcion;
    }

    public String getIdCriterio() {
        return idCriterio;
    }

    public void setIdCriterio(String idCriterio) {
        this.idCriterio = idCriterio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @XmlTransient
    public List<Pregunta> getPreguntaList() {
        return preguntaList;
    }

    public void setPreguntaList(List<Pregunta> preguntaList) {
        this.preguntaList = preguntaList;
    }

    public Caracteristica getCaracteristicaidCaracteristica() {
        return caracteristicaidCaracteristica;
    }

    public void setCaracteristicaidCaracteristica(Caracteristica caracteristicaidCaracteristica) {
        this.caracteristicaidCaracteristica = caracteristicaidCaracteristica;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCriterio != null ? idCriterio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Criterio)) {
            return false;
        }
        Criterio other = (Criterio) object;
        if ((this.idCriterio == null && other.idCriterio != null) || (this.idCriterio != null && !this.idCriterio.equals(other.idCriterio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.paquete.docenciaservicio.Criterio[ idCriterio=" + idCriterio + " ]";
    }
    
}
