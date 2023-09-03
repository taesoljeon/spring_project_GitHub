package com.spring.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.spring.dto.image.ImageVO;

public interface ImageService {
	
	//public List<ImageVO> image_category_list(ImageVO vo);
	//public List<ImageVO> image_category_list(String category, String orderby);
	public List<ImageVO> image_category_list(@Param("categoryCode") List<String> category, @Param("orderBy") String orderBy);
	
	
	public List<ImageVO> image_search_list(String search);
	public List<ImageVO> image_main_list();
	public List<ImageVO> image_readAll();
	public int image_insert( MultipartFile file, HttpServletRequest request, ImageVO vo);
	public ImageVO image_read(ImageVO vo);
	public int image_update(MultipartFile file, HttpServletRequest request, ImageVO vo);
	public int image_delete(ImageVO vo);
	public Integer image_count(ImageVO vo);
}
