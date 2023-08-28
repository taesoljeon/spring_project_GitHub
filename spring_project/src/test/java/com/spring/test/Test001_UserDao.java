package com.spring.test;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.google.gson.Gson;
import com.spring.dao.user.UserDao;
import com.spring.dto.user.TotalDto;
import com.spring.dto.user.UserDto;
import com.spring.service.user.UserService;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@Log4j
public class Test001_UserDao {
	@Autowired ApplicationContext context;
	@Autowired UserDao dao;
	@Autowired UserService service;

	
	@Test @Ignore
	public void test1() {
		log.info("context : " + context);
	}
	
	@Test @Ignore
	public void paging1() {
		Map<String, Integer> para = new HashMap<>();
		para.put("pstartno"   , 0);
		para.put("onpagelist" , 10);
		log.info("admin_listcnt : " + service.admin_listcnt());
		log.info("size : " + service.user_read_admin(para).size());
		log.info("total : " + service.user_read_admin(para));
	}
	
	@Test @Ignore
	public void paging2() {
		Map<String, Integer> para = new HashMap<>();
		para.put("pstartno"   , 0);
		para.put("onpagelist" , 10);
		log.info("admin_listcnt : " + service.admin_listcnt());
		log.info("size : " + service.user_read_admin_id_ajax(para).size());
		log.info("total : " + service.user_read_admin_id_ajax(para));
	}
	
	@Test @Ignore
	public void paging3() {
		Map<String, Integer> para = new HashMap<>();
		para.put("pstartno"   , 0);
		para.put("onpagelist" , 10);
		
		//log.info("admin_listcnt : " + service.admin_listcnt());
		// log.info("size : " + service.user_read_admin_name_ajax(para).size());
		log.info("total : " + service.user_read_admin_name_ajax(para));
	}
	
	@Test @Ignore
	public void paging4() {
		Map<String, Integer> para = new HashMap<>();
		para.put("pstartno"   , 0);
		para.put("onpagelist" , 10);
		log.info("admin_listcnt : " + service.user_listcnt());
		log.info("size : " + service.user_read_user(para).size());
		log.info("total : " + service.user_read_user(para));
	}
	
	@Test @Ignore
	public void paging5() {
		Map<String, Integer> para = new HashMap<>();
		para.put("pstartno"   , 0);
		para.put("onpagelist" , 10);
		log.info("admin_listcnt : " + service.user_listcnt());
		log.info("size : " + service.user_read_user_id_ajax(para).size());
		log.info("total : " + service.user_read_user_id_ajax(para));
	}
	
	@Test @Ignore
	public void paging6() {
		Map<String, Integer> para = new HashMap<>();
		para.put("pstartno"   , 0);
		para.put("onpagelist" , 10);
		log.info("admin_listcnt : " + service.user_listcnt());
		log.info("size : " + service.user_read_user_name_ajax(para).size());
		log.info("total : " + service.user_read_user_name_ajax(para));
	}
	
	@Test @Ignore
	public void delete1() {
		UserDto dto = new UserDto();
		dto.setUser_id("abc");
		int result = service.user_delete_user_out(dto);
		if(result > 0) {
			log.info("성공");
		} else {
			log.info("실패");
		}
	}
	
	@Test @Ignore
	public void check1() {
		System.out.println(service.role_check("admin"));
	}
	
	@Test @Ignore
	public void kakao() {
		UserDto dto = new UserDto();
		dto.setUser_id("test1");
		System.out.println(service.user_login_kakao(dto));
	}
	
	@Test @Ignore
	public void kakao1() throws UnknownHostException {
		UserDto dto = new UserDto();
		dto.setUser_id("1");
		dto.setUser_password("1");
		dto.setUser_name("1");
		dto.setUser_gender("1");
		dto.setUser_birth_date("1999-01-01");
		dto.setUser_telephone_number("1");
		dto.setUser_address("1");
		dto.setUser_ip(InetAddress.getLocalHost().getHostAddress());
		log.info(service.user_insert_kakao(dto));
	}
	
	@Test // @Ignore
	public void total() {  
		 List<TotalDto> totalList = service.total_check();

		 Gson gson = new Gson();
		 String jsonList = gson.toJson(totalList);
		 log.info(jsonList);
	}
}