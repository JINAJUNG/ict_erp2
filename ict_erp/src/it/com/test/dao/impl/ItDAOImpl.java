package it.com.test.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.DBCon;
import it.com.test.dao.ItDAO;

public class ItDAOImpl implements ItDAO{
	private Connection con=null;
	
	public ItDAOImpl(Connection con) {
		this.con=con;
	}
	@Override
	public List<Map<String, String>> itSelectAll() {
		List<Map<String,String>> itList = new ArrayList<Map<String,String>>();
		Map<String, String> itMap =null;
		String sql = "select * from ict_test";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()) {
				itMap= new HashMap<String,String>();
				for(int i=1;i<=rsmd.getColumnCount();i++) {
					String columN = rsmd.getColumnLabel(i);
					itMap.put(columN, rs.getString(columN));
				}
				itList.add(itMap);
			}
			rs.close();
			ps.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBCon.closeCon();
		}
		return itList;
	}
	
	public static void main(String[] args) {
		ItDAOImpl it = new ItDAOImpl(DBCon.getCon());
		System.out.println(it.itSelectAll());
	}
}
