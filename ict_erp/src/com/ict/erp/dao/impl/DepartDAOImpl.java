package com.ict.erp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ict.erp.dao.DepartDAO;
import com.ict.erp.vo.DepartInfo;

import common.DBCon;

public class DepartDAOImpl implements DepartDAO {
	//메소드 밖에서 커넥션 맺어서 사용하는 방법
	//1
	private static Connection con;
	
	public DepartDAOImpl(Connection con) {
		this.con=con;
	}

	//2파라미터로 받는것
	@Override
	public List<DepartInfo> selectDepartList() throws SQLException {
		List<DepartInfo> departList = new ArrayList<DepartInfo>();
		String sql = "select dino,diname,didesc,DICNT from DEPART_INFO";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			DepartInfo di = new DepartInfo();
			di.setDiNO(rs.getInt("diNo"));
			di.setDiName(rs.getString("diName"));
			di.setDiDesc(rs.getString("diDesc"));
			di.setDiCnt(rs.getInt("diCnt"));
			departList.add(di);
		}
		rs.close();
		ps.close();

		
		return departList;
	}

	@Override
	public DepartInfo selectDepart() {
		return null;
	}

	public static void main(String[] args) {
		DepartDAO ddao = new DepartDAOImpl(DBCon.getCon());
		List<DepartInfo> li;
		try {
			li = ddao.selectDepartList();
			for(DepartInfo di : li) {
				System.out.println(di);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBCon.closeCon();
		}
		

	}

}
