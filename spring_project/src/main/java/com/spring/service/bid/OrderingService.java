package com.spring.service.bid;

import java.util.List;

import com.spring.dto.bid.OrderDto;

public interface OrderingService {
	public List<OrderDto> OrderBidRead(String user_id);
	
	public List<OrderDto> OrderSellRead(String user_id);
	
	public List<OrderDto> OrderReadAll();
	
	public int OrderUpdateCancle(int order_code);

	public int OrderUpdateDone(int order_code);
	
	public int OrderDelete(int order_code);
}
