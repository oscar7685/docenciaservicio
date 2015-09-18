<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
        marcacion = new Date()
        Hora = marcacion.getHours()
        Minutos = marcacion.getMinutes()
        Segundos = marcacion.getSeconds()
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
        $("#horaEstado").html(" " + Fecha);

        if (${aux_index2 == 2}) {
            /*$.ajax({
             type: 'POST',
             url: "sap/ControllerAI?action=recargarEstado",
             success: function(data){
             $("#estado").empty();
             $("#estado").html(data);
             }
             });*/
        }
        $("#actEnlaceEstado").click(function() {
            /*   $("div.ui-layout-center").empty();
             $.ajax({
             type: 'POST',
             url: "sap/ControllerAI?action=estadoProcesoAI",
             success: function(data) {
             $(".contenido").html(data);
             setTimeout(function() {
             $("#dancing-dots-text").remove();
             }, 200)
             } //fin success
             }); //fin $.ajaxF          
             
             $.ajax({
             type: 'POST',
             url: "sap/ControllerAI?action=recargarEstado",
             success: function(data) {
             $("#estado").empty();
             $("#estado").html(data);
             }
             });
             */
        }); //fin eventoClick #actEnlaceEstado

        $(".printEnlace").click(function() {
            $('#conte').jqprint();
            return false;
        });
    });



    $(function() {
        var chart;
        $(document).ready(function() {
            chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'container',
                    type: 'column'
                },
                title: {
                    text: 'Cantidad de  seleccionados VS Cantidad de personan que contestaron'
                },
                xAxis: {
                    categories: [
                        'Estudiantes',
                        'Docentes',
                        'Representantes Escenario'
                    ]
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Número de personas'
                    }
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0,
                        dataLabels: {
                            enabled: true,
                            color: "#4572A7",
                            style: {
                                fontWeight: 'bold'
                            },
                            formatter: function() {
                                return this.y + '';
                            }
                        }
                    }
                },
                series: [{
                        name: 'Seleccionados',
                        data: [${totalEst}, ${totalDoc}, ${totalAdm}]

                    }, {
                        name: 'Evaluados',
                        data: [${terminadosEst}, ${terminadosDoc}, ${terminadosAdm}],
                        color: '#89A54E'

                    }],
                tooltip: {
                    formatter: function() {
                        return '<b>' + this.x + '</b>: ' + this.y + ' personas';
                    }
                }

            });
        });
    });
</script>
<div class="page-heading">            
    <h1>Proceso</h1>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">
                    <div id="conte" class="span10">
                        <fieldset>
                            <legend>
                                Estado del proceso
                            </legend>
                            <c:if test="${aux_index2 != 3}">
                                <div class="span10" style="margin-left: 0px;">
                                    <div class="span1" style="margin-left: 0px;"><span class="label label-info span1" id="spanActualizadoEstado" style="margin-left: 0px;">Actualizado</span></div>
                                    <div class="span7" style="margin-left: 30px;"><p class="help-block" id="horaEstado"></p></div>
                                    <div class="span2" style="margin-left: 30px; text-align: right;"><a style="cursor: pointer" id="actEnlaceEstado"><i class="icon-refresh"></i> Actualizar</a></div>
                                </div>
                            </c:if>
                            <div>
                                <p>
                                    Detalle:
                                </p>
                            </div>
                            <table class="table table-striped table-bordered table-condensed">
                                <thead>
                                <th>Descripción</th>
                                <th>Fecha Inicio</th>
                                <th>Fecha Cierre</th>
                                <th>Escenario</th>
                                </thead>
                                <tbody>
                                    <tr> 
                                        <td class="span4">${Proceso.descripcionp}</td>
                                        <td><fmt:formatDate pattern='dd-MM-yyyy' value='${Proceso.fechai}'></fmt:formatDate></td>
                                        <td><fmt:formatDate pattern='dd-MM-yyyy' value='${Proceso.fechaf}'></fmt:formatDate></td>
                                        <td>${Proceso.escenarioidEscenario.nombre}</td>
                                    </tr>
                                </tbody>
                            </table> 
                            <br>
                            <p>Informes: </p>
                            <div>
                                <a  href="<%=request.getContextPath()%>/#informeMatrizFactores" class="btn btn-info"><i class="fa fa-bar-chart-o">  </i>Matriz de calidad por factores</a>
                                <a  href="<%=request.getContextPath()%>/#informeMatrizCaracteristicas" class="btn btn-info"><i class="fa fa-bar-chart-o">  </i>Matriz de calidad por caracter&iacute;sticas</a>
                                <a class="btn btn-info" href="<%=request.getContextPath()%>/#debilidades"><i class="fa fa-thumbs-o-down"></i> Debilidades</a>    
                                <a class="btn btn-info" href="<%=request.getContextPath()%>/#fortalezas"><i class="fa fa-thumbs-o-up"></i> Fortalezas</a>    
                                <a class="btn btn-info" href="<%=request.getContextPath()%>/#recomendaciones"><i class="fa fa-comment-o"></i> Recomendaciones</a>    

                            </div>
                            <br>
                            <p>Estado general del proceso:</p>
                            <table class="table table-striped table-bordered table-condensed">
                                <thead>
                                <th>Número total de muestra</th>
                                <th>Número de personas que han evaluado las encuestas</th>
                                <th>Porcentaje de personas que han evaluado las encuestas</th>
                                <th>Número de personas que faltan por evaluar las encuestas</th>
                                <th>Porcentaje de personas que faltan por evaluar las encuestas</th>
                                </thead>
                                <tbody>

                                    <tr>  
                                        <td>   
                                            <c:out value="${totalMuestraX}"/>
                                        </td>
                                        <td>   
                                            <c:out value="${terminadosX}"/>
                                        </td>
                                        <td>   
                                            <fmt:formatNumber type="number" maxFractionDigits="2" value="${terminadosX*100/totalMuestraX}"/>%
                                        </td>
                                        <td>   
                                            <c:out value="${totalMuestraX-terminadosX}"/>
                                        </td>
                                        <td>   
                                            <fmt:formatNumber type="number" maxFractionDigits="2" value="${100-(terminadosX*100/totalMuestraX)}"/>%
                                        </td>
                                    </tr>


                                </tbody>
                            </table><br>

                            <p>Estado por fuente del proceso:</p>
                            <table class="table table-striped table-bordered table-condensed">
                                <thead>
                                <th>Fuente</th>
                                <th>Número total de muestra</th>
                                <th>Número de personas que han evaluado las encuestas</th>
                                <th>Porcentaje de personas que han evaluado las encuestas</th>
                                <th>Número de personas que faltan por evaluar las encuestas</th>
                                <th>Porcentaje de personas que faltan por evaluar las encuestas</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            ESTUDIANTE
                                        </td>
                                        <td>
                                            ${totalEst}
                                        </td>
                                        <td>
                                            ${terminadosEst}
                                        </td>
                                        <td>   
                                            <c:choose>
                                                <c:when test="${totalEst!=0}">
                                                    <fmt:formatNumber type="number" maxFractionDigits="2" value="${terminadosEst*100/totalEst}"/>%
                                                </c:when>
                                                <c:otherwise>
                                                    0%
                                                </c:otherwise>
                                            </c:choose>

                                        </td>
                                        <td>   
                                            <c:out value="${totalEst-terminadosEst}"/>
                                        </td>
                                        <td>   
                                            <c:choose>
                                                <c:when test="${totalEst!=0}">
                                                    <fmt:formatNumber type="number" maxFractionDigits="2" value="${100-(terminadosEst*100/totalEst)}"/>%
                                                </c:when>
                                                <c:otherwise>
                                                    0%
                                                </c:otherwise>
                                            </c:choose>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            DOCENTE
                                        </td>
                                        <td>
                                            ${totalDoc}
                                        </td>
                                        <td>
                                            ${terminadosDoc}
                                        </td>
                                        <td>   
                                            <c:choose>
                                                <c:when test="${totalDoc!=0}">
                                                    <fmt:formatNumber type="number" maxFractionDigits="2" value="${terminadosDoc*100/totalDoc}"/>%
                                                </c:when>
                                                <c:otherwise>
                                                    0%
                                                </c:otherwise>
                                            </c:choose>

                                        </td>
                                        <td>   
                                            <c:out value="${totalDoc-terminadosDoc}"/>
                                        </td>
                                        <td>   
                                            <c:choose>
                                                <c:when test="${totalDoc!=0}">
                                                    <fmt:formatNumber type="number" maxFractionDigits="2" value="${100-(terminadosDoc*100/totalDoc)}"/>%
                                                </c:when>
                                                <c:otherwise>
                                                    0%
                                                </c:otherwise>
                                            </c:choose>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            REPRESENTANTE ESCENARIO
                                        </td>
                                        <td>
                                            ${totalAdm}
                                        </td>
                                        <td>
                                            ${terminadosAdm}
                                        </td>
                                        <td>   
                                            <c:choose>
                                                <c:when test="${totalAdm!=0}">
                                                    <fmt:formatNumber type="number" maxFractionDigits="2" value="${terminadosAdm*100/totalAdm}"/>%
                                                </c:when>
                                                <c:otherwise>
                                                    0%
                                                </c:otherwise>
                                            </c:choose>

                                        </td>
                                        <td>   
                                            <c:out value="${totalAdm-terminadosAdm}"/>
                                        </td>
                                        <td>   
                                            <c:choose>
                                                <c:when test="${totalAdm!=0}">
                                                    <fmt:formatNumber type="number" maxFractionDigits="2" value="${100-(terminadosAdm*100/totalAdm)}"/>%
                                                </c:when>
                                                <c:otherwise>
                                                    0%
                                                </c:otherwise>
                                            </c:choose>

                                        </td>

                                    </tr>
                                <div id="container" style="height: 500px; margin: 0 auto" class="span10"></div>             
                                <br>
                                </tbody>
                            </table>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


