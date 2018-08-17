<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String miId = request.getParameter("id");
	String miPwd = request.getParameter("pwd");
	String miName = request.getParameter("name");
	String miEmail = request.getParameter("email");
	String miEtc = request.getParameter("etc");
	String lvl = request.getParameter("lvl");
	String miNo = user.get("mino");
	String msg = (String) request.getAttribute("msg");
%>
<style>
.login-form {
	width: 300px;
	margin: 0 auto;
}
</style>
<%
	if (msg != null) {
%>
<script>
	alert(<%=msg%>);
</script>
<%
	}
%>
<body>
	<div class="container">
		<div class="row centered-form">
			<div
				class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please sign up</h3>
					</div>
					<div class="panel-body">
						<form role="form" action="<%=rPath%>views/user/signup_ok.jsp"
							method="post" onsubmit="return ch(this)">
							<div class="form-group">
								<input type="text" name="id" id="id"
									class="form-control input-sm" placeholder="ID" data-val="5,id">
							</div>
							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="password" name="pwd" id="pwd"
											class="form-control input-sm" placeholder="Password"
											data-val="5,pwd">
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6">
									<div class="form-group">
										<input type="password" name="pwdch" id="pwdch"
											class="form-control input-sm" placeholder="Confirm Password">
									</div>
								</div>
							</div>
							<div class="form-group">
								<input type="email" name="email" id="email"
									class="form-control input-sm" placeholder="Email Address">
							</div>
							<div class="form-group">
								<input type="text" name="name" id="name"
									class="form-control input-sm" placeholder="Name">
							</div>
							<div class="form-group">
								<label for="lvl">맴버 권한</label> <select class="form-control"
									id="lvl" name="lvl">
									<option value='0'>기본</option>
									<option value='1'>게시판관리자</option>
									<option value='2'>중간관리자</option>
									<option value='3'>관리자</option>
								</select>
							</div>
							<div class="form-group">
								<textarea class="form-control" rows="5" id="etc" name="etc"></textarea>
							</div>

							<input type="submit" value="Register"
								class="btn btn-info btn-block">

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function ch(obj) {
			var a = document.querySelectorAll('input[data-val]');

			console.log(a);
			var miName = obj.name.value.trim();
			var miId = obj.id.value.trim();
			var miPwd = obj.pwd.value.trim();
			var miPwdch = obj.pwdch.value.trim();

			if (miName.length < 2) {
				alert("이름은 2글자 이상");
				return false;
			}
			if (miId.length < 4) {
				alert("아이디는 4글자 이상");
				return false;
			}
			if (miPwd.length < 4) {
				alert("비밀번호는 4글자 이상");
				return false;
			}
			if (miPwd != miPwdch) {
				alert("비밀번호가 틀립니다");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>