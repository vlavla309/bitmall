package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CategoryVo;
import com.cafe24.bitmall.vo.OptionVo;

@Repository
public class OptionDao {
	@Autowired
	private SqlSession sqlSession;
	
	public OptionVo get(long no) {
		return sqlSession.selectOne("option.getByNo", no);
	}
	
	public List<OptionVo> getList() {
		return sqlSession.selectList("option.getParentOptionList");
	}
	
	public List<OptionVo> getList(Long parentNo) {
		return sqlSession.selectList("option.getSubOptionListByParentOptionNo", parentNo);
	}
	
	public boolean insert(OptionVo vo) {
		int count = sqlSession.insert("option.insert", vo);
		if(count == 0) {
			return false;
		}
		return true;
	}
	
	public boolean update(OptionVo vo) {
		int count = sqlSession.update("option.update", vo);
		if(count == 0) {
			return false;
		}
		return true;
	}
}
