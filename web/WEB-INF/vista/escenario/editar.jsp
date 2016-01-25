<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ol class="breadcrumb">

    <li><a href="#">Escenarios</a></li>
    <li class="active"><a href="#">editar</a></li>

</ol>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12">
            <div class="panel panel-midnightblue">
                <div class="panel-heading">
                    <h2>Editar escenario</h2>
                </div>
                <div class="panel-body">

                    <form class="form-horizontal" id="feditarescenario" action="#" data-parsley-validate>
                        <div class="form-group">
                            <label for="idescenario" class="col-sm-2 control-label">Id Escenario</label>
                            <div class="col-sm-8">
                                <input type="text" name="idescenario" class="form-control" data-parsley-type="digits"
                                       id="idescenario" readonly="readonly" required placeholder="Escribe un identificador para el escenario" value="${escenario.idEscenario}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nombre" class="col-sm-2 control-label">Nombre</label>
                            <div class="col-sm-8">
                                <input type="text" name="nombre"class="form-control" id="nombre" required placeholder="Escribe un nombre para el escenario" value="${escenario.nombre}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="dire" class="col-sm-2 control-label">Direcci&oacute;n</label>
                            <div class="col-sm-8">
                                <input type="text" name="dire" class="form-control" id="dire" required placeholder="Escribe una dirección para el escenario" value="${escenario.direccion}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tel" class="col-sm-2 control-label">Tel&eacute;fono</label>
                            <div class="col-sm-8">
                                <input type="text" name="tele" class="form-control" data-parsley-type="digits" id="tel" required placeholder="Escribe un telefono para el escenario" value="${escenario.telefono}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nit" class="col-sm-2 control-label">NIT</label>
                            <div class="col-sm-8">
                                <input type="text" name="nit" class="form-control" id="nit" required placeholder="Escribe un nit para el escenario" value="${escenario.nit}">
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-sm-8 col-sm-offset-2">
                                    <button class="btn-primary btn" id="btneditare">Editar escenario</button>
                                    <button class="btn-default btn" type="reset" name="back" onclick="history.back()">Cancelar</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>   
            </div>
        </div>
    </div>
</div>
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
        $('#btneditare').on('click', function() {
          
            $('#feditarescenario').parsley().subscribe('parsley:form:validate', function(formInstance) {

                // if one of these blocks is not failing do not prevent submission
                // we use here group validation with option force (validate even non required fields)
                if (formInstance.isValid()) {
                    formInstance.submitEvent.preventDefault();
                    $.ajax({
                        type: "POST",
                        url: "Controlador?action=editarEscenario2",
                        data: $("#feditarescenario").serialize(),
                        success: function()
                        {
                          location = "#listarEscenarios";
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