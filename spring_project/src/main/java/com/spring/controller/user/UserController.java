package com.spring.controller.user;

import java.io.IOException;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.spring.dto.user.PagingDto;
import com.spring.dto.user.TotalDto;
import com.spring.dto.user.UserDto;
import com.spring.dto.user.User_BankDto;
import com.spring.dto.user.sns_infoDto;
import com.spring.service.user.KakaoService;
import com.spring.service.user.NaverService;
import com.spring.service.user.UserService;

@Controller
public class UserController {
	@Autowired
	UserService service;
	
	@Autowired
	KakaoService kakao;

	//TaeSol
	@Autowired
	NaverService naver;
	
	
	@RequestMapping("/user/user_login_view.user") // 로그인 페이지
	public String user_login_view() {
		return "user_login_view";
	}

	@RequestMapping("/user/user_join_complete.user") // 회원가입 완료 페이지
	public String user_join_complete() {

		return "user_join_complete";
	}

	@RequestMapping("/user/user_admin_menu.user") // 관리자 메뉴 페이지
	public String user_admin_menu() {
		return "user_admin_menu";
	}
	
	@RequestMapping("/user/user_mypage.user") // 유저 - 마이 페이지
	public String user_mypage() {
		return "user_mypage";
	}
	
	@RequestMapping("/user/user_admin_create.user") // 관리자 관리 - 등록하기 페이지
	public String user_admin_create() {
		return "user_admin_create";
	}
	
	@RequestMapping("/user/user_member_delete.user") // 마이페이지 - 회원탈퇴 페이지
	public String user_member_delete() {
		return "user_member_delete";
	}
    // Taesol	Taesol	
	// Taesol	Taesol
	@RequestMapping("/user/user_naver_login.user") // 네이버 로그인 coll back 경로
	public String user_naver_login(@RequestParam String code, String state, 
			String error, String error_description, HttpSession session, RedirectAttributes rttr) {
	
		String access_token = naver.getAccess_token(code, state);
		String naverId = naver.getId(access_token); // 네이버 고유 값
		//System.out.println(access_token);
		//System.out.println(id);
		Integer sns_naver_code = service.sns_getNaver_code(naverId);	//null 값도 담아주기 위해 Integer에 담아준다.
		
		UserDto dto = new UserDto();
        String result = ""; // alert
        
		if(sns_naver_code == null || sns_naver_code == 0) {		//naver 로그인시 DB에 값이 없을경우 naver_code  생성
			sns_infoDto sns_dto = new sns_infoDto();
			sns_dto.setSns_id(naverId);
			service.sns_infoInsert(sns_dto);
		}
        
        
        if (naverId != null) {
        	// 우선 sns_info에서 id값을 이용해서 naver_code값을 받아와야 한다. 그 후 naver_code와 user_naver_code 비교
        	
        	sns_naver_code = service.sns_getNaver_code(naverId);			
        	Integer user_naver_code = service.user_getNaver_code(sns_naver_code);
        	System.out.println("sns_naver_code="+ sns_naver_code);
        	System.out.println("user_naver_code="+user_naver_code);
        	if (user_naver_code == null) {					//
        		result = "등록된 계정이 없습니다.\\n회원가입 페이지로 이동합니다.";
        		rttr.addFlashAttribute("success", result);
        		rttr.addFlashAttribute("sns_naver_code", sns_naver_code);
        		session.setAttribute("naver", access_token);			// 회원가입 컨트롤러 구분용도
        		//System.out.println("아이디 테스트" + id);
        		
        		return "redirect:/user/user_join_view.user";
        	} else { // 아이디 값이 필요
        		String user_id = service.user_getID(user_naver_code);
        		if(service.condition_check(user_id) == 1) {
            		result = "네이버 통합 계정입니다.\\n메인 페이지로 이동합니다.";
            		dto.setUser_id(user_id);
            		UserDto data = service.user_login_kakao(dto); // SELECT * FROM user WHERE user_id = #{user_id} 재사용
            		rttr.addFlashAttribute("success", result);
            		rttr.addFlashAttribute("url", "/image/main.image");        		
            		//session.setAttribute("kakao", access_token);
            		session.setAttribute("user", data);
            		return "redirect:/user/user_login_view.user";
        		} else {
        			result = "비활성화된 계정입니다.\\n관리자 문의 바랍니다.";
            		rttr.addFlashAttribute("success", result);
            		return "redirect:/user/user_login_view.user";
        		}
        	}
        } else {
        	result = "로그인 실패하였습니다.";
        	
    		rttr.addFlashAttribute("success", result);        	
    		return "redirect:/user/user_login_view.user";
        }
	}
	
	
    // Taesol
	// Taesol
	
	
	@RequestMapping("/user/user_kakao_login.user") // 카카오 로그인 및 카카오 정보 가져오기
    public String user_kakao_login(@RequestParam(value = "code", required = false) String code,
    		HttpSession session, RedirectAttributes rttr) throws Exception{
		
		String access_token = kakao.getAccessToken(code); // 엑세스 토큰
        HashMap<String, Object> kakakoData = kakao.getLogin(access_token); // 사용자 정보
        String email = (String) kakakoData.get("email"); // 이메일
        
		UserDto dto = new UserDto();
        String result = ""; // alert
        String id = ""; // 아이디
        
        // 정규식 패턴
        Pattern pattern = Pattern.compile("^(.+)@.+");
        Matcher matcher = pattern.matcher(email);
        
        if (matcher.matches()) {
        	id = matcher.group(1);
        	String check = service.user_id_check_ajax(id) != null ? service.user_id_check_ajax(id) : "";
        	if (!check.equals(id)) {
        		result = "등록된 계정이 없습니다.\\n회원가입 페이지로 이동합니다.";
        		rttr.addFlashAttribute("success", result);
        		rttr.addFlashAttribute("kakao_id", id);
        		session.setAttribute("kakao", access_token);
        		return "redirect:/user/user_join_view.user";
        	} else {
        		if(service.condition_check(id) == 1) {
            		result = "카카오 통합 계정입니다.\\n메인 페이지로 이동합니다.";
            		dto.setUser_id(id);
            		UserDto data = service.user_login_kakao(dto);
            		rttr.addFlashAttribute("success", result);
            		rttr.addFlashAttribute("url", "/image/main.image");        		
            		session.setAttribute("kakao", access_token);
            		session.setAttribute("user", data);
            		return "redirect:/user/user_login_view.user";
        		} else {
        			result = "비활성화된 계정입니다.\\n관리자 문의 바랍니다.";
            		rttr.addFlashAttribute("success", result);
            		return "redirect:/user/user_login_view.user";
        		}
        	}
        } else {
        	result = "로그인 실패하였습니다.";
    		rttr.addFlashAttribute("success", result);        	
    		return "redirect:/user/user_login_view.user";
        }
    }
	
	@PostMapping(value = "/user/user_join_action.user") // 회원가입 action //////////////////////////////////
	public String user_join_action(@ModelAttribute("user") UserDto user,
			@ModelAttribute("bank") User_BankDto bank, @RequestParam String postcode,
			@RequestParam String address, @RequestParam String extraAddress,
			@RequestParam String detailAddress, HttpServletResponse response, Model model, HttpSession session) throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		// user 테이블 세팅
		String ad = postcode + " " + address + extraAddress + " " + detailAddress;
		int result = 0;
		user.setUser_address(ad);
		user.setUser_ip(InetAddress.getLocalHost().getHostAddress());
		
		// DB 값 넣기
		if ((String) session.getAttribute("kakao") != null) {
			result = service.user_insert_kakao(user);
		} else if(session.getAttribute("naver") != null) { // 네이버 로그인 넣으면서 추가한 내용
			result = service.user_insert_naver(user);
		}
		else {
			result = service.user_insert(user);			
		}
		
		result += service.user_bank_insert(bank);
		if (result < 0) {
			response.getWriter().println("<script>alert('등록된 정보가 없습니다.'); history.go(-1);</script>");
			return null;
		} else {
			model.addAttribute("id", user.getUser_id());
			model.addAttribute("name", user.getUser_name());
			return "user_join_complete";
		}
	}
	
	@GetMapping(value = "/user/user_login_action.user") // 로그인 action
	public String user_login_action(@RequestParam String id, @RequestParam String password, HttpSession session,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		UserDto dto = new UserDto();
		dto.setUser_id(id);
		dto.setUser_password(password);
		UserDto data = service.user_login(dto);

		if (data != null) {
			if (data != null && data.getUser_condition_code() != 1) { // 비활성화 아이디
				response.getWriter().println("<script>alert('비활성화된 아이디입니다.\\n다시 입력해주세요.'); history.go(-1);</script>");
				return null;
			} else { // 활성화 아이디
				session.setAttribute("user", data);
				return "redirect:/";
			}
		} else { // 값 x
			response.getWriter().println("<script>alert('아이디 및 비밀번호가 틀렸습니다.'); history.go(-1);</script>");
			return null;
		}
	}

	@GetMapping(value = "/user/user_logout_action.user") // 로그아웃 action
	public void user_logout_action(HttpServletResponse response, HttpSession session, HttpServletRequest request)
			throws IOException, ServletException {
		response.setContentType("text/html; charset=UTF-8");
		session.invalidate();
		
		String url = "/image/main.image";

		response.getWriter().println(
				"<script>alert('로그아웃합니다.'); location.href = '" + request.getContextPath() + url + "';</script>");
	}

	@GetMapping(value = "/user/user_id_find_view.user") // 아이디 찾기 페이지
	public String user_id_find_view() {
		return "user_id_find_view";
	}

	@GetMapping(value = "user/user_id_find_action.user") /// 아이디 찾기 action
	public void user_id_find_action(@RequestParam String telephone, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		UserDto dto = new UserDto();
		dto.setUser_telephone_number(telephone);
		String url = "/user/user_login_view.user";
		UserDto data = service.user_find_id(dto);
		if (data == null) {
			response.getWriter().println("<script>alert('등록된 정보가 없습니다.'); history.go(-1);</script>");
		} else {
			response.getWriter().println("<script>alert('등록된 아이디는 " + data.getUser_id() + " 입니다.'); location.href = '"
					+ request.getContextPath() + url + "';</script>");
		}
	}

	@GetMapping(value = "/user/user_password_find_view.user") // 비밀번호 찾기 페이지
	public String user_password_find_view() {
		return "user_password_find_view";
	}

	@GetMapping(value = "/user/user_password_find_action.user") // 비밀번호 찾기 action
	public void user_password_find_action(@RequestParam String telephone, @RequestParam String id,
			HttpServletResponse response, HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		UserDto dto = new UserDto();
		dto.setUser_id(id);
		dto.setUser_telephone_number(telephone);
		UserDto data = service.user_find_password(dto);
		String url = "/user/user_login_view.user";

		if (data == null) {
			response.getWriter().println("<script>alert('등록된 정보가 없습니다.'); history.go(-1);</script>");
		} else {
			response.getWriter().println("<script>alert('등록된 패스워드는 " + data.getUser_password()
					+ " 입니다.'); location.href = '" + request.getContextPath() + url + "';</script>");
		}
	}

	@GetMapping(value = "/user/user_join_view.user") // 회원가입 페이지
	public String user_join_view() {
		return "user_join_view";
	}

	@PostMapping(value = "/user/user_id_check_ajax.user") // 아이디 중복 체크 ajax
	@ResponseBody
	public void user_id_check_ajax(@RequestParam("user_id") String user_id, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");

		String check = service.user_id_check_ajax(user_id) != null ? service.user_id_check_ajax(user_id) : "";
		String result = "";

		if (!check.equals(user_id)) {
			// 사용 가능아이디
			result = "<span id='id_check' style='color:green'>사용 가능한 아이디입니다.</span>";
		} else {
			// 아이디 중복
			result = "<span id='id_check' style='color:red' data-check='checked'>아이디가 중복되었습니다.</span>";
		}

		try {
			response.getWriter().println(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@PostMapping(value = "/user/user_telephone_check_ajax.user") // 휴대폰번호 중복 체크 ajax
	@ResponseBody
	public void user_telephone_check_ajax(@RequestParam("user_telephone_number") String user_telephone_number, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");

		String check = service.user_telephone_check_ajax(user_telephone_number) != null
				? service.user_telephone_check_ajax(user_telephone_number)
				: "";
		String result = "";

		if (!check.equals(user_telephone_number)) {
			// 사용 가능한 휴대폰번호
			result = "<span id='telephone_check' style='color:green'>사용 가능한 휴대폰번호입니다.</span>";
		} else {
			// 휴대폰번호 중복
			result = "<span id='telephone_check' style='color:red' data-check='checked'>휴대폰번호가 중복되었습니다.</span>";
		}

		try {
			response.getWriter().println(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	

	@RequestMapping("user/user_info.user")
	public String user_admin_info(HttpServletResponse response, HttpSession session, Model model) { // 어드민 내정보
		response.setContentType("text/html; charset=UTF-8");
		UserDto data = (UserDto) session.getAttribute("user");
		String id = data.getUser_id();
		model.addAttribute("userDto", service.user_mydetail(id));

		return "user_info";
	}

	@GetMapping("user/user_password_change.user") // 비밀번호 변경 폼 이동
	public String user_password_change(@RequestParam("user_password") String user_password,
			@RequestParam("user_id") String user_id, Model model) {
		model.addAttribute("user_password", user_password);
		model.addAttribute("user_id", user_id);
		return "user_password_change";
	}

	@GetMapping("user/user_name_change.user") // 이름 변경 폼 이동
	public String user_name_change(@RequestParam("user_name") String user_name,
			@RequestParam("user_id") String user_id, Model model) {
		model.addAttribute("user_name", user_name);
		model.addAttribute("user_id", user_id);
		return "user_name_change";
	}

	@GetMapping("user/user_telephone_change.user") // 휴대폰번호 변경 폼 이동
	public String user_telephone_change(@RequestParam("user_telephone_number") String user_telephone_number,
			@RequestParam("user_id") String user_id, Model model) {
		model.addAttribute("user_telephone_number", user_telephone_number);
		model.addAttribute("user_id", user_id);
		return "user_telephone_change";
	}

	@GetMapping("user/user_address_change.user") // 우편번호 변경 폼 이동
	public String user_address_change(@RequestParam("user_address") String user_address,
			@RequestParam("user_id") String user_id, Model model) {
		model.addAttribute("user_address", user_address);
		model.addAttribute("user_id", user_id);
		return "user_address_change";
	}

	@PostMapping(value = "user/user_password_change_action.user") // 패스워드 변경 action
	public String user_password_change_action(@RequestParam("password") String user_password,
			@RequestParam("user_id") String user_id,
			@RequestParam("change_password") String change_password, HttpSession session, RedirectAttributes rttr)
			throws IOException {
		UserDto dto = new UserDto();
		UserDto data = (UserDto) session.getAttribute("user");
		dto.setUser_id(user_id);
		dto.setUser_password(change_password);

		String result = "비밀번호 변경이 실패하였습니다.";

		if (service.user_change_password(dto) > 0) {
			result = "비밀번호 변경이 완료되었습니다.";
		}
		rttr.addFlashAttribute("success", result);
		if (data.getUser_id().equals(user_id)) {
			rttr.addFlashAttribute("url", "/user/user_info.user");		
		} else {
			if(service.role_check(user_id) !=3) {
				rttr.addFlashAttribute("url", "/user/user_admin_read.user");				
			} else {
				rttr.addFlashAttribute("url", "/user/user_member_read.user");				
			}
		}
		return "redirect:/user/user_password_change.user?user_id=" + user_id + "&user_password=" + user_password;	
	}

	@PostMapping(value = "user/user_name_change_action.user") // 이름 변경 action
	public String user_name_change_action(@RequestParam("user_name") String user_name,
			@RequestParam("user_id") String user_id,
			@RequestParam("change_name") String change_name, HttpSession session, RedirectAttributes rttr)
			throws IOException {
		UserDto dto = new UserDto();
		UserDto data = (UserDto) session.getAttribute("user");
		dto.setUser_id(user_id); 	
		dto.setUser_name(change_name);

		String result = "이름 변경이 실패하였습니다.";

		if (service.user_change_name(dto) > 0) {
			result = "이름 변경이 완료되었습니다.";
		}
		rttr.addFlashAttribute("success", result);
		String encodingName = URLEncoder.encode(user_name, "UTF-8");
		if (data.getUser_id().equals(user_id)) {
			rttr.addFlashAttribute("url", "/user/user_info.user");		
		} else {
			if(service.role_check(user_id) !=3) {
				rttr.addFlashAttribute("url", "/user/user_admin_read.user");				
			} else {
				rttr.addFlashAttribute("url", "/user/user_member_read.user");				
			}
		}
		return "redirect:/user/user_name_change.user?user_id=" + user_id + "&user_name=" + encodingName;	
	}

	@PostMapping(value = "user/user_telephone_change_action.user") // 휴대폰번호 변경 action
	public String user_telephone_change_action(
			@RequestParam("user_telephone_number") String user_telephone_number,
			@RequestParam("user_id") String user_id,
			@RequestParam("telephone") String telephone, HttpSession session, RedirectAttributes rttr)
			throws IOException {
		UserDto dto = new UserDto();
		UserDto data = (UserDto) session.getAttribute("user");
		dto.setUser_id(user_id);
		dto.setUser_telephone_number(telephone);

		String result = "휴대폰번호 변경이 실패하였습니다.";

		if (service.user_change_telephone(dto) > 0) {
			result = "휴대폰번호 변경이 완료되었습니다.";
		}
		rttr.addFlashAttribute("success", result);
		if (data.getUser_id().equals(user_id)) {
			rttr.addFlashAttribute("url", "/user/user_info.user");		
		} else {
			if(service.role_check(user_id) !=3) {
				rttr.addFlashAttribute("url", "/user/user_admin_read.user");				
			} else {
				rttr.addFlashAttribute("url", "/user/user_member_read.user");				
			}
		}
		return "redirect:/user/user_telephone_change.user?user_id=" + user_id + "&user_telephone_number=" + user_telephone_number;
	}

	@PostMapping(value = "user/user_address_change_action.user") // 우편번호 변경 action
	public String user_address_change_action(@RequestParam("user_address") String user_address,
			@RequestParam("postcode") String postcode, @RequestParam("address") String address,
			@RequestParam("user_id") String user_id,
			@RequestParam("extraAddress") String extraAddress, @RequestParam("detailAddress") String detailAddress,
			HttpSession session, RedirectAttributes rttr) throws IOException {
		UserDto dto = new UserDto();
		UserDto data = (UserDto) session.getAttribute("user");
		String ad = postcode + " " + address + extraAddress + " " + detailAddress;
		dto.setUser_id(user_id);
		dto.setUser_address(ad);
		String result = "우편번호 변경이 실패하였습니다.";

		if (service.user_change_address(dto) > 0) {
			result = "우편번호 변경이 완료되었습니다.";
		}
		rttr.addFlashAttribute("success", result);

		String encodingName = URLEncoder.encode(user_address, "UTF-8");
		if (data.getUser_id().equals(user_id)) {
			rttr.addFlashAttribute("url", "/user/user_info.user");		
		} else {
			if(service.role_check(user_id) !=3) {
				rttr.addFlashAttribute("url", "/user/user_admin_read.user");				
			} else {
				rttr.addFlashAttribute("url", "/user/user_member_read.user");				
			}
		}
		return "redirect:/user/user_address_change.user?user_id=" + user_id + "&user_address=" + encodingName;
	}

	@RequestMapping("user/user_admin_read.user") // 관리자 관리
	public String user_admin_read(@RequestParam(value = "pstartno", defaultValue = "0") int pstartno, Model model) {
		Map<String, Integer> para = new HashMap<>();
		para.put("pstartno", pstartno);
		para.put("onpagelist", 10);

		model.addAttribute("list", service.user_read_admin(para));
		model.addAttribute("paging", new PagingDto(pstartno, service.admin_listcnt()));
		return "user_admin_read";
	}

	@RequestMapping("user/user_member_read.user") // 유저 관리
	public String user_member_read(@RequestParam(value = "pstartno", defaultValue = "0") int pstartno, Model model) {
		Map<String, Integer> para = new HashMap<>();
		para.put("pstartno", pstartno);
		para.put("onpagelist", 10);

		model.addAttribute("list", service.user_read_user(para));
		model.addAttribute("paging", new PagingDto(pstartno, service.user_listcnt()));
		return "user_member_read";
	}
	
	@PostMapping("user/user_yes_action.user") // 관리자 계정 활성화
	public String user_yes_action(@RequestParam("check") String[] check, RedirectAttributes rttr) {
		UserDto dto = new UserDto();
		String result = "관리자 계정 활성화가 실패하였습니다.";
		int data = 0;
		for (String value : check) {
			dto.setUser_id(value);
			data += service.user_yes_user(dto);
		}
		if (data > 0) {
			result = "관리자 계정 활성화가 성공하였습니다.";
		}
		rttr.addFlashAttribute("success", result);
		if (service.role_check(check[0]) !=3) { // 관리자 페이지로
			return "redirect:/user/user_admin_read.user";			
		} else {
			return "redirect:/user/user_member_read.user";			
		}
	}

	@PostMapping("user/user_no_action.user") // 관리자 계정 비활성화
	public String user_no_action(@RequestParam("check") String[] check, RedirectAttributes rttr) {
		UserDto dto = new UserDto();
		String result = "관리자 계정 비활성화가 실패하였습니다.";
		int data = 0;
		for (String value : check) {
			dto.setUser_id(value);
			data += service.user_no_user(dto);
		}
		if (data > 0) {
			result = "관리자 계정 비활성화가 성공하였습니다.";
		}
		rttr.addFlashAttribute("success", result);
		if (service.role_check(check[0]) !=3) { // 관리자 페이지로
			return "redirect:/user/user_admin_read.user";			
		} else {
			return "redirect:/user/user_member_read.user";			
		}
	}

	@RequestMapping(value = "/user/admin_read_ajax.user", 
			method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> admin_read_ajax( // 어드민 관리지 관리 ajax
			@RequestParam(value = "pstartno", defaultValue = "0") int pstartno,
			@RequestParam("where") int where) throws IOException {
		
        Map<String , Object> result = new HashMap<>();
        result.put("result", Boolean.TRUE);
        result.put("data", result);
        
		Map<String, Integer> para = new HashMap<>();
		para.put("pstartno", pstartno);
		para.put("onpagelist", 10);

		if (where == 1) {
			result.put("data", service.user_read_admin(para));
		} else if (where == 2) {
			result.put("data", service.user_read_admin_id_ajax(para));
		} else if (where == 3) {
			result.put("data", service.user_read_admin_name_ajax(para));
		}
		return result;
	}
	
	@RequestMapping(value = "/user/user_read_ajax.user", 
			method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> user_read_ajax( // 어드민 회원 관리 ajax
			@RequestParam(value = "pstartno", defaultValue = "0") int pstartno,
			@RequestParam("where") int where) throws IOException {
		
        Map<String , Object> result = new HashMap<>();
        result.put("result", Boolean.TRUE);
        result.put("data", result);
        
		Map<String, Integer> para = new HashMap<>();
		para.put("pstartno", pstartno);
		para.put("onpagelist", 10);

		if (where == 1) {
			result.put("data", service.user_read_user(para));
		} else if (where == 2) {
			result.put("data", service.user_read_user_id_ajax(para));
		} else if (where == 3) {
			result.put("data", service.user_read_user_name_ajax(para));
		}
		return result;
	}
	
	@RequestMapping(value = "user/user_admin_create_action.user", method = RequestMethod.POST) // 관리자 관리 - 관리자 등록 action
	public String user_admin_create_action(@ModelAttribute("dto") UserDto dto,
			@RequestParam("postcode") String postcode, @RequestParam("address") String address,
			@RequestParam("extraAddress") String extraAddress, @RequestParam("detailAddress") String detailAddress,
			RedirectAttributes rttr) throws IOException {
		String ad = postcode + " " + address + extraAddress + " " + detailAddress;
		dto.setUser_address(ad);
		dto.setUser_ip(InetAddress.getLocalHost().getHostAddress());
		String result = "관리자 등록이 실패하였습니다.";

		if (service.user_insert_sub(dto) > 0) {
			result = "관리자 등록이 완료되었습니다.";
		}
		rttr.addFlashAttribute("success", result);

		return "redirect:/user/user_admin_create.user";
	}
	
	@RequestMapping("user/user_admin_detail.user") // 관리자 관리 - 어드민 상세 보기
	public String user_admin_detail(@RequestParam("user_id") String user_id, Model model) {
		model.addAttribute("userDto", service.user_mydetail(user_id));
		return "user_admin_detail";
	}
	
	@RequestMapping(value = "user/user_delete_action.user") // 회원 및 관리자 삭제 action
	public String user_delete_action(@ModelAttribute("dto") UserDto dto) {
		if(service.role_check(dto.getUser_id()) != 3) {
			service.user_delete_user_out(dto);
			return "redirect:/user/user_admin_read.user";			
		} else {
			service.user_delete_user_out(dto);
			return "redirect:/user/user_member_read.user";						
		}
	}
	
	@PostMapping(value = "user/user_member_delete_action.user") // 회원 탈퇴
	public String user_member_delete_action(@ModelAttribute("dto") UserDto dto,
			HttpSession session, RedirectAttributes rttr)
			throws IOException {

		String result = "회원 탈퇴 실패하였습니다.";

		if (service.user_delete_user(dto) > 0) {
			result = "회원 탈퇴 완료되었습니다.\\n그동안 감사했습니다.";
		}
		rttr.addFlashAttribute("success", result);
		rttr.addFlashAttribute("url", "/image/main.image");
		session.invalidate();
		return "redirect:/user/user_member_delete.user";
	}
	
	@RequestMapping("/user/user_sell_report.user")
	public String user_sell_report(Model model) {
		 List<TotalDto> totalList = service.total_check();

		 Gson gson = new Gson();
		 String jsonList = gson.toJson(totalList);
		model.addAttribute("list", jsonList);
		return "user_sell_report";
	}
}