package com.qunxiang.dao;

import java.util.List;

import com.qunxiang.bean.Department;

public interface DepartmentDao extends BaseDao<Department> {
	public List<Department> getAll();
}
