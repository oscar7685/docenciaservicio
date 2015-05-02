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
@Table(name = "resultados", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Resultados.findAll", query = "SELECT r FROM Resultados r"),
    @NamedQuery(name = "Resultados.findByIdResultados", query = "SELECT r FROM Resultados r WHERE r.idResultados = :idResultados"),
    @NamedQuery(name = "Resultados.findByEstado", query = "SELECT r FROM Resultados r WHERE r.estado = :estado"),
    @NamedQuery(name = "Resultados.findByRespuesta", query = "SELECT r FROM Resultados r WHERE r.respuesta = :respuesta")})
public class Resultados implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idResultados")
    private Integer idResultados;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "estado")
    private String estado;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2000)
    @Column(name = "respuesta")
    private String respuesta;
    @JoinColumn(name = "proceso_idproceso", referencedColumnName = "idproceso")
    @ManyToOne(optional = false)
    private Proceso procesoIdproceso;
    @JoinColumn(name = "Cuestionario_idCuestionario", referencedColumnName = "idCuestionario")
    @ManyToOne(optional = false)
    private Cuestionario cuestionarioidCuestionario;
    @JoinColumn(name = "Pregunta_idPregunta", referencedColumnName = "idPregunta")
    @ManyToOne(optional = false)
    private Pregunta preguntaidPregunta;
    @JoinColumn(name = "Usuario_idUsuario", referencedColumnName = "idUsuario")
    @ManyToOne(optional = false)
    private Fuente usuarioidUsuario;

    public Resultados() {
    }

    public Resultados(Integer idResultados) {
        this.idResultados = idResultados;
    }

    public Resultados(Integer idResultados, String estado, String respuesta) {
        this.idResultados = idResultados;
        this.estado = estado;
        this.respuesta = respuesta;
    }

    public Integer getIdResultados() {
        return idResultados;
    }

    public void setIdResultados(Integer idResultados) {
        this.idResultados = idResultados;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
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

    public Pregunta getPreguntaidPregunta() {
        return preguntaidPregunta;
    }

    public void setPreguntaidPregunta(Pregunta preguntaidPregunta) {
        this.preguntaidPregunta = preguntaidPregunta;
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
        hash += (idResultados != null ? idResultados.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Resultados)) {
            return false;
        }
        Resultados other = (Resultados) object;
        if ((this.idResultados == null && other.idResultados != null) || (this.idResultados != null && !this.idResultados.equals(other.idResultados))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.docenciaservicio.entidades.Resultados[ idResultados=" + idResultados + " ]";
    }
    
}
