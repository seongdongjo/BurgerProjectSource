package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.NoticeDAO;
import com.itbank.model.NoticeDTO;

@Service
public class NoticeService {

	@Autowired private NoticeDAO dao;
	
	public NoticeDTO getNotice(int num) {
		
		return dao.nextNotice(num);
	}
//
//	public List<NoticeDTO> searchList(String search) {
//		return dao.searchList(search);
//	}

	public List<HashMap<String, Object>> searchList(HashMap<String, Object> map) {
		return dao.searchList(map);
	}
	
	public int getTotal() {
		return dao.getTotal();
	}

	public int searchTotal(String search) {
		return dao.searchTotal(search);
	}

	public List<HashMap<String, Object>> topList() {
		
		return dao.selectNoticeTop();
	}

	public int deleteNews(int seq) {
		return dao.deleteNews(seq);
	}

	public NoticeDTO selectNews(int seq) {
		return dao.selectNews2(seq);
	}
}
