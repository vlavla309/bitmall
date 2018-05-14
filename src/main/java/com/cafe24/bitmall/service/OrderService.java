package com.cafe24.bitmall.service;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.bitmall.repository.MemberDao;
import com.cafe24.bitmall.repository.OptionDao;
import com.cafe24.bitmall.repository.OrderDao;
import com.cafe24.bitmall.repository.OrderItemDao;
import com.cafe24.bitmall.repository.PaymentDao;
import com.cafe24.bitmall.repository.ProductDao;
import com.cafe24.bitmall.util.OrderParam;
import com.cafe24.bitmall.util.PaginationBuilder;
import com.cafe24.bitmall.vo.MemberVo;
import com.cafe24.bitmall.vo.OrderItemVo;
import com.cafe24.bitmall.vo.OrderVo;
import com.cafe24.bitmall.vo.PaymentCardVo;
import com.cafe24.bitmall.vo.PaymentDepositVo;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class OrderService {
	private static final int DEFAULT_ORDER_PER_PAGE = 5;
	private static final int DEFAULT_PAGINATION_PER_PAGE = 5;
	
	@Autowired
	private ProductDao productDao;	
	@Autowired
	private MemberDao memberDao;	
	@Autowired
	private OptionDao optionDao;	
	@Autowired
	private OrderDao orderDao;		
	@Autowired
	private OrderItemDao orderItemDao;		
	@Autowired
	private PaymentDao paymentDao;	

	public Map<String, Object> getOrderListByParam(OrderParam params){
		return getOrderListByParam(params, DEFAULT_ORDER_PER_PAGE, DEFAULT_PAGINATION_PER_PAGE);
	}
	
	public Map<String, Object> getOrderListByParam(OrderParam params, int orderPerPage, int paginationPerPage){
		Map<String, Object> map = new HashMap<>();
		
		if(params.getBeginDate()== null) {
			params.setBeginDate("");
		}
		if(params.getEndDate()== null) {
			params.setEndDate("");
		}
		if(params.getStatus()== null) {
			params.setStatus("all");
		}
		if(params.getSearchValue()!=null && params.getSearchType().equals("member") != true) {
			params.setSearchValue("%"+params.getSearchValue()+"%");
		}
		
		List<OrderVo> orders = orderDao.getList(params,orderPerPage);
		long totalOrderCount = orderDao.getCount(params);
		
		for (OrderVo orderVo : orders) {
			orderVo.setOrderItems(orderItemDao.getList(orderVo.getCode()));
//			System.out.println(orderVo);
		}
		
		PaginationBuilder pb=new PaginationBuilder(params, totalOrderCount, orderPerPage, paginationPerPage);
		
		if(params.getSearchValue()!=null) {
			params.setSearchValue(params.getSearchValue().replace("%", ""));
		}

		pb.build();
		params.build();
//		System.out.println(pb);
		map.put("orders", orders);
		map.put("params", params);
		map.put("pb", pb);
		
		return map;
	}
	
	public Map<String, Object> getOrderFormInfo(String jsonStr, MemberVo authMember){
		Map<String, Object> map = new  HashMap<>();
		
		List<OrderItemVo> orderItems= jsonToOrderItemList(jsonStr);
		
		for (OrderItemVo orderItemVo : orderItems) {
			orderItemVo.setProduct(productDao.get(orderItemVo.getProductNo()));
			orderItemVo.setOption1(optionDao.get(orderItemVo.getOptionNo1()));
			orderItemVo.setOption2(optionDao.get(orderItemVo.getOptionNo2()));
		}
		MemberVo member = null;
		if(authMember != null) {
			member = memberDao.get(authMember.getNo());
		}
		map.put("member", member);
		map.put("orderItems", orderItems);
		return map;
	}

	public Map<String, Object> getOrderDetail(String orderCode){
		Map<String, Object> map = new  HashMap<>();
		
		OrderVo order = orderDao.get(orderCode);
		if(order== null) {
			return map;
		}
		PaymentCardVo card = null;
		PaymentDepositVo deposit = null;
		if(order.getPaymentType().equals("card")) {
			card = paymentDao.getPaymentCard(order.getNo());
		}else {
			deposit = paymentDao.getPaymentDeposit(order.getNo());
		}
		List<OrderItemVo> orderItems= orderItemDao.getList(orderCode);
		for (OrderItemVo orderItemVo : orderItems) {
			//System.out.println(orderItemVo);
			orderItemVo.setProduct(productDao.get(orderItemVo.getProductNo()));
			orderItemVo.setOption1(optionDao.get(orderItemVo.getOptionNo1()));
			orderItemVo.setOption2(optionDao.get(orderItemVo.getOptionNo2()));
			//System.out.println(orderItemVo.getOption1());
			//System.out.println(orderItemVo.getOption2());
		}
		map.put("orderItems", orderItems);
		map.put("order", order);
		map.put("card", card);
		map.put("deposit", deposit);
		
		return map;
	};
	
	@Transactional
	public void addOrder(OrderVo order, String jsonStr, PaymentCardVo card, PaymentDepositVo deposit) {
		List<OrderItemVo> orderItems = jsonToOrderItemList(jsonStr);
		long totalPrice =0;

		String orderCode=makeOrderCode();
		for (OrderItemVo orderItem : orderItems) {
			totalPrice += orderItem.getPrice()*orderItem.getQuantity();
			orderItem.setOrderCode(orderCode);
		}
		order.setCode(orderCode);
		order.setTotalPrice(totalPrice+2500);
		orderDao.insert(order);
		//System.out.println(order);
		for (OrderItemVo orderItem : orderItems) {
			orderItemDao.insert(orderItem);
		}
		
		
		if(order.getPaymentType().equals("card")) {
			card.setOrderNo(order.getNo());
			card.setPayer(order.getOrdererName());
			paymentDao.insert(card);
		}else if(order.getPaymentType().equals("deposit")) {
			deposit.setOrderNo(order.getNo());
			paymentDao.insert(deposit);
		}
		
	}
	
	public boolean setOrderStatus(String orderCode, String status) {
		OrderVo order = orderDao.get(orderCode);
		order.setStatus(status);
		return orderDao.Update(order);
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
