package com.cafe24.bitmall.vo;

import java.util.List;

public class OptionVo {
	private long no;
	private String name;
	private boolean status;
	private long parentNo;
	private String parentName;
	private List<OptionVo> subOptions;
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
	public boolean getStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public long getParentNo() {
		return parentNo;
	}
	public void setParentNo(long parentNo) {
		this.parentNo = parentNo;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public List<OptionVo> getSubOptions() {
		return subOptions;
	}
	public void setSubOptions(List<OptionVo> subOptions) {
		this.subOptions = subOptions;
	}
	@Override
	public String toString() {
		return "OptionVo [no=" + no + ", name=" + name + ", status=" + status + ", parentOptionNo=" + parentNo
				+ ", prarentName=" + parentName + ", subOptions=" + subOptions + "]";
	}
	
}
