package com.spring.controller.noticeboard;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.dto.noticeboard.NoticeboardVO;
import com.spring.dto.user.PagingDto;
import com.spring.service.NoticeboardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("noticeboard/*")
@Log4j
@AllArgsConstructor
public class NoticeboardController {

	@Autowired
	NoticeboardService noticeservice;

	@RequestMapping(value="/noticeboard.noticeboard", method=RequestMethod.GET)
	public String noticeboardStart() {
		
		return "noticeboard_admin";
	}
	
	@RequestMapping(value="/noticeboard_list.noticeboard", method=RequestMethod.GET)
	@ResponseBody public Map<String, Object> noticeboard_list
	(@RequestParam(value="pstartno" , defaultValue="0") int pstartno ,Model model) {
	
	Map<String, Object> para = new HashMap<>(); 
	para.put("result", Boolean.TRUE);
	
	para.put("pstartno" , pstartno); 
	para.put("onpagelist" , 10);
	para.put("paging", new PagingDto(pstartno, noticeservice.listcnt()) );
	para.put("data", noticeservice.notice_readAll(para));
	
	return para; }
	
	/*
	@RequestMapping(value="/noticeboard_paging.noticeboard", method=RequestMethod.GET)
	public String noticeboard_paging(@RequestParam(value="pstartno", defaultValue="0") int pstartno, Model model) {
	    Map<String, Object> para = new HashMap<>(); 
	    para.put("result", Boolean.TRUE);
	    para.put("pstartno", pstartno);
	    para.put("onpagelist", 10);
	    para.put("paging", new PagingDto(pstartno, noticeservice.listcnt()));
	    para.put("data", noticeservice.notice_readAll(para));
	  
	    model.addAttribute("noticeboardData", para); 

	    return "forward:/noticeboard/noticeboard.noticeboard"; // forward를 활용하여 값을 실어 보낸다.
	}
	*/
	@RequestMapping(value="noticeboard_insert.noticeboard", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> noticeboard_insert(
			@RequestBody NoticeboardVO vo) throws UnknownHostException{
		Map<String,Object> result = new HashMap<>();
		if(vo != null) { 
		// vo.setNoticeboard_user_id(noticeboard_user_id);
		vo.setNoticeboard_ip(InetAddress.getLocalHost().getHostAddress());
		noticeservice.noticeboard_insert(vo); 
		result.put("result", Boolean.TRUE);
		}
		else {
		result.put("result", Boolean.FALSE);	
		}
		return result;
			
	}
	
	@RequestMapping( value="noticeboard_read.noticeboard/{noticeboard_code}", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> noticeboard_read(@PathVariable int noticeboard_code ){
		
		Map<String,Object> result = new HashMap<>();
		result.put("result", Boolean.TRUE);
		result.put("data", noticeservice.noticeboard_read(noticeboard_code));
		
		return result;
	}

	@RequestMapping(value="noticeboard_update.noticeboard", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> noticeboard_update(
			@RequestBody NoticeboardVO vo) throws UnknownHostException{
		Map<String,Object> result = new HashMap<>();
		if(vo != null) { 
		noticeservice.noticeboard_update(vo);
		result.put("result", Boolean.TRUE);
		}
		else {
		result.put("result", Boolean.FALSE);	
		}
		return result;
			
	}
	
	@RequestMapping(value="noticeboard_delete.noticeboard", method=RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> noticeboard_delete(
			@RequestBody NoticeboardVO vo) throws UnknownHostException{
		Map<String,Object> result = new HashMap<>();
		if(vo != null) { 
		noticeservice.noticeboard_delete(vo);
		result.put("result", Boolean.TRUE);
		}
		else {
		result.put("result", Boolean.FALSE);	
		}
		return result;
			
	}
	
	@RequestMapping(value = "/noticeboard_user_read.noticeboard", method = RequestMethod.GET)
	public String noticeboardUserRead(@RequestParam int noticeboard_code, Model model) {
		
		
		model.addAttribute("noticeboard",noticeservice.noticeboard_read(noticeboard_code));
		return "noticeboard_user_read";
	}
	
	/////////////// user
	@RequestMapping(value="/noticeboard_user.noticeboard", method=RequestMethod.GET)
	public String noticeboardUser(@RequestParam(value="pstartno" , defaultValue="0") int pstartno ,Model model) {
		
		Map<String, Object> para = new HashMap<>();
		para.put("pstartno"   , pstartno);
		para.put("onpagelist" , 10);
		
		model.addAttribute("list", noticeservice.notice_readAll(para));
		model.addAttribute("paging"  , new PagingDto(pstartno, noticeservice.listcnt()) );
		return "noticeboard_user";
	}
	
	
	
}
