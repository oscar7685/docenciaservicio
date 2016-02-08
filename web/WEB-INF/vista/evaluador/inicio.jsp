<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Docencia servicio</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-touch-fullscreen" content="yes">
        <meta name="description" content="Avalon Admin Theme">
        <meta name="author" content="The Red Team">

        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400italic,700' rel='stylesheet' type='text/css'>

        <!--[if lt IE 10]>
            <script src="assets/js/media.match.min.js"></script>
            <script src="assets/js/placeholder.min.js"></script>
        <![endif]-->

        <link href="assets/fonts/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet">        <!-- Font Awesome -->
        <link href="assets/css/styles.css" type="text/css" rel="stylesheet">                                     <!-- Core CSS with all styles -->

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries. Placeholdr.js enables the placeholder attribute -->
        <!--[if lt IE 9]>
            <link href="assets/css/ie8.css" type="text/css" rel="stylesheet">
            <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
            <script type="text/javascript" src="assets/plugins/charts-flot/excanvas.min.js"></script>
            <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <!-- The following CSS are included as plugins and can be removed if unused-->

        <!--css para tablas-->
        <link href="assets/plugins/datatables/dataTables.bootstrap.css" type="text/css" rel="stylesheet">
        <link href="assets/plugins/datatables/dataTables.fontAwesome.css" type="text/css" rel="stylesheet">
        <!---->


    </head>

    <body class="infobar-offcanvas" style="background-color: #fff;">


        <header id="topnav" class="navbar navbar-inverse navbar-fixed-top clearfix" role="banner">
            <ul class="nav navbar-nav toolbar pull-right">

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle username" data-toggle="dropdown">
                        <span class="hidden-xs">${fuente.nombre} ${fuente.apellido}</span>
                        <img class="img-circle" src="assets/demo/avatar/avatar_06.png" alt="Dangerfield" />

                    </a>
                    <ul class="dropdown-menu userinfo">
                        <li><a href="#CerrarSesion"><span class="pull-left">Cerrar Sesi&oacute;n</span> <i class="pull-right fa fa-sign-out"></i></a></li>
                    </ul>
                </li>

            </ul>

        </header>

        <div id="wrapper">
            <div id="layout-static">
                <div class="static-content-wrapper">
                    <div class="static-content" style="margin-bottom: 0px;">
                        <div class="container-fluid">
                            <div class="row" style="background-color: #fff;">
                                <div class="col-md-offset-2 col-md-8">
                                    <br/>
                                    <br/>
                                    <h1>Listado de  Encuestas Disponibles</h1>
                                    <c:choose>
                                        <c:when test="${estudiantesConEncuesta!=null && fn:length(estudiantesConEncuesta)!= 0}">
                                            <table class="table table-striped table-bordered table-condensed">
                                                <thead>
                                                <th>Encuesta</th>
                                                <th>Escenario</th>
                                                <th></th>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${estudiantesConEncuesta}" var="estudiante" varStatus="iter">
                                                        <tr>    
                                                            <td>   
                                                                <c:out value="${cuestionarioEstudiantes.nombre}"/>
                                                            </td>
                                                            <td>
                                                                <c:out value="${estudiante.procesoIdproceso.escenarioidEscenario.nombre}"/>
                                                            </td>
                                                            <td> 
                                                                <a title="Responder Encuesta" href="#responderEncuesta&cuestionario=${cuestionarioEstudiantes.idCuestionario}&proceso=${estudiante.getProcesoIdproceso().idproceso}">Responder encuesta </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                            <br/>            
                                            <h5 style="text-align: center;">Usted ha sido seleccionado al azar para diligenciar una sencilla encuesta de caracter an&oacute;nimo y voluntario, Recuerde que su participaci&oacute;n es fundamental en el proceso de autoevaluaci&oacute;n de los anteriores escenarios</h5>
                                        </c:when>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${docentesConEncuesta!=null && fn:length(docentesConEncuesta)!= 0}">
                                            <table class="table table-striped table-bordered table-condensed">
                                                <thead>
                                                <th>Encuesta</th>
                                                <th>Escenario</th>
                                                <th></th>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${docentesConEncuesta}" var="docente" varStatus="iter">
                                                        <tr>    
                                                            <td>   
                                                                <c:out value="${cuestionarioDocentes.nombre}"/>
                                                            </td>
                                                            <td>
                                                                <c:out value="${docente.procesoIdproceso.escenarioidEscenario.nombre}"/>
                                                            </td>
                                                            <td> 
                                                                <a title="Responder Encuesta" href="#responderEncuesta&cuestionario=${cuestionarioDocentes.idCuestionario}&proceso=${docente.getProcesoIdproceso().idproceso}">Responder encuesta </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                            <br/>            
                                            <h5 style="text-align: center;">Usted ha sido seleccionado al azar para diligenciar una sencilla encuesta de caracter an&oacute;nimo y voluntario, Recuerde que su participaci&oacute;n es fundamental en el proceso de autoevaluaci&oacute;n de los anteriores escenarios</h5>
                                        </c:when>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${representantesConEncuesta!=null && fn:length(representantesConEncuesta)!= 0}">
                                            <table class="table table-striped table-bordered table-condensed">
                                                <thead>
                                                <th>Encuesta</th>
                                                <th>Escenario</th>
                                                <th></th>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${representantesConEncuesta}" var="representante" varStatus="iter">
                                                        <tr>    
                                                            <td>   
                                                                <c:out value="${cuestionarioRepresentantes.nombre}"/>
                                                            </td>
                                                            <td>
                                                                <c:out value="${representante.procesoIdproceso.escenarioidEscenario.nombre}"/>
                                                            </td>
                                                            <td> 
                                                                <a title="Responder Encuesta" href="#responderEncuesta&cuestionario=${cuestionarioRepresentantes.idCuestionario}&proceso=${representante.getProcesoIdproceso().idproceso}">Responder encuesta </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                            <br/>            
                                            <h5 style="text-align: center;">Usted ha sido seleccionado al azar para diligenciar una sencilla encuesta de caracter an&oacute;nimo y voluntario, Recuerde que su participaci&oacute;n es fundamental en el proceso de autoevaluaci&oacute;n de los anteriores escenarios</h5>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${(estudiantesConEncuesta==null || fn:length(estudiantesConEncuesta)== 0) 
                                                        && (docentesConEncuesta==null || fn:length(docentesConEncuesta)== 0)
                                                        && (representantesConEncuesta==null || fn:length(representantesConEncuesta)== 0)   }">
                                                No Existen Encuestas Disponibles.


                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="modalCc1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h2 class="modal-title">Atenci&oacute;n!</h2>
                    </div>
                    <div class="modal-body">
                        <h4>Ejecutar Proceso de Autoevaluaci&oacute;n.</h4>
                        <br>
                        <p style="text-align: justify">Esta seguro que desea ejecutar el Proceso?.</p>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" id="modalCc1b2" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" id="modalCc1b1">Ejecutar Proceso</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="modal fade" id="modalCp2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h2 class="modal-title">Atenci&oacute;n!</h2>
                    </div>
                    <div class="modal-body">
                        <h4>Ejecutar Proceso de Autoevaluaci&oacute;n</h4>
                        <br>
                        <p>Debe configurar todo el proceso para continuar.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->


        <!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script> -->

        <script src="assets/js/jquery-1.10.2.min.js"></script> 							<!-- Load jQuery -->
        <script src="assets/js/jqueryui-1.9.2.min.js"></script> 							<!-- Load jQueryUI -->
        <script src="assets/js/bootstrap.min.js"></script> 								<!-- Load Bootstrap -->
        <script src="js/jquery.hashchange.min.js"></script> <!-- hashchange-->
        <script src="js/evaluador.js"></script>

    </body>
</html>