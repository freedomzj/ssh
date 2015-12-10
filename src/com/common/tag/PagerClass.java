package com.common.tag;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * ��ҳ��ǩ������
 */
public class PagerClass<T> extends TagSupport {
	private static final long serialVersionUID = 5729832874890369508L;
	private String url;         //����URI
	private int pageSize;  //ÿҳҪ��ʾ�ļ�¼��
	private long recordCount;    //�ܼ�¼��
	private int pageNo; //��ǰҳ��
	private String params;
	
	@SuppressWarnings("all")
	public int doStartTag() throws JspException {
		
		PageDesc pageDesc = (PageDesc) pageContext.getRequest().getAttribute("pageDesc");
		
		pageSize = pageDesc.getPageSize();
		recordCount = pageDesc.getPageCount();
		pageNo = pageDesc.getPageNo();
		
//		recordCount="${pegeDesc.pageCount}"  pageNo="${pageNo}"
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		String path = request.getContextPath()+"/resource/css/pagecss.css";//ƴ��css��ʽ
		int pageCount = (int) ((recordCount + pageSize - 1) / pageSize);  //������ҳ��
		//ƴдҪ�����ҳ���HTML�ı�
		StringBuilder sb = new StringBuilder();
		sb.append("<link rel=\"stylesheet\" type=\"text/css\" href=\""+path+"\">");
		sb.append("</link>\r\n");
		sb.append("<div class=\"pagination\">\r\n");
		if(recordCount == 0){
			sb.append("<strong class=\"erromsg\">û�п���ʾ����Ŀ</strong>\r\n");
		}else{
			sb.append("<form method=\"post\" action=\"").append(this.url)
				.append("\" name=\"qPagerForm\">\r\n");
			// ���ͳ������
			sb.append("&nbsp;��<strong>").append(recordCount)
				.append("</strong>��")
				.append(",<strong>��")
				.append(pageCount)
				.append("</strong>ҳ:&nbsp;\r\n");
			
			//��ҳ����
			if (pageNo == 1) {
				sb.append("<span class=\"disabled\">&laquo;&nbsp;��ҳ")
					.append("</span>\r\n");
			} else {
				sb.append("<a href=\"javascript:turnOverPage(")
				  .append((1))
				  .append(")\">&laquo;&nbsp;��ҳ</a>\r\n");
			}
			//��һҳ����
			if (pageNo == 1) {
				sb.append("<span class=\"disabled\">&laquo;&nbsp;��һҳ")
					.append("</span>\r\n");
			} else {
				sb.append("<a href=\"javascript:turnOverPage(")
				  .append((pageNo - 1))
				  .append(")\">&laquo;&nbsp;��һҳ</a>\r\n");
			}
			// �ѵ�ǰҳ�����ó��������
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
			//���ǰ��ҳ������,��ʾ"..."
			int start = 1; 
			if(this.pageNo > 4){
				start = this.pageNo - 1;
				sb.append("<a href=\"javascript:turnOverPage(1)\">1</a>\r\n");
				sb.append("<a href=\"javascript:turnOverPage(2)\">2</a>\r\n");
				sb.append("&hellip;\r\n");
			}
			//��ʾ��ǰҳ������ҳ
			int end = this.pageNo + 1;
			if(end > pageCount){
				end = pageCount;
			}
			for(int i = start; i <= end; i++){
				if(pageNo == i){   //��ǰҳ�Ų���Ҫ������
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
			//�������ҳ������,��ʾ"..."
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
			//��һҳ����
			if (pageNo == pageCount) {
				sb.append("<span class=\"disabled\">��һҳ&nbsp;&raquo;")
					.append("</span>\r\n");
			} else {
				sb.append("<a href=\"javascript:turnOverPage(")
					.append((pageNo + 1))
					.append(")\">��һҳ&nbsp;&raquo;</a>\r\n");
			}
			//δҳ
			if(pageNo==pageCount){
				sb.append("<span class=\"disabled\">βҳ&nbsp;&raquo;")
				.append("</span>\r\n");
			}else{
				sb.append("<a href=\"javascript:turnOverPage(")
				  .append((pageNo=pageCount))
				  .append(")\">βҳ&nbsp;&raquo;</a>\r\n");
			}
			
			sb.append("</form>\r\n");
			// �����ύ����JS
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
		
		//�����ɵ�HTML�������Ӧ��
		try {
			pageContext.getOut().println(sb.toString());
		} catch (IOException e) {
			throw new JspException(e);
		}
		return SKIP_BODY;  //����ǩ����Ϊ��,����ֱ����������
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