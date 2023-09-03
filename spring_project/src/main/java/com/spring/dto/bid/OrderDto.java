package com.spring.dto.bid;

import lombok.Data;

@Data
public class OrderDto {
	int order_code;
	String product_brand;
	String product_name;
	int product_code;
	String image_target;
	String image_title;
	String size;
	int order_total_price;
	String order_date;
	int order_condition_code;
}
/**
오더코드		o.order_code
상품 브랜드	pro.product_brand
상품 이름		pro.product_name
상품 이미지		im.image_target
			im.image_title
상품 컬러		co.color
상품 사이즈	si.size
판매 가격		o.order_total_price
*/