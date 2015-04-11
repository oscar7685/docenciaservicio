<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                            <form action="" class="form row-border">
                                
                            <div class="form-group">
					<label class="col-sm-10 control-label">Ingrese el archivo con la poblacion asociada al escenario ${proceso.escenarioidEscenario.nombre}</label>
					<div class="col-sm-10">
						<div class="fileinput fileinput-new" data-provides="fileinput">
							<div class="input-group">
								<div class="form-control uneditable-input" data-trigger="fileinput">
									<i class="fa fa-file fileinput-exists"></i>&nbsp;<span class="fileinput-filename"></span>
								</div>
								<span class="input-group-btn">
									<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
									<span class="btn btn-default btn-file">
										<span class="fileinput-new">Seleccionar archivo</span>
										<span class="fileinput-exists">Cambiar</span>
										<input type="file" name="...">
									</span>
									
								</span>
							</div>
						</div>
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
