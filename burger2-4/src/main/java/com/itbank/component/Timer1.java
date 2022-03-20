package com.itbank.component;

import java.util.Timer;
import java.util.TimerTask;

import org.springframework.stereotype.Component;

class CH implements Runnable {
	@Override
	
	public void run() {
		// TODO Auto-generated method stub
		try {
			while (true) {

				Thread.sleep(1000);

			}

		} catch (InterruptedException e) {

			e.printStackTrace();

		}

	}
}

@Component
public class Timer1 {

//	int time;
//	int min;
//	int sec;
//	
//	public int min(int time) {
//		min = time / 60;
//		return min;
//	}
//	
//	public int sec (int time) {
//		sec = time % 60;
//		return sec;
//	}
//	
//	public String timer(int time) {
//		String timer2 = "";
//		min = time / 60;
//		sec = time % 60;
//		for(int i = min; i <= 0; i-- ) {
//			for(int j = sec; j <= 0; j--) {
//				timer2 +=( min + "분"  + sec + "초");
//			}
//		}
//		
//		return timer2;
//	}
//	var x = setInterval(function() {
//		   min = parseInt(time/60);
//		   sec = time%60;
//		   document.getElementById("timer").innerHTML = min + "분" + sec + "초";
//		   time--;
//		   if(time == 30) {
//			   orderProcess.innerText +='✔️ '
//		   }
//		   if(time < 0 ) {
//		      clearInterval(x);
//		      document.getElementById("timer").innerHTML = "배달 완료";
//				orderComplete.innerText +='✔️ '
//		   }
//		}, 1000); 
//		
		
	
	}
