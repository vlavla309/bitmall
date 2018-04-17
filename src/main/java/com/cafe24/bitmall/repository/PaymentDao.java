package com.cafe24.bitmall.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.PaymentCardVo;
import com.cafe24.bitmall.vo.PaymentDepositVo;

@Repository
public class PaymentDao {
	@Autowired
	private SqlSession sqlSession;
	
	public PaymentCardVo getPaymentCard(long orderNo) {
		return sqlSession.selectOne("payment.getPaymentCardByOrderNo", orderNo);
	}
	
	public PaymentDepositVo getPaymentDeposit(long orderNo) {
		return sqlSession.selectOne("payment.getPaymentDepositByOrderNo", orderNo);
	}
	
	public boolean insert(PaymentCardVo vo) {
		int count = sqlSession.insert("payment.insertPaymentCard", vo);
		if(count == 0) {
			return false;
		}
		return true;
	}
	
	public boolean insert(PaymentDepositVo vo) {
		int count = sqlSession.insert("payment.insertPaymentDeposit", vo);
		if(count == 0) {
			return false;
		}
		return true;
	}
}
