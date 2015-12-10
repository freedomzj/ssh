package com.qunxiang.dao;

import com.qunxiang.bean.User;

public interface UserDao extends BaseDao<User> {
	public User checkLogin(String username,String password);
	public boolean isExist(String username);
	public void addUser(User user);
	public void updateUser(User user);
	public User findUserById(int id);
	public void updatePwd(User user);
}
