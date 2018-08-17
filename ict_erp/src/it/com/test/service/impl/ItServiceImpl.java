package it.com.test.service.impl;

import java.util.List;
import java.util.Map;

import common.DBCon;
import it.com.test.dao.impl.ItDAOImpl;
import it.com.test.service.ItService;

public class ItServiceImpl implements ItService {

	@Override
	public List<Map<String, String>> itGetAll() {
		ItDAOImpl isl = new ItDAOImpl(DBCon.getCon());
		List<Map<String, String>> itList = null;
		itList = isl.itSelectAll();
		return itList;
	}

}
