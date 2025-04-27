<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/includes/idioma.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><fmt:message key="confirmar_reinicio_ranking" /></title>
    <link rel="stylesheet" href="css/stylesranking.css">
    <link rel="icon" href="Img/baldosa.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <%@ include file="/WEB-INF/includes/header.jsp"%>

    <main>
        <div class="max-width">
            <div class="page-header">
                <h1><fmt:message key="confirmar_reinicio_ranking" /></h1>
            </div>

            <div class="card">
                <div class="card-header">
                    <div class="card-badge">
                        <span class="icon icon-warning"></span>
                        <span><fmt:message key="atencion" /></span>
                    </div>
                    <h2 class="card-title"><fmt:message key="reinicio_ranking_advertencia" /></h2>
                </div>

                <div class="card-content">
                    <div class="warning-box">
                        <p><fmt:message key="reinicio_ranking_descripcion" /></p>
                        <ul>
                            <li><fmt:message key="reinicio_ranking_punto1" /></li>
                            <li><fmt:message key="reinicio_ranking_punto2" /></li>
                            <li><fmt:message key="reinicio_ranking_punto3" /></li>
                        </ul>
                        <p><fmt:message key="reinicio_ranking_confirmacion" /></p>
                    </div>
                    
                    <div class="action-buttons">
                        <form action="reiniciarRanking" method="post">
                            <input type="hidden" name="confirmar" value="si">
                            <button type="submit" class="btn btn-danger"><fmt:message key="si_reiniciar" /></button>
                        </form>
                        <a href="ranking?tipo=clases" class="btn btn-secondary"><fmt:message key="no_cancelar" /></a>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="/WEB-INF/includes/footer.jsp"%>
    <%@ include file="/WEB-INF/includes/headerScripts.jsp"%>
</body>
</html>