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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ususario
 */
@Entity
@Table(name = "documental", catalog = "docencia", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Documental.findAll", query = "SELECT d FROM Documental d"),
    @NamedQuery(name = "Documental.findByIddocumental", query = "SELECT d FROM Documental d WHERE d.iddocumental = :iddocumental"),
    @NamedQuery(name = "Documental.findByDocumento", query = "SELECT d FROM Documental d WHERE d.documento = :documento"),
    @NamedQuery(name = "Documental.findByResponsable", query = "SELECT d FROM Documental d WHERE d.responsable = :responsable"),
    @NamedQuery(name = "Documental.findByMedio", query = "SELECT d FROM Documental d WHERE d.medio = :medio"),
    @NamedQuery(name = "Documental.findByLugar", query = "SELECT d FROM Documental d WHERE d.lugar = :lugar"),
    @NamedQuery(name = "Documental.findByEvaluacion", query = "SELECT d FROM Documental d WHERE d.evaluacion = :evaluacion"),
    @NamedQuery(name = "Documental.findByAccion", query = "SELECT d FROM Documental d WHERE d.accion = :accion")})
public class Documental implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "iddocumental")
    private Integer iddocumental;
    @Size(max = 5000)
    @Column(name = "documento")
    private String documento;
    @Size(max = 45)
    @Column(name = "responsable")
    private String responsable;
    @Size(max = 45)
    @Column(name = "medio")
    private String medio;
    @Size(max = 45)
    @Column(name = "lugar")
    private String lugar;
    @Column(name = "evaluacion")
    private Integer evaluacion;
    @Size(max = 45)
    @Column(name = "accion")
    private String accion;
    @JoinColumn(name = "Criterio_idCriterio", referencedColumnName = "idCriterio")
    @ManyToOne(optional = false)
    private Criterio criterioidCriterio;
    @JoinColumn(name = "proceso_idproceso", referencedColumnName = "idproceso")
    @ManyToOne(optional = false)
    private Proceso procesoIdproceso;

    public Documental() {
    }

    public Documental(Integer iddocumental) {
        this.iddocumental = iddocumental;
    }

    public Integer getIddocumental() {
        return iddocumental;
    }

    public void setIddocumental(Integer iddocumental) {
        this.iddocumental = iddocumental;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getResponsable() {
        return responsable;
    }

    public void setResponsable(String responsable) {
        this.responsable = responsable;
    }

    public String getMedio() {
        return medio;
    }

    public void setMedio(String medio) {
        this.medio = medio;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public Integer getEvaluacion() {
        return evaluacion;
    }

    public void setEvaluacion(Integer evaluacion) {
        this.evaluacion = evaluacion;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public Criterio getCriterioidCriterio() {
        return criterioidCriterio;
    }

    public void setCriterioidCriterio(Criterio criterioidCriterio) {
        this.criterioidCriterio = criterioidCriterio;
    }

    public Proceso getProcesoIdproceso() {
        return procesoIdproceso;
    }

    public void setProcesoIdproceso(Proceso procesoIdproceso) {
        this.procesoIdproceso = procesoIdproceso;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddocumental != null ? iddocumental.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Documental)) {
            return false;
        }
        Documental other = (Documental) object;
        if ((this.iddocumental == null && other.iddocumental != null) || (this.iddocumental != null && !this.iddocumental.equals(other.iddocumental))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.docenciaservicio.entidades.Documental[ iddocumental=" + iddocumental + " ]";
    }
    
}
