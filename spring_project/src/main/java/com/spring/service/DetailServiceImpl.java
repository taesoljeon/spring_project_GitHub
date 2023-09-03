package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.detail.DetailDao;
import com.spring.dto.detail.DetailVO;
import com.spring.dto.product.ProductVO;

@Service
public class DetailServiceImpl implements DetailService{
	
	@Autowired DetailDao dao;
	
	@Override
	public List<DetailVO> detail_list() {
			
		return dao.detail_list();
	}
	@Override
	public List<DetailVO> main_detail_List(DetailVO vo) {
		
		return dao.main_detail_List(vo);
	}
	
	 @Override public List<DetailVO> detail_read(DetailVO vo) { return dao.detail_read(vo); }
	
	
	@Override
	public int detail_insert(DetailVO vo) {
		
		return dao.detail_insert(vo);
	}

	@Override
	public int detail_update(DetailVO vo) {
		
		return dao.detail_update(vo);
	}

	@Override
	public int detail_delete(DetailVO vo) {
		
		return 0;
	}


	

	

}
