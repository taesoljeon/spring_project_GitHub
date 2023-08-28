package com.spring.dao.detail;

import java.util.List;

import com.spring.dto.detail.DetailVO;

public interface DetailDao {
	// select * from detail where detail_product_code=#{product_code} order by detail_code asc 파라미터 값 필요?
	public List<DetailVO> detail_list();
	public List<DetailVO> main_detail_List(DetailVO vo);
	public int detail_insert(DetailVO vo);
	public int detail_update(DetailVO vo);
	public int detail_delete(DetailVO vo);
	public List<DetailVO> detail_read (DetailVO vo);
	
	//public int detail_read (int detail_product_code);
	// 파라미터로 필요한값은 product_code임 아마도 수정필요
}
