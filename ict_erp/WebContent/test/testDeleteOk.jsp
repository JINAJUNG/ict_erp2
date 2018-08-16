<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<%
	String[] chks = request.getParameterValues("chk");

	Connection con = DBCon.getCon();
	String sql = "delete from ict_test where itNo=?";
	PreparedStatement ps = con.prepareStatement(sql);
	int cnt = 0;
	for (String ch : chks) {
		ps.setString(1, ch);
		cnt += ps.executeUpdate();
	}
	if (chks.length != cnt) {
		con.rollback();
%>
<script>
alert('<%=chks.length%>갯수만큼 삭제하지 못했습니다.');
location.href='<%=rPath %>/test/testList.jsp';
</script>
<%
	}else{
		con.commit();
		%>
<script>
alert('<%=chks.length%>갯수만큼 삭제 했습니다.');
location.href='<%=rPath %>/test/testList.jsp';
</script>
		<%
	}
	ps.close();
	DBCon.closeCon();
%>