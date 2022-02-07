package com.itbank.model;

import java.sql.Date;

//orderSeq	    	number			    default order_seq.nextval primary key,
//userid		    varchar2(500)		constraint orderlist_user_fk references user_table(userid),
//orderDate	    	date	    		default sysdate,
//deliveryTime		varchar2(500)		not null,
//orderAddress   	varchar2(1000)	    constraint orderlist_userAddress_fk references user_table(address),
//phone		    	varchar2(1000)		constraint orderlist_userPhone_fk references user_table(phone),
//menus		    	varchar2(4000)		null,
//price		    	number		    	null,
//paystatus	    	varchar2(500)		constraint paystatus_check check (paystatus in ('y', 'n')),
//orderstatus	    varchar2(500)		constraint orderstatus_check check (orderstatus in ('y', 'n')),
//requirement	    varchar2(500)		null

public class OrderListDTO {

	private int orderSeq;
	private Date orderDate, deliveryTime;
	private String userid, price, total, orderAddress, phone, menus, paystatus, orderstatus, requirement;
	
	public int getOrderSeq() {
		return orderSeq;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public Date getDeliveryTime() {
		return deliveryTime;
	}
	public String getUserid() {
		return userid;
	}
	public String getPrice() {
		return price;
	}
	public String getTotal() {
		return total;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public String getPhone() {
		return phone;
	}
	public String getMenus() {
		return menus;
	}
	public String getPaystatus() {
		return paystatus;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setOrderSeq(int orderSeq) {
		this.orderSeq = orderSeq;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public void setDeliveryTime(Date deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setMenus(String menus) {
		this.menus = menus;
	}
	public void setPaystatus(String paystatus) {
		this.paystatus = paystatus;
	}
	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	
	
	
}
