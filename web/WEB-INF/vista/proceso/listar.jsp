<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="page-heading">            
    <h1>Procesos</h1>
    <div class="options">
        <div class="btn-toolbar">
            <a href="#" class="btn btn-default"><i class="fa fa-fw fa-cog"></i></a>
        </div>
    </div>
</div>
<ol class="breadcrumb">

    <li><a href="#">Proceso</a></li>
    <li class="active"><a href="#">listar</a></li>

</ol>

<div class="container-fluid">

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2>Procesos</h2>
                    <div class="panel-ctrls">
                    </div>
                </div>
                <c:choose>
                    <c:when test="${fn:length(procesos)!= 0}">
                        <div class="panel-body panel-no-padding">
                            <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Id Proceso</th>
                                        <th>Descripci&oacute;n</th>
                                        <th>Escenario</th>
                                        <th>Fecha Inicio</th>
                                        <th>Fecha Final</th>
                                        <th>Estado</th>
                                        <th>acci&oacute;n</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${procesos}" var="proceso" varStatus="iter">
                                        <tr class="odd gradeX">
                                            <td>${proceso.idproceso}</td>
                                            <td>${proceso.descripcionp}</td>
                                            <td>${proceso.escenarioidEscenario.nombre}</td>
                                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${proceso.fechai}" /></td>
                                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${proceso.fechaf}" /></td>
                                            <td>${proceso.estado}</td>
                                            <td> <a href="#editarProceso&id=${proceso.idproceso}" title="Editar" class="btn btn-xs btn-default todo-options"><i class="fa fa-pencil"></i></a>
                                                <a href="#verMuestra&id=${proceso.idproceso}" title="Ver Muestra" class="btn btn-xs btn-default todo-options"><i class="fa fa-group"></i></a>&nbsp;
                                                <a href="#calificarDocumentos&id=${proceso.idproceso}" title="Calificar Criterios Documentales" class="btn btn-xs btn-default todo-options"><i class="fa fa-file-text"></i></a>&nbsp;
                                                    <c:choose>
                                                        <c:when test="${proceso.estado == 'En configuracion'}">
                                                        <a style="margin-left: 20px;" href="#ejecutarProceso&id=${proceso.idproceso}" title="Ejecutar proceso" class="btn btn-xs btn-default todo-options"><i class="fa fa-play-circle"></i></a>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <a href="#verInformes&id=${proceso.idproceso}" title="Ver Informes" class="btn btn-xs btn-default todo-options"><i class="fa fa-bar-chart"></i></a>&nbsp;
                                                        </c:otherwise>
                                                    </c:choose>



                                            </td>
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
                        <div class="panel-body panel-no-padding">No hay procesos registrados en el sistema</div>
                    </c:otherwise>
                </c:choose>   
            </div>
            <a href="#crearProceso" class="btn btn-large btn-primary"><i class="icon-plus"></i> Crear proceso</a>
        </div>
    </div>

</div> <!-- .container-fluid -->


