package com.qunxiang.action;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.qunxiang.bean.Order;
import com.qunxiang.bean.Pic;
import com.qunxiang.bean.User;
import com.qunxiang.service.IUserService;

@Controller
@Scope("prototype")
public class HibernateTestAction {
	
	private User user;
	
	
	@Autowired
	private IUserService userService;
	
	public String oneToOne(){
		user=userService.findUserById(1000009);
		user.setUserPhone("123456789");
		userService.updateUser(user);
		Set<Pic> pic=user.getPicList();
		for (Pic pic2 : pic) {
			System.out.println(pic2.getPath());
		}
		Set<Order> order=user.getOrderList();
		for (Order order2 : order) {
			System.out.println(order2);
		}
		return "onetoOne";
	}
	
	
	
	public String htestUI(){
		return  "htestUI";
	}
	
	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	


}
