package com.cafe24.bitmall.util;

public class ProductParam extends Param{
	
	private long categoryNo;
	private String status;
	private String icon;
	private String sort;
	
	public ProductParam() {
		this(1, null, null, 0L, null, null, null);
	}

	public ProductParam(int pageNo, String searchType, String searchValue,long categoryNo, String status, String icon, String sort) {
		super(pageNo, searchType, searchValue);
		this.categoryNo = categoryNo;
		this.status = status;
		this.icon = icon;
		this.sort = sort;		
	}

	public long getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(long categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	@Override
	public String toString() {
		return "ProductParam [pageNo=" + getPageNo() + ", searchType=" + getSearchType() + ", searchValue=" + getSearchValue() + "categoryNo=" + categoryNo + ", status=" + status + ", icon=" + icon + ", sortType="
				+ sort + "]";
	}
	
	@Override
	public void build() {
		super.build();
		String shortQueryString=getShortQueryString();
		String queryString = getQueryString();
		
		if(categoryNo != 0) {
			shortQueryString+="&categoryNo="+this.categoryNo;
		}
		if(status != null) {
			shortQueryString+="&status="+this.status;
		}
		if(icon != null) {
			shortQueryString+="&icon="+this.icon;
		}
		if(sort != null) {
			shortQueryString+="&sort="+this.sort;
		}
		setShortQueryString(shortQueryString);
		setQueryString(getShortQueryString()+"&pageNo="+getPageNo());
	}
}
