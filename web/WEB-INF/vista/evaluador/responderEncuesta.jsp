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
    .parsley-errors-list{
        padding: 0;
    }

</style>
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
            <form id="fencuesta" action="#" data-parsley-validate>
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
                                                <label><input type="radio" value="5" name="pregunta${pregunta.idPregunta}"></label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="radio">
                                                <label><input type="radio" value="4" name="pregunta${pregunta.idPregunta}"></label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="radio">
                                                <label><input type="radio" value="3" name="pregunta${pregunta.idPregunta}"></label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="radio">
                                                <label><input type="radio" value="2" name="pregunta${pregunta.idPregunta}"></label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="radio">
                                                <label><input type="radio" value="1" name="pregunta${pregunta.idPregunta}"></label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="radio">
                                                <label><input type="radio" value="0" required name="pregunta${pregunta.idPregunta}"></label>
                                            </div>
                                        </td>
                                    </c:when>
                                </c:choose>
                            </tr>       
                        </c:forEach>
                    </tbody>
                </table> 
                <br/>
                <div class="row">
                    <div class="form-group">
                        <label class="control-label">Debilidades</label>
                        <textarea rows="4" class="form-control"  placeholder="Debilidades" name="debilidades" maxlength="1999"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Fortalezas</label>
                        <textarea rows="4" class="form-control"  placeholder="Fortalezas" name="fortalezas" maxlength="1999"></textarea>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Recomendaciones para el plan de mejora</label>
                        <textarea rows="4" class="form-control"  placeholder="Recomendaciones para el plan de mejora" name="recomendaciones" maxlength="1999"></textarea>
                    </div>
                </div>



                <div class="row">
                    <div class="form-group">
                        <!--<button class="btn" id="guardar" data-content="Guarda la encuesta sin salir de ella, de esta manera usted podr&aacute; seguir contestando la encuesta cuando desee." value="1" data-original-title="Guardar encuesta" type="button" data-loading-text="Guardando..." autocomplete="off">Guardar</button>-->
                        <button id="enviarBtn" class="btn btn-primary" data-content="Env&iacute;a la encuesta evaluada. Verifique que todas las preguntas han sido respondidas correctamente. Esta operación no se podrá deshacer."  value="1" data-original-title="Enviar encuesta" type="submit">Enviar</button>
                    </div>
                </div>

            </form>



            <br/>
        </div>
    </div>
</div> <!-- .container-fluid -->

<!-- Modal -->
<div class="modal fade" id="myModalGracias" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title">Gracias</h2>
            </div>
            <div class="modal-body">
                <h2> La encuesta se ha enviado correctamente.
                 Muchas gracias por participar del proceso de autoevaluaci&oacute;n del escenario ${escenario.nombre}.</h2>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="assets/plugins/datatables/jquery.dataTables.js"></script> 						<!-- Data Tables -->
<script src="assets/plugins/datatables/dataTables.bootstrap.js"></script> 					<!-- Bootstrap Support for Datatables -->
<script src="assets/plugins/tables-fixedheader/js/dataTables.fixedHeader.js"></script> 		<!-- Fixed Header -->
<script src="assets/demo/demo-fixedheadertables.js"></script>
<script src="assets/plugins/form-parsley/parsley.js"></script>  
<script>
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

    $(function() {
        $("button").popover({trigger: "hover", placement: 'top'});

        $('#fencuesta').parsley().subscribe('parsley:form:validate', function(formInstance) {
            formInstance.submitEvent.preventDefault();
            // if one of these blocks is not failing do not prevent submission
            // we use here group validation with option force (validate even non required fields)
            if (formInstance.isValid()) {
                $("#enviarBtn").addClass('disabled');
                $.ajax({
                    type: "POST",
                    url: "Controlador?action=enviarEncuesta",
                    data: $("#fencuesta").serialize(),
                    success: function()
                    {
                        
                        $("#myModalGracias").modal();
                        $('#myModalGracias').on('hidden.bs.modal', function() {
                            location = "<%=request.getContextPath()%>/#inicio";
                        });
                    } //fin success
                }); //fin del $.ajax 
            }

        });




        $("#guardar").click(function(e) {
            e.preventDefault();
            $(this).button('loading');
            $.ajax({
                type: 'POST',
                url: "<%=request.getContextPath()%>/controladorF?action=guardarE",
                data: $("#formResponderE").serialize(),
                success: function() {
                    $("#guardar").button('reset');
                    marcacion = new Date();
                    Hora = marcacion.getHours();
                    Minutos = marcacion.getMinutes();
                    Segundos = marcacion.getSeconds();
                    if (Hora <= 9)
                        Hora = "0" + Hora;
                    if (Minutos <= 9)
                        Minutos = "0" + Minutos;
                    if (Segundos <= 9)
                        Segundos = "0" + Segundos;
                    var Dia = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo");
                    var Mes = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
                    var Hoy = new Date();
                    var Anio = Hoy.getFullYear();
                    var Fecha = Dia[Hoy.getDay()] + " " + Hoy.getDate() + " de " + Mes[Hoy.getMonth()] + " de " + Anio + ", a las " + Hora + ":" + Minutos + ":" + Segundos;
                    $("#spanGuardado").show();
                    $("#hora2").html(" " + Fecha);
                } //fin success
            });

        });

    });

</script>