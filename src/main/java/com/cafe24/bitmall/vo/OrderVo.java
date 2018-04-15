package com.cafe24.bitmall.vo;

import java.util.List;

public class OrderVo {
	private long no;
	private String orderCode;
	private long totalPrice;
	private String ordererName;
	private String ordererPhone1;
	private String ordererPhone2;
	private String ordererEmail;
	private String ordererAddr;
	private String recipientName;
	private String recipientPhone1;
	private String recipientPhone2;
	private String recipientEmail;
	private String recipientAddr;
	private String requirement;
	private String regDate;
	private long memberNo;
	private List<OrderItemVo> orderItems;
	public long getNo() {
		return no;
	}
	public String getOrdererAddr() {
		return ordererAddr;
	}
	public void setOrdererAddr(String ordererAddr) {
		this.ordererAddr = ordererAddr;
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
	public long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getOrdererName() {
		return ordererName;
	}
	public void setOrdererName(String ordererName) {
		this.ordererName = ordererName;
	}
	public String getOrdererPhone1() {
		return ordererPhone1;
	}
	public void setOrdererPhone1(String ordererPhone1) {
		this.ordererPhone1 = ordererPhone1;
	}
	public String getOrdererPhone2() {
		return ordererPhone2;
	}
	public void setOrdererPhone2(String ordererPhone2) {
		this.ordererPhone2 = ordererPhone2;
	}
	public String getOrdererEmail() {
		return ordererEmail;
	}
	public void setOrdererEmail(String ordererEmail) {
		this.ordererEmail = ordererEmail;
	}
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public String getRecipientPhone1() {
		return recipientPhone1;
	}
	public void setRecipientPhone1(String recipientPhone1) {
		this.recipientPhone1 = recipientPhone1;
	}
	public String getRecipientPhone2() {
		return recipientPhone2;
	}
	public void setRecipientPhone2(String recipientPhone2) {
		this.recipientPhone2 = recipientPhone2;
	}
	public String getRecipientEmail() {
		return recipientEmail;
	}
	public void setRecipientEmail(String recipientEmail) {
		this.recipientEmail = recipientEmail;
	}
	public String getRecipientAddr() {
		return recipientAddr;
	}
	public void setRecipientAddr(String recipientAddr) {
		this.recipientAddr = recipientAddr;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public List<OrderItemVo> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OrderItemVo> orderItems) {
		this.orderItems = orderItems;
	}
	public long getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(long memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "OrderVo [no=" + no + ", orderCode=" + orderCode + ", totalPrice=" + totalPrice + ", ordererName="
				+ ordererName + ", ordererPhone1=" + ordererPhone1 + ", ordererPhone2=" + ordererPhone2
				+ ", ordererEmail=" + ordererEmail + ", ordererAddr=" + ordererAddr + ", recipientName=" + recipientName
				+ ", recipientPhone1=" + recipientPhone1 + ", recipientPhone2=" + recipientPhone2 + ", recipientEmail="
				+ recipientEmail + ", recipientAddr=" + recipientAddr + ", requirement=" + requirement + ", regDate="
				+ regDate + ", memberNo=" + memberNo + ", orderItems=" + orderItems + "]";
	}
}
