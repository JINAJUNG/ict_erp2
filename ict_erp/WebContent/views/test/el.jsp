<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp" %>
<%
String name = "정진아";
request.setAttribute("name", name);
%>
<body>
${name}
</body>
</html>