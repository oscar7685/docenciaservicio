<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
        <c:choose>
            <c:when test="${fn:length(listaEstudiantes)!= 0}">
                <c:forEach items="${listaEstudiantes}" var="estudiante" varStatus="iter">
                    <tr class="odd gradeX">
                        <td>${estudiante.fuenteidUsuario.idUsuario}</td>
                        <td>${estudiante.idEstudiante}</td>
                        <td>${estudiante.fuenteidUsuario.nombre}</td>
                        <td>${estudiante.fuenteidUsuario.apellido}</td>
                        <td>${estudiante.programaIdprograma.nombrepro}</td>
                        <td>${estudiante.semestre}</td>
                        <td> <a href="#" class="btn btn-xs btn-default todo-options"><i class="fa fa-pencil"></i></a></td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>           
   

