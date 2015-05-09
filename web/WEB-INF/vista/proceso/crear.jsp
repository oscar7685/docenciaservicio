<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ol class="breadcrumb">

    <li><a href="#">Procesos</a></li>
    <li class="active"><a href="#">crear</a></li>

</ol>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-midnightblue">
                <div class="panel-heading">
                    <h2>Crear proceso</h2>
                </div>
                <div class="panel-body">

                    <form class="form-horizontal" id="fcrearproceso" action="#" data-parsley-validate>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Descripci&oacute;n</label>
                            <div class="col-sm-8">
                                <textarea class="form-control" name="descripcion" required placeholder="Escribe una descripcion para el proceso"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Escenario</label>
                            <div class="col-sm-8">
                                <select name="escenario" class="form-control" id="source" required>
                                    <option value="">Escoja un escenario</option>
                                    <c:forEach items="${escenarios}" var="escenario" varStatus="iter">
                                        <option value="${escenario.idEscenario}">${escenario.nombre}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Fecha de Inicio</label>
                            <div class="col-sm-8">
                                <input type="text" name="fechai" required class="form-control mask" data-inputmask="'alias': 'date'">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Fecha Final</label>
                            <div class="col-sm-8">
                                <input type="text" name="fechaf" required class="form-control mask" data-inputmask="'alias': 'date'">
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-sm-8 col-sm-offset-2">
                                    <button type="submit" class="btn-primary btn" id="btncrearp">Crear proceso</button>
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
       $('#fcrearproceso').parsley().subscribe('parsley:form:validate', function(formInstance) {
                formInstance.submitEvent.preventDefault();
                // if one of these blocks is not failing do not prevent submission
                // we use here group validation with option force (validate even non required fields)
                if (formInstance.isValid()) {
                    $.ajax({
                        type: "POST",
                        url: "Controlador?action=crearProceso2",
                        data: $("#fcrearproceso").serialize(),
                        success: function()
                        {
                            location = "#listarProcesos";
                        } //fin success
                    }); //fin del $.ajax 
                }
                
            });
        

    });
</script>