package com.cafe24.bitmall.util;

public class Param {
	private int pageNo;
	private String searchType;
	private String searchValue;
	private String shortQueryString;
	private String queryString;
	
	public Param() {
		this(1, null, null);
	}
	public Param(int pageNo, String searchType, String searchValue) {
		this.pageNo = pageNo;
		this.searchType = searchType;
		this.searchValue = searchValue;
		this.shortQueryString = "";
		this.queryString="";
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	
	public String getShortQueryString() {
		return shortQueryString;
	}
	public void setShortQueryString(String shortQueryString) {
		this.shortQueryString = shortQueryString;
	}
	public String getQueryString() {
		return queryString;
	}
	public void setQueryString(String queryString) {
		this.queryString = queryString;
	}
	@Override
	public String toString() {
		return "Param [pageNo=" + pageNo + ", searchType=" + searchType + ", searchValue=" + searchValue + "]";
	}
	
	public void build() {
		if(searchType!=null) {
			this.shortQueryString+="&searchType="+searchType+"&searchValue="+searchValue;
		}
		this.queryString = shortQueryString+"&pageNo="+pageNo;
	}
}
