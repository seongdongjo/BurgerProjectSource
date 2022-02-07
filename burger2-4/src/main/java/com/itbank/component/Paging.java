package com.itbank.component;

import org.springframework.stereotype.Component;

@Component
public class Paging {

	int section;
	int begin;
	int end;
	boolean prev;
	boolean next;
	
	public int section(int page) {
		section = ( page - 1 ) / 5;
		return section;
	}
	
	public int begin(int section) {
		begin = (section * 5) + 1;
		return begin;
	}
	
	public int end (int pageCount) {
		end = pageCount < begin + 4 ? pageCount : begin+4;
		return end;
	}
	
	public boolean prev (int section) {
		prev = (section != 0);
		return prev;
	}
	
	public boolean next(int pageCount, int end) {
		next = (pageCount / 5 != end / 5);
		return next;
	}
}
