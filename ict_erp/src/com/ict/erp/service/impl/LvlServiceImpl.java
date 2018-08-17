package com.ict.erp.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ict.erp.dao.LvlDAO;
import com.ict.erp.dao.impl.LvlDAOImpl;
import com.ict.erp.service.LvlService;
import com.ict.erp.vo.LvlInfo;

import common.DBCon;

public class LvlServiceImpl implements LvlService {
	private LvlDAO ldao = new LvlDAOImpl();
	@Override
	public List<LvlInfo> getLiList(HttpServletRequest request) throws SQLException {
		Connection connection = DBCon.getCon();
		try {
			List<LvlInfo> liList = ldao.selectLvlList(connection);
			request.setAttribute("liList", liList);
			return liList;
		} catch (SQLException e) {
			throw e;
		}finally {
			DBCon.closeCon();
		}
	}

}
