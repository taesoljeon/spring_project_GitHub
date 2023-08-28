package com.spring.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.spring.dao.image.ImageDao;
import com.spring.dto.image.ImageVO;

import lombok.extern.log4j.Log4j;

@Transactional
@Service
@Log4j
public class ImageServiceImpl implements ImageService {

	@Autowired ImageDao dao;
	
	
	@Override
	public List<ImageVO> image_main_list() {
		
		return dao.image_main_list();
	}
	
	@Override
	public List<ImageVO> image_readAll() {
		
		return dao.image_readAll();
	}

	@Override
	public int image_insert(MultipartFile file, HttpServletRequest request, ImageVO vo) {
		
		String saved="";
		saved = fileUpload(file, request);
		vo.setImage_target(saved);
		
		return dao.image_insert(vo);
	}

	@Override
	public ImageVO image_read(ImageVO vo) {
		
		return dao.image_read(vo);
	}

	@Override
	public int image_update(MultipartFile file, HttpServletRequest request, ImageVO vo) {
		//이전파일 가져오기
				vo.setImage_target(dao.image_read(vo).getImage_target());
				
				// 현재파일의 이름이 0이 아니라면~
				String saved="";
				if(file.getOriginalFilename().length() != 0) {
					saved=fileUpload(file, request);
					vo.setImage_target(saved);
				}
				
		return dao.image_update(vo);
	}

	@Override
	public int image_delete(ImageVO vo) {
	
		return dao.image_delete(vo);
	}
	
private String fileUpload(MultipartFile file, HttpServletRequest request) {
		
		log.info("ㅁname  : " + file.getOriginalFilename());
		log.info("ㅁsize  : " + file.getSize());
		log.info("ㅁContentType : " + file.getContentType());
		
		//#1. 파일 이름 중복안되게 고유값 설정
		UUID uid = UUID.randomUUID(); // 고유한 키값을 잡아준다.
		String saved = uid.toString() + "_" + file.getOriginalFilename();
		//#2. 파일 업로드
		//String uploadpath = "C:\\upload";
		//String rootPath = "C:\\spring_sts3\\spring_Team";
		//String rootPath = "/var/lib/tomcat9/webapps";
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		
		//String attachPath = "\\TESTIMG";
		//String attachPath = "/spring_project/src/main/webapp/resourcesimg/upload";
		String attachPath = "inc/image";
		String uploadPath = rootPath + attachPath;
		log.info("ㅁuploadPath : " + uploadPath);
		
		//File은 무조건 java.io
		File target = new File(uploadPath, saved);
		try {
			FileCopyUtils.copy(file.getBytes(), target);
			log.info("ㅁ2. upload 성공 : " + saved);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return saved;
	}

@Override
public Integer image_count(ImageVO vo) {
	
	return dao.image_count(vo);
}

@Override
public List<ImageVO> image_search_list(String search) {
	
	return dao.image_search_list(search);
}

@Override
public List<ImageVO> image_category_list(@Param("categoryCode") String category, @Param("orderBy") String orderBy) {
	
	return dao.image_category_list(category, orderBy);
}




}
