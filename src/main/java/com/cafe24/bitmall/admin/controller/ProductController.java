	package com.cafe24.bitmall.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.bitmall.service.AdminService;
import com.cafe24.bitmall.service.ProductService;
import com.cafe24.bitmall.util.ProductParam;
import com.cafe24.bitmall.vo.ProductVo;

@RequestMapping("/admin/product")
@Controller(value="adminProductController")
public class ProductController {
	private static final int PRODUCT_PER_PAGE = 4;
	private static final int PAGINATION_PER_PAGE = 5;
	
	@Autowired
	private AdminService adminServ;
	@Autowired
	private ProductService productServ;
	
	
	//Product
	//list
	@RequestMapping(value="", method=RequestMethod.GET)
	public String listProduct(
			Model model,
			ProductParam params) {
		
		System.out.println(params);
		model.addAllAttributes(productServ.getProductListByParam(params, PRODUCT_PER_PAGE, PAGINATION_PER_PAGE));
		return "admin/product";
	}
	
	//add
	@RequestMapping(value = "/add", method = RequestMethod.GET )
	public String addProduct(Model model) {
		model.addAllAttributes(adminServ.getProductAddFormInfo());
		return "admin/product_new";
	}
/*
	@RequestMapping(value = "/add", method = RequestMethod.POST )
	public String addProduct(
			@RequestParam("category") Long categoryNo,
			@RequestParam("code") String code,
			@RequestParam("name") String name,
			@RequestParam("brand") String brand,
			@RequestParam(value = "price") Long price,
			@RequestParam("desc") String description,
			@RequestParam(value = "discount", required=false, defaultValue="0") Long discountRate,
			@RequestParam("opt1") long optionNo1,
			@RequestParam("opt2") long optionNo2,
			@RequestParam("status") String status,
			@RequestParam(value = "icon_new", required=false, defaultValue="false") Boolean isNew,
			@RequestParam(value = "icon_hit", required=false, defaultValue="false") Boolean isHit,
			@RequestParam(value = "icon_sale", required=false, defaultValue="false") Boolean isSale,
			@RequestParam(value = "img-file") MultipartFile[] imgFiles
		) {
			
		ProductVo product = new ProductVo();
		product.setCode(code);
		product.setName(name);
		product.setBrand(brand);
		product.setDescription(description);
		product.setPrice(price);
		product.setIsHit(isHit);
		product.setIsSale(isSale);
		product.setIsNew(isNew);
		product.setCategoryNo(categoryNo);
		product.setOptionNo1(optionNo1);
		product.setOptionNo1(optionNo2);
		product.setStatus(status);
		product.setDiscountRate(discountRate);
		
		//System.out.println(product);
		boolean result = productServ.addProduct(product, imgFiles);
		return "redirect:/admin/product";
	}
	*/
	@RequestMapping(value = "/add", method = RequestMethod.POST )
	public String addProduct(
			ProductVo product,
			@RequestParam(value = "img-file") MultipartFile[] imgFiles
		) {
		
		System.out.println("add:"+product);
		boolean result = productServ.addProduct(product, imgFiles);
		return "redirect:/admin/product";
	}
	
	//edit
	@RequestMapping(value = "/edit/{productNo}", method = RequestMethod.GET )
	public String editProduct(
			Model model,
			@ModelAttribute("params") ProductParam params,
			@PathVariable("productNo") Long productNo) {
		params.build();
		model.addAllAttributes(productServ.getProductDetail(productNo));
		return "/admin/product_edit";
	}
	
	//FAQ
	@RequestMapping(value = "/faq", method = RequestMethod.GET )
	public String faq() {
		return "admin/faq";
	}
}
