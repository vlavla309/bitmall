package com.cafe24.bitmall.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.util.Param;
import com.cafe24.bitmall.vo.ProductVo;

@Repository
public class ProductDao {
	@Autowired
	private SqlSession sqlSession;
	
	public ProductVo get(Long no) {
		return sqlSession.selectOne("product.getByNo", no);
	}
	
	public List<ProductVo> getList(Param params, int productPerPage){
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("params", params);
		paramMap.put("productPerPage", productPerPage);
		return sqlSession.selectList("product.getListByParam", paramMap);
	}
	
	public long getCount(Param params){
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("params", params);
		return sqlSession.selectOne("product.getCountByParam", paramMap);
	}
	
	public boolean insert(ProductVo vo) {
		int count = sqlSession.insert("product.insert", vo);

		if(count == 0) {
			return false;
		}
		return true;
	}
}
