<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<link rel="stylesheet" href="css/jquery.fileupload.css">
<style type="text/css">
    h3{
        font-weight: bold;
    }
    #wrapper{
        overflow: auto !important;
    }
    
</style>
<div class="page-heading">            
    <h1>Encuestas</h1> <a href="#listarCuestionarios"><button class="btn-default btn pull-right">Volver</button></a>
</div>
<div class="container-fluid">
    <div class="row" style="background-color: #fff;">
        <div class="col-md-offset-2 col-md-8">
            <div class="full-height-content">
                <table class="table table-bordered" style="font-weight: bold;">
                    <tbody>
                        <tr>
                            <td rowspan="3" style="width: 25%; text-align: center;"><img src="<%=request.getContextPath()%>/assets/img/LogoU.png"></td>
                            <td style="width: 75%; text-align: center; vertical-align: middle;">UNIVERSIDAD DE CARTAGENA</td>
                        </tr>
                        <tr>
                            <td style="width: 75%; text-align: center; vertical-align: middle;">MODELO DE AUTOEVALUACIÓN DE LA RELACIÓN DOCENCIA-SERVICIO</td>
                        </tr>
                        <tr>
                            <td style="width: 75%; text-align: center; vertical-align: middle;text-transform: uppercase;">${cuestionario.nombre}</td>
                        </tr>
                    </tbody>
                </table>
                <h3>Objetivo:</h3>
                <p style="text-align: justify;">Evaluar la relación Docencia Servicio con fundamento en el convenio suscrito entre la Universidad de Cartagena y las Instituciones prestadoras de servicio, con el fin de identificar las fortalezas y debilidades que permitan el diseño de planes de mejoramiento de las prácticas formativas y garantizar la calidad en la atención de salud.</p>
                <h3>Instrucciones:</h3>
                <p id="insp" style="text-align: justify;">A continuación encuentra una serie de enunciados consistentes en un afirmación. Frente a cada una de estas, encuentra diferentes opciones de respuesta. Seleccione la respuesta correspondiente segun su criterio</p>
                <h3>Criterio de Evaluación:</h3>
                5. Completamente de acuerdo. Fortaleza Mayor<br/>
                4. De acuerdo. Fortaleza Menor<br/>
                3. Parcialmente de acuerdo. Debilidad Minima o Poco significativa<br/>
                2. En desacuerdo. Debilidad Menor<br/>
                1. Completamente en desacuerdo. Debilidad Mayor<br/>
                0. No sabe/No responde

            </div>

            <br/>
            <table id="tablaencuesta" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th style="text-align: center; vertical-align: middle;" rowspan="2">Criterios de Evaluación</th>
                        <th style="text-align: center; vertical-align: middle;" rowspan="2">Enunciado</th>
                        <th style="text-align: center; vertical-align: middle;" colspan="6">Respuesta</th>
                    </tr>
                    <tr>
                        <th style="text-align: center; vertical-align: middle;">5</th>
                        <th style="text-align: center; vertical-align: middle;">4</th>
                        <th style="text-align: center; vertical-align: middle;">3</th>
                        <th style="text-align: center; vertical-align: middle;">2</th>
                        <th style="text-align: center; vertical-align: middle;">1</th>
                        <th style="text-align: center; vertical-align: middle;">0</th>
                    </tr>
                </thead>
                <tbody id="bodytablaencuesta">
                    <c:forEach items="${preguntas}" var="pregunta" varStatus="iter">
                        <tr>
                            <td>${pregunta.criterioidCriterio.idCriterio}</td>
                            <td style="text-transform:initial">${pregunta.enunciado}</td>
                            <c:choose>
                                <c:when test="${pregunta.tipo.equals('0a5')}">
                                    <td>
                                        <div class="radio">
                                            <label><input type="radio" name="${pregunta.idPregunta}"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="radio">
                                            <label><input type="radio" name="${pregunta.idPregunta}"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="radio">
                                            <label><input type="radio" name="${pregunta.idPregunta}"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="radio">
                                            <label><input type="radio" name="${pregunta.idPregunta}"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="radio">
                                            <label><input type="radio" name="${pregunta.idPregunta}"></label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="radio">
                                            <label><input type="radio" name="${pregunta.idPregunta}"></label>
                                        </div>
                                    </td>
                                </c:when>
                            </c:choose>
                        </tr>       
                    </c:forEach>
                </tbody>
            </table>         
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


        $("#agregarRepresentante").click(function() {
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