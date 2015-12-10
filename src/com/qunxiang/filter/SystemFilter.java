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
    	
    	//获取访问的url
    	StringBuffer url = request.getRequestURL(); // http://localhost/springmvc/temp/loginUI
    	String projectName = request.getContextPath();// /springmvc
    	User user = (User) request.getSession().getAttribute("user");
    	try {
    		
			if(user == null){
				//没有登陆(下面两个取其中一个就行)
				//如果是到登陆页面,或者是首页的话就不进行拦截操作(需要拦截的路径)
				System.out.println("url:"+url);
	    		if(url.toString().endsWith("index_releaseUI.action") || url.toString().endsWith(projectName+"/")){
	    			response.sendRedirect(basePath+"user_loginUI.action");
	    		}else{
	    			filterChain.doFilter(servletRequest, servletResponse);
	    		}
			}else{
				//已经登陆
	    		filterChain.doFilter(servletRequest, servletResponse);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
    }  
  
    /** 
     * 判断是否为Ajax请求 
     * 
     * @param request HttpServletRequest 
     * @return 是true, 否false 
     */  
    public static boolean isAjaxRequest(HttpServletRequest request) {  
        return request.getRequestURI().startsWith("/api");  
//        String requestType = request.getHeader("X-Requested-With");  
//        return requestType != null && requestType.equals("XMLHttpRequest");  
    }  
  
    public void init(FilterConfig filterConfig) throws ServletException {  
            /*如果需要注入，请取消注释*/  
//           ServletContext servletContext = filterConfig.getServletContext();  
//            WebApplicationContext applicationContext = (WebApplicationContext) servletContext.  
//                    getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);  
//            if (null == topConstantsImpl) {  
//                //从Spring AC 中加载app configuration对象  
//                topConstantsImpl = applicationContext.getBean(TopConstantsImpl.class);  
//        }  
    }  
  
    public void destroy() {  
        //To change body of implemented methods use File | Settings | File Templates.  
    }  
  
  
}
