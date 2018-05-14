package com.cafe24.bitmall.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.OptionDao;
import com.cafe24.bitmall.repository.ProductDao;
import com.cafe24.bitmall.vo.OrderItemVo;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class CartService {
	
	@Autowired
	private ProductDao productDao;	
	
	@Autowired
	private OptionDao optionDao;	

	public Map<String, Object> getCartInfo(String jsonStr){
		Map<String, Object> map = new  HashMap<>();
		
		/* Json Array String을 List<Object>로 변환*/
		ObjectMapper objectMapper = new ObjectMapper();
		List<OrderItemVo> cartItems= null;
		try {
			cartItems = objectMapper.readValue(jsonStr, objectMapper.getTypeFactory().constructCollectionType(
					List.class, OrderItemVo.class));
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for (OrderItemVo orderItemVo : cartItems) {
			//System.out.println(orderItemVo);
			orderItemVo.setProduct(productDao.get(orderItemVo.getProductNo()));
			orderItemVo.setOption1(optionDao.get(orderItemVo.getOptionNo1()));
			orderItemVo.setOption2(optionDao.get(orderItemVo.getOptionNo2()));
		}
		map.put("cartItems", cartItems);
		return map;
	}
}
