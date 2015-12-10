package com.qunxiang.dao;

import java.util.List;

import com.qunxiang.bean.Industry;

public interface IndustryDao extends BaseDao<Industry>{
	public List<Industry> getAll();
}
