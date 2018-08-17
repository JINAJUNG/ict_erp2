<%@page import="common.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<%
String itNo = request.getParameter("itNo");
 Connection con = DBCon.getCon();
String sql = "select * from ict_test where itNo=?";
 PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,itNo);
ResultSet rs = ps.executeQuery();
String itText ="";
String itPwd = "";
while(rs.next()){
	itText = rs.getString("itText");
	itPwd = rs.getString("itPwd");
}
%>
<body>
	<form action="<%=rPath%>test/testUpdateOK.jsp">
		번호 : <%=itNo%><br>
		텍스트 : <input type="text" name="itText" value="<%=itText%>"><br>
		비번 : <input type="password" name="itPwd" value="<%=itPwd%>"><br>
		<button>수정</button>
		<input type="hidden" name="itNo" value="<%=itNo%>">
	</form>
</body>
</html> 