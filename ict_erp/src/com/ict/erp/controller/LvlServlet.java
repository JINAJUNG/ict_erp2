package com.ict.erp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.erp.service.LvlService;
import com.ict.erp.service.impl.LvlServiceImpl;
import com.ict.erp.utils.ICTUtils;

public class LvlServlet extends HttpServlet {

	private LvlService ls = new LvlServiceImpl();
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String cmd = ICTUtils.getCmd(uri);
		
		if(cmd==null || cmd=="") {
			doService(response,"유효하지 않는 요청입니다.");
			return;
		}
		String rPath = request.getContextPath();
		uri = uri.replace(rPath, "");
		String page = ICTUtils.getJSPPage(uri);
		if(cmd.equals("lvlList")) {
			try {
				ls.getLiList(request);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(response,null);
	}
	
	public void doService(HttpServletResponse res, String txt) throws IOException{
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw =res.getWriter();

		if(txt!=null) {
			pw.print(txt);
			return;
		}
		pw.print("옼돜");
		
	}
}
