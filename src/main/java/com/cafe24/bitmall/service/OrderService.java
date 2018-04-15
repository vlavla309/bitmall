package com.cafe24.bitmall.service;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.OptionDao;
import com.cafe24.bitmall.repository.ProductDao;
import com.cafe24.bitmall.vo.OrderItemVo;
import com.cafe24.bitmall.vo.OrderVo;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class OrderService {
	
	@Autowired
	private ProductDao productDao;	
	
	@Autowired
	private OptionDao optionDao;	

	public Map<String, Object> getOrderFormInfo(String jsonStr){
		Map<String, Object> map = new  HashMap<>();
		
		List<OrderItemVo> orderItems= jsonToOrderItemList(jsonStr);
		
		for (OrderItemVo orderItemVo : orderItems) {
			System.out.println(orderItemVo);
			orderItemVo.setProduct(productDao.get(orderItemVo.getProductNo()));
			orderItemVo.setOption1(optionDao.get(orderItemVo.getOptionNo1()));
			orderItemVo.setOption2(optionDao.get(orderItemVo.getOptionNo2()));
		}
		map.put("orderItems", orderItems);
		return map;
	}

	public void addOrder(OrderVo order, String jsonStr) {
		System.out.println(jsonStr);
		System.out.println(order);
		
		String orderCode = makeOrderCode();
		order.setOrderCode(orderCode);
		jsonToOrderItemList(jsonStr);
		
		//System.out.println(order);
	}
	
	private String makeOrderCode() {
		String orderCode="";
		Calendar calendar= Calendar.getInstance();
		orderCode += calendar.get(Calendar.YEAR);
		orderCode += calendar.get(Calendar.MONTH);
		orderCode += calendar.get(Calendar.DATE);
		orderCode += calendar.get(Calendar.HOUR);
		orderCode += calendar.get(Calendar.MINUTE);
		orderCode += calendar.get(Calendar.SECOND);
		orderCode += calendar.get(Calendar.MILLISECOND);
		
		return orderCode;
	}

	private List<OrderItemVo> jsonToOrderItemList(String jsonStr){
		List<OrderItemVo> orderItems= null;
		
		/* Json Array String을 List<Object>로 변환*/
		ObjectMapper objectMapper = new ObjectMapper();
				try {
			orderItems = objectMapper.readValue(jsonStr, objectMapper.getTypeFactory().constructCollectionType(
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
				
		return orderItems;
	}
}
