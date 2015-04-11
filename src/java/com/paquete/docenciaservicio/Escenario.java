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
@Table(name = "escenario", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Escenario.findAll", query = "SELECT e FROM Escenario e"),
    @NamedQuery(name = "Escenario.findByIdEscenario", query = "SELECT e FROM Escenario e WHERE e.idEscenario = :idEscenario"),
    @NamedQuery(name = "Escenario.findByNombre", query = "SELECT e FROM Escenario e WHERE e.nombre = :nombre"),
    @NamedQuery(name = "Escenario.findByDireccion", query = "SELECT e FROM Escenario e WHERE e.direccion = :direccion"),
    @NamedQuery(name = "Escenario.findByTelefono", query = "SELECT e FROM Escenario e WHERE e.telefono = :telefono"),
    @NamedQuery(name = "Escenario.findByNit", query = "SELECT e FROM Escenario e WHERE e.nit = :nit")})
public class Escenario implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idEscenario")
    private Integer idEscenario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre")
    private String nombre;
    @Size(max = 500)
    @Column(name = "direccion")
    private String direccion;
    @Size(max = 45)
    @Column(name = "telefono")
    private String telefono;
    @Size(max = 45)
    @Column(name = "nit")
    private String nit;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "escenarioidEscenario")
    private List<Proceso> procesoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "escenarioidEscenario")
    private List<Representanteescenario> representanteescenarioList;

    public Escenario() {
    }

    public Escenario(Integer idEscenario) {
        this.idEscenario = idEscenario;
    }

    public Escenario(Integer idEscenario, String nombre) {
        this.idEscenario = idEscenario;
        this.nombre = nombre;
    }

    public Integer getIdEscenario() {
        return idEscenario;
    }

    public void setIdEscenario(Integer idEscenario) {
        this.idEscenario = idEscenario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    @XmlTransient
    public List<Proceso> getProcesoList() {
        return procesoList;
    }

    public void setProcesoList(List<Proceso> procesoList) {
        this.procesoList = procesoList;
    }

    @XmlTransient
    public List<Representanteescenario> getRepresentanteescenarioList() {
        return representanteescenarioList;
    }

    public void setRepresentanteescenarioList(List<Representanteescenario> representanteescenarioList) {
        this.representanteescenarioList = representanteescenarioList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEscenario != null ? idEscenario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Escenario)) {
            return false;
        }
        Escenario other = (Escenario) object;
        if ((this.idEscenario == null && other.idEscenario != null) || (this.idEscenario != null && !this.idEscenario.equals(other.idEscenario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.paquete.docenciaservicio.Escenario[ idEscenario=" + idEscenario + " ]";
    }
    
}
