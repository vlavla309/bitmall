package com.cafe24.bitmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.MemberDao;
import com.cafe24.bitmall.vo.MemberVo;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;
	
	public MemberVo getMember(Long no) {
		return null;
	}
	
	public MemberVo getAuthMember(String id, String password) {
		return memberDao.get(id, password);
	}
	
	public boolean addMember(MemberVo vo) {
		return memberDao.insert(vo);
	}
}
