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
import javax.persistence.ManyToMany;
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
 * @author Oscar
 */
@Entity
@Table(name = "pregunta", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pregunta.findAll", query = "SELECT p FROM Pregunta p"),
    @NamedQuery(name = "Pregunta.findByIdPregunta", query = "SELECT p FROM Pregunta p WHERE p.idPregunta = :idPregunta"),
    @NamedQuery(name = "Pregunta.findByTipo", query = "SELECT p FROM Pregunta p WHERE p.tipo = :tipo"),
    @NamedQuery(name = "Pregunta.findByEnunciado", query = "SELECT p FROM Pregunta p WHERE p.enunciado = :enunciado"),
    @NamedQuery(name = "Pregunta.findByOtro", query = "SELECT p FROM Pregunta p WHERE p.otro = :otro")})
public class Pregunta implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "idPregunta")
    private String idPregunta;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "tipo")
    private String tipo;
    @Size(max = 500)
    @Column(name = "enunciado")
    private String enunciado;
    @Size(max = 45)
    @Column(name = "otro")
    private String otro;
    @ManyToMany(mappedBy = "preguntaList")
    private List<Cuestionario> cuestionarioList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "preguntaidPregunta")
    private List<Resultados> resultadosList;
    @JoinColumn(name = "Criterio_idCriterio", referencedColumnName = "idCriterio")
    @ManyToOne
    private Criterio criterioidCriterio;

    public Pregunta() {
    }

    public Pregunta(String idPregunta) {
        this.idPregunta = idPregunta;
    }

    public Pregunta(String idPregunta, String tipo) {
        this.idPregunta = idPregunta;
        this.tipo = tipo;
    }

    public String getIdPregunta() {
        return idPregunta;
    }

    public void setIdPregunta(String idPregunta) {
        this.idPregunta = idPregunta;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getEnunciado() {
        return enunciado;
    }

    public void setEnunciado(String enunciado) {
        this.enunciado = enunciado;
    }

    public String getOtro() {
        return otro;
    }

    public void setOtro(String otro) {
        this.otro = otro;
    }

    @XmlTransient
    public List<Cuestionario> getCuestionarioList() {
        return cuestionarioList;
    }

    public void setCuestionarioList(List<Cuestionario> cuestionarioList) {
        this.cuestionarioList = cuestionarioList;
    }

    @XmlTransient
    public List<Resultados> getResultadosList() {
        return resultadosList;
    }

    public void setResultadosList(List<Resultados> resultadosList) {
        this.resultadosList = resultadosList;
    }

    public Criterio getCriterioidCriterio() {
        return criterioidCriterio;
    }

    public void setCriterioidCriterio(Criterio criterioidCriterio) {
        this.criterioidCriterio = criterioidCriterio;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPregunta != null ? idPregunta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pregunta)) {
            return false;
        }
        Pregunta other = (Pregunta) object;
        if ((this.idPregunta == null && other.idPregunta != null) || (this.idPregunta != null && !this.idPregunta.equals(other.idPregunta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.paquete.docenciaservicio.Pregunta[ idPregunta=" + idPregunta + " ]";
    }
    
}
