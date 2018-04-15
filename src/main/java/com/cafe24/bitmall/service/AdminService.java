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
public class AdminService {

	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductImageDao productImgDao;
	@Autowired
	private FileUploadService fileUploadServ;
	@Autowired
	private OptionDao optionDao;
	
	
	public Map<String, Object> getProductAddFormInfo() {
		Map<String, Object> map = new HashMap<>();
		map.put("categories", categoryDao.getList());
		map.put("options", optionDao.getList());
		return map;
	}
}
