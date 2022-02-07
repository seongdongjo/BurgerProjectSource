package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.BurgerDTO;
import com.itbank.model.DessertDTO;
import com.itbank.model.DrinkDTO;
import com.itbank.model.ImageDAO;
import com.itbank.model.McMorningDTO;
import com.itbank.model.McafeDTO;
import com.itbank.model.SideDTO;

@Service
public class ImageService {


	@Autowired private ImageDAO dao;
	
	public List<McMorningDTO> getmacList() {
		return dao.getmacList();
	}
	public List<McMorningDTO> getmacSetList() {
		return dao.getmacList();   //똑같은 맥모닝테이블이라 위에랑 겹친다
	}
	public List<BurgerDTO> getburgerList() {
		return dao.getburgerList();
	}
	public List<BurgerDTO> getburgerSetList() {
		return dao.getburgerList();
	}

	public List<SideDTO> getsideList() {
		return dao.getsideList();
	}
	public List<DrinkDTO> getdrinkList() {
		return dao.getdrinkList();
	}
	public List<DessertDTO> getdessertList() {
		return dao.getdessertList();
	}
	public List<McafeDTO> getmcafeList() {
		return dao.getmcafeList();
	}
}
