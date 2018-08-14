package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBUtils {
	private Connection con;
	public DBUtils(Connection con) {
		this.con = con;
	}
	public List<Map<String,String>> selectList(String sql) throws SQLException{
		List<Map<String,String>> list = 
				new ArrayList<Map<String,String>>();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		ResultSetMetaData rsmd = rs.getMetaData();
		int colCnt = rsmd.getColumnCount();
		List<String> colList = new ArrayList<String>();
		for(int i=1;i<=colCnt;i++) {
			String col = rsmd.getColumnLabel(i);
			colList.add(col);
		}
		
		Map<String,String> map = null;
		while(rs.next()) {
			map = new HashMap<String,String>();
			for(String col:colList) {
				map.put(col, rs.getString(col));
			}
			list.add(map);
		}
		rs.close();
		rs = null;
		ps.close();
		ps = null;
		return list;
	}
}