package com.spring.service;

import java.util.List;
import java.util.Map;

import com.spring.dto.product.ProductVO;

public interface ProductService {
	public List<ProductVO> product_readAll(Map<String, Integer> para);
	public  int          listcnt();
	
	public int product_insert(ProductVO vo);
	public int product_update(ProductVO vo);
	public ProductVO product_read(ProductVO vo);
	public int getInsertedProductCode();
}
