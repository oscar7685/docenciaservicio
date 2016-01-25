<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">

    .inicial td {
        text-align: right;
    }
</style>
<script type="text/javascript">
    $(function () {
    var chart;
            var chart2 = new Array(${encuestas.size()});
            var pregunta = "${pregunta.enunciado}".split(" ");
            var max = 70;
            var acom = 0;
            var finali = "";
            for (var i = 0; i < pregunta.length; i++){
    acom += pregunta[i].length;
            if (acom < max){
    finali += pregunta[i] + " ";
    } else{
    acom = 0;
            finali += "<br/>" + pregunta[i] + " ";
    }
    }

    $(document).ready(function() {
    $('.tool').tooltip().click(function(e){
    $(this).tooltip('hide');
    })


    <c:forEach items="${encuestas}" var="encuesta" varStatus="status" >
    chart2[${status.index}] = new Highcharts.Chart({
    chart: {
    renderTo: 'container${encuesta.idCuestionario}',
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false

    },
            title: {
    text: null
    },
            subtitle: {
    text: '${encuesta.nombre}'
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
            ['0', ${cerosE[status.index]}],
            ['1', ${unosE[status.index]}],
            ['2', ${dosE[status.index]}],
            ['3', ${tresE[status.index]}],
            ['4', ${cuatrosE[status.index]}],
    {
    name: '5',
            y: ${cincosE[status.index]},
            sliced: true,
            selected: true
    },
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
    text: "" + finali + ""
    },
            xAxis: {
    categories: [
    <c:forEach items="${encuestas}" var="detalleE" varStatus="status">
        <c:choose>
            <c:when test="${encuestas.size()!=status.index+1}">
            '${detalleE.nombre}',</c:when><c:otherwise>
                    '${detalleE.nombre}'
            </c:otherwise>
        </c:choose>             

    </c:forEach>
        ],
                labels: {
        formatter: function() {
        return this.value;
        },
                align: 'right',
                style: {
        fontSize: '10px',
                fontFamily: 'Verdana, sans-serif'
        }
        }
        },
                yAxis: {
        min: 0,
                max: 5,
                title: {
        text: 'Promedio de respuesta'
        }
        },
                legend: {
        enabled: false
        },
                tooltip: {
        formatter: function() {
        return '<b>' + this.x + '</b><br/>' +
                'Promedio de respuestas: ' + Highcharts.numberFormat(this.y, 2) +
                '';
        }
        },
                series: [{
        name: 'Encuesta',
                data: [
    <c:forEach items="${encuestas}" var="detalleP2" varStatus="status33">
        <c:choose>
            <c:when test="${encuestas.size()!=status33.index+1}">
                <c:choose>
                    <c:when test="${promediorepuestasE[status33.index]>=4.5}">
                    {
                    y: ${promediorepuestasE[status33.index]},
                            color: '#89A54E'
                    },</c:when>
                    <c:when test="${promediorepuestasE[status33.index]<4.5 && promediorepuestasE[status33.index]>=4.0}">
                    {
                    y: ${promediorepuestasE[status33.index]},
                            color: '#80699B'
                    },</c:when>
                    <c:when test="${promediorepuestasE[status33.index]<4.0 && promediorepuestasE[status33.index]>=3.0}">
                    {
                    y: ${promediorepuestasE[status33.index]},
                            color: '#3D96AE'
                    },</c:when>
                    <c:when test="${promediorepuestasE[status33.index]<3.0 && promediorepuestasE[status33.index]>=2.0}">
                    {
                    y: ${promediorepuestasE[status33.index]},
                            color: '#DB843D'
                    },</c:when><c:otherwise>
                    {
                    y: ${promediorepuestasE[status33.index]},
                            color: '#AA4643'
                    },</c:otherwise></c:choose>






            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${promediorepuestasE[status33.index]>=4.5}">
                    {
                    y: ${promediorepuestasE[status33.index]},
                            color: '#89A54E'
                    }

                    </c:when>
                    <c:when test="${promediorepuestasE[status33.index]<4.5 && promediorepuestasE[status33.index]>=4.0}">
                        {
                        y: ${promediorepuestasE[status33.index]},
                                color: '#80699B'
                        }

                    </c:when>
                    <c:when test="${promediorepuestasE[status33.index]<4.0 && promediorepuestasE[status33.index]>=3.0}">
                        {
                        y: ${promediorepuestasE[status33.index]},
                                color: '#3D96AE'
                        }

                    </c:when>
                    <c:when test="${promediorepuestasE[status33.index]<3.0 && promediorepuestasE[status33.index]>=2.0}">
                        {
                        y: ${promediorepuestasE[status33.index]},
                                color: '#DB843D'
                        }

                    </c:when>
                    <c:otherwise>
                        {
                        y: ${promediorepuestasE[status33.index]},
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
        });
</script>
<div class="page-heading">            
    <h1>Detalle Pregunta</h1>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">
                    <div id="conte" class="span10">
                        <br/>
                        <legend>Pregunta: ${pregunta.enunciado}</legend>
                        <ul class="breadcrumb">
                            <li><a href="<%=request.getContextPath()%>/#informeMatrizFactores">Matriz de Calidad de Factores</a> <span class="divider">/</span></li>
                            <li><a href="<%=request.getContextPath()%>/#informeMatriz">Matriz de Calidad de Características</a> <span class="divider">/</span></li>
                            <li><a class="tool" data-placement="top" rel="tooltip" data-original-title="${pregunta.criterioidCriterio.caracteristicaidCaracteristica.factoridFactor.nombreF}" href="#detalleFactor&id=${pregunta.criterioidCriterio.caracteristicaidCaracteristica.factoridFactor.idFactor}">Factor ${pregunta.criterioidCriterio.caracteristicaidCaracteristica.factoridFactor.idFactor}</a> <span class="divider">/</span></li>
                            <li><a class="tool" data-placement="top" rel="tooltip" data-original-title="${pregunta.criterioidCriterio.caracteristicaidCaracteristica.nombreC}" href="#detalleCaracteristica&id=${pregunta.criterioidCriterio.caracteristicaidCaracteristica.idCaracteristica}">Característica ${pregunta.criterioidCriterio.caracteristicaidCaracteristica.idCaracteristica}</a><span class="divider">/</span></li>
                            <li><a class="tool" data-placement="top" rel="tooltip" data-original-title="${pregunta.criterioidCriterio.descripcion}" href="#detalleCriterio&id=${pregunta.criterioidCriterio.idCriterio}">Criterio ${pregunta.criterioidCriterio.idCriterio}</a><span class="divider">/</span></li>
                            <li class="active tool" data-placement="top" rel="tooltip" data-original-title="${pregunta.enunciado}">Pregunta ${pregunta.idPregunta}</li>
                        </ul>
                        <br>
                        <c:choose>
                            <c:when test="${encuestas.size()!= 0}">

                                <table class="table table-striped table-bordered table-condensed inicial">
                                    <thead>
                                    <th>Encuesta</th>
                                    <th>Promedio respuesta</th>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${encuestas}" var="row" varStatus="iter">
                                            <tr>
                                                <td style="text-align: left">   
                                                    <c:out value="${row.nombre}"/>
                                                </td>
                                                <td>   
                                                    <div class="btn-group pull-right">
                                                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
                                                            ${promediorepuestasE[iter.index]} <span class="caret"></span>
                                                        </a>
                                                        <ul class="dropdown-menu" style="padding-top: 0px;">
                                                            <div id="container${row.idCuestionario}" style="min-width: 850px; height: 400px; margin: 0 auto"></div>
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
                            </c:when>
                            <c:otherwise>
                                No Existen Hay datos Registrados en el Sistema.
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>    
        </div>
    </div>
</div>