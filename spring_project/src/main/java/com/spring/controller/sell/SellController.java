package com.spring.controller.sell;

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

import com.spring.dto.detail.DetailVO;
import com.spring.dto.sell.SellVO;
import com.spring.dto.user.PagingDto;
import com.spring.service.DetailService;
import com.spring.service.SellService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("sell/*")
@Log4j
@AllArgsConstructor
public class SellController {
	
	@Autowired SellService service;
	@Autowired DetailService detail_service;
	// detail 테이블 이용한 리스트 확인 필요	
	
	/*
	 * @RequestMapping(value="/sell_list.sell", method=RequestMethod.GET) public
	 * String sell_list(@RequestParam(value="pstartno" , defaultValue="0") int
	 * pstartno ,@RequestParam String sell_user_id, Model model,SellVO vo) //마이페이지
	 * 내가 등록한 매물 list {
	 * 
	 * Map<String, Integer> para = new HashMap<>(); para.put("pstartno" , pstartno);
	 * para.put("onpagelist" , 10); //##
	 * 
	 * log.info(sell_user_id); // session에 있는 아이디 값 담아주는 작업 필요
	 * vo.setSell_user_id(sell_user_id); model.addAttribute("list",
	 * service.sell_readAll(para, vo)); model.addAttribute("paging" , new
	 * PagingDto(pstartno, service.listcnt()) ); return "sell_list"; }
	 */
	@RequestMapping(value = "/sell_list.sell", method = RequestMethod.GET)
	public String sell_list(@RequestParam (value= "sell_user_id",  defaultValue = "") String sell_user_id,
							@RequestParam(value = "pstartno", defaultValue = "0") int pstartno,
	                         Model model) {
		/*
		 * SellVO sellVO = new SellVO(); sellVO.setSell_user_id(sell_user_id);
		 * System.out.println(sell_user_id);
		 */
	    
	    Map<String, Object> para = new HashMap<>();
	    para.put("pstartno", pstartno);
	    para.put("onpagelist", 10); // 이 값도 필요에 따라서 동적으로 설정 가능
	    para.put("sell_user_id", sell_user_id);
	    
	    model.addAttribute("list", service.sell_readAll(para));
	    model.addAttribute("paging", new PagingDto(pstartno, service.listcnt()));
	    return "sell_list";
	}

	//메인->상세(List) select * from detail where detail_product_code = #{detail_product_code} 
	@RequestMapping(value="/sell_detail_list.sell", method=RequestMethod.GET)
	public String main_detail_List(@RequestParam int product_code,Model model) // 상세페이지에서 매물등록 누를 시 나오는 리스트 
	{
		DetailVO dvo = new DetailVO();
		dvo.setDetail_product_code(product_code);
		
		model.addAttribute("list", detail_service.main_detail_List(dvo));
		return "sell_insert_list";
	}
	
	@RequestMapping(value="/sell_insert.sell", method=RequestMethod.GET)
	public String sell_insert_view(@RequestParam String detail_code)	// 매물 등록 버튼 누른 후 나오는 리스트에서 insert  
	{	log.info("............................" + detail_code);
		log.info(".......................sell_insert_view");
		return "sell_insert";
	}
	
	@RequestMapping(value="/sell_insert.sell", method=RequestMethod.POST) // insert
	public String sell_insert(@RequestParam String sell_user_id, @ModelAttribute SellVO vo, RedirectAttributes rttr, Model model) {
		String result = "매물등록 실패!";
	    log.info("......................................................확인용");
	    SellVO list_vo = new SellVO();
	    list_vo.setSell_user_id(sell_user_id);
	    if (service.sell_insert(vo) > 0) {
	        result = "매물등록 성공!";  
	    }	    
	        log.info("......................................................."+  vo);
	        
	    rttr.addFlashAttribute("success", result);
		/* model.addAttribute("list", service.sell_readAll(list_vo)); */
	    return "redirect:/sell/sell_list.sell?sell_user_id="+ sell_user_id;   
	}
	
	@RequestMapping(value="/sell_update.sell", method=RequestMethod.GET)
	public String sell_update_view(SellVO vo,Model model) {			// 마이페이지 내가 등록한 매물 리스트에서 버튼
		log.info("......................................sell_update_view");

		model.addAttribute(service.sell_read(vo));
		return "sell_update";
		
	}
	
	@RequestMapping(value = "/sell_update.sell", method = RequestMethod.POST)
	public String sell_update(Model model, @ModelAttribute SellVO vo,
	        RedirectAttributes rttr,@RequestParam String sell_user_id) {
		String result = "fail";
	    log.info("......................................sell_update_수정실행");

	    SellVO list_vo = new SellVO();
	    list_vo.setSell_user_id(sell_user_id);
	    
	    if (service.sell_update(vo) > 0) {
	        result = "매물수정 성공!";  
	    }	    
	        log.info("......................................................."+  vo);
	        
	    rttr.addFlashAttribute("success", result);
		/* model.addAttribute("list", service.sell_readAll(list_vo)); */
	    return "redirect:/sell/sell_list.sell?sell_user_id="+ sell_user_id;  
	}
	
	@RequestMapping(value="/sell_delete.sell", method = RequestMethod.POST) 
	public String sell_delete(@ModelAttribute SellVO vo ,RedirectAttributes rttr, @RequestParam(value = "sell_user_id", required = false) String sell_user_id, 
			Model model     ) throws Exception {
		
		String result = "삭제 실패!";
	    log.info("......................................................확인용");
	    SellVO list_vo = new SellVO();
	    list_vo.setSell_user_id(sell_user_id);
	    
	    
	    if (service.sell_delete(vo) > 0) {
	        result = "매물삭제 성공!";  
	    }	    
	        log.info("......................................................."+  vo);
	        
	    rttr.addFlashAttribute("success", result);
		/* model.addAttribute("list", service.sell_readAll(list_vo)); */
	     
	    return "redirect:/sell/sell_list.sell?sell_user_id="+ sell_user_id;   
	        
	}

}
