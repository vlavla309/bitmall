package com.cafe24.bitmall.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.util.Param;
import com.cafe24.bitmall.vo.OrderVo;
import com.cafe24.bitmall.vo.ProductVo;

@Repository
public class OrderDao {
	@Autowired
	private SqlSession sqlSession;
	
	public OrderVo get(Long no) {
		return sqlSession.selectOne("order.getByNo", no);
	}
	
	public OrderVo get(String orderCode) {
		return sqlSession.selectOne("order.getByOrderCode", orderCode);
	}
	
	public List<OrderVo> getList(Param params, int orderPerPage){
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("params", params);
		paramMap.put("orderPerPage", orderPerPage);
		return sqlSession.selectList("order.getListByParam", paramMap);
	}
	
	public long getCount(Param params){
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("params", params);
		return sqlSession.selectOne("order.getCountByParam", paramMap);
	}
	
	public boolean insert(OrderVo vo) {
		int count = sqlSession.insert("order.insert", vo);
		if(count == 0) {
			return false;
		}
		return true;
	}
	
	public boolean Update(OrderVo vo) {
		int count = sqlSession.insert("order.update", vo);
		if(count == 0) {
			return false;
		}
		return true;
	}
}
