<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<table id="tabladocente" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Identificación</th>
            <th>Nombre</th>
            <th>Apellidos</th>
            <th>Programa</th>
            <th>Tipo contrato</th>
            <th>acci&oacute;n</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${fn:length(listaDocentes)!= 0}">
                <c:forEach items="${listaDocentes}" var="docente" varStatus="iter56">
                    <c:set var="varaux" value="0"/>
                    <c:forEach items="${encabezadosDocentes}" var="item3" >
                        <c:if test="${docente.fuenteidUsuario.idUsuario == item3.fuenteidUsuario.idUsuario}">
                            <c:set var="varaux" value="1"/>
                            <tr class="terminadoC">
                                <td style="background-color: #DFF0D8; color: #468847;">${docente.fuenteidUsuario.idUsuario}</td>
                                <td style="background-color: #DFF0D8; color: #468847;">${docente.fuenteidUsuario.nombre}</td>
                                <td style="background-color: #DFF0D8; color: #468847;">${docente.fuenteidUsuario.apellido}</td>
                                <td style="background-color: #DFF0D8; color: #468847;">${docente.programaIdprograma.nombrepro}</td>
                                <td style="background-color: #DFF0D8; color: #468847;">${docente.tipoContrato}</td>
                                <td style="background-color: #DFF0D8; color: #468847;"></td>
                            </tr>  
                        </c:if>
                    </c:forEach>
                    <c:if test="${varaux == 0}">
                        <tr>
                            <td>${docente.fuenteidUsuario.idUsuario}</td>
                            <td>${docente.fuenteidUsuario.nombre}</td>
                            <td>${docente.fuenteidUsuario.apellido}</td>
                            <td>${docente.programaIdprograma.nombrepro}</td>
                            <td>${docente.tipoContrato}</td>
                            <td><button class="btn btn-xs btn-default todo-options eliminarDocente" title="Eliminar" data-value="${docente.docenteid}"><i class="fa fa-times"></i></button></td>
                        </tr>  
                    </c:if>
                </c:forEach>
            </c:when>
        </c:choose>           
    </tbody>
</table>
