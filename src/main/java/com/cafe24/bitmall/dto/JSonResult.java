package com.cafe24.bitmall.dto;
public class JSonResult {
	private String result; 		// "success" or "fail"
	private String message; 	//result가 "fail"일 경우 원인 메시지
	private Object data; 		//result가 "success"일 경우 전달 데이터
	
	private JSonResult(String result, String message, Object data) {
		this.result = result;
		this.message = message;
		this.data = data;
	}
	
	public String getResult() {
		return result;
	}
	public String getMessage() {
		return message;
	}
	public Object getData() {
		return data;
	}
	
	@Override
	public String toString() {
		return "JSonResult [result=" + result + ", message=" + message + ", data=" + data + "]";
	}
	
	public static JSonResult success(Object data) {
		return new JSonResult("success", null, data);
	}
	
	public static JSonResult fail(String message) {
		return new JSonResult("fail", message, null);
	}
}
