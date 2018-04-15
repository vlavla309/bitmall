package com.cafe24.bitmall.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.CategoryDao;
import com.cafe24.bitmall.repository.OptionDao;
import com.cafe24.bitmall.repository.ProductDao;
import com.cafe24.bitmall.repository.ProductImageDao;
import com.cafe24.bitmall.vo.OptionVo;

@Service
public class CategoryService {

	@Autowired
	private CategoryDao categoryDao;
	
	
	public Map<String, Object> getCategories() {
		Map<String, Object> map = new HashMap<>();
		map.put("categories", categoryDao.getList());
		return map;
	}
}
