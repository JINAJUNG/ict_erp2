package com.ict.erp.dao;

import java.sql.SQLException;
import java.util.List;

import com.ict.erp.vo.DepartInfo;

public interface DepartDAO {
	public List<DepartInfo> selectDepartList() throws SQLException; //검색
	public DepartInfo selectDepart(); //all
}
