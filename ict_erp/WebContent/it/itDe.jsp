<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp" %>
<%
String[] chD = request.getParameterValues("itno");

Connection con = DBCon.getCon();
String sql = "delete from ict_test where itNo=?";
PreparedStatement ps = con.prepareStatement(sql);
int cnt=0;
for(String str : chD){
	cnt++;
	ps.setString(1, str);
	ps.addBatch();
}
ps.executeBatch();
if(chD.length!=cnt){
	con.rollback();
	%>
	<script>
	alert("시스템에러가 잇어서 못지워");
	location.href='<%=rPath%>it/itMain.jsp';
	</script>
	<%
}else{
	con.commit();
	ps.close();
	DBCon.closeCon();
	%>
	<script>
	alert("지워졌어 good!");
	location.href='<%=rPath%>it/itMain.jsp';
	</script>
	<%
}
%>