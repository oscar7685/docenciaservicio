<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="row" style="background-color: #fff;">
    <div class="col-md-offset-2 col-md-8">
        <br/>
        <br/>
        <h1>Listado de  Encuestas Disponibles</h1>
        <c:choose>
            <c:when test="${estudiantesConEncuesta!=null && fn:length(estudiantesConEncuesta)!= 0}">
                <table class="table table-striped table-bordered table-condensed">
                    <thead>
                    <th>Encuesta</th>
                    <th>Escenario</th>
                    <th></th>
                    </thead>
                    <tbody>
                        <c:forEach items="${estudiantesConEncuesta}" var="estudiante" varStatus="iter">
                            <tr>    
                                <td>   
                                    <c:out value="${cuestionarioEstudiantes.nombre}"/>
                                </td>
                                <td>
                                    <c:out value="${estudiante.procesoIdproceso.escenarioidEscenario.nombre}"/>
                                </td>
                                <td> 
                                    <a title="Responder Encuesta" href="#responderEncuesta&cuestionario=${cuestionarioEstudiantes.idCuestionario}&proceso=${estudiante.getProcesoIdproceso().idproceso}">Responder encuesta </a>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
                <br/>            
                <h5 style="text-align: center;">Usted ha sido seleccionado al azar para diligenciar una sencilla encuesta de caracter an&oacute;nimo y voluntario, Recuerde que su participaci&oacute;n es fundamental en el proceso de autoevaluaci&oacute;n de los anteriores escenarios</h5>
            </c:when>
        </c:choose>

        <c:choose>
            <c:when test="${docentesConEncuesta!=null && fn:length(docentesConEncuesta)!= 0}">
                <table class="table table-striped table-bordered table-condensed">
                    <thead>
                    <th>Encuesta</th>
                    <th>Escenario</th>
                    <th></th>
                    </thead>
                    <tbody>
                        <c:forEach items="${docentesConEncuesta}" var="docente" varStatus="iter">
                            <tr>    
                                <td>   
                                    <c:out value="${cuestionarioDocentes.nombre}"/>
                                </td>
                                <td>
                                    <c:out value="${docente.procesoIdproceso.escenarioidEscenario.nombre}"/>
                                </td>
                                <td> 
                                    <a title="Responder Encuesta" href="#responderEncuesta&cuestionario=${cuestionarioDocentes.idCuestionario}&proceso=${docente.getProcesoIdproceso().idproceso}">Responder encuesta </a>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
                <br/>            
                <h5 style="text-align: center;">Usted ha sido seleccionado al azar para diligenciar una sencilla encuesta de caracter an&oacute;nimo y voluntario, Recuerde que su participaci&oacute;n es fundamental en el proceso de autoevaluaci&oacute;n de los anteriores escenarios</h5>
            </c:when>
        </c:choose>

        <c:choose>
            <c:when test="${representantesConEncuesta!=null && fn:length(representantesConEncuesta)!= 0}">
                <table class="table table-striped table-bordered table-condensed">
                    <thead>
                    <th>Encuesta</th>
                    <th>Escenario</th>
                    <th></th>
                    </thead>
                    <tbody>
                        <c:forEach items="${representantesConEncuesta}" var="representante" varStatus="iter">
                            <tr>    
                                <td>   
                                    <c:out value="${cuestionarioRepresentantes.nombre}"/>
                                </td>
                                <td>
                                    <c:out value="${representante.procesoIdproceso.escenarioidEscenario.nombre}"/>
                                </td>
                                <td> 
                                    <a title="Responder Encuesta" href="#responderEncuesta&cuestionario=${cuestionarioRepresentantes.idCuestionario}&proceso=${representante.getProcesoIdproceso().idproceso}">Responder encuesta </a>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
                <br/>            
                <h5 style="text-align: center;">Usted ha sido seleccionado al azar para diligenciar una sencilla encuesta de caracter an&oacute;nimo y voluntario, Recuerde que su participaci&oacute;n es fundamental en el proceso de autoevaluaci&oacute;n de los anteriores escenarios</h5>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${(estudiantesConEncuesta==null || fn:length(estudiantesConEncuesta)== 0) 
                            && (docentesConEncuesta==null || fn:length(docentesConEncuesta)== 0)
                            && (representantesConEncuesta==null || fn:length(representantesConEncuesta)== 0)   }">
                    No Existen Encuestas Disponibles.


            </c:when>
        </c:choose>
    </div>
</div>

