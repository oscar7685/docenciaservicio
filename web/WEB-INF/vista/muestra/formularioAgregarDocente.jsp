

<!-- Modal -->
<!--<div class="modal fade" id="modalAgregarDocente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">-->
<div class="modal-dialog">
    <div class="modal-content">
        <form class="form-horizontal row-border" id="fcreardocente" action="#" data-parsley-validate>
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
<!--</div><!-- /.modal -->


<script type="text/javascript">
    console.log("punto 1");
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

</script>
<script src="<%=request.getContextPath()%>/assets/plugins/form-parsley/parsley.js"></script><!-- Validate Plugin / Parsley -->
<script type="text/javascript">
    $(function() {
        $("#botonAgregarDocente").click(function() {

            $('#fcreardocente').parsley().validate();
            var instance = $('#fcreardocente').parsley();
            if (instance.isValid()) {
                $.ajax({
                    type: "POST",
                    url: "Controlador?action=crearDocente2",
                    data: $("#fcreardocente").serialize(),
                    success: function(data)
                    {
                        $("#tabladocente").remove();
                        $("#panel-body-docente").prepend(data);


                    } //fin success
                }); //fin del $.ajax 
            } else {


            }
        });
    });


</script>