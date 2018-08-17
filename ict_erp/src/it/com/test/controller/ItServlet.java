package it.com.test.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.erp.utils.ICTUtils;

import it.com.test.service.ItService;
import it.com.test.service.impl.ItServiceImpl;

/**
 * Servlet implementation class ItServlet
 */
/*@WebServlet("/it/*")*/
public class ItServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ItService isl = new ItServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String rPath = request.getContextPath();
		String cmd = ICTUtils.getCmd(uri);
		cmd = cmd.replace(".jsp", "");
		uri = uri.replace(rPath, "");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		if (cmd.equals("itMain")) {
			List<Map<String, String>> itList = isl.itGetAll();
			request.setAttribute("itList", itList);
			RequestDispatcher rd = request.getRequestDispatcher(uri);
			rd.forward(request, response);
			return;
		} else {
			System.out.println(cmd);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
