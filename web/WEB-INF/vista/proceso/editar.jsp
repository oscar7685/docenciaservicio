<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<ol class="breadcrumb">

    <li><a href="#">Procesos</a></li>
    <li class="active"><a href="#">editar</a></li>

</ol>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-midnightblue">
                <div class="panel-heading">
                    <h2>Editar proceso</h2>
                </div>
                <div class="panel-body">

                    <form class="form-horizontal" id="feditarproceso" action="#" data-parsley-validate>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="idproceso">Id Proceso</label>
                            <div class="col-sm-8">
                                <input type="text" name="idproceso" id="idproceso" class="form-control" disabled="" value="${proceso.idproceso}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="descripcion">Descripci&oacute;n</label>
                            <div class="col-sm-8">
                                <textarea class="form-control" name="descripcion" id="descripcion" required placeholder="Escribe una descripcion para el proceso">${proceso.descripcionp}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Escenario</label>
                            <div class="col-sm-8">
                                <select name="escenario" class="form-control" id="source" disabled="">
                                    <option value="">${proceso.escenarioidEscenario.nombre}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Fecha de Inicio</label>
                            <div class="col-sm-8">
                                <input type="text" name="fechai" class="form-control mask" data-parsley-pattern="/^([0][1-9]|[12][0-9]|3[01])(\/|-)([0][1-9]|[1][0-2])\2(\d{4})$/" data-inputmask="'alias': 'date'" value="<fmt:formatDate pattern='dd-MM-yyyy' value='${proceso.fechai}' />">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Fecha Final</label>
                            <div class="col-sm-8">
                                <input type="text" name="fechaf"class="form-control mask" data-parsley-pattern="/^([0][1-9]|[12][0-9]|3[01])(\/|-)([0][1-9]|[1][0-2])\2(\d{4})$/" data-inputmask="'alias': 'date'" value="<fmt:formatDate pattern='dd-MM-yyyy' value='${proceso.fechaf}' />">
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-sm-8 col-sm-offset-2">
                                    <button class="btn-primary btn" id="btneditarp">Editar proceso</button>
                                    <button class="btn-default btn">Cancelar</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>   
            </div>
        </div>
    </div>
</div>

<script src="assets/plugins/form-inputmask/jquery.inputmask.bundle.min.js"></script>  	<!-- Input Masks Plugin -->

<script src="assets/demo/demo-mask.js"></script>

<script src="assets/plugins/form-parsley/parsley.js"></script>  					<!-- Validate Plugin / Parsley -->
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

    $(function() {
        $('#btneditarp').on('click', function() {
            $('#feditarproceso').parsley().subscribe('parsley:form:validate', function(formInstance) {

                // if one of these blocks is not failing do not prevent submission
                // we use here group validation with option force (validate even non required fields)
                if (formInstance.isValid()) {
                    formInstance.submitEvent.preventDefault();
                    $.ajax({
                        type: "POST",
                        url: "Controlador?action=editarProceso2",
                        data: $("#feditarproceso").serialize(),
                        success: function()
                        {
                            location = "#listarProcesos";
                        } //fin success
                    }); //fin del $.ajax 


                }

                // else stop form submission
                formInstance.submitEvent.preventDefault();

                // and display a gentle message
                $('.invalid-form-error-message')
                        .html("You must correctly fill at least one of these 2 blocks' fields!")
                        .addClass("filled");
                return;

                $('.invalid-form-error-message').html('');
            });


        });

    });
</script>