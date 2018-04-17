package com.cafe24.bitmall.vo;

public class PaymentCardVo {
	private long no;
	private String cardType;
	private String cardNo;
	private String approveNo;
	private String payer;
	private String installment;
	private long orderNo;
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getApproveNo() {
		return approveNo;
	}
	public void setApproveNo(String approveNo) {
		this.approveNo = approveNo;
	}
	public String getPayer() {
		return payer;
	}
	public void setPayer(String payer) {
		this.payer = payer;
	}
	public long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(long orderNo) {
		this.orderNo = orderNo;
	}
	public String getInstallment() {
		return installment;
	}
	public void setInstallment(String installment) {
		this.installment = installment;
	}
	@Override
	public String toString() {
		return "PaymentCardVo [no=" + no + ", cardType=" + cardType + ", cardNo=" + cardNo + ", approveNo=" + approveNo
				+ ", payer=" + payer + ", installment=" + installment + ", orderNo=" + orderNo + "]";
	}
	
}
