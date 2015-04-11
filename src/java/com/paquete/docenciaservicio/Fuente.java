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
 * @author Usuario
 */
@Entity
@Table(name = "fuente", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Fuente.findAll", query = "SELECT f FROM Fuente f"),
    @NamedQuery(name = "Fuente.findByIdUsuario", query = "SELECT f FROM Fuente f WHERE f.idUsuario = :idUsuario"),
    @NamedQuery(name = "Fuente.findByNombre", query = "SELECT f FROM Fuente f WHERE f.nombre = :nombre"),
    @NamedQuery(name = "Fuente.findByApellido", query = "SELECT f FROM Fuente f WHERE f.apellido = :apellido"),
    @NamedQuery(name = "Fuente.findByTelefono", query = "SELECT f FROM Fuente f WHERE f.telefono = :telefono"),
    @NamedQuery(name = "Fuente.findByPassword", query = "SELECT f FROM Fuente f WHERE f.password = :password"),
    @NamedQuery(name = "Fuente.findByTipo", query = "SELECT f FROM Fuente f WHERE f.tipo = :tipo")})
public class Fuente implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idUsuario")
    private Integer idUsuario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "apellido")
    private String apellido;
    @Size(max = 45)
    @Column(name = "telefono")
    private String telefono;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "password")
    private String password;
    @Size(max = 45)
    @Column(name = "tipo")
    private String tipo;
    @ManyToMany(mappedBy = "fuenteList")
    private List<Proceso> procesoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "usuarioidUsuario")
    private List<Resultados> resultadosList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fuenteidUsuario")
    private List<Estudiante> estudianteList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fuenteidUsuario")
    private List<Representanteescenario> representanteescenarioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fuenteidUsuario")
    private List<Docente> docenteList;

    public Fuente() {
    }

    public Fuente(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Fuente(Integer idUsuario, String nombre, String apellido, String password) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.password = password;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    @XmlTransient
    public List<Proceso> getProcesoList() {
        return procesoList;
    }

    public void setProcesoList(List<Proceso> procesoList) {
        this.procesoList = procesoList;
    }

    @XmlTransient
    public List<Resultados> getResultadosList() {
        return resultadosList;
    }

    public void setResultadosList(List<Resultados> resultadosList) {
        this.resultadosList = resultadosList;
    }

    @XmlTransient
    public List<Estudiante> getEstudianteList() {
        return estudianteList;
    }

    public void setEstudianteList(List<Estudiante> estudianteList) {
        this.estudianteList = estudianteList;
    }

    @XmlTransient
    public List<Representanteescenario> getRepresentanteescenarioList() {
        return representanteescenarioList;
    }

    public void setRepresentanteescenarioList(List<Representanteescenario> representanteescenarioList) {
        this.representanteescenarioList = representanteescenarioList;
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
        hash += (idUsuario != null ? idUsuario.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Fuente)) {
            return false;
        }
        Fuente other = (Fuente) object;
        if ((this.idUsuario == null && other.idUsuario != null) || (this.idUsuario != null && !this.idUsuario.equals(other.idUsuario))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.paquete.docenciaservicio.Fuente[ idUsuario=" + idUsuario + " ]";
    }
    
}
