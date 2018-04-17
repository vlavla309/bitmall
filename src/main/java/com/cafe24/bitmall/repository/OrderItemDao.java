package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.OrderItemVo;

@Repository
public class OrderItemDao {
	@Autowired
	private SqlSession sqlSession;
	
	public OrderItemVo get(long no) {
		return sqlSession.selectOne("order_item.getByNo", no);
	}
	
	
	public List<OrderItemVo> getList(String  orderCode) {
		return sqlSession.selectList("order_item.getListByOrderCode", orderCode);
	}
	
	public boolean insert(OrderItemVo vo) {
		int count = sqlSession.insert("order_item.insert", vo);
		if(count == 0) {
			return false;
		}
		return true;
	}
	
	public boolean update(OrderItemVo vo) {
		int count = sqlSession.update("order_item.update", vo);
		if(count == 0) {
			return false;
		}
		return true;
	}
}
