package com.spring.dto.bid;

import lombok.Data;

@Data
public class TransactionHistoryVO {
	String size;
	int order_total_price;
	String order_date;
}
/**

si.size , o.order_total_price , o.order_date

 min(s.sell_price)

*/