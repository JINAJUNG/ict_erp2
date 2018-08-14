package com.ict.erp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.erp.service.impl.DepartServiceImpl;
import com.ict.erp.utils.ICTUtils;
import com.ict.erp.vo.DepartInfo;

public class DepartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DepartServiceImpl ds = new DepartServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String cmd = ICTUtils.getCmd(uri);

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		PrintWriter pw = response.getWriter();

		if (cmd == null || cmd.equals("")) {
			pw.println("주소가 맞을까??");
			return;
		}
		System.out.println(uri);
		try {
			if (cmd.equals("list")) {
				List<DepartInfo> diList = ds.getDepartList();
				StringBuilder sb = new StringBuilder();
				sb.append("<table border='1'>\r\n");
				sb.append("<thead>");
				sb.append("<tr>");
				sb.append("<th>diNo</th>");
				sb.append("<th>diName</th>");
				sb.append("<th>diDesc</th>");
				sb.append("<th>diCnt</th>");
				sb.append("</tr>");
				sb.append("</thead>");
				sb.append("<tbody>");
				for (DepartInfo di : diList) {
					sb.append("<tr>");
					sb.append("<td>"+di.getDiNO() + "</td>");
					sb.append("<td>"+di.getDiName() + "</td>");
					sb.append("<td>"+di.getDiDesc() + "</td>");
					sb.append("<td>"+di.getDiCnt() + "</td>");
					sb.append("</tr>");
				}
				sb.append("</tbody>");
				sb.append("</table>"); //String담아서
				pw.print(sb);//한번에 빌드
			} else if (cmd.equals("view")) {

			} else {
				pw.println("안녕 나는 누구게?? 근데 이거 잘못 된 거 같앵");
				return;
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public static void main(String[] args) {
		DepartServlet ds = new DepartServlet();
		try {
			ds.doGet(null, null);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
