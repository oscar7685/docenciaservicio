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
 * @author Ususario
 */
@Entity
@Table(name = "encabezado", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Encabezado.findAll", query = "SELECT e FROM Encabezado e"),
    @NamedQuery(name = "Encabezado.findByIdEncabezado", query = "SELECT e FROM Encabezado e WHERE e.idEncabezado = :idEncabezado"),
    @NamedQuery(name = "Encabezado.findByEstado", query = "SELECT e FROM Encabezado e WHERE e.estado = :estado"),
    @NamedQuery(name = "Encabezado.findByFecha", query = "SELECT e FROM Encabezado e WHERE e.fecha = :fecha"),
    @NamedQuery(name = "Encabezado.findByDebilidades", query = "SELECT e FROM Encabezado e WHERE e.debilidades = :debilidades"),
    @NamedQuery(name = "Encabezado.findByFortalezas", query = "SELECT e FROM Encabezado e WHERE e.fortalezas = :fortalezas"),
    @NamedQuery(name = "Encabezado.findByRecomendaciones", query = "SELECT e FROM Encabezado e WHERE e.recomendaciones = :recomendaciones")})
public class Encabezado implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idEncabezado")
    private Integer idEncabezado;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "estado")
    private String estado;
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Size(max = 2000)
    @Column(name = "debilidades")
    private String debilidades;
    @Size(max = 2000)
    @Column(name = "fortalezas")
    private String fortalezas;
    @Size(max = 2000)
    @Column(name = "recomendaciones")
    private String recomendaciones;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "encabezadoidEncabezado")
    private List<Respuestas> respuestasList;
    @JoinColumn(name = "fuente_idUsuario", referencedColumnName = "idUsuario")
    @ManyToOne(optional = false)
    private Fuente fuenteidUsuario;
    @JoinColumn(name = "proceso_idproceso", referencedColumnName = "idproceso")
    @ManyToOne(optional = false)
    private Proceso procesoIdproceso;
    @JoinColumn(name = "Cuestionario_idCuestionario", referencedColumnName = "idCuestionario")
    @ManyToOne(optional = false)
    private Cuestionario cuestionarioidCuestionario;

    public Encabezado() {
    }

    public Encabezado(Integer idEncabezado) {
        this.idEncabezado = idEncabezado;
    }

    public Encabezado(Integer idEncabezado, String estado) {
        this.idEncabezado = idEncabezado;
        this.estado = estado;
    }

    public Integer getIdEncabezado() {
        return idEncabezado;
    }

    public void setIdEncabezado(Integer idEncabezado) {
        this.idEncabezado = idEncabezado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getDebilidades() {
        return debilidades;
    }

    public void setDebilidades(String debilidades) {
        this.debilidades = debilidades;
    }

    public String getFortalezas() {
        return fortalezas;
    }

    public void setFortalezas(String fortalezas) {
        this.fortalezas = fortalezas;
    }

    public String getRecomendaciones() {
        return recomendaciones;
    }

    public void setRecomendaciones(String recomendaciones) {
        this.recomendaciones = recomendaciones;
    }

    @XmlTransient
    public List<Respuestas> getRespuestasList() {
        return respuestasList;
    }

    public void setRespuestasList(List<Respuestas> respuestasList) {
        this.respuestasList = respuestasList;
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

    public Cuestionario getCuestionarioidCuestionario() {
        return cuestionarioidCuestionario;
    }

    public void setCuestionarioidCuestionario(Cuestionario cuestionarioidCuestionario) {
        this.cuestionarioidCuestionario = cuestionarioidCuestionario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEncabezado != null ? idEncabezado.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Encabezado)) {
            return false;
        }
        Encabezado other = (Encabezado) object;
        if ((this.idEncabezado == null && other.idEncabezado != null) || (this.idEncabezado != null && !this.idEncabezado.equals(other.idEncabezado))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.docenciaservicio.entidades.Encabezado[ idEncabezado=" + idEncabezado + " ]";
    }
    
}
