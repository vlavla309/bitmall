package com.cafe24.bitmall.vo;

public class PaymentDepositVo {
	private long no;
	private String account;
	private String depositor;
	private long orderNo;
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getDepositor() {
		return depositor;
	}
	public void setDepositor(String depositor) {
		this.depositor = depositor;
	}
	public long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(long orderNo) {
		this.orderNo = orderNo;
	}
	@Override
	public String toString() {
		return "PaymentDeposit [no=" + no + ", account=" + account + ", depositor=" + depositor + ", orderNo=" + orderNo
				+ "]";
	}
	
}
