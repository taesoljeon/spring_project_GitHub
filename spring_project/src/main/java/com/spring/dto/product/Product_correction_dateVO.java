package com.spring.dto.product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product_correction_dateVO {
	private int product_code;
	/* private String product_correction; */
	private String product_correction_date;
}
