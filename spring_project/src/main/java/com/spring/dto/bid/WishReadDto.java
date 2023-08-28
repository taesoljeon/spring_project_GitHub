package com.spring.dto.bid;

import lombok.Data;

@Data
public class WishReadDto {
	private int wish_code;
	private int detail_code;
	private String product_brand;
	private String product_name;
	private int product_code;
	private String image_target;
	private String image_title;
	private String size;
	private int min_price;
	private int size_code;
}


/**

w.wish_code ,
de.detail_code ,
im.image_target ,
im.image_title ,
pr.product_brand ,
pr.product_name ,
pr.product_code ,
si.size ,

**/