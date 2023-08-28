package com.spring.controller.image;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.image.ImageVO;
import com.spring.service.ImageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("image/*")

@Log4j
@AllArgsConstructor
public class ImageController {
	
	@Autowired ImageService service;


	 @RequestMapping(value="/main.image", method=RequestMethod.GET)
	 public String main_list(Model model) throws Exception {
	 log.info(".......................main_image_list"); 
	 
	 model.addAttribute("list", service.image_main_list());
	 log.info(".......................main_image_list" + model.addAttribute("list", service.image_main_list()));
	 return "main";
	 }
	  
	 @RequestMapping(value="/main_search.image", method=RequestMethod.POST)
	 public String main_searh_list(@RequestParam String search, Model model) throws Exception {
	 log.info("......................."); 
	 
	 model.addAttribute("list", service.image_search_list(search));
	 
	 return "main";
	 }
	
	 
	 @RequestMapping(value="/main_category.image", method=RequestMethod.POST)
	 public String main_category_list(@RequestParam(value = "categoryCode", required = false) String category, @RequestParam(value="orderBy", required = false) String orderBy, Model model) throws Exception {
	     log.info(".......................");
	     model.addAttribute("list", service.image_category_list(category, orderBy));
	     return "main";
	 }

	@RequestMapping(value="/image_read.image", method=RequestMethod.GET)
	public String image_read (ImageVO vo,Model model) throws Exception {
		log.info(".............................. 이미지 보기 테스트" + service.image_read(vo));
		
		model.addAttribute(service.image_read(vo));
		return "image_read";
	}

	// url  : image/image_read.image
	// 파일명 : imgae/image_insert.jsp
	@RequestMapping(value= "/image_insert.image", method = RequestMethod.GET)
	public String image_insert_view() {
		log.info(".............................. 이미지 업로드 뷰");	
		return "image_insert";	
	}
	
	@RequestMapping(value="/image_insert.image", method= RequestMethod.POST) 
	public String  image_insert(   MultipartFile file  ,  HttpServletRequest request, 
			 ImageVO vo , RedirectAttributes rttr ) throws IOException {/**/
		log.info(".......................................image_target" + vo);
		log.info(".......................................image_target" + file);
		log.info(".......................................이미지 업로드~~~~테스트");
		String result = "업로드 실패!";
		log.info(".......................product_code");
		if(service.image_insert(file, request, vo) > 0 ) { result ="이미지 업로드 성공!"; }
		rttr.addFlashAttribute("success", result); 
		return "redirect:/product/product_list.product";
	}
	
	@RequestMapping(value="/image_update.image", method = RequestMethod.GET)
	public String image_update_view(ImageVO vo,   Model model ) throws Exception {
		
		log.info("........................ : update_view");
		model.addAttribute(service.image_read(vo));
		
		return "image_update";
		
	}
	@RequestMapping(value="/image_update.image", method = RequestMethod.POST)
	public String image_update(MultipartFile file, HttpServletRequest request,
			ImageVO vo ,RedirectAttributes rttr   ) throws Exception {
		log.info("....................88 : update");
		String result = "fail";
		if(service.image_update(file, request, vo)>0) { result = "이미지 수정성공";}
		rttr.addFlashAttribute("success", result);
		log.info("......................................."+vo.getImage_product_code());
		return "redirect:/image/image_read.image?image_product_code=" + vo.getImage_product_code(); //read.jsp -success 띄워주면 된다
		
		
	}
	
	@RequestMapping(value="/image_delete.image", method = RequestMethod.POST)
	public String image_delete(ImageVO vo ,RedirectAttributes rttr) throws Exception {
		
		String result = "fail";
		if(service.image_delete(vo)>0) { result = "이미지 삭제성공";}
		rttr.addFlashAttribute("success", result);
		
		return "redirect:/product/product_list.product";
		
		
	}
	
}

