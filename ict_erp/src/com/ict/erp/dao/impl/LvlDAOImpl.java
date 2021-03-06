package com.ict.erp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ict.erp.dao.LvlDAO;
import com.ict.erp.vo.LvlInfo;

import common.DBCon;

public class LvlDAOImpl implements LvlDAO {

	@Override
	public List<LvlInfo> selectLvlList(Connection con) throws SQLException {
		String sql = "select lvl, liName, liDesc from lvl_info";
		List<LvlInfo> liList=null;
		try {
			liList = new ArrayList<LvlInfo>();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				LvlInfo li = new LvlInfo(rs.getInt("lvl"), rs.getString("liName"), rs.getString("liDesc"));
				liList.add(li);
			}
		} catch (SQLException e) {
			throw e;// 에러가 생기면 throws넘겨준다
		} finally { // finally도 실행됨
			DBCon.closeCon();
		}
		return liList;
	}
}
