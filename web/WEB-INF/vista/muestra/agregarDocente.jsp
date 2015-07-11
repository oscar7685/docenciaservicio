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
                <c:forEach items="${listaDocentes}" var="docente" varStatus="iter">
                    <tr class="odd gradeX">
                        <td>${docente.fuenteidUsuario.idUsuario}</td>
                        <td>${docente.fuenteidUsuario.nombre}</td>
                        <td>${docente.fuenteidUsuario.apellido}</td>
                        <td>${docente.programaIdprograma.nombrepro}</td>
                        <td>${docente.tipoContrato}</td>
                        <td> <a href="#" class="btn btn-xs btn-default todo-options"><i class="fa fa-pencil"></i></a></td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>           
    </tbody>
</table>
<script type="text/javascript">
    $(function() {
        $("#formAsigMue3").validate({
            submitHandler: function() {
                $('#myModalNuevoConglomerado').modal('hide');
                $('#myModalNuevoConglomerado').on('hidden', function() {
                    $("#selectConglomerado option[value='nuevoCriterio']").attr("selected", "selected");
                    $("#enlace").show();
                });
            }
        });
    });
</script>