package com.itbank.model;

//menutop_seq			        number		    default menutop_seq.nextval primary key,
//burger_table_description	varchar2(1000)	not null,
//burger_background		    varchar2(1000)	not null,
//mcmorning_table_description	varchar2(1000)	not null,
//mcmorning_background		varchar2(1000)	not null,
//side_table_description		varchar2(1000)	not null,
//side_background			    varchar2(1000)	not null,
//drink_table_description		varchar2(1000)	not null,
//drink_background		    varchar2(1000)	not null,
//dessert_table_description	varchar2(1000)	not null,
//dessert_background		    varchar2(1000)	not null,
//mccafe_table_description	varchar2(1000)	not null,
//mccafe_background		    varchar2(1000)	not null

public class MenuTopDTO {	
	
	private String menutop_seq;
	private String burger_table_description, burger_table_background;
	private String mcmorning_table_description, mcmorning_table_background;
	private String side_table_description, side_table_background;
	private String drink_table_desciption, drink_table_background;
	private String dessert_table_desciption, dessert_table_background;
	private String mccafe_table_desciption, mccafe_table_bankground;
	public String getMenutop_seq() {
		return menutop_seq;
	}
	public String getBurger_table_description() {
		return burger_table_description;
	}
	public String getBurger_table_background() {
		return burger_table_background;
	}
	public String getMcmorning_table_description() {
		return mcmorning_table_description;
	}
	public String getMcmorning_table_background() {
		return mcmorning_table_background;
	}
	public String getSide_table_description() {
		return side_table_description;
	}
	public String getSide_table_background() {
		return side_table_background;
	}
	public String getDrink_table_desciption() {
		return drink_table_desciption;
	}
	public String getDrink_table_background() {
		return drink_table_background;
	}
	public String getDessert_table_desciption() {
		return dessert_table_desciption;
	}
	public String getDessert_table_background() {
		return dessert_table_background;
	}
	public String getMccafe_table_desciption() {
		return mccafe_table_desciption;
	}
	public String getMccafe_table_bankground() {
		return mccafe_table_bankground;
	}
	public void setMenutop_seq(String menutop_seq) {
		this.menutop_seq = menutop_seq;
	}
	public void setBurger_table_description(String burger_table_description) {
		this.burger_table_description = burger_table_description;
	}
	public void setBurger_table_background(String burger_table_background) {
		this.burger_table_background = burger_table_background;
	}
	public void setMcmorning_table_description(String mcmorning_table_description) {
		this.mcmorning_table_description = mcmorning_table_description;
	}
	public void setMcmorning_table_background(String mcmorning_table_background) {
		this.mcmorning_table_background = mcmorning_table_background;
	}
	public void setSide_table_description(String side_table_description) {
		this.side_table_description = side_table_description;
	}
	public void setSide_table_background(String side_table_background) {
		this.side_table_background = side_table_background;
	}
	public void setDrink_table_desciption(String drink_table_desciption) {
		this.drink_table_desciption = drink_table_desciption;
	}
	public void setDrink_table_background(String drink_table_background) {
		this.drink_table_background = drink_table_background;
	}
	public void setDessert_table_desciption(String dessert_table_desciption) {
		this.dessert_table_desciption = dessert_table_desciption;
	}
	public void setDessert_table_background(String dessert_table_background) {
		this.dessert_table_background = dessert_table_background;
	}
	public void setMccafe_table_desciption(String mccafe_table_desciption) {
		this.mccafe_table_desciption = mccafe_table_desciption;
	}
	public void setMccafe_table_bankground(String mccafe_table_bankground) {
		this.mccafe_table_bankground = mccafe_table_bankground;
	}
}
