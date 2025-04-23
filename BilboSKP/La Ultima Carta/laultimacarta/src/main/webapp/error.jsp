<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><fmt:message key="error" /></title>
    <link rel="stylesheet" href="css/stylesranking.css">
    <link rel="icon" href="Img/baldosa.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <%@ include file="/WEB-INF/includes/header.jsp"%>

    <main>
        <div class="max-width">
            <div class="page-header">
                <h1><fmt:message key="error" /></h1>
            </div>

            <div class="card">
                <div class="card-header">
                    <div class="card-badge error">
                        <span class="icon icon-error"></span>
                        <span><fmt:message key="error_acceso" /></span>
                    </div>
                    <h2 class="card-title"><fmt:message key="error_permisos" /></h2>
                </div>

                <div class="card-content">
                    <div class="message error">
                        <p>${error}</p>
                    </div>
                    
                    <div class="action-buttons">
                        <a href="inicio" class="btn btn-primary"><fmt:message key="volver_inicio" /></a>
                        <a href="ranking" class="btn btn-secondary"><fmt:message key="ver_ranking_nacional" /></a>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="/WEB-INF/includes/footer.jsp"%>
    <%@ include file="/WEB-INF/includes/headerScripts.jsp"%>
</body>
</html>