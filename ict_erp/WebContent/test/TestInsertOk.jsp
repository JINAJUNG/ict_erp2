<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<%
	String itNo = request.getParameter("itNo");
	String itText = request.getParameter("itText");

	Connection con = DBCon.getCon();
	String sql = "insert into ict_test values(?,?)";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, itNo);
	ps.setString(2, itText);

	int rNum = ps.executeUpdate();
ps.close();
DBCon.closeCon();
	if (rNum == 1) {
%>
<script>
alert("ict_test에 정상 저장 되었습니다.");
location.href="<%=rPath%>test/testList.jsp";

</script>
<%
	}else{
%>
<script>
alert("저장 니니");
location.href="<%=rPath%>test/testInsert.jsp";

</script>

<%
	}
%>