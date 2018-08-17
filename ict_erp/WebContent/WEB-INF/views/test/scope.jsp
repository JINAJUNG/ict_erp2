<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<%-- <c:set var="title" value="abc" /> <!-- var 변수(키), value 값, {scope="request"}scope는 default가 page--> --%>
<%
application.setAttribute("app","내가 짱"); //서버
session.setAttribute("sess", "부짱"); //브라우저
request.setAttribute("req", "난 삼둥이"); //리퀘스트
pageContext.setAttribute("page", "난 막둥이"); //페이지

RequestDispatcher rd = request.getRequestDispatcher("print.jsp");
rd.forward(request, response);
%>
<body>

</body>
</html>