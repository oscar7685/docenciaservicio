<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="page-heading">            
    <h1>Fortalezas</h1>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <c:choose>
                    <c:when test="${fn:length(estudiantes)!= 0}">
                        <table class="table table-bordered">
                            <thead style="background-color: #ffffff;">
                                <tr>
                                    <th>Fortalezas dadas por estudiantes</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${estudiantes}" var="est" varStatus="status">
                                    <tr>
                                        <td>${est.fortalezas}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>   
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${fn:length(docentes)!= 0}">
                        <table class="table table-bordered">
                            <thead style="background-color: #ffffff;">
                                <tr>
                                    <th>Fortalezas dadas por docentes</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${docentes}" var="doc" varStatus="status">
                                    <tr>
                                        <td>${doc.fortalezas}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>   
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${fn:length(ipeses)!= 0}">
                        <table class="table table-bordered">
                            <thead style="background-color: #ffffff;">
                                <tr>
                                    <th>Fortalezas dadas por IPS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${ipeses}" var="ips" varStatus="status">
                                    <tr>
                                        <td>${ips.fortalezas}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>   
                    </c:when>
                </c:choose>

            </div>
        </div>
    </div>
</div>

