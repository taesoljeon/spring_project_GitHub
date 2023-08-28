package com.spring.dto.detail;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DetailVO {	
	private int detail_code;
	private int detail_size_code;
	private int detail_product_code;
}