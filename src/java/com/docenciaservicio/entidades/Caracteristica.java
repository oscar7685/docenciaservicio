/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.entidades;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
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
@Cacheable
@Entity
@Table(name = "caracteristica", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Caracteristica.findAll", query = "SELECT c FROM Caracteristica c"),
    @NamedQuery(name = "Caracteristica.findByIdCaracteristica", query = "SELECT c FROM Caracteristica c WHERE c.idCaracteristica = :idCaracteristica"),
    @NamedQuery(name = "Caracteristica.findByNombreC", query = "SELECT c FROM Caracteristica c WHERE c.nombreC = :nombreC")})
public class Caracteristica implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "idCaracteristica")
    private String idCaracteristica;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "nombreC")
    private String nombreC;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "caracteristicaidCaracteristica")
    private List<Criterio> criterioList;
    @JoinColumn(name = "Factor_idFactor", referencedColumnName = "idFactor")
    @ManyToOne(optional = false)
    private Factor factoridFactor;

    public Caracteristica() {
    }

    public Caracteristica(String idCaracteristica) {
        this.idCaracteristica = idCaracteristica;
    }

    public Caracteristica(String idCaracteristica, String nombreC) {
        this.idCaracteristica = idCaracteristica;
        this.nombreC = nombreC;
    }

    public String getIdCaracteristica() {
        return idCaracteristica;
    }

    public void setIdCaracteristica(String idCaracteristica) {
        this.idCaracteristica = idCaracteristica;
    }

    public String getNombreC() {
        return nombreC;
    }

    public void setNombreC(String nombreC) {
        this.nombreC = nombreC;
    }

    @XmlTransient
    public List<Criterio> getCriterioList() {
        return criterioList;
    }

    public void setCriterioList(List<Criterio> criterioList) {
        this.criterioList = criterioList;
    }

    public Factor getFactoridFactor() {
        return factoridFactor;
    }

    public void setFactoridFactor(Factor factoridFactor) {
        this.factoridFactor = factoridFactor;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCaracteristica != null ? idCaracteristica.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Caracteristica)) {
            return false;
        }
        Caracteristica other = (Caracteristica) object;
        if ((this.idCaracteristica == null && other.idCaracteristica != null) || (this.idCaracteristica != null && !this.idCaracteristica.equals(other.idCaracteristica))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.docenciaservicio.entidades.Caracteristica[ idCaracteristica=" + idCaracteristica + " ]";
    }
    
}
