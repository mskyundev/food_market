package com.team3.vo;

import java.sql.Date;

public class ProductWishListVO {
	private int pd_wish_idx;
	private String member_mb_id; //구매자일 때만 제어하기
	private int product_pd_idx;
	private Date pd_wish_date;
	
	public ProductWishListVO() {}


	
	public ProductWishListVO(int pd_wish_idx, String member_mb_id, int product_pd_idx, Date pd_wish_date) {
		this.pd_wish_idx = pd_wish_idx;
		this.member_mb_id = member_mb_id;
		this.product_pd_idx = product_pd_idx;
		this.pd_wish_date = pd_wish_date;
	}



	@Override
	public String toString() {
		return "pd_wishlistVO [pd_wish_idx=" + pd_wish_idx + ", member_mb_id=" + member_mb_id + ", product_pd_idx="
				+ product_pd_idx + ", pd_wish_date=" + pd_wish_date + "]";
	}



	public int getPd_wish_idx() {
		return pd_wish_idx;
	}
	public void setPd_wish_idx(int pd_wish_idx) {
		this.pd_wish_idx = pd_wish_idx;
	}
	public String getMember_mb_id() {
		return member_mb_id;
	}
	public void setMember_mb_id(String member_mb_id) {
		this.member_mb_id = member_mb_id;
	}
	public int getProduct_pd_idx() {
		return product_pd_idx;
	}
	public void setProduct_pd_idx(int product_pd_idx) {
		this.product_pd_idx = product_pd_idx;
	}
	public Date getPd_wish_date() {
		return pd_wish_date;
	}
	public void setPd_wish_date(Date pd_wish_date) {
		this.pd_wish_date = pd_wish_date;
	}
	
}

