package com.team3.vo;

public class PreOrdersVO {
	private int pre_id; //임시결제 순서값
	private String mb_id; //회원 아이디
	private int cart_idx; //장바구니 순서값
	private int pd_idx; //상품 순서값
	private String pd_name; //상품명
	private String pd_img; //상품 이미지
	private String pd_category;
	
	private int price; //임시 결제 상품 합산가격
	private int amount; //임시 결제 상품 총 수량
	private int summoney; //최종 결제 금액

	
	public PreOrdersVO() {
	
	}

	public PreOrdersVO(int pre_id, String mb_id, int cart_idx, int pd_idx, String pd_name, String pd_img,
			String pd_category, int price, int amount, int summoney) {
		this.pre_id = pre_id;
		this.mb_id = mb_id;
		this.cart_idx = cart_idx;
		this.pd_idx = pd_idx;
		this.pd_name = pd_name;
		this.pd_img = pd_img;
		this.pd_category = pd_category;
		this.price = price;
		this.amount = amount;
		this.summoney = summoney;
	}
	
	@Override
	public String toString() {
		return "preordersVO [pre_id=" + pre_id + ", mb_id=" + mb_id + ", cart_idx=" + cart_idx + ", pd_idx=" + pd_idx
				+ ", pd_name=" + pd_name + ", pd_img=" + pd_img + ", pd_category=" + pd_category + ", price=" + price
				+ ", amount=" + amount + ", summoney=" + summoney + "]";
		
	
	}
	public String getPd_category() {
		return pd_category;
	}
	public void setPd_category(String pd_categoty) {
		this.pd_category = pd_categoty;
	}
	public int getSummoney() {
		return summoney;
	}
	public void setSummoney(int summoney) {
		this.summoney = summoney;
	}
	public int getPre_id() {
		return pre_id;
	}
	public void setPre_id(int pre_id) {
		this.pre_id = pre_id;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public int getCart_idx() {
		return cart_idx;
	}
	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
	}
	public int getPd_idx() {
		return pd_idx;
	}
	public void setPd_idx(int pd_idx) {
		this.pd_idx = pd_idx;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public String getPd_img() {
		return pd_img;
	}
	public void setPd_img(String pd_img) {
		this.pd_img = pd_img;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}


	
	
}


