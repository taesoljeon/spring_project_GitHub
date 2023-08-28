package com.spring.controller.product;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.image.ImageVO;
import com.spring.dto.product.ProductVO;
import com.spring.dto.user.PagingDto;
import com.spring.service.ImageService;
import com.spring.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@RequestMapping("product/*")
@Log4j
@AllArgsConstructor
public class ProductController {
	
	@Autowired ProductService service;
	//@Autowired DetailService detail_service;
	@Autowired ImageService imageService;
	
	/*
	 * @RequestMapping(value="/product_list.product", method=RequestMethod.GET)
	 * public String product_list(Model model) {
	 * 
	 * model.addAttribute("list", service.product_readAll());
	 * model.addAttribute("image_list", imageService.image_readAll()); return
	 * "product_list"; }
	 */
	@RequestMapping(value="/product_list.product", method=RequestMethod.GET)
	public String product_list(@RequestParam(value="pstartno" , defaultValue="0") int pstartno ,Model model) 
	{
		
		Map<String, Integer> para = new HashMap<>();
		para.put("pstartno"   , pstartno);
		para.put("onpagelist" , 10);  //##
		
		model.addAttribute("list", service.product_readAll(para));
		model.addAttribute("image_list", imageService.image_readAll());
		model.addAttribute("paging"  , new PagingDto(pstartno, service.listcnt()) );
		return "product_list";
	}
	
	
	
	@RequestMapping(value="/product_read.product", method=RequestMethod.GET)
	public String product_read (ProductVO vo,Model model) 
	{	
		
		log.info(".......................product_read");
		ImageVO vo2 = new ImageVO();
		vo2.setImage_product_code(vo.getProduct_code());
		
		model.addAttribute("image_check",imageService.image_count(vo2));
		//model.addAttribute("image_list",imageService.image_readAll());
		//log.info(imageService.image_count(vo2));
		//System.out.println(imageService.image_count(vo2));
		model.addAttribute(service.product_read(vo));
		
		return "product_read";
		
	}
	
	@RequestMapping(value="/product_insert.product", method=RequestMethod.GET)
	public String product_insert_view() 
	{	
		log.info(".......................product_insert_view");
		return "product_insert";
	}
	//@RequestParam(value = "checkbox", required = false) int[] checkbox,
	@RequestMapping(value="/product_insert.product", method=RequestMethod.POST)
	public String product_insert(@ModelAttribute ProductVO vo, RedirectAttributes rttr, Model model) {
		String result = "상품등록 실패!";
	    log.info("......................................................확인용"); 
	    //log.info("......................................................."+  Arrays.toString(checkbox));
	    
	    if (service.product_insert(vo) > 0) {
	        result = "상품등록 성공!";  
	    }
	    
	    //int detail_product_code = service.getInsertedProductCode();
		/*
		 * for(int i = 0; i < checkbox.length; i++) { DetailVO dvo = new DetailVO();
		 * dvo.setDetail_size_code(checkbox[i]);
		 * dvo.setDetail_product_code(detail_product_code);
		 * detail_service.detail_insert(dvo); }
		 * log.info("......................................................."+
		 * detail_product_code);
		 */
	    log.info("......................................................."+  vo);
	   
	    rttr.addFlashAttribute("success", result);
	    
	    return "redirect:/product/product_list.product";    
	}
	
	@RequestMapping(value="/product_update.product", method=RequestMethod.GET)
	public String product_update_view(ProductVO vo,Model model) {
		log.info("......................................product_update_view");
		//DetailVO dvo = new DetailVO();
		
		model.addAttribute(service.product_read(vo));
		return "product_update";
		//dvo.setDetail_product_code(vo.getProduct_code());
		//log.info("dvo.........................."+dvo);
		//model.addAttribute("list", detail_service.detail_read(dvo));	
	}
	//@RequestParam(value = "checkbox", required = false) int[] checkbox,
	@RequestMapping(value="/product_update.product", method=RequestMethod.POST)
	public String product_update(@ModelAttribute ProductVO vo, RedirectAttributes rttr) {
			//DetailVO dvo = new DetailVO();
		log.info("......................................product_update_수정실행");
		String result ="fail";	
		/*
		 * int detail_product_code = vo.getProduct_code();
		 * dvo.setDetail_product_code(detail_product_code); List<DetailVO> detailCode =
		 * detail_service.get_detail_code(dvo);
		 * log.info("detailCode.................................detailCodeTest" +
		 * detailCode.get(0).getDetail_code()); for(int i = 0; i < checkbox.length; i++)
		 * { dvo = new DetailVO();
		 * 
		 * dvo.setDetail_size_code(checkbox[i]);
		 * dvo.setDetail_product_code(detail_product_code);
		 * dvo.setDetail_code(detailCode.get(i).getDetail_code());
		 * log.info("......................................" + dvo);
		 * detail_service.detail_update(dvo); }
		 */
		if(service.product_update(vo)>0) { result = "상품 수정성공";}		
	    rttr.addFlashAttribute("success", result);

	    return "redirect:/product/product_list.product";
	}
}
/*
 @RequestMapping(value="/product_update.product", method=RequestMethod.POST)
	public String product_update(@ModelAttribute ProductVO vo,
			@RequestParam(value = "checkbox", required = false) int[] checkbox,
			RedirectAttributes rttr) {
			DetailVO dvo = new DetailVO();
		log.info("......................................product_update_수정실행");
		String result ="fail";	
		int detail_product_code = vo.getProduct_code();
		dvo.setDetail_product_code(detail_product_code);
		List<DetailVO> detailCode = detail_service.get_detail_code(dvo);
		log.info("detailCode.................................detailCodeTest" + detailCode.get(0).getDetail_code());
	    for(int i = 0; i < checkbox.length; i++) {
	    	dvo = new DetailVO();
	    	
	    	dvo.setDetail_size_code(checkbox[i]);
	    	dvo.setDetail_product_code(detail_product_code);
	    	dvo.setDetail_code(detailCode.get(i).getDetail_code());
	    	log.info("......................................" + dvo);
	    	detail_service.detail_update(dvo);
	    }

		if(service.product_update(vo)>0) { result = "상품 수정성공";}
		
		
	    rttr.addFlashAttribute("success", result);
		//return "product_read.product";
	    return "redirect:/product_list.product";
  		
  		
  		해당 방식으로 처리시 
  		mysql> select * from detail;
+-------------+------------------+---------------------+
| detail_code | detail_size_code | detail_product_code |
+-------------+------------------+---------------------+
|          31 |                4 |                  12 |
|          32 |                9 |                  12 |
|          33 |               14 |                  12 |
|          34 |                4 |                  12 |
|          35 |                5 |                  12 |
|          36 |                6 |                  12 |
|          37 |                7 |                  12 |
|          38 |                8 |                  12 |
|          39 |                9 |                  12 |
|          40 |               10 |                  12 |
|          41 |               11 |                  12 |
|          42 |               12 |                  12 |
|          43 |               13 |                  12 |
|          44 |               14 |                  12 |
|          45 |               15 |                  12 | 
- 이런식으로 수정되는 문제 발생 / 삭제하고 다시 생성하는 방식으로 구현할시에는 cascade를 걸어놓은 값들이 삭제되는 문제가 발생한다.
- cascade 해제를 해도 문제는 발생한다. 삭제해야 될 detail_code를 사용하는 테이블이 있거나 하는 식으로 문제 발생
- 애초에 테이블을 아동/성인/여성 등으로 나누거나 기존의 입력방식으로 사이즈 전체를 생성하는 방식으로 구현했어야 됨
- fk / pk 이기 때문에 함부로 삭제/수정하면 안되는 값들 밖에 없음  
  
- int size = Math.min(detailCode.size(), checkbox.length);
  for (int i = 0; i < size; i++) {
    dvo.setDetail_code(detailCode.get(i).getDetail_code());
    
}
내가 입력한 checkbox 사이즈와 detail_code의 사이즈 
ex) where detail_product_code = 12 는 15개 인데 checkbox로 form 넘겨준 값은 2개이다 와 같이
처리되는 배열의 크기가 달라지는 문제가 발생하기 떄문에 위와 같은 코드를 적용시켜도 업데이트에 문제가 발생함
  
 */
