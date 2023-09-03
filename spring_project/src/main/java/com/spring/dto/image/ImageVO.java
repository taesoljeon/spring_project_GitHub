package com.spring.dto.image;

import java.util.List;

import com.spring.dto.product.ProductVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImageVO {
	private int image_code;
	private String image_target;
	private String image_title;
	private int image_product_code;
	private List<ProductVO> image_main_list;
}
