package com.cafe24.bitmall.vo;

public class CategoryVo {
	private long no;
	private String name;
	private String description;
	private String regDate;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "Category [no=" + no + ", name=" + name + ", description=" + description + ", regDate=" + regDate + "]";
	}
}
