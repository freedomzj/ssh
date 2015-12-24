package com.qunxiang.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.qunxiang.bean.User;
import com.qunxiang.dao.UserDao;
import com.qunxiang.util.MD5Util;
@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao  {

	@Override
	public User checkLogin(String username, String password) {
		List<String> propertyName = new ArrayList<String>();
		propertyName.add("username");
		propertyName.add("password");
		List<Object> value = new ArrayList<Object>();
		value.add(username);
		value.add(MD5Util.getMD5Code(password));
		User user = findSingleByPropertyList(propertyName, value);
		return user;
	}

	@Override
	public boolean isExist(String username) {
		return findSingle("username", username) != null;
	}

	@Override
	public void addUser(User user) {
		user.setPassword(MD5Util.getMD5Code(user.getPassword()));
		save(user);
	}

	@Override
	public void updateUser(User user) {
		update(user);
	}

	@Override
	public User findUserById(int id) {
	
		return get(User.class, id);
	}

	@Override
	public void updatePwd(User user) {
		user.setPassword(MD5Util.getMD5Code(user.getPassword()));
		updateUser(user);
	}
}
