package com.ict.erp.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ict.erp.service.UserService;

public class UserServiceImpl implements UserService {

	@Override
	public void login(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println(id);
		System.out.println(pwd);
		Map<String,String> rMap = new HashMap<String,String>();
		
		rMap.put("msg", "성공");
		rMap.put("url", "views/index");
		request.setAttribute("rMap", rMap);
		
		if(id.equals("jinas")) {
			if(pwd.equals("123ewq")) {
				/*hs = request.getSession(true); //true와 공란은 같은 의미
				hs = request.getSession(false);*/
				HttpSession hs =request.getSession();
				hs.setAttribute("id", id);
				hs.setAttribute("name", "이름");
				hs.setAttribute("age", "23");
				return;
			}
		}
		rMap.put("msg", "실패");
		rMap.put("url", "views/index");
		
	}

}
