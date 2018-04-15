package com.cafe24.bitmall.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.util.Param;
import com.cafe24.bitmall.vo.MemberVo;

@Repository
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVo get(long no) {
		return sqlSession.selectOne("member.getByNo", no);
	}
	
	public MemberVo get(MemberVo vo) {
		return sqlSession.selectOne("member.getByVo", vo);
	}
	
	public MemberVo get(String id, String password) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		return sqlSession.selectOne("member.getByIdAndPassword", map);
	}
	
	public List<MemberVo> getList() {
		return sqlSession.selectList("member.getList");
	}
	
	public List<MemberVo> getList(Param param) {
		return sqlSession.selectList("member.getListByParam", param);
	}
	
	public boolean insert(MemberVo vo) {
		int count = sqlSession.insert("member.insert", vo);
		if(count == 0) {
			return false;
		}
		return true;
	}
	
	public boolean update(MemberVo vo) {
		int count = sqlSession.insert("member.update", vo);
		if(count == 0) {
			return false;
		}
		return true;
	}
	
}
