package com.spring.dto.bid;

import lombok.Data;

@Data
public class BidReadDto {
	private int bid_code;
	private int bid_condition_code;
	private String bid_creation_date;
	private int bid_price;
	private String product_brand;
	private String product_name;
	private int product_code;
	private String image_target;
	private String image_title;
	private String size;
}
