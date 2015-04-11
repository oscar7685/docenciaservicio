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
@Table(name = "factor", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Factor.findAll", query = "SELECT f FROM Factor f"),
    @NamedQuery(name = "Factor.findByIdFactor", query = "SELECT f FROM Factor f WHERE f.idFactor = :idFactor"),
    @NamedQuery(name = "Factor.findByNombreF", query = "SELECT f FROM Factor f WHERE f.nombreF = :nombreF")})
public class Factor implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "idFactor")
    private String idFactor;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "nombreF")
    private String nombreF;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "factoridFactor")
    private List<Caracteristica> caracteristicaList;

    public Factor() {
    }

    public Factor(String idFactor) {
        this.idFactor = idFactor;
    }

    public Factor(String idFactor, String nombreF) {
        this.idFactor = idFactor;
        this.nombreF = nombreF;
    }

    public String getIdFactor() {
        return idFactor;
    }

    public void setIdFactor(String idFactor) {
        this.idFactor = idFactor;
    }

    public String getNombreF() {
        return nombreF;
    }

    public void setNombreF(String nombreF) {
        this.nombreF = nombreF;
    }

    @XmlTransient
    public List<Caracteristica> getCaracteristicaList() {
        return caracteristicaList;
    }

    public void setCaracteristicaList(List<Caracteristica> caracteristicaList) {
        this.caracteristicaList = caracteristicaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idFactor != null ? idFactor.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Factor)) {
            return false;
        }
        Factor other = (Factor) object;
        if ((this.idFactor == null && other.idFactor != null) || (this.idFactor != null && !this.idFactor.equals(other.idFactor))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.paquete.docenciaservicio.Factor[ idFactor=" + idFactor + " ]";
    }
    
}
