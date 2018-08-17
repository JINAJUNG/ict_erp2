<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<body>
	<jsp:include page="/WEB-INF/views/test/name.jsp" flush="false">
		<jsp:param name="id"  value="jinas" />
		<jsp:param name="pwd" value="1234"  />
	</jsp:include>
</body>
</html>