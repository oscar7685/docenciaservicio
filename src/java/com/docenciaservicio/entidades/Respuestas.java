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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ususario
 */
@Entity
@Table(name = "respuestas", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Respuestas.findAll", query = "SELECT r FROM Respuestas r"),
    @NamedQuery(name = "Respuestas.findByIdrespuestas", query = "SELECT r FROM Respuestas r WHERE r.idrespuestas = :idrespuestas"),
    @NamedQuery(name = "Respuestas.findResultadosxPreguntaxEncuestaxProceso", query = "SELECT r FROM Respuestas r WHERE r.preguntaidPregunta=:pregunta and r.encabezadoidEncabezado.cuestionarioidCuestionario=:cuestionario and r.encabezadoidEncabezado.procesoIdproceso=:proceso and (r.respuesta='5' or r.respuesta='4' or r.respuesta='3' or r.respuesta='2' or r.respuesta='1')"),
    @NamedQuery(name = "Respuestas.findByRespuesta", query = "SELECT r FROM Respuestas r WHERE r.respuesta = :respuesta")})
public class Respuestas implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idrespuestas")
    private Integer idrespuestas;
    @Column(name = "respuesta")
    private Integer respuesta;
    @JoinColumn(name = "encabezado_idEncabezado", referencedColumnName = "idEncabezado")
    @ManyToOne(optional = false)
    private Encabezado encabezadoidEncabezado;
    @JoinColumn(name = "Pregunta_idPregunta", referencedColumnName = "idPregunta")
    @ManyToOne(optional = false)
    private Pregunta preguntaidPregunta;

    public Respuestas() {
    }

    public Respuestas(Integer idrespuestas) {
        this.idrespuestas = idrespuestas;
    }

    public Integer getIdrespuestas() {
        return idrespuestas;
    }

    public void setIdrespuestas(Integer idrespuestas) {
        this.idrespuestas = idrespuestas;
    }

    public Integer getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Integer respuesta) {
        this.respuesta = respuesta;
    }

    public Encabezado getEncabezadoidEncabezado() {
        return encabezadoidEncabezado;
    }

    public void setEncabezadoidEncabezado(Encabezado encabezadoidEncabezado) {
        this.encabezadoidEncabezado = encabezadoidEncabezado;
    }

    public Pregunta getPreguntaidPregunta() {
        return preguntaidPregunta;
    }

    public void setPreguntaidPregunta(Pregunta preguntaidPregunta) {
        this.preguntaidPregunta = preguntaidPregunta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idrespuestas != null ? idrespuestas.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Respuestas)) {
            return false;
        }
        Respuestas other = (Respuestas) object;
        if ((this.idrespuestas == null && other.idrespuestas != null) || (this.idrespuestas != null && !this.idrespuestas.equals(other.idrespuestas))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.docenciaservicio.entidades.Respuestas[ idrespuestas=" + idrespuestas + " ]";
    }
    
}
