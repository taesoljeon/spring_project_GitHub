package com.spring.dao.bid;

import com.spring.dto.bid.OrderTransactionVO;

public interface OrderTransaction {
	public OrderTransactionVO orderTransactionRead(int sell_code);
	
	public int orderTransactionUpdate(OrderTransactionVO dto);
	
	public int orderTransactionInsert(OrderTransactionVO dto);
}