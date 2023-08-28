package com.spring.service;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.product.ProductDao;
import com.spring.dto.product.ProductVO;

@Transactional
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired	ProductDao dao;
	
	
	
	@Override
	public List<ProductVO> product_readAll(Map<String, Integer> para) { return dao.product_readAll(para); }
	@Override
	public int product_insert(ProductVO vo) { return dao.product_insert(vo); }
	@Override
	public int product_update(ProductVO vo) { return dao.product_update(vo); }
	@Override
	public ProductVO product_read(ProductVO vo) {
		
		return dao.product_read(vo);
	}
	@Override
	public int getInsertedProductCode() { return dao.getInsertedProductCode(); }
	@Override
	public int listcnt() { return dao.listcnt(); }

}
