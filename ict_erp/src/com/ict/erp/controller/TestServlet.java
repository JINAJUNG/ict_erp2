package com.ict.erp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		response.setContentType("text/html;charset=utf-8");
 		request.setCharacterEncoding("utf-8"); //받을때 안깨지게 해줘야겠죠?
 		Map<String, String[]> params = request.getParameterMap();
 		Iterator<String> it = params.keySet().iterator();
 		PrintWriter out = response.getWriter();
 		while(it.hasNext()) {
 			String key = it.next();
 			out.println(key+" : ");
 			for(String value : params.get(key)) {
 				out.println(value+" ");
 			}
 			out.println("<br>");
 		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
