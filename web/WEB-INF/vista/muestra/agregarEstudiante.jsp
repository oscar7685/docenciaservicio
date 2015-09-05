<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:choose>
    <c:when test="${fn:length(listaEstudiantes)!= 0}">
        <c:forEach items="${listaEstudiantes}" var="estudiante" varStatus="iter55">
            <c:set var="varaux" value="0"/>
            <c:forEach items="${encabezadosEstudiantes}" var="item3" >
                <c:if test="${estudiante.fuenteidUsuario.idUsuario == item3.fuenteidUsuario.idUsuario}">
                    <c:set var="varaux" value="1"/>
                    <tr class="terminadoC">
                        <td style="background-color: #DFF0D8; color: #468847;">${estudiante.fuenteidUsuario.idUsuario}</td>
                        <td style="background-color: #DFF0D8; color: #468847;">${estudiante.idEstudiante}</td>
                        <td style="background-color: #DFF0D8; color: #468847;">${estudiante.fuenteidUsuario.nombre}</td>
                        <td style="background-color: #DFF0D8; color: #468847;">${estudiante.fuenteidUsuario.apellido}</td>
                        <td style="background-color: #DFF0D8; color: #468847;">${estudiante.programaIdprograma.nombrepro}</td>
                        <td style="background-color: #DFF0D8; color: #468847;">${estudiante.semestre}</td>
                        <td style="background-color: #DFF0D8; color: #468847;"></td>
                    </tr>
                </c:if>
            </c:forEach>
            <c:if test="${varaux == 0}">
                <tr>
                    <td>${estudiante.fuenteidUsuario.idUsuario}</td>
                    <td>${estudiante.idEstudiante}</td>
                    <td>${estudiante.fuenteidUsuario.nombre}</td>
                    <td>${estudiante.fuenteidUsuario.apellido}</td>
                    <td>${estudiante.programaIdprograma.nombrepro}</td>
                    <td>${estudiante.semestre}</td>
                    <td><button class="btn btn-xs btn-default todo-options eliminarEstudiante" title="Eliminar" data-value="${estudiante.id}"><i class="fa fa-times"></i></button></td>
                </tr>  

            </c:if>
            <c:set var="contador" value="${iter55.index}"></c:set>
        </c:forEach>
    </c:when>
</c:choose>           


