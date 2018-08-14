<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>

	<form method="post" action="<%=rPath %>test/">
		<div class="container">
			취미 : 걷기 <input type="checkbox" name="hobbi" value="waking">, 노래 <input
				type="checkbox" name="hobbi" value="sing">, 웹툰 <input type="checkbox"
				name="hobbi" value="webtoon"><br>
			연령 : 10대 <input type="radio" name="age" value="10대">,
			20대 <input type="radio" name="age" value="20대">,
			30대 <input type="radio" name="age" value="30대">,
			40대 <input type="radio" name="age" value="40대">,
			50이상 <input type="radio" name="age" value="고연령"><br>
			거주 지역 :
			<select name = "area" >
				<option value="서울">서울</option>
				<option value="대전">대전</option>
				<option value="대구">대구</option>
			</select><br>
			이름 : <input type="text" name="name" class="form-control" ><br>
			ID : <input type="text" name="id" class="form-control" ><br>
			Phone : <input type="text" name="phone" class="form-control" ><br>
			<button class="btn btn-default">전송</button>
		</div>
	</form>

</body>
</html>