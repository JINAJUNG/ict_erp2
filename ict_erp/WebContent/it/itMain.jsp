<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
	<div class="container">
		<table class="table table-striped">
			<tr>
				<th><input type="checkbox" onclick="allClick(this)"></th>
				<th>번호</th>
				<th>내용</th>
				<th>비번</th>
			</tr>
			<%
				Connection con = DBCon.getCon();
				String sql = "select * from ict_test";
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				int a = 0;

				while (rs.next()) {
					a++;
			%>
			<tr>
				<td><input type="checkbox" name="deV"
					value="<%=rs.getString("itNo")%>"></td>
				<td><%=rs.getString("itNo")%></td>
				<td><%=rs.getString("itText")%></td>
				<td><%=rs.getString("itPwd")%></td>
			</tr>
			<%
				}
				rs.close();
				ps.close();
				DBCon.closeCon();
			%>
			<%
				if (a == 0) {
			%>
			<tr>
				<td colspan="3">X</td>
			</tr>
			<%
				}
			%>

		</table>
		<button type="button" onclick="goIn()">Go Insert</button>
		<button type="button" onclick="goDe(this)">Go Delete</button>
	</div>
	<script type="text/javascript">
		function allClick(obj){
			console.log(obj.checked);
			var cl = document.querySelectorAll('input[name="deV"]');
			for(var i=0;i<cl.length;i++){
				cl[i].checked = obj.checked;
			}
		}
	
		function goIn(){
			location.href='<%=rPath%>it/itIn.jsp';
		}
		function goDe(obj){
			var chObj = document.querySelectorAll('input[name=deV]:checked');
			
			if(chObj.length==0){
				alert('체크안햇는데 모지워?궁그미해~');
				return;
			}
			var parameter="?";
			for(var i = 0;i<chObj.length;i++){
				parameter += "itno="+chObj[i].value+"&";
			}
			parameter = parameter.substring(0,parameter.length-1);
			console.log(parameter);
			location.href='<%=rPath%>it/itDe.jsp'+parameter;
		}
	</script>
</body>
</html>
