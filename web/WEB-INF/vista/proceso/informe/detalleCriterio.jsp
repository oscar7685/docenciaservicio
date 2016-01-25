<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">

    .inicial td {
        text-align: right;
    }
</style>



<script type="text/javascript">
    $(document).ready(function() {
    $('.tool').tooltip().click(function(e){
    $(this).tooltip('hide');
    })
    });<c:choose>
        <c:when test="${criterio.preguntaList.size()!= 0}">
    $(function () {
    var chart;
            var chart2 = new Array(${criterio.preguntaList.size()});
            var indicad = "${criterio.descripcion}".split(" ");
            var max2 = 70;
            var acom2 = 0;
            var finali2 = "";
            for (var i = 0; i < indicad.length; i++){
    acom2 += indicad[i].length;
            if (acom2 < max2){
    finali2 += indicad[i] + " ";
    } else{
    acom2 = 0;
            finali2 += "<br/>" + indicad[i] + " ";
    }
    }
            <c:forEach items="${criterio.preguntaList}" var="pregunta" varStatus="status" >
    chart2[${status.index}] = new Highcharts.Chart({
    chart: {
    renderTo: 'container${pregunta.idPregunta}',
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false

    },
            title: {
    text: null
    },
            subtitle: {
    text: '${pregunta.enunciado}'
    },
            plotOptions: {
    pie: {
    allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
    enabled: true,
            color: '#000000',
            connectorColor: '#000000',
            formatter: function() {
    var igv = this.percentage;
            igv = igv.toFixed(2);
            return '<b>' + this.point.name + '</b>: ' + igv + ' %';
    }
    }
    }
    },
            tooltip: {
    formatter: function() {
    return '' +
            this.point.name + ': ' + this.y + ' personas';
    }
    },
            series: [{
    type: 'pie',
            name: 'Personas',
            data: [
            ['0', ${ceros[status.index]}],
            ['1', ${unos[status.index]}],
            ['2', ${dos[status.index]}],
            ['3', ${tres[status.index]}],
            ['4', ${cuatros[status.index]}],
    {
    name: '5',
            y: ${cincos[status.index]},
            sliced: true,
            selected: true },
    ]
    }]


    });</c:forEach>
            chart = new Highcharts.Chart({
    chart: {
    renderTo: 'grafica',
            type: 'column',
            margin: [ 50, 30, 100, 50]
    },
            title: {
    text: "" + finali2 + ""
    },
            xAxis: {
    categories: [
            <c:forEach items="${criterio.preguntaList}" var="detalleP" varStatus="status">
                <c:choose>
                    <c:when test="${criterio.preguntaList.size()!=status.index+1}">
                    '${detalleP.idPregunta}-${detalleP.enunciado}',</c:when><c:otherwise>
                            '${detalleP.idPregunta}-${detalleP.enunciado}'
                    </c:otherwise>
                </c:choose>             

            </c:forEach>
                ],
                        labels: {
                formatter: function() {
                var partes = this.value.split("-");
                        return "Pregunta " + partes[0];
                },
                        rotation: - 45,
                        align: 'right',
                        style: {
                fontSize: '12px',
                        fontFamily: 'Verdana, sans-serif'
                }
                }
                },
                        plotOptions: {
                series: {
                cursor: 'pointer',
                        point: {
                events: {
                click: function() {
                var partes2 = this.category.split("-");
                        var a = $("a[data='" + partes2[1] + "']");
                        location = a.attr("href");
                }
                }
                }
                }
                },
                        yAxis: {
                min: 0,
                        max: 5,
                        title: {
                text: 'Grado de cumplimiento'
                }
                },
                        legend: {
                enabled: false
                },
                        tooltip: {
                formatter: function() {
                var pregunta = this.x.split(" ");
                        var max = 50;
                        var acom = 0;
                        var finali = "";
                        for (var i = 0; i < pregunta.length; i++){
                acom += pregunta[i].length;
                        if (acom < max){
                finali += pregunta[i] + " ";
                } else{
                acom = 0;
                        finali += "</b><br/><b>" + pregunta[i] + " ";
                }

                }

                return '<b>' + finali + '</b><br/>' +
                        'Cumplimiento: ' + Highcharts.numberFormat(this.y, 2) +
                        '';
                }
                },
                        series: [{
                name: 'Preguntas',
                        data: [
            <c:forEach items="${criterio.preguntaList}" var="detalleI2" varStatus="status33">
                <c:choose>
                    <c:when test="${criterio.preguntaList.size()!=status33.index+1}">
                        <c:choose>
                            <c:when test="${promediorepuestas[status33.index]>=4.5}">
                            {
                            y: ${promediorepuestas[status33.index]},
                                    color: '#89A54E'
                            },</c:when>
                            <c:when test="${promediorepuestas[status33.index]<4.5 && promediorepuestas[status33.index]>=4.0}">
                            {
                            y: ${promediorepuestas[status33.index]},
                                    color: '#80699B'
                            },</c:when>
                            <c:when test="${promediorepuestas[status33.index]<4.0 && promediorepuestas[status33.index]>=3.0}">
                            {
                            y: ${promediorepuestas[status33.index]},
                                    color: '#3D96AE'
                            },</c:when>
                            <c:when test="${promediorepuestas[status33.index]<3.0 && promediorepuestas[status33.index]>=2.0}">
                            {
                            y: ${promediorepuestas[status33.index]},
                                    color: '#DB843D'
                            },</c:when><c:otherwise>
                            {
                            y: ${promediorepuestas[status33.index]},
                                    color: '#AA4643'
                            },</c:otherwise></c:choose>






                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${promediorepuestas[status33.index]>=4.5}">
                            {
                            y: ${promediorepuestas[status33.index]},
                                    color: '#89A54E'
                            }

                            </c:when>
                            <c:when test="${promediorepuestas[status33.index]<4.5 && promediorepuestas[status33.index]>=4.0}">
                                {
                                y: ${promediorepuestas[status33.index]},
                                        color: '#80699B'
                                }

                            </c:when>
                            <c:when test="${promediorepuestas[status33.index]<4.0 && promediorepuestas[status33.index]>=3.0}">
                                {
                                y: ${promediorepuestas[status33.index]},
                                        color: '#3D96AE'
                                }

                            </c:when>
                            <c:when test="${promediorepuestas[status33.index]<3.0 && promediorepuestas[status33.index]>=2.0}">
                                {
                                y: ${promediorepuestas[status33.index]},
                                        color: '#DB843D'
                                }

                            </c:when>
                            <c:otherwise>
                                {
                                y: ${promediorepuestas[status33.index]},
                                        color: '#AA4643'
                                }
                            </c:otherwise>
                        </c:choose>





                    </c:otherwise>
                </c:choose>             

            </c:forEach>


                ],
                        dataLabels: {
                enabled: true,
                        rotation: - 90,
                        color: '#FFFFFF',
                        align: 'right',
                        x: - 3,
                        y: 10,
                        formatter: function() {
                return this.y;
                },
                        style: {
                fontSize: '13px',
                        fontFamily: 'Verdana, sans-serif'
                }
                }
                }]
                });
                });
        </c:when>
    </c:choose>
</script>
<div class="page-heading">            
    <h1>Detalle Criterio</h1>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">
                    <div id="conte" class="span10">
                        <legend>Criterio: ${criterio.descripcion}</legend>
                        <ul class="breadcrumb">
                            <li><a href="<%=request.getContextPath()%>/#informeMatrizFactores">Matriz de Calidad de Factores</a> <span class="divider">/</span></li>
                            <li><a href="<%=request.getContextPath()%>/#informeMatrizCaracteristicas">Matriz de Calidad de Características</a> <span class="divider">/</span></li>
                            <li><a class="tool" data-placement="top" rel="tooltip" data-original-title="${criterio.caracteristicaidCaracteristica.factoridFactor.nombreF}" href="#detalleFactor&id=${criterio.caracteristicaidCaracteristica.factoridFactor.idFactor}">Factor ${criterio.caracteristicaidCaracteristica.factoridFactor.idFactor}</a> <span class="divider"></span></li>
                            <li><a class="tool" data-placement="top" rel="tooltip" data-original-title="${criterio.caracteristicaidCaracteristica.nombreC}"  href="#detalleCaracteristica&id=${criterio.caracteristicaidCaracteristica.idCaracteristica}" data="${criterio.caracteristicaidCaracteristica.nombreC}">Característica ${criterio.caracteristicaidCaracteristica.idCaracteristica}</a><span class="divider"></span></li>
                            <li class="active tool" data-placement="top" rel="tooltip" data-original-title="${criterio.descripcion}">Criterio ${criterio.idCriterio}</li>
                        </ul>
                        <br>

                        <c:choose>
                            <c:when test="${documental!= null}">
                                <h3>Informaci&oacute;n Documental</h3>
                                <table class="table table-striped table-bordered table-condensed inicial">
                                    <thead>
                                    <th>Documentos</th>
                                    <th>Responsable</th>
                                    <th>Medio</th>
                                    <th>Lugar</th>
                                    <th>Evaluaci&oacute;n</th>
                                    <th>Acci&oacute;n</th>
                                    </thead>
                                    <tbody>

                                        <tr>
                                            <td style="text-align: left">   
                                                <c:out value="${documental.documento}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                <c:out value="${documental.responsable}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                <c:out value="${documental.medio}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                <c:out value="${documental.lugar}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                <c:out value="${documental.evaluacion}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                <c:out value="${documental.accion}"/>
                                            </td>
                                        <tr>

                                    </tbody>
                                </table>
                            </c:when>
                        </c:choose>

                        <c:choose>
                            <c:when test="${criterio.preguntaList.size()!= 0}">
                                <h3>Encuesta</h3>
                                <table class="table table-striped table-bordered table-condensed">
                                    <thead>
                                    <th>C&oacute;digo</th>
                                    <th>Pregunta</th>
                                    <th>Promedio respuesta</th>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${criterio.preguntaList}" var="row" varStatus="itera">
                                            <tr>
                                                <td style="text-align: left">   
                                                    <c:out value="${row.idPregunta}"/>
                                                </td>
                                                <td style="text-align: left">   
                                                    <a href="#detallePregunta&id=${row.idPregunta}" data="${row.enunciado}">${row.enunciado}</a> 
                                                </td>
                                                <td>
                                                    <div class="btn-group pull-right">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                                                            ${promediorepuestas[itera.index]} <span class="caret"></span>
                                                        </a>
                                                        <ul class="dropdown-menu" style="padding-top: 0px;">
                                                            <div id="container${row.idPregunta}" style="min-width: 850px; height: 400px; margin: 0 auto"></div>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <br/>
                                <div id="grafica" style="height: 500px; margin: 0 auto" class="span10"></div>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Escala</th>
                                            <th>Descripci&oacute;n</th>
                                            <th>Grado de cumplimiento</th>
                                        </tr>
                                    </thead>
                                    <tbody style="color: #ffffff;">
                                        <tr style="background-color: #89A54E;">
                                            <td>
                                                4.5 a 5.0
                                            </td>
                                            <td>
                                                Se cumple plenamente
                                            </td>
                                            <td>
                                                90% a 100%
                                            </td>
                                        </tr>
                                        <tr style="background-color: #80699B;">
                                            <td>
                                                4.0 a 4.4
                                            </td>
                                            <td>
                                                Se cumple en alto grado
                                            </td>
                                            <td>
                                                80% a 89%
                                            </td>
                                        </tr>
                                        <tr style="background-color: #3D96AE;">
                                            <td>
                                                3.0 a 3.9
                                            </td>
                                            <td>
                                                Se cumple en mediano grado
                                            </td>
                                            <td>
                                                60% a 79%
                                            </td>
                                        </tr>
                                        <tr style="background-color: #DB843D;">
                                            <td>
                                                2.0 a 2.9
                                            </td>
                                            <td>
                                                Se cumple en bajo grado
                                            </td>
                                            <td>
                                                40% - 59%
                                            </td>
                                        </tr>
                                        <tr style="background-color: #AA4643;">
                                            <td>
                                                1.0 a 1.9
                                            </td>
                                            <td>
                                                No se cumple
                                            </td>
                                            <td>
                                                0% - 39%
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                                <div id="container"></div>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>    
        </div>
    </div>
</div>
