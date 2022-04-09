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
		section = ( page - 1 ) / 5; //페이지가 1~5까지는 0section , 6~10까지는 1section
		return section;
	}
	
	public int begin(int section) {
		begin = (section * 5) + 1;
		return begin;
	}
	
	public int end (int pageCount) { //pageCount = 페이징버튼 갯수
		end = pageCount < begin + 4 ? pageCount : begin+4; //begin이 1이면 end는 5, begin이 6이면 end 10
		return end;
	}
	
	public boolean prev (int section) { //버튼(true,flase로 반환)
		prev = (section != 0); //section이 0이라면 이전버튼이 없다
		return prev;
	}
	
	public boolean next(int pageCount, int end) { //버튼
		next = (pageCount / 5 != end / 5); //pageCount가 end보다 작을 수는 없다.
		return next;
	}
}
