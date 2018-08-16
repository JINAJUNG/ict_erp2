<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp" %>
<body>
<form action="<%=rPath%>test/TestInsertOk.jsp">
번호 : <input type="text" name="itNo">
Text : <input type="text" name="itText">
<button>저장</button>
</form>
</body>
</html>