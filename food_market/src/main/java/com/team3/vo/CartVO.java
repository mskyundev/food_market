package com.team3.vo;

public class CartVO {
	//장바구니 번호(AI 사용)
		private int cart_idx;
		//회원 아이디
		private String mb_id;
		//상품 번호
		private int pd_idx;
		//상품명
		private String pd_name;
		//상품사진
		private String pd_img;
		//상품크기
		private String pd_size;
		//상품가격
		private int price;
		//상품 합계 금액
		private int money;
		//상품수량
		private int amount;
		//상품 재고
		private int pd_stock;
		//카테고리
		private String pd_category;

		public String getPd_category() {
			return pd_category;
		}


		public void setPd_category(String pd_category) {
			this.pd_category = pd_category;
		}


		public int getPd_stock() {
			return pd_stock;
		}
		public void setPd_stock(int pd_stock) {
			this.pd_stock = pd_stock;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
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
		public String getPd_size() {
			return pd_size;
		}
		public void setPd_size(String pd_size) {
			this.pd_size = pd_size;
		}
		public int getAmount() {
			return amount;
		}
		public void setAmount(int amount) {
			this.amount = amount;
		}

		public CartVO() {}
		public int getCart_idx() {
			return cart_idx;
		}
		public void setCart_idx(int cart_idx) {
			this.cart_idx = cart_idx;
		}


		public String getMb_id() {
			return mb_id;
		}
		public void setMb_id(String mb_id) {
			this.mb_id = mb_id;
		}



		public int getMoney() {
			return money;
		}
		public void setMoney(int money) {
			this.money = money;
		}

		
		
	}


