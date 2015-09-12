<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="${pageContext.request.contextPath}/js/mindmup-editabletable.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style type="text/css"> 

    td:focus {
        -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
        -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;	
        outline: rgb(91, 157, 217) auto 5px;
    }
    textarea.error {
        -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px red;
        -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px red;
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px red;	
        outline: thin auto red;
    }
    textarea {
        -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
        -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #7ab5d3;	
        outline: rgb(91, 157, 217) auto 5px;
        outline-offset: 0px;
        border: none;
    }

</style>
<div class="page-heading">            
    <h1>Proceso</h1>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <!-- Accordion -->
            <div class="row">
                <div class="col-md-12">
                    <div id="conte" class="span10">
                        <form id="formInfoNum" class="form-horizontal" method="post" action="">
                            <fieldset>
                                <legend>Evaluar Criterios</legend>
                                <table id="tablaX" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="col-md-3">Criterio</th>
                                            <th class="col-md-2">Documento asociado</th>
                                            <th class="col-md-2">Responsable</th>
                                            <th class="col-md-1">Medio</th>
                                            <th class="col-md-1">Lugar</th>
                                            <th class="col-md-1">Estado <i class="fa fa-info-circle" style="width: 25px;height: 25px; font-size: 28px" data-content="<p style='font-weight:normal'>5: La información requerida en el criterio está completa y actualizada.<br/>
                                                                           4: La información requerida en el criterio está completa y en proceso de actualización.<br/>
                                                                           3: La información requerida en el criterio está en proceso de elaboración.<br/>
                                                                           2: Se detectó la inexistencia de la información requerida en el criterio. Ya se previó su elaboración.<br/>
                                                                           1: La información requerida en el criterio no existe y no se ha previsto su elaboración.<br/>
                                                                           0: No aplica</p>" data-original-title="Escala de gradación"></i></th>
                                            <th class="col-md-2">Acci&oacute;n a implementar u observaci&oacute;n</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach items="${listaCriterios}" var="item" varStatus="iter">
                                            <c:set var="encontrado" value="false"></c:set>
                                            <c:forEach items="${criteriosCalificados}" var="itemNC" varStatus="iterNC"> 
                                                <c:choose>
                                                    <c:when test="${itemNC.criterioidCriterio.idCriterio==item.idCriterio}">
                                                        <c:set var="encontrado" value="true"></c:set>
                                                            <tr>
                                                                <td style="text-align: justify;"><c:out value="${item.idCriterio} ${item.descripcion}"></c:out>
                                                                <input type="hidden" name="indicadorInput" value="<c:out value="${item.idCriterio}"></c:out>">
                                                                </td>
                                                                <td><c:out value="${itemNC.documento}"></c:out></td>
                                                            <td>${itemNC.responsable}</td>
                                                            <td>${itemNC.medio}</td>
                                                            <td>${itemNC.lugar}</td>
                                                            <td>${itemNC.evaluacion}</td>
                                                            <td>${itemNC.accion}</td>
                                                        </tr> 
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${encontrado==false}">
                                                    <tr>
                                                        <td style="text-align: justify;">${item.idCriterio} ${item.descripcion}
                                                            <input type="hidden" name="indicadorInput" value="${item.idCriterio}">
                                                        </td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                </c:when>
                                            </c:choose>            
                                        </c:forEach>                 
                                    </tbody>
                                </table>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function() {
        $('#tablaX').editableTableWidget({editor: $('<textarea>')});
        $('#tablaX tr').find("td:eq(5)").on('validate', function(evt, newValue) {
            if (newValue !== '1' && newValue !== '2' && newValue !== '3' && newValue !== '4' && newValue !== '5' && newValue !== '0') {
                return false; // mark cell as invalid 
            }
        });

        $('#tablaX tr').find("td").on('validate', function(evt, newValue) {
            if (newValue.length > 1999) {
                return false; // mark cell as invalid 
            }
        });
        $('#tablaX tr').find("td:eq(0)").on('validate', function(evt, newValue) {
            return false; // mark cell as invalid 
        });
        $('#tablaX td').on('change', function(evt, newValue) {
            // do something with the new cell value 

            var indicador = $(this).parents("tr").find("input[name='indicadorInput']").val();
            var columna = $(this).index();
            $.ajax({
                type: 'POST',
                url: "<%=request.getContextPath()%>/Controlador?action=registrarDocumental",
                data: "indicador=" + indicador + "&columna=" + columna + "&valor=" + newValue,
                success: function() {
                   // $("#dancing-dots-text").remove();
                }
            }); //fin $.ajax

        });
        $("i").popover({trigger: "hover", placement: 'bottom', html: true});


    });
</script>