package com.team3.vo;

import java.sql.Timestamp;

public class CsVO {
	private int cs_idx;
	private int cs_type;
	private String cs_subject;
	private String cs_content;
	private String cs_file;
	private Timestamp cs_date;
	private int cs_re_ref;
	private int cs_re_lev;
	private int cs_re_seq;
	private int order_od_idx;
	private String member_mb_id;
	private int pd_idx;
	private String od_num;
	
	
	
	
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
	public int getCs_idx() {
		return cs_idx;
	}
	public void setCs_idx(int cs_idx) {
		this.cs_idx = cs_idx;
	}
	public int getCs_type() {
		return cs_type;
	}
	public void setCs_type(int cs_type) {
		this.cs_type = cs_type;
	}
	public String getCs_subject() {
		return cs_subject;
	}
	public void setCs_subject(String cs_subject) {
		this.cs_subject = cs_subject;
	}
	public String getCs_content() {
		return cs_content;
	}
	public void setCs_content(String cs_content) {
		this.cs_content = cs_content;
	}
	public String getCs_file() {
		return cs_file;
	}
	public void setCs_file(String cs_file) {
		this.cs_file = cs_file;
	}
	public Timestamp getCs_date() {
		return cs_date;
	}
	public void setCs_date(Timestamp cs_date) {
		this.cs_date = cs_date;
	}
	public int getCs_re_ref() {
		return cs_re_ref;
	}
	public void setCs_re_ref(int cs_re_ref) {
		this.cs_re_ref = cs_re_ref;
	}
	public int getCs_re_lev() {
		return cs_re_lev;
	}
	public void setCs_re_lev(int cs_re_lev) {
		this.cs_re_lev = cs_re_lev;
	}
	public int getCs_re_seq() {
		return cs_re_seq;
	}
	public void setCs_re_seq(int cs_re_seq) {
		this.cs_re_seq = cs_re_seq;
	}
	public int getOrder_od_idx() {
		return order_od_idx;
	}
	public void setOrder_od_idx(int order_od_idx) {
		this.order_od_idx = order_od_idx;
	}
	public String getMember_mb_id() {
		return member_mb_id;
	}
	public void setMember_mb_id(String member_mb_id) {
		this.member_mb_id = member_mb_id;
	}
	
	
}

