package com.common.tag;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * 分页标签处理类
 */
public class PagerClass<T> extends TagSupport {
	private static final long serialVersionUID = 5729832874890369508L;
	private String url;         //请求URI
	private int pageSize;  //每页要显示的记录数
	private long recordCount;    //总记录数
	private int pageNo; //当前页号
	private String params;
	
	@SuppressWarnings("all")
	public int doStartTag() throws JspException {
		
		PageDesc pageDesc = (PageDesc) pageContext.getRequest().getAttribute("pageDesc");
		
		pageSize = pageDesc.getPageSize();
		recordCount = pageDesc.getPageCount();
		pageNo = pageDesc.getPageNo();
		
//		recordCount="${pegeDesc.pageCount}"  pageNo="${pageNo}"
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		String path = request.getContextPath()+"/resource/css/pagecss.css";//拼接css样式
		int pageCount = (int) ((recordCount + pageSize - 1) / pageSize);  //计算总页数
		//拼写要输出到页面的HTML文本
		StringBuilder sb = new StringBuilder();
		sb.append("<link rel=\"stylesheet\" type=\"text/css\" href=\""+path+"\">");
		sb.append("</link>\r\n");
		sb.append("<div class=\"pagination\">\r\n");
		if(recordCount == 0){
			sb.append("<strong class=\"erromsg\">没有可显示的项目</strong>\r\n");
		}else{
			sb.append("<form method=\"post\" action=\"").append(this.url)
				.append("\" name=\"qPagerForm\">\r\n");
			// 输出统计数据
			sb.append("&nbsp;共<strong>").append(recordCount)
				.append("</strong>项")
				.append(",<strong>共")
				.append(pageCount)
				.append("</strong>页:&nbsp;\r\n");
			
			//首页处理
			if (pageNo == 1) {
				sb.append("<span class=\"disabled\">&laquo;&nbsp;首页")
					.append("</span>\r\n");
			} else {
				sb.append("<a href=\"javascript:turnOverPage(")
				  .append((1))
				  .append(")\">&laquo;&nbsp;首页</a>\r\n");
			}
			//上一页处理
			if (pageNo == 1) {
				sb.append("<span class=\"disabled\">&laquo;&nbsp;上一页")
					.append("</span>\r\n");
			} else {
				sb.append("<a href=\"javascript:turnOverPage(")
				  .append((pageNo - 1))
				  .append(")\">&laquo;&nbsp;上一页</a>\r\n");
			}
			// 把当前页号设置成请求参数
			sb.append("<input type=\"hidden\" id=\"queryHelper_pageNo\" name=\"").append("pageDesc.pageNo")
			.append("\" value=\"").append(pageNo).append("\"/>\r\n");
			sb.append("<input type=\"hidden\" id=\"queryHelper_pageSize\" name=\"").append("pageDesc.pageSize")
			.append("\" value=\"").append(pageSize).append("\"/>\r\n");
			for(String param : params.split("&")) {
				
 	 	   		String[] paramStrs = param.split("=");
 	 	   		if(paramStrs.length == 2) {
 	 	   			
 	 	   			String key = paramStrs[0];
 	 	   			String value = paramStrs[1];
 	 	   			sb.append("<input type=\"hidden\" id=\"queryHelper_"+key+"\" name=\"").append(key)
 	 	   			.append("\" value=\"").append(value).append("\"/>\r\n");
 	 	   			
 	 	   		}
 	 	   	}
			//如果前面页数过多,显示"..."
			int start = 1; 
			if(this.pageNo > 4){
				start = this.pageNo - 1;
				sb.append("<a href=\"javascript:turnOverPage(1)\">1</a>\r\n");
				sb.append("<a href=\"javascript:turnOverPage(2)\">2</a>\r\n");
				sb.append("&hellip;\r\n");
			}
			//显示当前页附近的页
			int end = this.pageNo + 1;
			if(end > pageCount){
				end = pageCount;
			}
			for(int i = start; i <= end; i++){
				if(pageNo == i){   //当前页号不需要超链接
					sb.append("<span class=\"current\">")
						.append(i)
						.append("</span>\r\n");
				}else{
					sb.append("<a href=\"javascript:turnOverPage(")
						.append(i)
						.append(")\">")
						.append(i)
						.append("</a>\r\n");
				}
			}
			//如果后面页数过多,显示"..."
			if(end < pageCount - 2){
				sb.append("&hellip;\r\n");
			}
			if(end < pageCount - 1){
				sb.append("<a href=\"javascript:turnOverPage(")
				.append(pageCount - 1)
				.append(")\">")
				.append(pageCount - 1)
				.append("</a>\r\n");
			}
			if(end < pageCount){
				sb.append("<a href=\"javascript:turnOverPage(")
				.append(pageCount)
				.append(")\">")
				.append(pageCount)
				.append("</a>\r\n"); 
			}
			//下一页处理
			if (pageNo == pageCount) {
				sb.append("<span class=\"disabled\">下一页&nbsp;&raquo;")
					.append("</span>\r\n");
			} else {
				sb.append("<a href=\"javascript:turnOverPage(")
					.append((pageNo + 1))
					.append(")\">下一页&nbsp;&raquo;</a>\r\n");
			}
			//未页
			if(pageNo==pageCount){
				sb.append("<span class=\"disabled\">尾页&nbsp;&raquo;")
				.append("</span>\r\n");
			}else{
				sb.append("<a href=\"javascript:turnOverPage(")
				  .append((pageNo=pageCount))
				  .append(")\">尾页&nbsp;&raquo;</a>\r\n");
			}
			
			sb.append("</form>\r\n");
			// 生成提交表单的JS
			sb.append("<script language=\"javascript\">\r\n");
			sb.append("  function turnOverPage(no){\r\n");
			sb.append("    if(no>").append(pageCount).append("){");
			sb.append("      no=").append(pageCount).append(";}\r\n");
			sb.append("    if(no<1){no=1;}\r\n");
			sb.append("    document.getElementById(\"queryHelper_pageNo\").value=no;\r\n");
			sb.append("    document.qPagerForm.submit();\r\n");
			sb.append(" }\r\n");
			sb.append("</script>\r\n");
		}
		sb.append("</div>\r\n");
		
		//把生成的HTML输出到响应中
		try {
			pageContext.getOut().println(sb.toString());
		} catch (IOException e) {
			throw new JspException(e);
		}
		return SKIP_BODY;  //本标签主体为空,所以直接跳过主体
	}
	public String getParams() {
		return params;
	}
	public void setParams(String params) {
		this.params = params;
	}

	public String getUrl() {
		return url;
	}

	public int getPageSize() {
		return pageSize;
	}
	public int getPageNo() {
		return pageNo;
	}
	public long getRecordCount() {
		return recordCount;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}
}