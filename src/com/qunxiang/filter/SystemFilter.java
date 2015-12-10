package com.qunxiang.filter;

import java.io.IOException;




import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import com.qunxiang.bean.User;

import javax.servlet.*;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

public class SystemFilter implements Filter {  
	  
    Logger logger = LoggerFactory.getLogger(SystemFilter.class);  
  
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, 
    		FilterChain filterChain)  {  
    	
    	HttpServletRequest request =(HttpServletRequest)servletRequest;
    	HttpServletResponse response =(HttpServletResponse)servletResponse;
    	
    	String path = request.getContextPath();
    	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    	
    	//��ȡ���ʵ�url
    	StringBuffer url = request.getRequestURL(); // http://localhost/springmvc/temp/loginUI
    	String projectName = request.getContextPath();// /springmvc
    	User user = (User) request.getSession().getAttribute("user");
    	try {
    		
			if(user == null){
				//û�е�½(��������ȡ����һ������)
				//����ǵ���½ҳ��,��������ҳ�Ļ��Ͳ��������ز���(��Ҫ���ص�·��)
				System.out.println("url:"+url);
	    		if(url.toString().endsWith("index_releaseUI.action") || url.toString().endsWith(projectName+"/")){
	    			response.sendRedirect(basePath+"user_loginUI.action");
	    		}else{
	    			filterChain.doFilter(servletRequest, servletResponse);
	    		}
			}else{
				//�Ѿ���½
	    		filterChain.doFilter(servletRequest, servletResponse);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
    }  
  
    /** 
     * �ж��Ƿ�ΪAjax���� 
     * 
     * @param request HttpServletRequest 
     * @return ��true, ��false 
     */  
    public static boolean isAjaxRequest(HttpServletRequest request) {  
        return request.getRequestURI().startsWith("/api");  
//        String requestType = request.getHeader("X-Requested-With");  
//        return requestType != null && requestType.equals("XMLHttpRequest");  
    }  
  
    public void init(FilterConfig filterConfig) throws ServletException {  
            /*�����Ҫע�룬��ȡ��ע��*/  
//           ServletContext servletContext = filterConfig.getServletContext();  
//            WebApplicationContext applicationContext = (WebApplicationContext) servletContext.  
//                    getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);  
//            if (null == topConstantsImpl) {  
//                //��Spring AC �м���app configuration����  
//                topConstantsImpl = applicationContext.getBean(TopConstantsImpl.class);  
//        }  
    }  
  
    public void destroy() {  
        //To change body of implemented methods use File | Settings | File Templates.  
    }  
  
  
}
