package com.spring.service.bid;
//package com.spring.service;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.transaction.interceptor.TransactionAspectSupport;
//
//import com.spring.dao.OrderTransaction;
//import com.spring.dto.OrderTransactionVO;
//
//@Service("orderTransactionService")
//public class OrderTransactionServiceImpl implements OrderTransactionService{
//	
//	@Autowired
//	private OrderTransaction service;
//
//	@Autowired
//	private OrderTransactionVO vo;
//	
//	@Transactional
//	@Override
//	public void orderTransaction(int sell_code) {
//		
//		try {
//		vo = service.orderTransactionRead(sell_code);
//		service.orderTransactionUpdate(vo);
//		service.orderTransactionInsert(vo);
//		} catch(Exception e) {
//			e.printStackTrace();
//			TransactionAspectSupport.currentTransactionStatus().isRollbackOnly();
//		}
//	}
//}
