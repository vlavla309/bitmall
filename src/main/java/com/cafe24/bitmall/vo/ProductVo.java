package com.cafe24.bitmall.vo;

public class ProductVo {
	private long no;
	private String code;
	private String name;
	private String description;
	private long price;
	private String brand;
	private boolean isNew;
	private boolean isHit;
	private boolean isSale;
	private double discountRate;
	private String status;
	private long optionNo1;
	private long optionNo2;
	private long categoryNo;
	private String regDate;
	private String imagePath;
	
	public boolean getIsNew() {
		return isNew;
	}
	public void setIsNew(boolean isNew) {
		this.isNew = isNew;
	}
	public boolean getIsHit() {
		return isHit;
	}
	public void setIsHit(boolean isHit) {
		this.isHit = isHit;
	}
	public boolean getIsSale() {
		return isSale;
	}
	public void setIsSale(boolean isSale) {
		this.isSale = isSale;
	}
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public double getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(double discountRate) {
		this.discountRate = discountRate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public long getOptionNo1() {
		return optionNo1;
	}
	public void setOptionNo1(long optionNo1) {
		this.optionNo1 = optionNo1;
	}
	public long getOptionNo2() {
		return optionNo2;
	}
	public void setOptionNo2(long optionNo2) {
		this.optionNo2 = optionNo2;
	}
	public long getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(long categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	@Override
	public String toString() {
		return "ProductVo [no=" + no + ", code=" + code + ", name=" + name + ", description=" + description + ", price="
				+ price + ", brand=" + brand + ", isNew=" + isNew + ", isHit=" + isHit + ", isSale=" + isSale
				+ ", discountRate=" + discountRate + ", status=" + status + ", optionNo1=" + optionNo1 + ", optionNo2="
				+ optionNo2 + ", categoryNo=" + categoryNo + ", regDate=" + regDate + ", imagePath=" + imagePath + "]";
	}
}
