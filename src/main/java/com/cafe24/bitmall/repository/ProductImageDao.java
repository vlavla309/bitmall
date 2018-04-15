package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.ProductImageVo;

@Repository
public class ProductImageDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ProductImageVo> getList(Long productNo){
		return sqlSession.selectList("product_image.getListByProductNo", productNo);
	}
	
	public boolean insert(ProductImageVo vo) {
		int count = sqlSession.insert("product_image.insert", vo);

		if(count == 0) {
			return false;
		}
		return true;
	}
}
