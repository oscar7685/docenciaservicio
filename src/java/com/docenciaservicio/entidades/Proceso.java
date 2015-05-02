/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.docenciaservicio.entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Usuario
 */
@Entity
@Table(name = "proceso", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Proceso.findAll", query = "SELECT p FROM Proceso p"),
    @NamedQuery(name = "Proceso.findByIdproceso", query = "SELECT p FROM Proceso p WHERE p.idproceso = :idproceso"),
    @NamedQuery(name = "Proceso.findByDescripcionp", query = "SELECT p FROM Proceso p WHERE p.descripcionp = :descripcionp"),
    @NamedQuery(name = "Proceso.findByFechai", query = "SELECT p FROM Proceso p WHERE p.fechai = :fechai"),
    @NamedQuery(name = "Proceso.findByFechaf", query = "SELECT p FROM Proceso p WHERE p.fechaf = :fechaf"),
    @NamedQuery(name = "Proceso.findByEstado", query = "SELECT p FROM Proceso p WHERE p.estado = :estado")})
public class Proceso implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idproceso")
    private Integer idproceso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "descripcionp")
    private String descripcionp;
    @Column(name = "fechai")
    @Temporal(TemporalType.DATE)
    private Date fechai;
    @Column(name = "fechaf")
    @Temporal(TemporalType.DATE)
    private Date fechaf;
    @Size(max = 45)
    @Column(name = "estado")
    private String estado;
    @JoinTable(name = "proceso_has_fuente", joinColumns = {
        @JoinColumn(name = "proceso_idproceso", referencedColumnName = "idproceso")}, inverseJoinColumns = {
        @JoinColumn(name = "fuente_idUsuario", referencedColumnName = "idUsuario")})
    @ManyToMany
    private List<Fuente> fuenteList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "procesoIdproceso")
    private List<Resultados> resultadosList;
    @JoinColumn(name = "Escenario_idEscenario", referencedColumnName = "idEscenario")
    @ManyToOne(optional = false)
    private Escenario escenarioidEscenario;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "procesoIdproceso")
    private List<Estudiante> estudianteList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "procesoIdproceso")
    private List<Docente> docenteList;

    public Proceso() {
    }

    public Proceso(Integer idproceso) {
        this.idproceso = idproceso;
    }

    public Proceso(Integer idproceso, String descripcionp) {
        this.idproceso = idproceso;
        this.descripcionp = descripcionp;
    }

    public Integer getIdproceso() {
        return idproceso;
    }

    public void setIdproceso(Integer idproceso) {
        this.idproceso = idproceso;
    }

    public String getDescripcionp() {
        return descripcionp;
    }

    public void setDescripcionp(String descripcionp) {
        this.descripcionp = descripcionp;
    }

    public Date getFechai() {
        return fechai;
    }

    public void setFechai(Date fechai) {
        this.fechai = fechai;
    }

    public Date getFechaf() {
        return fechaf;
    }

    public void setFechaf(Date fechaf) {
        this.fechaf = fechaf;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @XmlTransient
    public List<Fuente> getFuenteList() {
        return fuenteList;
    }

    public void setFuenteList(List<Fuente> fuenteList) {
        this.fuenteList = fuenteList;
    }

    @XmlTransient
    public List<Resultados> getResultadosList() {
        return resultadosList;
    }

    public void setResultadosList(List<Resultados> resultadosList) {
        this.resultadosList = resultadosList;
    }

    public Escenario getEscenarioidEscenario() {
        return escenarioidEscenario;
    }

    public void setEscenarioidEscenario(Escenario escenarioidEscenario) {
        this.escenarioidEscenario = escenarioidEscenario;
    }

    @XmlTransient
    public List<Estudiante> getEstudianteList() {
        return estudianteList;
    }

    public void setEstudianteList(List<Estudiante> estudianteList) {
        this.estudianteList = estudianteList;
    }

    @XmlTransient
    public List<Docente> getDocenteList() {
        return docenteList;
    }

    public void setDocenteList(List<Docente> docenteList) {
        this.docenteList = docenteList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idproceso != null ? idproceso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Proceso)) {
            return false;
        }
        Proceso other = (Proceso) object;
        if ((this.idproceso == null && other.idproceso != null) || (this.idproceso != null && !this.idproceso.equals(other.idproceso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.docenciaservicio.entidades.Proceso[ idproceso=" + idproceso + " ]";
    }
    
}
