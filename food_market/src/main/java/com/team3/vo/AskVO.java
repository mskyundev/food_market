package com.team3.vo;

public class AskVO {
	/*
	 * 0. 배송문의
	 * 1. 주문결제
	 * 2. 반품/교환/환불
	 * 3. 회원서비스
	 * 8. 기타
	 */
	private int ask_type;
	private String ask_subject;
	private String ask_content;
	
	public int getAsk_type() {
		return ask_type;
	}
	public void setAsk_type(int ask_type) {
		this.ask_type = ask_type;
	}
	public String getAsk_subject() {
		return ask_subject;
	}
	public void setAsk_subject(String ask_subject) {
		this.ask_subject = ask_subject;
	}
	public String getAsk_content() {
		return ask_content;
	}
	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}
}

