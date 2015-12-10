package com.qunxiang.daoImpl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.qunxiang.bean.Industry;
import com.qunxiang.dao.IndustryDao;
import com.qunxiang.dao.QueryHelper;
@Repository
public class IndustryDaoImpl extends BaseDaoImpl<Industry> implements IndustryDao {
	@Override
	public List<Industry> getAll() {
		return findAll();
	}

}
