package com.itbank.component;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Component;

@Component
public class Hash {

	public String getHash(String input) {
	
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			
			// 겹치는게 있을 수 있어서 reset
			md.reset();
			
			// 입력값을 바이트단위로 쪼갠다 다음에 md에 업데이트
			md.update(input.getBytes("UTF-8"));
			
			// 128의 16진수로 만들어 낸다 이렇게 만들어진 문자열을 반환한다
			String hashNumber = String.format("%0128x", new BigInteger(1, md.digest()));
			
			return hashNumber;
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("해시 알고리즘이 없나여?");
		}
		return null;
		
		
	}
	
}