package com.team3.vo;

import java.util.Date;

public class ProductVO {
	private String pd_category;
	private int pd_idx;
	private String pd_name;
	private int pd_price;
	private String pd_size;
	private String pd_origin;
	private String pd_img_name_f;
	private String pd_img_name_s;
	private int pd_stock;
	private Date pd_date;
	private String member_mb_id; // member 외래키

	//ProductWishListVO 객체
	private ProductWishListVO ProductWishListVO;
	public ProductWishListVO getPd_wishlistVO() {
		return ProductWishListVO;
	}
	public void setPd_wishlistVO(ProductWishListVO pd_wishlistVO) {
		this.ProductWishListVO = pd_wishlistVO;
	}

	//member VO객체
	private MemberVO mvo;
	public MemberVO getMemdto() {
		return mvo;
	}
	public void setMemdto(MemberVO mvo) {
		this.mvo = mvo;
	}

	
	
	public ProductVO(String pd_category, int pd_idx, String pd_name, int pd_price, String pd_size, String pd_origin,
			String pd_img_name_f, String pd_img_name_s, int pd_stock, Date pd_date, String member_mb_id,
			ProductWishListVO ProductWishListVO, MemberVO mvo) {
		super();
		this.pd_category = pd_category;
		this.pd_idx = pd_idx;
		this.pd_name = pd_name;
		this.pd_price = pd_price;
		this.pd_size = pd_size;
		this.pd_origin = pd_origin;
		this.pd_img_name_f = pd_img_name_f;
		this.pd_img_name_s = pd_img_name_s;
		this.pd_stock = pd_stock;
		this.pd_date = pd_date;
		this.member_mb_id = member_mb_id;
		this.ProductWishListVO = ProductWishListVO;
		this.mvo = mvo;
	}
	
	@Override
	public String toString() {
		return "productVO [pd_category=" + pd_category + ", pd_idx=" + pd_idx + ", pd_name=" + pd_name + ", pd_price="
				+ pd_price + ", pd_size=" + pd_size + ", pd_origin=" + pd_origin + ", pd_img_name_f=" + pd_img_name_f
				+ ", pd_img_name_s=" + pd_img_name_s + ", pd_stock=" + pd_stock + ", pd_date=" + pd_date
				+ ", member_mb_id=" + member_mb_id + ", ProductWishListVO=" + ProductWishListVO + ", mvo=" + mvo + "]";
	}
	
	public ProductVO() {
	}

	public String getPd_category() {
		return pd_category;
	}

	public void setPd_category(String pd_category) {
		this.pd_category = pd_category;
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

	public int getPd_price() {
		return pd_price;
	}

	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}

	public String getPd_size() {
		return pd_size;
	}

	public void setPd_size(String pd_size) {
		this.pd_size = pd_size;
	}

	public String getPd_origin() {
		return pd_origin;
	}

	public void setPd_origin(String pd_origin) {
		this.pd_origin = pd_origin;
	}

	public Date getPd_date() {
		return pd_date;
	}

	public void setPd_date(Date pd_date) {
		this.pd_date = pd_date;
	}

	public String getMember_mb_id() {
		return member_mb_id;
	}

	public void setMember_mb_id(String member_mb_id) {
		this.member_mb_id = member_mb_id;
	}

	public String getPd_img_name_f() {
		return pd_img_name_f;
	}

	public void setPd_img_name_f(String pd_img_name_f) {
		this.pd_img_name_f = pd_img_name_f;
	}

	public String getPd_img_name_s() {
		return pd_img_name_s;
	}

	public void setPd_img_name_s(String pd_img_name_s) {
		this.pd_img_name_s = pd_img_name_s;
	}

	public int getPd_stock() {
		return pd_stock;
	}

	public void setPd_stock(int pd_stock) {
		this.pd_stock = pd_stock;
	}

}

