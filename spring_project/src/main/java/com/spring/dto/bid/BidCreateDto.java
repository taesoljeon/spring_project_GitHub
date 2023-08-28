package com.spring.dto.bid;

import lombok.Data;

@Data
public class BidCreateDto {
	private int detail_code;
	private String user_id;
	private int price;
	
	private int bid_code;
	private int sell_code;
	
	private String product_name;
	private String success_url;
	
	private int product_code;
}
