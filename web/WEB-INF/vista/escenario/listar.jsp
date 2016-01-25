<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="page-heading">            
    <h1>Escenarios</h1>
</div>
<ol class="breadcrumb">

    <li><a href="#">Escenarios</a></li>
    <li class="active"><a href="#">listar</a></li>

</ol>

<div class="container-fluid">

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2>Escenarios</h2>
                    <div class="panel-ctrls">
                    </div>
                </div>
                <c:choose>
                    <c:when test="${fn:length(escenarios)!= 0}">
                        <div class="panel-body panel-no-padding">
                            <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Id escenario</th>
                                        <th>Nombre</th>
                                        <th>Direcci&oacute;n</th>
                                        <th>Tel&eacute;fono</th>
                                        <th>Nit</th>
                                        <th>Acci&oacute;n</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${escenarios}" var="escenario" varStatus="iter">
                                        <tr class="odd gradeX">
                                            <td>${escenario.idEscenario}</td>
                                            <td>${escenario.nombre}</td>
                                            <td>${escenario.direccion}</td>
                                            <td>${escenario.telefono}</td>
                                            <td>${escenario.nit}</td>
                                            <td> <a href="#editarEscenario&id=${escenario.idEscenario}" class="btn btn-xs btn-default todo-options"><i class="fa fa-pencil"></i></a></td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                            <div class="panel-footer"></div>
                        </div>

                        <!-- Load page level scripts-->
                        <script src="assets/plugins/datatables/jquery.dataTables.js"></script>
                        <script src="assets/plugins/datatables/dataTables.bootstrap.js"></script>
                        <script src="assets/demo/demo-datatables.js"></script>
                        <!-- End loading page level scripts-->
                    </c:when>
                    <c:otherwise>
                        NO hay escenario registrados en el sistema
                    </c:otherwise>
                </c:choose>   
            </div>
            <a href="#crearEscenario" class="btn btn-large btn-primary"><i class="icon-plus"></i> Crear escenario</a>
        </div>
    </div>

</div> <!-- .container-fluid -->


