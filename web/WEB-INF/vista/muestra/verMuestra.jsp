<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<link rel="stylesheet" href="css/jquery.fileupload.css">

<div class="page-heading">            
    <h1>Muestra</h1>
    <div class="options">
        <div class="btn-toolbar">
            <a href="#" class="btn btn-default"><i class="fa fa-fw fa-cog"></i></a>
        </div>
    </div>
</div>
<div class="container-fluid">

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2>Muestra</h2>
                    <div class="panel-ctrls">
                    </div>
                </div>

                <div class="panel-body">
                    <!-- Accordion -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel-group panel-default" id="accordionA">
                                <div class="panel panel-default">
                                    <a data-toggle="collapse" data-parent="#accordionA" href="#collapseOne"><div class="panel-heading"><h2>Muestra Estudiantes</h2></div></a>
                                    <div id="collapseOne" class="collapse in">
                                        <div class="panel-body">
                                            <!-- <div class="alert alert-dismissable alert-warning">
                                                 <i class="fa fa-fw fa-warning"></i>&nbsp; <strong>Alerta!</strong> No hay muestra asignada para este proceso hasta el momento.
                                                 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                             </div>-->

                                            <li style="list-style: none;"><a target="_blank" class="btn btn-lg btn-primary-alt btn-label" href="DescargarFormato"><i class="fa fa-download"></i> Descargar formato</a></li>
                                            <br/>
                                            <c:choose>
                                                <c:when test="${proceso.estado != 'Finalizado'}">
                                                    <form action="Formulario" class="form row-border" enctype='multipart/form-data'>

                                                        <div class="form-group">
                                                            <label class="col-sm-10 control-label">Ingrese el archivo con la poblacion estudiantil asociada al escenario ${proceso.escenarioidEscenario.nombre}</label>
                                                            <div class="col-sm-10">
                                                                <span class="btn btn-success fileinput-button">
                                                                    <i class="glyphicon glyphicon-plus"></i>
                                                                    <span>Seleccionar archivo...</span>
                                                                    <!-- The file input field used as target for the file upload widget -->
                                                                    <input id="fileupload" type="file" name="files[]" multiple>
                                                                </span>
                                                                <br>
                                                                <br>
                                                                <!-- The global progress bar -->
                                                                <div id="progress" class="progress">
                                                                    <div class="progress-bar progress-bar-success"></div>
                                                                </div>
                                                                <!-- The container for the uploaded files -->
                                                                <div id="files" class="files"></div>
                                                                <br>
                                                            </div>
                                                        </div>

                                                    </form>
                                                </c:when>
                                            </c:choose>

                                            <table id="tablaestudiante" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th>Identificación</th>
                                                        <th>Codigo estudiantil</th>
                                                        <th>Nombre</th>
                                                        <th>Apellidos</th>
                                                        <th>Programa</th>
                                                        <th>Semestre</th>
                                                        <th>acci&oacute;n</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="bodytablaestudiante">
                                                    <c:choose>
                                                        <c:when test="${fn:length(estudiantesMuestra)!= 0}">
                                                            <c:forEach items="${estudiantesMuestra}" var="estudiante" varStatus="iter55">
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
                                                                        <td>
                                                                            <c:choose>
                                                                                <c:when test="${proceso.estado != 'Finalizado'}">
                                                                                    <button class="btn btn-xs btn-default todo-options eliminarEstudiante" title="Eliminar" data-value="${estudiante.id}"><i class="fa fa-times"></i></button>
                                                                                    </c:when>
                                                                                </c:choose>

                                                                        </td>
                                                                    </tr>  

                                                                </c:if>
                                                                <c:set var="contador" value="${iter55.index}"></c:set>
                                                            </c:forEach>
                                                        </c:when>
                                                    </c:choose>

                                                </tbody>
                                            </table>
                                            <c:choose>
                                                <c:when test="${proceso.estado != 'Finalizado'}">
                                                    <button class="btn btn-primary" id="agregarEstudiante">Agregar estudiante</button>                
                                                </c:when>
                                            </c:choose>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <a data-toggle="collapse" data-parent="#accordionA" href="#collapseTwo"><div class="panel-heading"><h2>Muestra Docentes</h2></div></a>
                                <div id="collapseTwo" class="collapse in">
                                    <div class="panel-body" id="panel-body-docente">
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
                                            <tbody id="bodytabladocente">
                                                <c:choose>
                                                    <c:when test="${fn:length(docentesMuestra)!= 0}">
                                                        <c:forEach items="${docentesMuestra}" var="docente" varStatus="iter56">
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
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${proceso.estado != 'Finalizado'}">
                                                                                <button class="btn btn-xs btn-default todo-options eliminarDocente" title="Eliminar" data-value="${docente.docenteid}"><i class="fa fa-times"></i></button>
                                                                                </c:when>
                                                                            </c:choose>

                                                                    </td>
                                                                </tr>  

                                                            </c:if>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>

                                            </tbody>
                                        </table>
                                        <c:choose>
                                            <c:when test="${proceso.estado != 'Finalizado'}">
                                                <button class="btn btn-primary" id="agregarDocente">Agregar docente</button>
                                            </c:when>
                                        </c:choose>

                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <a data-toggle="collapse" data-parent="#accordionA" href="#collapseThree"><div class="panel-heading"><h2>Muestra Representantes Escenario</h2></div></a>
                                <div id="collapseThree" class="collapse in">
                                    <div class="panel-body" id="panel-body-representante">
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
                                            <tbody id="bodytablarepresentante">
                                                <c:choose>
                                                    <c:when test="${fn:length(representanteMuestra)!= 0}">
                                                        <c:forEach items="${representanteMuestra}" var="representante" varStatus="iter56">
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
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${proceso.estado != 'Finalizado'}">
                                                                                <button class="btn btn-xs btn-default todo-options eliminarRepresentante" title="Eliminar" data-value="${representante.idRepresentanteEscenario}"><i class="fa fa-times"></i></button>
                                                                                </c:when>
                                                                            </c:choose>

                                                                    </td>
                                                                </tr>  
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                        <c:choose>
                                            <c:when test="${proceso.estado != 'Finalizado'}">
                                                <button class="btn btn-primary" id="agregarRepresentante">Agregar representante</button>
                                            </c:when>
                                        </c:choose>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div> <!-- .container-fluid -->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title">Errores de validación</h2>
            </div>
            <div class="modal-body">
                <h2>Ha ocurrido un error de validación</h2>
                <p id="erorres"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal Eliminar Estudiante-->
<div class="modal fade" id="modalEliminarEstudiante" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title">Confirmación de Eliminación</h2>
            </div>
            <div class="modal-body">
                <h2>Está seguro que quiere eliminar al estudiante del proceso: ${proceso.descripcionp}</h2>
            </div>
            <div class="modal-footer">
                <button type="button" id="botonEliminarEstudiante" class="btn btn-primary">Eliminar</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal Eliminar Docente-->
<div class="modal fade" id="modalEliminarDocente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title">Confirmación de Eliminación</h2>
            </div>
            <div class="modal-body">
                <h2>Está seguro que quiere eliminar al estudiante del proceso: ${proceso.descripcionp}</h2>
            </div>
            <div class="modal-footer">
                <button type="button" id="botonEliminarDocente" class="btn btn-primary">Eliminar</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal Eliminar Representante-->
<div class="modal fade" id="modalEliminarRepresentante" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title">Confirmación de Eliminación</h2>
            </div>
            <div class="modal-body">
                <h2>Está seguro que quiere eliminar al estudiante del proceso: ${proceso.descripcionp}</h2>
            </div>
            <div class="modal-footer">
                <button type="button" id="botonEliminarRepresentante" class="btn btn-primary">Eliminar</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal -->
<div class="modal fade" id="modalAgregarDocente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-horizontal" id="fcreardocente" action="#" data-parsley-validate>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h2 class="modal-title">Agregar Docente</h2>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="identificacion" class="col-sm-2 control-label">Identificación</label>
                        <div class="col-sm-8">
                            <input type="text" name="identificacion" class="form-control" data-parsley-type="digits" data-parsley-group="block1" id="identificacion" required placeholder="Escribe una identificación para el docente">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nombre" class="col-sm-2 control-label">Nombre</label>
                        <div class="col-sm-8">
                            <input type="text" name="nombre"class="form-control" id="nombre" required placeholder="Escribe un nombre para el docente">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="apellido" class="col-sm-2 control-label">Apellidos</label>
                        <div class="col-sm-8">
                            <input type="text" name="apellido" class="form-control" id="apellido" required placeholder="Escribe los  apellidos del docente">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="programa" class="col-sm-2 control-label">Programa</label>
                        <div class="col-sm-8">
                            <select name="programa" class="form-control" id="programa" required>
                                <option value="">Escoja un programa</option>
                                <option value="1">Quimica Farmaceutica</option>
                                <option value="2">Medicina</option>
                                <option value="3">Odontologia</option>
                                <option value="4">Enfermeria</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tipoContrato" class="col-sm-2 control-label">Tipo contrato</label>
                        <div class="col-sm-8">
                            <select name="tipoContrato" class="form-control" id="tipoContraro" required>
                                <option value="">Escoja un tipo de contrato</option>
                                <option value="Planta">Planta</option>
                                <option value="Catedra">Catedra</option>
                            </select>
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" id="botonAgregarDocente" class="btn btn-primary">Agregar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!-- Modal -->
<div class="modal fade" id="modalAgregarRepresentante" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-horizontal" id="fcrearrepresentate" action="#" data-parsley-validate>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h2 class="modal-title">Agregar Representante</h2>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="identificacionR" class="col-sm-2 control-label">Identificación</label>
                        <div class="col-sm-8">
                            <input type="text" name="identificacionR" class="form-control" data-parsley-type="digits" data-parsley-group="block1" id="identificacionR" required placeholder="Escribe una identificación para el representante">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nombreR" class="col-sm-2 control-label">Nombre</label>
                        <div class="col-sm-8">
                            <input type="text" name="nombreR" class="form-control" id="nombreR" required placeholder="Escribe un nombre para el representante">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="apellidoR" class="col-sm-2 control-label">Apellidos</label>
                        <div class="col-sm-8">
                            <input type="text" name="apellidoR" class="form-control" id="apellidoR" required placeholder="Escribe los  apellidos del representante">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cargo" class="col-sm-2 control-label">Cargo</label>
                        <div class="col-sm-8">
                            <input type="text" name="cargo" class="form-control" id="cargo" required placeholder="Escribe el cargo del representante">
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" id="botonAgregarRepresentante" class="btn btn-primary">Agregar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal Estudiante-->
<div class="modal fade" id="modalAgregarEstudiante" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-horizontal" id="fcrearestudiante" action="#" data-parsley-validate>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h2 class="modal-title">Agregar Estudiante</h2>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="identificacionE" class="col-sm-2 control-label">Identificación</label>
                        <div class="col-sm-8">
                            <input type="text" name="identificacionE" class="form-control" data-parsley-type="digits" data-parsley-group="block1" id="identificacionE" required placeholder="Escribe una identificación para el estudiante">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="codigoE" class="col-sm-2 control-label">Codigo estudiante</label>
                        <div class="col-sm-8">
                            <input type="text" name="codigoE" class="form-control" data-parsley-type="digits" data-parsley-group="block1" id="codigoE" required placeholder="Escribe el codigo estudiantil">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nombreE" class="col-sm-2 control-label">Nombre</label>
                        <div class="col-sm-8">
                            <input type="text" name="nombreE" class="form-control" id="nombreE" required placeholder="Escribe un nombre para el estudiante">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="apellidoE" class="col-sm-2 control-label">Apellidos</label>
                        <div class="col-sm-8">
                            <input type="text" name="apellidoE" class="form-control" id="apellidoE" required placeholder="Escribe los  apellidos del estudiante">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="semestreE" class="col-sm-2 control-label">Semestre</label>
                        <div class="col-sm-8">
                            <select name="semestreE" class="form-control" id="semestreE" required>
                                <option value="">Escoja un semestre</option>
                                <option value="12">12</option>
                                <option value="11">11</option>
                                <option value="10">10</option>
                                <option value="9">9</option>
                                <option value="8">8</option>
                                <option value="7">7</option>
                                <option value="6">6</option>
                                <option value="5">5</option>
                                <option value="4">4</option>
                                <option value="3">3</option>
                                <option value="2">2</option>
                                <option value="1">1</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="programaE" class="col-sm-2 control-label">Programa</label>
                        <div class="col-sm-8">
                            <select name="programaE" class="form-control" id="programaE" required>
                                <option value="">Escoja un programa</option>
                                <option value="1">Quimica Farmaceutica</option>
                                <option value="2">Medicina</option>
                                <option value="3">Odontologia</option>
                                <option value="4">Enfermeria</option>
                            </select>
                        </div>
                    </div>




                </div>
                <div class="modal-footer">
                    <button type="button" id="botonAgregarEstudiante" class="btn btn-primary">Agregar</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="js/jquery.fileupload.js"></script>
<script src="js/jquery.fileupload-process.js"></script>
<script src="js/jquery.fileupload-validate.js"></script>
<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/form-parsley/parsley.js"></script>  					<!-- Validate Plugin / Parsley -->
<script>
    var eliminar;
    // See Docs
    window.ParsleyConfig = {
        successClass: 'has-success'
                , errorClass: 'has-error'
                , errorElem: '<span></span>'
                , errorsWrapper: '<span class="help-block"></span>'
                , errorTemplate: "<div></div>"
                , classHandler: function(el) {
            return el.$element.closest(".form-group");
        }
    };

    /*jslint unparam: true */
    /*global window, $ */
    $(function() {
        'use strict';
        // Change this to the location of your server-side upload handler:
        var url = 'SubirArchivo';
        $('#fileupload').fileupload({
            url: url,
            dataType: 'json',
            acceptFileTypes: /(\.|\/)(xlsm)$/i,
            done: function(e, data) {
                if (data.result.errores) {
                    $("p#erorres").html(data.result.errores);
                    $("#myModal").modal('show');
                }
                else {
                    $.each(data.result.files, function(index, file) {
                        $('<p/>').text(file.name).appendTo('#files');
                    });

                    $.ajax({
                        type: "POST",
                        url: "Controlador?action=listarMuestraEstudiantes",
                        data: $("#fcrearestudiante").serialize(),
                        success: function(data)
                        {
                            $("#bodytablaestudiante").empty();
                            $("#bodytablaestudiante").prepend(data);
                            $("#modalAgregarEstudiante").modal('hide');

                        } //fin success
                    }); //fin del $.ajax 

                }


            },
            fail: function(e, data) {
                //por si hay error
            },
            progressall: function(e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .progress-bar').css('width', progress + '%');
            }
        }).prop('disabled', !$.support.fileInput)
                .parent().addClass($.support.fileInput ? undefined : 'disabled');




        $('#myModal').on('hidden.bs.modal', function(e) {
            $('#progress .progress-bar').css('width', 0 + '%');
        });
        $("#agregarDocente").click(function() {
            $("#fcreardocente")[0].reset();
            $("#modalAgregarDocente").modal('show');
        });
        $("#botonAgregarDocente").click(function() {
            $('#fcreardocente').parsley().validate();
            var formInstance = $('#fcreardocente').parsley();
            // if one of these blocks is not failing do not prevent submission
            // we use here group validation with option force (validate even non required fields)
            if (formInstance.isValid()) {
                $.ajax({
                    type: "POST",
                    url: "Controlador?action=crearDocente2",
                    data: $("#fcreardocente").serialize(),
                    success: function(data)
                    {
                        $("#tabladocente").remove();
                        $("#panel-body-docente").prepend(data);
                        $("#modalAgregarDocente").modal('hide');

                    } //fin success
                }); //fin del $.ajax 

            } else {


            }
        });

        $('body').on('click', '.eliminarEstudiante', function() {
            eliminar = $(this).attr("data-value").valueOf();
            $("#modalEliminarEstudiante").modal('show');
        });

        $('body').on('click', '.eliminarDocente', function() {
            eliminar = $(this).attr("data-value").valueOf();
            $("#modalEliminarDocente").modal('show');
        });

        $('body').on('click', '.eliminarRepresentante', function() {
            eliminar = $(this).attr("data-value").valueOf();
            $("#modalEliminarRepresentante").modal('show');
        });


        $("#botonEliminarEstudiante").click(function() {
            $.ajax({
                type: "POST",
                url: "Controlador?action=eliminarEstudiante&idEstudiante=" + eliminar,
                success: function(data)
                {
                    $("#bodytablaestudiante").empty();
                    $("#bodytablaestudiante").prepend(data);
                    $("#modalEliminarEstudiante").modal('hide');

                } //fin success
            }); //fin del $.ajax 
        });


        $("#botonEliminarDocente").click(function() {
            $.ajax({
                type: "POST",
                url: "Controlador?action=eliminarDocente&idDocente=" + eliminar,
                success: function(data)
                {
                    $("#tabladocente").remove();
                    $("#panel-body-docente").prepend(data);
                    $("#modalEliminarDocente").modal('hide');

                } //fin success
            }); //fin del $.ajax 


        });

        $("#botonEliminarRepresentante").click(function() {
            $.ajax({
                type: "POST",
                url: "Controlador?action=eliminarRepresentante&idRepresentante=" + eliminar,
                success: function(data)
                {
                    $("#tablarepresentante").remove();
                    $("#panel-body-representante").prepend(data);
                    $("#modalEliminarRepresentante").modal('hide');

                } //fin success
            }); //fin del $.ajax 


        });


        $("#agregarRepresentante").click(function() {
            $("#fcrearrepresentate")[0].reset();
            $("#modalAgregarRepresentante").modal('show');
        });

        $("#botonAgregarRepresentante").click(function() {
            $('#fcrearrepresentate').parsley().validate();
            var formInstance = $('#fcrearrepresentate').parsley();
            // if one of these blocks is not failing do not prevent submission
            // we use here group validation with option force (validate even non required fields)
            if (formInstance.isValid()) {
                $.ajax({
                    type: "POST",
                    url: "Controlador?action=crearRepresentante2",
                    data: $("#fcrearrepresentate").serialize(),
                    success: function(data)
                    {
                        $("#tablarepresentante").remove();
                        $("#panel-body-representante").prepend(data);
                        $("#modalAgregarRepresentante").modal('hide');

                    } //fin success
                }); //fin del $.ajax 

            } else {


            }
        });

        $("#agregarEstudiante").click(function() {
            $("#fcrearestudiante")[0].reset();
            $("#modalAgregarEstudiante").modal('show');

        });

        $("#botonAgregarEstudiante").click(function() {
            $('#fcrearestudiante').parsley().validate();
            var formInstance = $('#fcrearestudiante').parsley();
            // if one of these blocks is not failing do not prevent submission
            // we use here group validation with option force (validate even non required fields)
            if (formInstance.isValid()) {
                $.ajax({
                    type: "POST",
                    url: "Controlador?action=crearEstudiante2",
                    data: $("#fcrearestudiante").serialize(),
                    success: function(data)
                    {
                        $("#bodytablaestudiante").empty();
                        $("#bodytablaestudiante").prepend(data);
                        $("#modalAgregarEstudiante").modal('hide');

                    } //fin success
                }); //fin del $.ajax 

            } else {


            }
        });
    });
</script>