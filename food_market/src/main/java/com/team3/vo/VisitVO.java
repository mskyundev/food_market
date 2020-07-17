package com.team3.vo;

import java.sql.Date;

public class VisitVO {
	private int chrome;
	private int edge;
	private int explorer;
	private int safari;
	private int etc;
	private Date date;
	private int visits;
	
	public int getChrome() {
		return chrome;
	}
	public void setChrome(int chrome) {
		this.chrome = chrome;
	}
	public int getEdge() {
		return edge;
	}
	public void setEdge(int edge) {
		this.edge = edge;
	}
	public int getExplorer() {
		return explorer;
	}
	public void setExplorer(int explorer) {
		this.explorer = explorer;
	}
	public int getSafari() {
		return safari;
	}
	public void setSafari(int safari) {
		this.safari = safari;
	}
	public int getEtc() {
		return etc;
	}
	public void setEtc(int etc) {
		this.etc = etc;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getVisits() {
		return visits;
	}
	public void setVisits(int visits) {
		this.visits = visits;
	}
}
