<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp" %>
<body>
<%="application : "+application.getAttribute("app") %><br>
<%="session : "+session.getAttribute("sess") %><br>
<%="request : "+request.getAttribute("req") %><br>
<%="page : "+pageContext.getAttribute("page") %>
</body>
</html>