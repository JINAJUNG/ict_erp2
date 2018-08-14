<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp" %>
<body>
<%
	request.setCharacterEncoding("utf-8"); //form의 method방식이 get이면 해줄필요 없고 post는 해줘야한다.
	Map<String,String[]> params = request.getParameterMap();
	Iterator<String> it = params.keySet().iterator();
	
	while(it.hasNext()){
		String key = (String)it.next();
		out.print(key+" : ");
		for(String value : params.get(key)){
			out.print(value+" ");
		}
		out.print("<br>");
	}
%>
</body>
</html>