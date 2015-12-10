package com.common.tag;

import java.util.List;


public class PageDesc {

	private Integer pageSize;
	
	private Integer pageNo;
	
	private Integer totalPage;
	
	private Long pageCount;
	
	@SuppressWarnings("rawtypes")
	private List result;
	
	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}


	public Integer getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}


	public Long getPageCount() {
		return pageCount;
	}


	public void setPageCount(Long pageCount) {
		this.pageCount = pageCount;
	}
	
	public Integer getStartNum(){
		return  (this.pageNo-1)*this.pageSize;
	}

	@Override
	public String toString() {

		String str = "pageSize:" + pageSize + "\n" +
				"pageNo:" + pageNo + "\n" +
				"pageCount:" + pageCount + "\n"
			;
		return str;
	}


	@SuppressWarnings("unchecked")
	public <T> List<T> getResult(Class<T> type) {
		
		return (List<T>) result;
	}


	public void setResult(List result) {
		this.result = result;
	}
}
