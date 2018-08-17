<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%
	String no = request.getParameter("no");
	String text = request.getParameter("text");
	String pwd = request.getParameter("pwd");
	System.out.println(no+"no "+text+"text "+pwd+"pwd ");
	Connection con = DBCon.getCon();
	String sql = "insert into ict_test values(?,?,?)";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, no);
	ps.setString(2, text);
	ps.setString(3, pwd);
	int cnt = ps.executeUpdate();
	ps.close();
	con.commit();
	DBCon.closeCon();
	if (cnt == 1) {
%>
	<script>
		alert("등록 완료");
		location.href = '<%=rPath%>it/itMain.jsp';
	</script>
<%
	}else{
		%>
		<script>
			alert("등록 실패");
			location.href = '<%=rPath%>it/itIn.jsp';
		</script>
	<%		
	}
%>