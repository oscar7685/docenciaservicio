<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<table id="tablarepresentante" class="table table-striped table-bordered" cellspacing="0" width="100%">
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
                <c:forEach items="${listaRepresentantes}" var="representante" varStatus="iter56">
                    <c:set var="varaux" value="0"/>
                    <c:forEach items="${encabezadosRepresentantes}" var="item3" >
                        <c:if test="${representante.fuenteidUsuario.idUsuario == item3.fuenteidUsuario.idUsuario}">
                            <c:set var="varaux" value="1"/>
                            <tr class="terminadoC">
                                <td style="background-color: #DFF0D8; color: #468847;">${representante.fuenteidUsuario.idUsuario}</td>
                                <td style="background-color: #DFF0D8; color: #468847;">${representante.fuenteidUsuario.nombre}</td>
                                <td style="background-color: #DFF0D8; color: #468847;">${representante.fuenteidUsuario.apellido}</td>
                                <td style="background-color: #DFF0D8; color: #468847;">${representante.cargo}</td>
                                <td style="background-color: #DFF0D8; color: #468847;"></td>
                            </tr>  
                        </c:if>
                    </c:forEach>
                    <c:if test="${varaux == 0}">
                        <tr>
                            <td>${representante.fuenteidUsuario.idUsuario}</td>
                            <td>${representante.fuenteidUsuario.nombre}</td>
                            <td>${representante.fuenteidUsuario.apellido}</td>
                            <td>${representante.cargo}</td>
                            <td><button class="btn btn-xs btn-default todo-options eliminarRepresentante" title="Eliminar" data-value="${representante.idRepresentanteEscenario}"><i class="fa fa-times"></i></button></td>
                        </tr>  
                    </c:if>
                </c:forEach>
            </c:when>
        </c:choose>           
    </tbody>
</table>
