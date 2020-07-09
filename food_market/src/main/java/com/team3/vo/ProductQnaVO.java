package com.team3.vo;

import java.sql.Timestamp;

public class ProductQnaVO {
	private int qna_num;
	private String qna_content;
	private Timestamp qna_data;
	private String mb_id;
	private int pd_idx;
	private Integer qna_re_ref;
	private Integer qna_re_lev;
	private Integer qna_re_seq;
	
	
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Timestamp getQna_data() {
		return qna_data;
	}
	public void setQna_data(Timestamp qna_data) {
		this.qna_data = qna_data;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public int getPd_idx() {
		return pd_idx;
	}
	public void setPd_idx(int pd_idx) {
		this.pd_idx = pd_idx;
	}
	public Integer getQna_re_ref() {
		return qna_re_ref;
	}
	public void setQna_re_ref(Integer qna_re_ref) {
		this.qna_re_ref = qna_re_ref;
	}
	public Integer getQna_re_lev() {
		return qna_re_lev;
	}
	public void setQna_re_lev(Integer qna_re_lev) {
		this.qna_re_lev = qna_re_lev;
	}
	public Integer getQna_re_seq() {
		return qna_re_seq;
	}
	public void setQna_re_seq(Integer qna_re_seq) {
		this.qna_re_seq = qna_re_seq;
	}
	
}

