	package com.cafe24.bitmall.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.bitmall.service.OptionService;
import com.cafe24.bitmall.vo.OptionVo;

@RequestMapping("/admin/option")
@Controller(value="adminOptionController")
public class OptionController {
	@Autowired
	private OptionService optionServ;
	
	/*-------Option-------------*/
	@RequestMapping(value = "", method = RequestMethod.GET )
	public String listParentOption(Model model) {
		model.addAllAttributes(optionServ.getParentOptionList());
		return "admin/option";
	}
	@RequestMapping(value = "/{parentNo}", method = RequestMethod.GET )
	public String listSubOption(
			Model model,
			@PathVariable("parentNo") Long parentNo) {
		model.addAllAttributes(optionServ.getSubOptionList(parentNo));
		return "admin/sub_option";
	}
	
	//옵션
	@RequestMapping(value = "/add", method = RequestMethod.GET )
	public String addOption() {
		return "admin/option_new";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST )
	public String addOption(OptionVo option) {
		System.out.println("옵션:"+option);
		optionServ.insertOption(option);
		return "redirect:/admin/option";
	}
	//소옵션
	@RequestMapping(value = "/add/{parentNo}", method = RequestMethod.GET )
	public String addSubOption() {
		return "admin/option_new";
	}
	
	@RequestMapping(value = "/add/{parentNo}", method = RequestMethod.POST )
	public String addSubOption(
			OptionVo option,
			@PathVariable("parentNo") Long parentNo) {
		System.out.println("소옵션:"+option);
		optionServ.insertOption(option);
		return "redirect:/admin/option/"+parentNo;
	}
	
	
	@RequestMapping(value = "/edit/{no}", method = RequestMethod.GET )
	public String editOption(
			Model model,
			@PathVariable("no") Long no) {
		Map<String, Object> map = optionServ.getOptionByNo(no);
		model.addAllAttributes(map);
		
		if(map.get("type").equals("sub")) {
			OptionVo option =  (OptionVo) map.get("option");
			return "admin/sub_option_edit";
		}
		
		return "admin/option_edit";
	}
	
	@RequestMapping(value = "/edit/{no}", method = RequestMethod.POST )
	public String editOption(OptionVo option) {
		optionServ.updateOption(option);
		
		if(option.getParentNo() != 0) {
			return "redirect:/admin/option/"+option.getParentNo();
		}
		
		return "redirect:/admin/option";
	}
	
	@RequestMapping(value = "/delete/{no}")
	public String deleteOption(@PathVariable("no") Long no) {
		Map<String, Object> map = optionServ.getOptionByNo(no);
		optionServ.deleteOption(no);
		
		if(map.get("type").equals("sub")) {
			OptionVo option =  (OptionVo) map.get("option");
			return "redirect:/admin/option/"+option.getParentNo();
		}
		
		
		return "redirect:/admin/option";
	}
}
