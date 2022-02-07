package com.itbank.model;

import java.sql.Date;

//qna_seq		number			    default qna_seq.nextval primary key,
//writer		varchar2(500)		constraint qnaboard_user_fk references user_table(userid),
//title			varchar2(500)		not null,
//phone			varchar2(500)		constraint qna_phone_fk references user_table(phone),
//email			varchar2(1000)		constraint qna_email_fk references user_table(email),	
//qnaType		varchar2(500)		not null,
//regDate		date			    default sysdate,
//ipAddress		varchar2(500)		not null,
//content		varchar2(4000)		not null,	
//storeRegion	varchar2(500)		default null,
//storeName		varchar2(1000)		default null,
//result		varchar2(500)		default 'n' constraint result_check check (result in ('y', 'n')),
//flag			varchar2(100)		constraint flag_check check (flag in ('y', 'n'))

public class QnaBoardDTO {

	private int qna_seq;
	private Date regDate;
	private String writer, title, phone, email, qnaType, ipAddress, content, storeRegion, storeName, result, flag;
	
	public int getQna_seq() {
		return qna_seq;
	}
	public Date getRegDate() {
		return regDate;
	}
	public String getWriter() {
		return writer;
	}
	public String getTitle() {
		return title;
	}
	public String getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public String getQnaType() {
		return qnaType;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public String getContent() {
		return content;
	}
	public String getStoreRegion() {
		return storeRegion;
	}
	public String getStoreName() {
		return storeName;
	}
	public String getResult() {
		return result;
	}
	public String getFlag() {
		return flag;
	}
	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setQnaType(String qnaType) {
		this.qnaType = qnaType;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setStoreRegion(String storeRegion) {
		this.storeRegion = storeRegion;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
}
