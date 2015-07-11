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
                                                <tbody id="bodytabladocente">
                                                    <c:choose>
                                                        <c:when test="${fn:length(estudiantesMuestra)!= 0}">
                                                            <c:forEach items="${estudiantesMuestra}" var="estudiante" varStatus="iter">
                                                                <tr>
                                                                    <td>${estudiante.fuenteidUsuario.idUsuario}</td>
                                                                    <td>${estudiante.idEstudiante}</td>
                                                                    <td>${estudiante.fuenteidUsuario.nombre}</td>
                                                                    <td>${estudiante.fuenteidUsuario.apellido}</td>
                                                                    <td>${estudiante.programaIdprograma.nombrepro}</td>
                                                                    <td>${estudiante.semestre}</td>
                                                                    <td></td>
                                                                </tr>       
                                                            </c:forEach>
                                                        </c:when>
                                                    </c:choose>

                                                </tbody>
                                            </table>

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
                                                        <c:forEach items="${docentesMuestra}" var="docente" varStatus="iter">
                                                            <tr>
                                                                <td>${docente.fuenteidUsuario.idUsuario}</td>
                                                                <td>${docente.fuenteidUsuario.nombre}</td>
                                                                <td>${docente.fuenteidUsuario.apellido}</td>
                                                                <td>${docente.programaIdprograma.nombrepro}</td>
                                                                <td>${docente.tipoContrato}</td>
                                                                <td></td>
                                                            </tr>       
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>

                                            </tbody>
                                        </table>
                                        <button class="btn btn-primary" id="agregarDocente">Agregar docente</button>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <a data-toggle="collapse" data-parent="#accordionA" href="#collapseThree"><div class="panel-heading"><h2>Muestra Representantes Escenario</h2></div></a>
                                <div id="collapseThree" class="collapse in">
                                    <div class="panel-body">
                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
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
            $("#modalAgregarDocente").modal('show');
        });
        $("#botonAgregarDocente").click(function() {
            $('#fcreardocente').parsley().validate();
            var formInstance = $('#fcreardocente').parsley();
            // if one of these blocks is not failing do not prevent submission
            // we use here group validation with option force (validate even non required fields)
            if (formInstance.isValid()) {
                console.log("es valido!!")
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

            } else {/*
             // else stop form submission
             formInstance.submitEvent.preventDefault();
             
             // and display a gentle message
             $('.invalid-form-error-message')
             .html("You must correctly fill at least one of these 2 blocks' fields!")
             .addClass("filled");
             return;
             
             $('.invalid-form-error-message').html('');*/

            }


        });
    });
</script>