package com.itbank.promotion;

//promotion_seq		number		default promotion_seq.nextval primary key,
//promotion_img		varchar2(1500)	not null,
//promotion_content	varchar2(1500)	not null

public class PromDTO {

	private int promotion_seq;
	private String promotion_img, promotion_content;
	
	public int getPromotion_seq() {
		return promotion_seq;
	}
	public void setPromotion_seq(int promotion_seq) {
		this.promotion_seq = promotion_seq;
	}
	public String getPromotion_img() {
		return promotion_img;
	}
	public void setPromotion_img(String promotion_img) {
		this.promotion_img = promotion_img;
	}
	public String getPrmotion_content() {
		return promotion_content;
	}
	public void setPrmotion_content(String promotion_content) {
		this.promotion_content = promotion_content;
	}
	
	
}
