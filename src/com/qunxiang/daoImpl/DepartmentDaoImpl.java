package com.qunxiang.daoImpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qunxiang.bean.Department;
import com.qunxiang.dao.DepartmentDao;
@Repository
public class DepartmentDaoImpl extends BaseDaoImpl<Department> implements DepartmentDao{
	@Override
	public List<Department> getAll() {
		return findAll();
	}

}
