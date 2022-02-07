
package com.itbank.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

//NOTICE_SEQ NOT NULL NUMBER         
//TITLE      NOT NULL VARCHAR2(500)  
//WRITER              VARCHAR2(500)  
//CONTENT    NOT NULL VARCHAR2(2000) 
//REQDATE             DATE           
//CNT        NOT NULL NUMBER         
//FLAG       NOT NULL VARCHAR2(100)  
//FILENAME            VARCHAR2(1000)

public class NoticeDTO {

	private int notice_seq, cnt;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date regDate;
	private String title, writer, content, flag;
	private MultipartFile uploadFile;
	private String fileName;
	
	public int getNotice_seq() {
		return notice_seq;
	}
	public int getCnt() {
		return cnt;
	}
	public Date getRegDate() {
		return regDate;
	}
	public String getTitle() {
		return title;
	}
	public String getWriter() {
		return writer;
	}
	public String getContent() {
		return content;
	}
	public String getFlag() {
		return flag;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public String getFileName() {
		return fileName;
	}
	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	

	
	
}
