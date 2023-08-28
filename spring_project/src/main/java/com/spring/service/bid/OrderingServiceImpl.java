package com.spring.service.bid;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.bid.Ordering;
import com.spring.dto.bid.OrderDto;

@Service("orderingService")
public class OrderingServiceImpl implements OrderingService{
	
	@Autowired
	private Ordering order;

	@Override
	public List<OrderDto> OrderBidRead(String user_id) {
		List<OrderDto> list = order.OrderBidRead(user_id);
		list.stream().forEach(a -> a.setOrder_date(a.getOrder_date().substring(2, a.getOrder_date().indexOf(" "))));
		return list;
	}

	@Override
	public List<OrderDto> OrderSellRead(String user_id) {
		List<OrderDto> list = order.OrderSellRead(user_id);
		list.stream().forEach(a -> a.setOrder_date(a.getOrder_date().substring(2, a.getOrder_date().indexOf(" "))));
		return list;
	}

	@Override
	public List<OrderDto> OrderReadAll() {
		List<OrderDto> list = order.OrderReadAll();
		list.stream().forEach(a -> a.setOrder_date(a.getOrder_date().substring(2, a.getOrder_date().indexOf(" "))));
		return list;
	}

	@Override
	public int OrderUpdateCancle(int order_code) {
		return order.OrderUpdateCancle(order_code);
	}

	@Override
	public int OrderUpdateDone(int order_code) {
		return order.OrderUpdateDone(order_code);
	}

	@Override
	public int OrderDelete(int order_code) {
		return order.OrderDelete(order_code);
	}

}
