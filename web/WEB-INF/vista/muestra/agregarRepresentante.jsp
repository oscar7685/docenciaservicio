<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<table id="tabladocente" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Identificación</th>
            <th>Nombre</th>
            <th>Apellidos</th>
            <th>Cargo</th>
            <th>acci&oacute;n</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${fn:length(listaRepresentantes)!= 0}">
                <c:forEach items="${listaRepresentantes}" var="representante" varStatus="iter">
                    <tr class="odd gradeX">
                        <td>${representante.fuenteidUsuario.idUsuario}</td>
                        <td>${representante.fuenteidUsuario.nombre}</td>
                        <td>${representante.fuenteidUsuario.apellido}</td>
                        <td>${representante.cargo}</td>
                        <td> <a href="#" class="btn btn-xs btn-default todo-options"><i class="fa fa-pencil"></i></a></td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>           
    </tbody>
</table>
