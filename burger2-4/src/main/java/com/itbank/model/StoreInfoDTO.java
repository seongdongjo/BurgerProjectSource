package com.itbank.model;

//STORE_SEQ            NOT NULL NUMBER         
//STORE_NAME           NOT NULL VARCHAR2(1000) 
//STORE_ADDRESS        NOT NULL VARCHAR2(1000) 
//STORE_DETAIL_ADDRESS NOT NULL VARCHAR2(1000) 
//STORE_TEL            NOT NULL VARCHAR2(1000) 
//STORE_OPENING_HOURS  NOT NULL VARCHAR2(1000) 
//HOURS24                       VARCHAR2(50)   
//MCDRIVE                       VARCHAR2(50)   
//MCDELIVERY                    VARCHAR2(50)   
//MCMORNING                     VARCHAR2(50)   
//PARKING                       VARCHAR2(50)   
//DECAFFEINE                    VARCHAR2(50)

public class StoreInfoDTO {

	private int store_seq;
	private String store_name, store_address, store_detail_address,
					store_tel, store_opening_hours, hours24, mcdrive, 
					mcdelivery, mcmorning, parking, decaffeine;
	
	public int getStore_seq() {
		return store_seq;
	}
	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_address() {
		return store_address;
	}
	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}
	public String getStore_detail_address() {
		return store_detail_address;
	}
	public void setStore_detail_address(String store_detail_address) {
		this.store_detail_address = store_detail_address;
	}
	public String getStore_tel() {
		return store_tel;
	}
	public void setStore_tel(String store_tel) {
		this.store_tel = store_tel;
	}
	public String getStore_opening_hours() {
		return store_opening_hours;
	}
	public void setStore_opening_hours(String store_opening_hours) {
		this.store_opening_hours = store_opening_hours;
	}
	public String getHours24() {
		return hours24;
	}
	public void setHours24(String hours24) {
		this.hours24 = hours24;
	}
	public String getMcdrive() {
		return mcdrive;
	}
	public void setMcdrive(String mcdrive) {
		this.mcdrive = mcdrive;
	}
	public String getMcdelivery() {
		return mcdelivery;
	}
	public void setMcdelivery(String mcdelivery) {
		this.mcdelivery = mcdelivery;
	}
	public String getMcmorning() {
		return mcmorning;
	}
	public void setMcmorning(String mcmorning) {
		this.mcmorning = mcmorning;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getDecaffeine() {
		return decaffeine;
	}
	public void setDecaffeine(String decaffeine) {
		this.decaffeine = decaffeine;
	}
	
}
