package com.itbank.model;

/*MCCAFE_SEQ     NUMBER        
MCCAFE_NAME    VARCHAR2(500) 
MCCAFE_IMG     VARCHAR2(500) */
public class ViewMcafeDTO {
	private int mccafe_seq;
	private String mccafe_name;
	private String mccafe_img;
	public int getMccafe_seq() {
		return mccafe_seq;
	}
	public void setMccafe_seq(int mccafe_seq) {
		this.mccafe_seq = mccafe_seq;
	}
	public String getMccafe_name() {
		return mccafe_name;
	}
	public void setMccafe_name(String mccafe_name) {
		this.mccafe_name = mccafe_name;
	}
	public String getMccafe_img() {
		return mccafe_img;
	}
	public void setMccafe_img(String mccafe_img) {
		this.mccafe_img = mccafe_img;
	}
}
