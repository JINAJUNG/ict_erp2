<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<%
request.setCharacterEncoding("utf-8");
String miId=request.getParameter("id");

String url = "jdbc:oracle:thin:@localhost:1521:XE";
String driver = "oracle.jdbc.driver.OracleDriver";
String dbId = "ictu";
String dbPwd = "12345678";

Connection con = null;
String msg="아이디중복";

try{
	Class.forName(driver);
	con = DriverManager.getConnection(url,dbId,dbPwd);
	String sql = "select count(1) from member_info";
	sql += " where miId=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, miId);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		int cnt = rs.getInt(1);
		if(cnt ==1){
			RequestDispatcher rd = request.getRequestDispatcher("/views/user/signup.jsp");
			request.setAttribute("msg", msg);
			rd.forward(request, response);
			return;
		}
	}
	String miPwd=request.getParameter("pwd");
	String miName=request.getParameter("name");
	String miEmail=request.getParameter("email");
	String miEtc=request.getParameter("etc");
	String lvl=request.getParameter("lvl");
	String miNo = user.get("mino");
	
	sql= "insert into member_info values(";
	sql += "seq_mino.nextval, ?,?,";
	sql += "1,?,?,";
	sql += "to_char(SYSDATE,'YYYYMMDD'),to_char(SYSDATE,'HH24miss'),?,";
	sql += "to_char(SYSDATE,'YYYYMMDD'),to_char(SYSDATE,'HH24miss'),?,";
	sql += "?,?)";
	
	ps = con.prepareStatement(sql);
	ps.setString(1, miId);
	ps.setString(2, miPwd);
	ps.setString(3, miEmail);
	ps.setString(4, miEtc);
	ps.setString(5, miNo); //최초 등록자
	ps.setString(6, miNo); //마지막 수정자
	ps.setString(7, lvl);
	ps.setString(8, miName);
	int rCnt = ps.executeUpdate();
	if(rCnt==1){
		out.write("사원등록에 성공");
	}else{
		RequestDispatcher rd = request.getRequestDispatcher("/views/user/signup.jsp");
		msg="입력된정보가 올바르지않아요~";
		request.setAttribute("msg", msg);
		rd.forward(request, response);
		return;
	}
	
}catch(Exception e){	
}
%>