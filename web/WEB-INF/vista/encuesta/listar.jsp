<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="page-heading">            
    <h1>Encuestas</h1>
</div>
<ol class="breadcrumb">

    <li><a href="index.html">Inicio</a></li>
    <li class="active"><a href="#">Encuestas</a></li>

</ol>

<div class="container-fluid">

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2>Encuestas</h2>
                    <div class="panel-ctrls">
                    </div>
                </div>
                <c:choose>
                    <c:when test="${fn:length(encuestas)!= 0}">
                        <div class="panel-body panel-no-padding">
                            <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Id encuesta</th>
                                        <th>Encuesta</th>
                                        <th>Acci&oacute;n</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${encuestas}" var="encuesta" varStatus="iter">
                                        <tr class="odd gradeX">
                                            <td>${encuesta.idCuestionario}</td>
                                            <td>${encuesta.nombre}</td>
                                            <td> <a href="#vistaPrevia&id=${encuesta.idCuestionario}" class="btn btn-xs btn-default todo-options"><i class="fa fa-eye"></i></a></td>
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
                        NO hay encuestas registrados en el sistema
                    </c:otherwise>
                </c:choose>   
            </div>
        </div>
    </div>

</div> <!-- .container-fluid -->


