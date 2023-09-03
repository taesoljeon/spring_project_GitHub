package com.spring.dto.bid;

import lombok.Data;

@Data
public class ProductDetailVO {
	int product_code;
	String product_brand;
	String product_name;
	String product_title;
	int wishcnt;
	String product_number;
	String product_date;
	int product_price;
	String image_target;
	String image_title;
}

/**

product_code ,
product_brand ,
product_name ,
product_title ,
(  select count(*) from wish w join detail de on w.detail_code = de.detail_code where de.product_code = ?  ) 'wishcnt' ,
product_number ,
product_date ,

*/