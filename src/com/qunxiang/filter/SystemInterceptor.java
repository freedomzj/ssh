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
		//��ȡ�����Ķ���
		ActionContext context = invocation.getInvocationContext();
		Map session = context.getSession();
		User user =(User) session.get("user");
		String url = context.getName();
//		System.out.println("context.getName():"+context.getName()); // index_releaseUI ����action���ƺͷ�����
		if (user != null) {
			//����
			return invocation.invoke();
		}else{
			//������·���г�������·��ʱ����Ҫ����
			if (url.indexOf("index_releaseUI") != -1
					|| url.indexOf("index_userUploadUI") != -1
					|| url.indexOf("index_trainUploadUI") != -1
					|| url.indexOf("index_voteUploadUI") != -1) {
				context.put("info", "����û�е�¼,���ȵ�¼");
				return Action.LOGIN;
			}else{
				return invocation.invoke();
			}
		}
	}

}
