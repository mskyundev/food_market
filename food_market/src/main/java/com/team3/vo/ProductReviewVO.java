package com.team3.vo;

import java.sql.Date;

public class ProductReviewVO {
	private int pd_re_idx;
	private String pd_re_subject;
	private String pd_re_img_name;
	private int pd_re_star;
	private Date pd_re_date;
	//-------------------------------
	private String member_mb_id; //외래키
	private int product_pd_idx; //외래키
	private int order_od_idx; //외래키 주문 번호가 있을 때 리뷰 작성하기 
	
	@Override
	public String toString() {
		return "pd_reviewVO [pd_re_idx=" + pd_re_idx + ", pd_re_subject=" + pd_re_subject + ", pd_re_img_name="
				+ pd_re_img_name + ", pd_re_star=" + pd_re_star + ", pd_re_date=" + pd_re_date + ", member_mb_id="
				+ member_mb_id + ", product_pd_idx=" + product_pd_idx + ", order_od_idx=" + order_od_idx + "]";
	}

	public ProductReviewVO() {}
	
	public int getPd_re_idx() {
		return pd_re_idx;
	}
	public void setPd_re_idx(int pd_re_idx) {
		this.pd_re_idx = pd_re_idx;
	}
	public String getPd_re_subject() {
		return pd_re_subject;
	}
	public void setPd_re_subject(String pd_re_subject) {
		this.pd_re_subject = pd_re_subject;
	}
	public String getPd_re_img_name() {
		return pd_re_img_name;
	}
	public void setPd_re_img_name(String pd_re_img_name) {
		this.pd_re_img_name = pd_re_img_name;
	}
	public int getPd_re_star() {
		return pd_re_star;
	}
	public void setPd_re_star(int pd_re_star) {
		this.pd_re_star = pd_re_star;
	}
	public Date getPd_re_date() {
		return pd_re_date;
	}
	public void setPd_re_date(Date pd_re_date) {
		this.pd_re_date = pd_re_date;
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
	public int getOrder_od_idx() {
		return order_od_idx;
	}
	public void setOrder_od_idx(int order_od_idx) {
		this.order_od_idx = order_od_idx;
	}
	
}

