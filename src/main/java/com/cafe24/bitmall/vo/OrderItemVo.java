package com.cafe24.bitmall.vo;

public class OrderItemVo {
	private long no;
	private String orderCode;
	private String name;
	private long productNo;
	private long price;
	private long quantity;
	private long optionNo1;
	private long optionNo2;
	private String optionName1;
	private String optionName2;
	private ProductVo product;
	private OptionVo option1;
	private OptionVo option2;
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getProductNo() {
		return productNo;
	}
	public void setProductNo(long productNo) {
		this.productNo = productNo;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public long getQuantity() {
		return quantity;
	}
	public void setQuantity(long quantity) {
		this.quantity = quantity;
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
	public String getOptionName1() {
		return optionName1;
	}
	public void setOptionName1(String optionName1) {
		this.optionName1 = optionName1;
	}
	public String getOptionName2() {
		return optionName2;
	}
	public void setOptionName2(String optionName2) {
		this.optionName2 = optionName2;
	}
	public ProductVo getProduct() {
		return product;
	}
	public void setProduct(ProductVo product) {
		this.product = product;
	}
	public OptionVo getOption1() {
		return option1;
	}
	public void setOption1(OptionVo option1) {
		this.option1 = option1;
	}
	public OptionVo getOption2() {
		return option2;
	}
	public void setOption2(OptionVo option2) {
		this.option2 = option2;
	}
	@Override
	public String toString() {
		return "OrderItemVo [no=" + no + ", orderCode=" + orderCode + ", name=" + name + ", productNo=" + productNo
				+ ", price=" + price + ", quantity=" + quantity + ", optionNo1=" + optionNo1 + ", optionNo2="
				+ optionNo2 + ", optionName1=" + optionName1 + ", optionName2=" + optionName2 + ", product=" + product
				+ ", option1=" + option1 + ", option2=" + option2 + "]";
	}
}
