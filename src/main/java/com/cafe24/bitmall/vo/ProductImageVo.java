package com.cafe24.bitmall.vo;

public class ProductImageVo {
	private long no;
	private String name;
	private String path;
	private int orderNo;
	private String regDate;
	private long productNo;
	
	public long getNo() {
		return no;
	}

	public void setNo(long no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public long getProductNo() {
		return productNo;
	}

	public void setProductNo(long productNo) {
		this.productNo = productNo;
	}

	@Override
	public String toString() {
		return "ProductImage [no=" + no + ", name=" + name + ", path=" + path + ", orderNo=" + orderNo + ", regDate="
				+ regDate + ", productNo=" + productNo + "]";
	}
}
