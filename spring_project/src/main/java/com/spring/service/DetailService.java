package com.spring.service;

import java.util.List;

import com.spring.dto.detail.DetailVO;
import com.spring.dto.product.ProductVO;

public interface DetailService {
	
		public List<DetailVO> detail_list();
		public List<DetailVO> main_detail_List(DetailVO vo);
	    public int detail_insert(DetailVO vo);
	    public int detail_update(DetailVO vo);
	    public int detail_delete(DetailVO vo);
	    public List<DetailVO> detail_read(DetailVO vo);
	    //public int detail_read(int detail_product_code);
		// 파라미터로 필요한값은 product_code임 아마도 수정필요

}
