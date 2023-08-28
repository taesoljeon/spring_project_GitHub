package com.spring.dto.bid;

import lombok.Data;

@Data
public class ProductBuyVO {
	private int product_code;
	private String product_number;
	private String product_name;
	private String product_title;
	private int size_code;
	private int min_price;
	private int recent_price;
	private int avg_price;
}
