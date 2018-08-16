<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
	<form action="<%=rPath%>it/itInO.jsp" class="form-horizontal">
		<div class="form-group">
			<label for="no" class="col-sm-2 control-label">NO</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="no" placeholder="No">
			</div>
		</div>
		<div class="form-group">
			<label for="text" class="col-sm-2 control-label">TEXT</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="text" placeholder="Text">
			</div>
		</div>
		<div class="form-group">
			<label for="pwd" class="col-sm-2 control-label">PASSWORD</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="pwd" placeholder="PASSWORD">
			</div>
		</div>
		<button>Go!</button>
	</form>
</body>
</html>