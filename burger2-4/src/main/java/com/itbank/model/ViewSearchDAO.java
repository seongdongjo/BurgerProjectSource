package com.itbank.model;

import java.util.HashMap;
import java.util.List;

public interface ViewSearchDAO {
	public List<HashMap<String, String>> viewsearch(HashMap<String, String> map);
}