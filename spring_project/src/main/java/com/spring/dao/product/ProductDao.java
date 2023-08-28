package com.spring.dao.product;

import java.util.List;
import java.util.Map;

import com.spring.dto.product.ProductVO;

public interface ProductDao {
	
	public List<ProductVO> product_readAll(Map<String, Integer> para);
	public  int          listcnt();
	
	public ProductVO product_read(ProductVO vo);
	public int product_insert(ProductVO vo);
	public int product_update(ProductVO vo);
	public int getInsertedProductCode();
//	public int delete(ProductVO vo); 삭제 없음
	
}
