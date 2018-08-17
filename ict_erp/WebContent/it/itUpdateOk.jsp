<%@page import="common.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<%
String itNo = request.getParameter("itNo");
String itText = request.getParameter("itText");
String itPwd = request.getParameter("itPwd");
 Connection con = DBCon.getCon();
String sql = "update ict_test set itText=?, itPwd=? where itNo=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,itText);
ps.setString(2,itPwd);
ps.setString(3,itNo);
 int cnt = ps.executeUpdate();
if(cnt==1){
	con.commit();
%>
	<script>
		alert("정상 수정!!");
		location.href="<%=rPath%>test/testList.jsp";
	</script>
<%
}
ps.close();
DBCon.closeCon();
%> 