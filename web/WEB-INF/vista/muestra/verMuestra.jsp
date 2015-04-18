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
                <c:choose>
                    <c:when test="${fn:length(fuente)!= 0}">


                    </c:when>
                    <c:otherwise>
                        <div class="panel-body">
                            <div class="alert alert-dismissable alert-warning">
                                <i class="fa fa-fw fa-warning"></i>&nbsp; <strong>Alerta!</strong> No hay muestra asignada para este proceso hasta el momento.
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            </div>

                            <li style="list-style: none;"><a target="_blank" class="btn btn-lg btn-primary-alt btn-label" href="DescargarFormato"><i class="fa fa-download"></i> Descargar formato</a></li>
                            <br/>
                            <form action="Formulario" class="form row-border" enctype='multipart/form-data'>

                                <div class="form-group">
                                    <label class="col-sm-10 control-label">Ingrese el archivo con la poblacion asociada al escenario ${proceso.escenarioidEscenario.nombre}</label>
                                    <div class="col-sm-10">
                                        <!--<div class="fileinput fileinput-new" >
                                            <div class="input-group">
                                                <div class="form-control uneditable-input">
                                                    <i class="fa fa-file fileinput-exists"></i>&nbsp;<span class="fileinput-filename"></span>
                                                </div>
                                                <span class="input-group-btn">
                                                    <a href="#" class="btn btn-default fileinput-exists">Remove</a>
                                                    <span class="btn btn-default btn-file">
                                                        <span class="fileinput-new">Seleccionar archivo</span>
                                                        <span class="fileinput-exists">Cambiar</span>
                                                        <input type="file" name="archivo">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>-->

                                        <span class="btn btn-success fileinput-button">
                                            <i class="glyphicon glyphicon-plus"></i>
                                            <span>Select files...</span>
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
                        </div>
                    </c:otherwise>
                </c:choose>   
            </div>
        </div>
    </div>

</div> <!-- .container-fluid -->



<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="js/jquery.fileupload.js"></script>
<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
    /*jslint unparam: true */
    /*global window, $ */
    $(function() {
        'use strict';
        // Change this to the location of your server-side upload handler:
        var url = window.location.hostname === 'blueimp.github.io' ?
                '//jquery-file-upload.appspot.com/' : 'SubirArchivo';
        $('#fileupload').fileupload({
            url: url,
            dataType: 'json',
            done: function(e, data) {
                $.each(data.result.files, function(index, file) {
                    $('<p/>').text(file.name).appendTo('#files');
                });
            },
            progressall: function(e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .progress-bar').css(
                        'width',
                        progress + '%'
                        );
            }
        }).prop('disabled', !$.support.fileInput)
                .parent().addClass($.support.fileInput ? undefined : 'disabled');
    });
</script>