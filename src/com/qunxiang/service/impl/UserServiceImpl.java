package com.qunxiang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qunxiang.bean.User;
import com.qunxiang.dao.UserDao;
import com.qunxiang.service.IUserService;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public User checkLogin(String username, String password) {
		// TODO Auto-generated method stub
		return userDao.checkLogin(username, password);
	}

	@Override
	public boolean isExist(String username) {
		// TODO Auto-generated method stub
		return userDao.isExist(username);
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		userDao.addUser(user);
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userDao.update(user);
	}

	@Override
	public User findUserById(int id) {
		// TODO Auto-generated method stub
		return userDao.findUserById(id);
	}

	@Override
	public void updatePwd(User user) {
		// TODO Auto-generated method stub
		userDao.updatePwd(user);
	}
	
	
	

}
