package com.spring.dto.bid;

import lombok.Data;

@Data
public class WishDto {
	private int detail_code;
	private String user_id;
	
	private int product_code;
	private int size_code;
}
