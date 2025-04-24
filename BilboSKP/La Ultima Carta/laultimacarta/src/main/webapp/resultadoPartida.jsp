<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><fmt:message key="resultado_partida" /></title>
    <link rel="stylesheet" href="css/stylesranking.css">
    <link rel="icon" href="Img/baldosa.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <%@ include file="/WEB-INF/includes/header.jsp"%>

    <main>
        <div class="max-width">
            <div class="page-header">
                <h1><fmt:message key="resultado_partida" /></h1>
            </div>

            <div class="card">
                <div class="card-header">
                    <c:if test="${not empty mensaje}">
                        <div class="card-badge">
                            <span class="icon icon-success"></span>
                            <span><fmt:message key="exito" /></span>
                        </div>
                    </c:if>
                    <c:if test="${not empty error}">
                        <div class="card-badge">
                            <span class="icon icon-error"></span>
                            <span><fmt:message key="error" /></span>
                        </div>
                    </c:if>
                    <h2 class="card-title"><fmt:message key="partida_finalizada" /></h2>
                </div>

                <div class="card-content">
                    <c:if test="${not empty mensaje}">
                        <div class="success-box">
                            <p>${mensaje}</p>
                            <p><fmt:message key="ranking_actualizado" /></p>
                        </div>
                    </c:if>
                    
                    <c:if test="${not empty error}">
                        <div class="error-box">
                            <p>${error}</p>
                        </div>
                    </c:if>
                    
                    <div class="action-buttons">
                        <a href="ranking?tipo=clases" class="btn btn-primary"><fmt:message key="ver_ranking" /></a>
                        <a href="inicio" class="btn btn-secondary"><fmt:message key="volver_inicio" /></a>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="/WEB-INF/includes/footer.jsp"%>
    <%@ include file="/WEB-INF/includes/headerScripts.jsp"%>
</body>
</html>