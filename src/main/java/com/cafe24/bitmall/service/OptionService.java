package com.cafe24.bitmall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.OptionDao;
import com.cafe24.bitmall.vo.OptionVo;

@Service
public class OptionService {

	
	@Autowired
	private OptionDao optionDao;
	
	
	/* ------Option-------*/
	public Map<String, Object> getOptionByNo(Long no) {
		Map<String, Object> map = new HashMap<>();
		OptionVo option = optionDao.get(no);
		String type = "parent";
		
		if(option.getParentNo() != 0) {
			type = "sub";
		}
		
		map.put("type", type);
		map.put("option", option);
		
		return map;
	} 
	
	public Map<String, Object> getParentOptionList() {
		Map<String, Object> map = new HashMap<>();
		List<OptionVo> options =optionDao.getList();
		
		map.put("options", options);
		map.put("optionsLength", options.size());
		return map;
	} 
	public Map<String, Object> getSubOptionList(Long parentNo) {
		Map<String, Object> map = new HashMap<>();
		List<OptionVo> subOptions =optionDao.getList(parentNo);
		OptionVo parentOption = optionDao.get(parentNo);
		map.put("parentOption", parentOption);
		map.put("subOptions", subOptions);
		map.put("subOptionsLength", subOptions.size());
		return map;
	} 
	
	
	public boolean insertOption(OptionVo option) {
		return optionDao.insert(option);
	} 
	
	public boolean updateOption(OptionVo option) {
		return optionDao.update(option);
	} 
	
	public boolean deleteOption(Long no) {
		OptionVo option = optionDao.get(no);
		option.setStatus(false);
		return optionDao.update(option);
	} 
	
	/* ------subOption-------*/
	/*public Map<String, Object> getOptionItemByNo(Long no) {
		Map<String, Object> map = new HashMap<>();
		map.put("optionitem", optionItemDao.get(no));
		return map;
	} 
	
	public Map<String, Object> getOptionItemListByOptionNo(Long optionNo) {
		Map<String, Object> map = new HashMap<>();
		List<OptionItemVo> optionItems = optionItemDao.getList(optionNo);
		
		map.put("optionItems", optionItems);
		map.put("optionItemsLength", optionItems.size());
		return map;
	} 
	
	public boolean insertOptionItem(OptionItemVo optionItem) {
		return optionItemDao.insert(optionItem);
	} 
	
	public boolean updateOptionItem(OptionItemVo optionItem) {
		return optionItemDao.update(optionItem);
	} 
	
	public boolean deleteOptionItem(Long no) {
		OptionItemVo optionItem = optionItemDao.get(no);
		optionItem.setStatus(false);
		return optionItemDao.update(optionItem);
	} 
	*/
	
}
