package com.spring.dao.image;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.dto.image.ImageVO;


public interface ImageDao {
	
	//public List<ImageVO> image_category_list(ImageVO vo);
	//public List<ImageVO> image_category_list(String category, String orderby);
	public List<ImageVO> image_category_list(@Param("categoryCode") List<String> category, @Param("orderBy") String orderBy);
	
	public List<ImageVO> image_search_list(String search);
	public List<ImageVO> image_main_list();
	public List<ImageVO> image_readAll();
	public int image_insert(ImageVO vo);
	public ImageVO image_read(ImageVO vo);
	public int image_update(ImageVO vo);
	public int image_delete(ImageVO vo);
	public Integer image_count(ImageVO vo);		// 버튼 처리용 
}
