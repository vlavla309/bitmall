package com.cafe24.bitmall.util;

public class OrderParam extends Param{
	
	private String status;
	private String beginDate;
	private String endDate;
	
	public OrderParam() {
		this(1, null, null, null, null, null);
	}

	public OrderParam(int pageNo, String searchType, String searchValue, String status, String beginDate, String endDate) {
		super(pageNo, searchType, searchValue);
		this.status = status;
		this.beginDate = beginDate;
		this.endDate = endDate;		
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "OrderParam [pageNo=" + getPageNo() + ", searchType=" + getSearchType() + ", searchValue=" + getSearchValue() + ", status=" + status + ", beginDate=" + beginDate + ", endDate="
				+ endDate + "]";
	}
	
	@Override
	public void build() {
		super.build();
		String shortQueryString=getShortQueryString();
		String queryString = getQueryString();

		if(status != null) {
			shortQueryString+="&status="+this.status;
		}
		if(beginDate != null) {
			shortQueryString+="&beginDate="+this.beginDate;
		}
		if(endDate != null) {
			shortQueryString+="&endDate="+this.endDate;
		}
		setShortQueryString(shortQueryString);
		setQueryString(getShortQueryString()+"&pageNo="+getPageNo());
	}
}
