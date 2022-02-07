package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.StoreInfoDAO;
import com.itbank.model.StoreInfoDTO;

@Service
public class StoreService {

	@Autowired private StoreInfoDAO dao;
	
	public List<StoreInfoDTO> getStore(String info) {
		return dao.selectStore(info);
	}

	public List<HashMap<String, Object>> selectCate(HashMap<String, Object> map1) {
		return dao.selectCate(map1);
	}

	public int selectCount(String cate1) {
		
		return dao.selectCount(cate1);
	}

}
