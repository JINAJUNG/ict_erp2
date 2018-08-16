<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th><input type="checkbox" id="allChk" onclick="allCh(this)"></th>
					<th>번호</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<%
					Connection con = DBCon.getCon();
					String sql = "select itNo,itText from ict_test order by itNo asc";
					PreparedStatement ps = con.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
					int cnt = 0;
					
					while (rs.next()) {
						cnt++;
				%>
				<tr>
					<td><input type="checkbox" name="chk" value="<%=rs.getInt("itNo")%>"></td>
					<td><%=rs.getInt("itNo")%></td>
					<td><%=rs.getString("itText")%></td>
				</tr>
				<%
					}
					rs.close();
					ps.close();
					DBCon.closeCon();
					if (cnt == 0) {
				%>
				<tr>
					<td colspan="2">게시물없음</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<div>
			<button type="button" onclick="move('testInsert.jsp')">게시물
				올리기</button>
			<button type="button" onclick="deleteList()">삭제</button>
		</div>
	</div>
	<script type="text/javascript">
	function allCh(obj){
		console.log(obj);
		var chkObjs = document.querySelectorAll('input[name=chk]');
		for(var i=0;i<chkObjs.length;i++){
			chkObjs[i].checked = obj.checked;
		}
	}
	
	function move(page){
		location.href="<%=rPath%>test/" + page;
		}
	
	function deleteList(){
		var chkObjs = document.querySelectorAll('input[name=chk]:checked');
		if(chkObjs.length==0){
			alert('삭제할 리스트를 선택해 주세요.');
			return;
		}
		var params='?';
		
		for(var i=0;i<chkObjs.length;i++){
			params += 'chk='+chkObjs[i].value + '&';
			
		}

		params = params.substring(0,params.length-1);
		console.log(params);
		location.href='<%=rPath%>test/testDeleteOk.jsp'+params;
		/* +params 붙여서 get으로 보내는 값을 붙여줘야함 */
	}
	</script>
</body>
</html>
