package com.cafe24.bitmall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.bitmall.repository.CategoryDao;
import com.cafe24.bitmall.repository.OptionDao;
import com.cafe24.bitmall.repository.ProductDao;
import com.cafe24.bitmall.repository.ProductImageDao;
import com.cafe24.bitmall.util.PaginationBuilder;
import com.cafe24.bitmall.util.Param;
import com.cafe24.bitmall.util.ProductParam;
import com.cafe24.bitmall.vo.CategoryVo;
import com.cafe24.bitmall.vo.ProductImageVo;
import com.cafe24.bitmall.vo.ProductVo;

@Service
public class ProductService {
	private static final int PRODUCT_PER_PAGE = 2;
	private static final int PAGINATION_PER_PAGE = 5;
	
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

	public Map<String, Object> getProductDetail(Long no) {
		Map<String, Object> map = new HashMap<>();
		
		ProductVo product=productDao.get(no);
		map.put("product", product);
		map.put("productImages", productImgDao.getList(no));
		map.put("options1", optionDao.getList(product.getOptionNo1()));
		map.put("options2", optionDao.getList(product.getOptionNo2()));
		return map;
	}
	
	public Map<String, Object> getProductListByParam(Param params){
		return getProductListByParam(params, PRODUCT_PER_PAGE, PAGINATION_PER_PAGE);
	}
	
	public Map<String, Object> getProductListByParam(Param params, int productPerPage, int paginationPerPage){
		Map<String, Object> map = new HashMap<>();
		
		params.build();
		if(params.getSearchValue()!=null) {
			params.setSearchValue("%"+params.getSearchValue()+"%");
		}
		
		List<ProductVo> products = productDao.getList(params,productPerPage);
		long totalProductCount = productDao.getCount(params);
		
		PaginationBuilder pb=new PaginationBuilder(params, totalProductCount, productPerPage, paginationPerPage);
		pb.build();
		//System.out.println(pb);
	/*	for (ProductVo productVo : products) {
			System.out.println(productVo);
		}*/
		
		CategoryVo category = categoryDao.get(((ProductParam)params).getCategoryNo());
		
		if(params.getSearchValue()!=null) {
			params.setSearchValue(params.getSearchValue().replace("%", ""));
		}
		map.put("products", products);
		map.put("params", params);
		map.put("pb", pb);
		map.put("category", category);
		
		return map;
	}

	public boolean addProduct(ProductVo product, MultipartFile[] imgFiles) {
		boolean result = productDao.insert(product);

		if(result == false) {
			return false;
		}

		int order=0;

		for (MultipartFile imgFile : imgFiles) {
			ProductImageVo productImg=new ProductImageVo();
			String path="";
			if(imgFile.getSize()>0) {
				path = fileUploadServ.restore(imgFile);
				productImg.setName(imgFile.getOriginalFilename());
				productImg.setPath(path);
				productImg.setOrderNo(order++);
				productImg.setProductNo(product.getNo());
				System.out.println(productImg);
				result = productImgDao.insert(productImg);
			}

			if(result == false) {
				return false;
			}
		}

		return true;
	}
}
