<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<%
session.invalidate();
%>
<script>
alert("로그아웃 성공");
location.href="<%=rPath%>/views/index.jsp";
</script>