package com.team3.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class AdminVO {
	private int am_idx;
	private String am_id;
	private String am_pw;
	private Timestamp am_date;
	private int mb_seller;
	
	
	public int getAm_idx() {
		return am_idx;
	}
	public void setAm_idx(int am_idx) {
		this.am_idx = am_idx;
	}
	public String getAm_id() {
		return am_id;
	}
	public void setAm_id(String am_id) {
		this.am_id = am_id;
	}
	public String getAm_pw() {
		return am_pw;
	}
	public void setAm_pw(String am_pw) {
		this.am_pw = am_pw;
	}
	public Timestamp getAm_date() {
		return am_date;
	}
	public void setAm_date(Timestamp am_date) {
		this.am_date = am_date;
	}
	public int getMb_seller() {
		return mb_seller;
	}
	public void setMb_seller(int mb_seller) {
		this.mb_seller = mb_seller;
	}
	
	
	
}
