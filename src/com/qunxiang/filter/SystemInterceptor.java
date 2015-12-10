package com.qunxiang.filter;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.qunxiang.bean.User;
import java.util.*;
import org.springframework.context.annotation.Scope;
@Scope("prototype")
public class SystemInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		//获取上下文对象
		ActionContext context = invocation.getInvocationContext();
		Map session = context.getSession();
		User user =(User) session.get("user");
		String url = context.getName();
//		System.out.println("context.getName():"+context.getName()); // index_releaseUI 返回action名称和方法名
		if (user != null) {
			//放行
			return invocation.invoke();
		}else{
			//当请求路径中出现以下路径时就需要拦截
			if (url.indexOf("index_releaseUI") != -1
					|| url.indexOf("index_userUploadUI") != -1
					|| url.indexOf("index_trainUploadUI") != -1
					|| url.indexOf("index_voteUploadUI") != -1) {
				context.put("info", "您还没有登录,请先登录");
				return Action.LOGIN;
			}else{
				return invocation.invoke();
			}
		}
	}

}
