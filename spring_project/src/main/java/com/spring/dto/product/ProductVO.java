package com.spring.dto.product;

import java.util.List;

import com.spring.dto.detail.DetailVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductVO {
	
	private int product_code;
	private String product_brand;
	private String product_name;
	private String product_number;
	private int product_price;
	private String product_date;
	private String product_title;
	private String product_creation_date;
	private int product_category_code;
	private List<Product_correction_dateVO> product_correction_dateList;
	private List<DetailVO> product_detailReda;
	
}
