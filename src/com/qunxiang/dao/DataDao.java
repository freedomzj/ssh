package com.qunxiang.dao;

import java.util.List;

import com.qunxiang.bean.Data;

public interface DataDao extends BaseDao<Data>{
	public List<Data> findByValue(String value);
}
