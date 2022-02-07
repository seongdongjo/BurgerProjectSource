package com.itbank.component;

import org.springframework.stereotype.Component;

@Component
public class Timer {

	int time;
	int min;
	int sec;
	
	public int min(int time) {
		min = time / 60;
		return min;
	}
	
	public int sec (int time) {
		sec = time % 60;
		return sec;
	}
	
	public String timer(int time) {
		String timer2 = "";
		
		for(int i = min; i <= 0; i-- ) {
			for(int j = sec; j <= 0; j--) {
				timer2 +=( min + "분"  + sec + "초");
			}
		}
		
		return timer2;
	}
	
}
