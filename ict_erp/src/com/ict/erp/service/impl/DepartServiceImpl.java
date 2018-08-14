package com.ict.erp.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.ict.erp.dao.DepartDAO;
import com.ict.erp.dao.impl.DepartDAOImpl;
import com.ict.erp.vo.DepartInfo;

import common.DBCon;

public class DepartServiceImpl implements com.ict.erp.service.DepartService {

	@Override
	public List<DepartInfo> getDepartList() throws SQLException {
		DepartDAO ddao = new DepartDAOImpl(DBCon.getCon());
		List<DepartInfo> li=null;
		try {
			li = ddao.selectDepartList();
			/*for(DepartInfo di : li) {
				System.out.println(di);
			}*/
		} catch (SQLException e) {
			throw e;
		}finally {
			DBCon.closeCon();
		}
		return li;
	}

	@Override
	public DepartInfo getDepart() {
		return null;
	}

	public static void main(String[] args) {
		DepartServiceImpl ds = new DepartServiceImpl();
		try {
			List<DepartInfo> dsList = ds.getDepartList();
			for(DepartInfo di : dsList) {
				System.out.println(di);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
