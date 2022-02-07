package com.itbank.model;

import java.sql.Date;

//REPLY_SEQ NOT NULL NUMBER         
//BOARD_IDX          NUMBER         
//WRITER             VARCHAR2(500)  
//CONTENT   NOT NULL VARCHAR2(2000) 
//WRITEDATE          DATE   

public class ReplyDTO {

	private int reply_seq, board_idx;
	private Date writeDate;
	private String writer, content;
	
	public int getReply_seq() {
		return reply_seq;
	}
	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	

}
