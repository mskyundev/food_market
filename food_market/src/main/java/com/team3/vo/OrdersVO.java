package com.team3.vo;

public class OrdersVO {
	private int od_idx; //주문순서값
	private int pd_idx; //상품순서값
	private String od_num; //주문번호
	private String mb_id; //회원 아이디
	private String od_address; //배송지 주소1
	private String od_address1; //배송지 주소2
	private String od_mobile; //주문자 번호
	private String od_name; //주문자 이름
	private String od_msg; //주문 메세지
	private String od_date; //주문완료 날짜
	private int od_total; //주문 최종 금액
	private String pd_name; //상품명
	private String pd_img_name_f; //상품 이미지
	private String pd_price; //상품 가격
	private String od_delivery; //배송상태
	private int amount; //주문 상품 총 수량
	private int price; //주문 상품 총 가격
	private int summoney; //주문 합산금액 (배송비 + 상품금액)
	private String pd_img; //상품 이미지2
	private String pd_category; //상품 카테고리
	
	
	
	
	
	
	@Override
	public String toString() {
		return "ordersVO [od_idx=" + od_idx + ", pd_idx=" + pd_idx + ", od_num=" + od_num + ", mb_id=" + mb_id
				+ ", od_address=" + od_address + ", od_address1=" + od_address1 + ", od_mobile=" + od_mobile
				+ ", od_name=" + od_name + ", od_msg=" + od_msg + ", od_date=" + od_date + ", od_total=" + od_total
				+ ", pd_name=" + pd_name + ", pd_img_name_f=" + pd_img_name_f + ", pd_price=" + pd_price
				+ ", od_delivery=" + od_delivery + ", amount=" + amount + ", price=" + price + ", summoney=" + summoney
				+ ", pd_img=" + pd_img + ", pd_category=" + pd_category + "]";
	}
	public String getPd_category() {
		return pd_category;
	}
	public void setPd_category(String pd_category) {
		this.pd_category = pd_category;
	}
	public int getSummoney() {
		return summoney;
	}

	public void setSummoney(int summoney) {
		this.summoney = summoney;
	}

	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPd_img() {
		return pd_img;
	}
	public void setPd_img(String pd_img) {
		this.pd_img = pd_img;
	}

	public String getOd_delivery() {
		return od_delivery;
	}
	public void setOd_delivery(String od_delivery) {
		this.od_delivery = od_delivery;
	}
	public String getPd_price() {
		return pd_price;
	}
	public void setPd_price(String pd_price) {
		this.pd_price = pd_price;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public String getPd_img_name_f() {
		return pd_img_name_f;
	}
	public void setPd_img_name_f(String pd_img_name_f) {
		this.pd_img_name_f = pd_img_name_f;
	}
	public String getOd_date() {
		return od_date;
	}
	public void setOd_date(String od_date) {
		this.od_date = od_date;
	}
	public int getOd_total() {
		return od_total;
	}
	public void setOd_total(int od_total) {
		this.od_total = od_total;
	}
	public String getOd_msg() {
		return od_msg;
	}
	public void setOd_msg(String od_msg) {
		this.od_msg = od_msg;
	}
	public int getOd_idx() {
		return od_idx;
	}
	public void setOd_idx(int od_idx) {
		this.od_idx = od_idx;
	}
	public int getPd_idx() {
		return pd_idx;
	}
	public void setPd_idx(int pd_idx) {
		this.pd_idx = pd_idx;
	}
	public String getOd_num() {
		return od_num;
	}
	public void setOd_num(String od_num) {
		this.od_num = od_num;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getOd_address() {
		return od_address;
	}
	public void setOd_address(String od_address) {
		this.od_address = od_address;
	}
	public String getOd_address1() {
		return od_address1;
	}
	public void setOd_address1(String od_address1) {
		this.od_address1 = od_address1;
	}
	public String getOd_mobile() {
		return od_mobile;
	}
	public void setOd_mobile(String od_mobile) {
		this.od_mobile = od_mobile;
	}
	public String getOd_name() {
		return od_name;
	}
	public void setOd_name(String od_name) {
		this.od_name = od_name;
	}


	
}


