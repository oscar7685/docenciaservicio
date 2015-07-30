<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<link rel="stylesheet" href="css/jquery.fileupload.css">

<div class="page-heading">            
    <h1>Encuesta</h1>
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
                    <h2>Encuesta</h2>
                    <div class="panel-ctrls">
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel-group panel-default" id="accordionA">
                                <div class="panel panel-default">
                                    <c:choose>
                                        <c:when test="${cuestionario.idCuestionario==1}">
                                            <div class="panel-heading"><h2>Encuesta Estudiantes</h2></div>
                                        </c:when>
                                        <c:when test="${cuestionario.idCuestionario==2}">
                                            <div class="panel-heading"><h2>Encuesta Docentes</h2></div>
                                        </c:when>
                                        <c:when test="${cuestionario.idCuestionario==3}">
                                            <div class="panel-heading"><h2>Encuesta Directivos</h2></div>
                                        </c:when>
                                    </c:choose>

                                    <div id="collapseOne" class="collapse in">
                                        <div class="panel-body">
                                            <!-- <div class="alert alert-dismissable alert-warning">
                                                 <i class="fa fa-fw fa-warning"></i>&nbsp; <strong>Alerta!</strong> No hay muestra asignada para este proceso hasta el momento.
                                                 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                             </div>-->
                                            <br/>
                                            <table id="tablaencuesta" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th>Id pregunta</th>
                                                        <th>Enunciado</th>
                                                        <th>Respuesta</th>
                                                        <th>acci&oacute;n</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="bodytablaencuesta">
                                                    <c:forEach items="${preguntas}" var="pregunta" varStatus="iter">
                                                        <tr>
                                                            <td>${pregunta.idPregunta}</td>
                                                            <td>${pregunta.enunciado}</td>
                                                            <c:choose>
                                                                <c:when test="${pregunta.tipo.equals('0a5')}">
                                                                    <td>
                                                                        <div class="radio">
                                                                            <label><input type="radio" name="${pregunta.idPregunta}">0</label>
                                                                        </div>
                                                                        <div class="radio">
                                                                            <label><input type="radio" name="${pregunta.idPregunta}">1</label>
                                                                        </div>
                                                                        <div class="radio">
                                                                            <label><input type="radio" name="${pregunta.idPregunta}">2</label>
                                                                        </div>
                                                                        <div class="radio">
                                                                            <label><input type="radio" name="${pregunta.idPregunta}">3</label>
                                                                        </div>
                                                                        <div class="radio">
                                                                            <label><input type="radio" name="${pregunta.idPregunta}">4</label>
                                                                        </div>
                                                                        <div class="radio">
                                                                            <label><input type="radio" name="${pregunta.idPregunta}">5</label>
                                                                        </div>
                                                                    </td>
                                                                </c:when>
                                                            </c:choose>
                                                            <td></td>
                                                        </tr>       
                                                    </c:forEach>
                                                </tbody>
                                            </table>         
                                        </div>
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
        , classHandler: function (el) {
            return el.$element.closest(".form-group");
        }
    };

    /*jslint unparam: true */
    /*global window, $ */
    $(function () {
        'use strict';
        // Change this to the location of your server-side upload handler:
        var url = 'SubirArchivo';
        $('#fileupload').fileupload({
            url: url,
            dataType: 'json',
            acceptFileTypes: /(\.|\/)(xlsm)$/i,
            done: function (e, data) {
                if (data.result.errores) {
                    $("p#erorres").html(data.result.errores);
                    $("#myModal").modal('show');
                }
                else {
                    $.each(data.result.files, function (index, file) {
                        $('<p/>').text(file.name).appendTo('#files');
                    });

                    $.ajax({
                        type: "POST",
                        url: "Controlador?action=listarMuestraEstudiantes",
                        data: $("#fcrearestudiante").serialize(),
                        success: function (data)
                        {
                            $("#bodytablaestudiante").empty();
                            $("#bodytablaestudiante").prepend(data);
                            $("#modalAgregarEstudiante").modal('hide');

                        } //fin success
                    }); //fin del $.ajax 

                }


            },
            fail: function (e, data) {
                //por si hay error
            },
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .progress-bar').css('width', progress + '%');
            }
        }).prop('disabled', !$.support.fileInput)
                .parent().addClass($.support.fileInput ? undefined : 'disabled');




        $('#myModal').on('hidden.bs.modal', function (e) {
            $('#progress .progress-bar').css('width', 0 + '%');
        });
        $("#agregarDocente").click(function () {
            $("#modalAgregarDocente").modal('show');
        });
        $("#botonAgregarDocente").click(function () {
            $('#fcreardocente').parsley().validate();
            var formInstance = $('#fcreardocente').parsley();
            // if one of these blocks is not failing do not prevent submission
            // we use here group validation with option force (validate even non required fields)
            if (formInstance.isValid()) {
                $.ajax({
                    type: "POST",
                    url: "Controlador?action=crearDocente2",
                    data: $("#fcreardocente").serialize(),
                    success: function (data)
                    {
                        $("#tabladocente").remove();
                        $("#panel-body-docente").prepend(data);
                        $("#modalAgregarDocente").modal('hide');

                    } //fin success
                }); //fin del $.ajax 

            } else {


            }
        });


        $("#agregarRepresentante").click(function () {
            $("#modalAgregarRepresentante").modal('show');
        });

        $("#botonAgregarRepresentante").click(function () {
            $('#fcrearrepresentate').parsley().validate();
            var formInstance = $('#fcrearrepresentate').parsley();
            // if one of these blocks is not failing do not prevent submission
            // we use here group validation with option force (validate even non required fields)
            if (formInstance.isValid()) {
                $.ajax({
                    type: "POST",
                    url: "Controlador?action=crearRepresentante2",
                    data: $("#fcrearrepresentate").serialize(),
                    success: function (data)
                    {
                        $("#tablarepresentante").remove();
                        $("#panel-body-representante").prepend(data);
                        $("#modalAgregarRepresentante").modal('hide');

                    } //fin success
                }); //fin del $.ajax 

            } else {


            }
        });

        $("#agregarEstudiante").click(function () {
            $("#modalAgregarEstudiante").modal('show');
        });

        $("#botonAgregarEstudiante").click(function () {
            $('#fcrearestudiante').parsley().validate();
            var formInstance = $('#fcrearestudiante').parsley();
            // if one of these blocks is not failing do not prevent submission
            // we use here group validation with option force (validate even non required fields)
            if (formInstance.isValid()) {
                $.ajax({
                    type: "POST",
                    url: "Controlador?action=crearEstudiante2",
                    data: $("#fcrearestudiante").serialize(),
                    success: function (data)
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