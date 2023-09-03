package com.spring.controller.bid;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.bid.BidCreateDto;
import com.spring.dto.bid.BidUserVO;
import com.spring.dto.bid.ChartParamDto;
import com.spring.dto.bid.ChartResultDto;
import com.spring.dto.bid.OrderDto;
import com.spring.dto.bid.ProductParamVO;
import com.spring.dto.bid.TransactionHistoryVO;
import com.spring.dto.bid.WishDto;
import com.spring.dto.user.UserDto;
import com.spring.service.bid.BiddingService;
import com.spring.service.bid.KakaoPayService;
import com.spring.service.bid.OrderingService;
import com.spring.service.bid.ProductDetailService;
import com.spring.service.bid.WishService;
import com.spring.service.user.UserService;

@Controller
public class BiddingController {
	
	@Autowired
	private UserService user;
	
	@Autowired
	private ProductDetailService product;
	
	@Autowired
	private WishService wish;
	
	@Autowired
	private BiddingService bidding;
	
	@Autowired
	private OrderingService order;
	
	@Autowired
	private KakaoPayService kakaoPay;
	
	@RequestMapping(value = "/bid/product_detail.bid", method = RequestMethod.GET)
	public String home(Model model, @RequestParam("product_code") int product_code) {
		ProductParamVO vo = new ProductParamVO();
//		vo.setProduct_code(1);
//		model.addAttribute("dto" , product.readProduct(1));
//		model.addAttribute("sizeList", product.readSizePrice(1));
		vo.setProduct_code(product_code);
		model.addAttribute("dto" , product.readProduct(product_code));
		model.addAttribute("sizeList", product.readSizePrice(vo));
		model.addAttribute("transhistory" , product.readTransHistory(vo));
		
		return "productdetail";
	}
	
//	@RequestMapping(value= "/product_detail_size" , method = RequestMethod.GET)
//	@ResponseBody
//	public List<TransactionHistoryVO> sizePrice(@RequestParam("product_code") int product_code , @RequestParam("size_code") Integer size_code) {
//		System.out.println(product_code + "//" + size_code);
//		List<TransactionHistoryVO> result = service.readTransHistory(product_code, size_code);
//		System.out.println(result);
//		return result;
//	}
	
	@RequestMapping(value= "/bid/product_detail_size.bid" , method = RequestMethod.POST , produces = "application/json") 
	@ResponseBody
	public List<TransactionHistoryVO> sizePrice(@RequestBody ProductParamVO vo) {
		return product.readTransHistory(vo);
	}
	
	@RequestMapping(value= "/bid/wishsizechk.bid" , method=RequestMethod.POST , produces = "application/json")
	@ResponseBody
	public List<Integer> wishchk(@RequestBody WishDto dto) {
		return wish.wishsizechk(dto);
	}

	@RequestMapping(value= "/bid/wishcreate.bid" , method = RequestMethod.POST , produces = "application/json")
	@ResponseBody
	public void wishcreate(@RequestBody WishDto dto) {   // 관심상품 담기.
		
		ProductParamVO vo = new ProductParamVO();
		
		vo.setProduct_code(dto.getProduct_code());
		vo.setSize_code(dto.getSize_code());
		vo.setUser_id(dto.getUser_id());
		
		int detailcode = product.getDetailCode(vo);	// detail_code 구하기
		
		dto.setDetail_code(detailcode);
		
		try {
			wish.wishCreate(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
//	@RequestMapping(value= "/bid/product_buy.bid" , method = RequestMethod.POST )
//	public String product_buy(Model model , @ModelAttribute ProductBuyVO vo ) {  
//		
//		model.addAttribute("dto" , vo);
//		model.addAttribute("size", product.getsize(vo.getSize_code()));
//		
//		ProductParamVO pvo = new ProductParamVO();
//		pvo.setSize_code(vo.getSize_code());
//		pvo.setProduct_code(vo.getProduct_code());
//		
//		model.addAttribute("detail_code", product.getDetailCode(pvo));
//		return "productbuy";
//	}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value= "/bid/product_buy.bid" , method = RequestMethod.POST )
	public String product_buy2(Model model , @ModelAttribute ProductParamVO vo ) {  
		model.addAttribute("dto" , product.readProduct(vo.getProduct_code()));
		model.addAttribute("sizeList", product.readSizePrice(vo).get(0));
		List<TransactionHistoryVO> trans = null;
		if ( !((trans = product.readTransHistory(vo) ).isEmpty()) ) {
			model.addAttribute("recentprice" , trans.get(0).getOrder_total_price());
			model.addAttribute("avgprice" , (int)trans.stream().map(a -> a.getOrder_total_price()).mapToInt(a -> a).average().orElse(0));
		}
		model.addAttribute("detail_code", product.getDetailCode(vo));
		return "productbuy";
	}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value= "/bid/wish_list.bid" , method = RequestMethod.GET)
	public String wish_list(Model model , HttpServletRequest request, RedirectAttributes rttr) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			rttr.addFlashAttribute("loginSession", "세션이 만료되었습니다.");
			return "redirect:/user/user_login_view.user";
		}
		UserDto data = (UserDto)session.getAttribute("user");
		String user_id = (data.getUser_id());
		model.addAttribute("wishlist", wish.wishReadAll(user_id));
		return "mywish";
	}

	@RequestMapping(value= "/bid/wish_del.bid" , method = RequestMethod.GET)
	public String wish_del(Model model, @RequestParam int wish_code , HttpServletRequest request) {
		wish.wishDelete(wish_code);
		return "redirect:/bid/wish_list.bid";
	}

	@RequestMapping(value= "/bid/product_buy.bid" , method = RequestMethod.GET , produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String product_buy(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDto udto = (UserDto)session.getAttribute("user");
		String user_id = udto.getUser_id();
		
		BidUserVO vo = product.bidUserRead(user_id);
		model.addAttribute("user", vo);
		
		String result = "<div>\r\n"
				+ "			<h4>배송 주소</h4>\r\n"
				+ "			<dl style=\"margin:5px;\">\r\n"
				+ "				<dt style=\"float:left; min-width: 80px\">받는분</dt>\r\n"
				+ "				<dd>"+vo.getUser_name()+"</dd>\r\n"
				+ "				<dt style=\"float:left; min-width: 80px\">연락처</dt>\r\n"
				+ "				<dd>"+vo.getUser_telephone_number()+"</dd>\r\n"
				+ "				<dt style=\"float:left; min-width: 80px\">배송지</dt>\r\n"
				+ "				<dd id='user_address'>"+vo.getUser_address()+"</dd>\r\n"
				+ "			</dl>\r\n"
				+ "			<button class=\"btn\" style=\"float:right;\" data-toggle=\"modal\" data-target=\"#myModal\">주소변경</button>\r\n"
				+ "		</div>\r\n"
				+ "		<br><br>\r\n"
				+ "		<div>\r\n"
				+ "			<h4>최종 주문 정보</h4>\r\n"
				+ "			<strong>총 결제금액</strong>\r\n"
				+ "			<p class=\"text-right\" id='totalprice'></p>\r\n"
				+ "			<hr>\r\n"
				+ "		</div>"
				+ "<button class=\"btn form-control\" id=\"nextbtn2\" style=\"background-color: black; color:white; height:40px;\">즉시 구매 계속</button>";
		
		return result;
	}
	
	
	@RequestMapping(value= "/bid/user_address_change_action.bid" , method = RequestMethod.POST , produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String user_address_change_action(@RequestBody String address,
			HttpServletRequest request ) throws IOException {
		UserDto dto = new UserDto();
		HttpSession session = request.getSession();
		UserDto data = (UserDto)session.getAttribute("user");
		dto.setUser_id(data.getUser_id());
		dto.setUser_address(address);
		String result = "우편번호 변경이 실패하였습니다.";

		if (user.user_change_address(dto) > 0) {
			result = "우편번호 변경이 완료되었습니다.";
		}

		return result;
	}
	
	@RequestMapping(value= "/bid/Payment.bid" , method = RequestMethod.POST)
	public String payment(@ModelAttribute BidCreateDto vo, HttpServletRequest request) {
		request.getSession().setAttribute("bidVO", vo);
		return "redirect:" + kakaoPay.kakaoPayRead(vo);
	}
	
	@RequestMapping(value= "/bid/bidCreate.bid" , method = RequestMethod.GET)
	public String bidCreate(HttpServletRequest request) {
		
		BidCreateDto vo = (BidCreateDto)request.getSession().getAttribute("bidVO");
		request.getSession().removeAttribute("bidVO");
		
		if (bidding.bidCreate(vo) > 0 ) {
			return "redirect:/bid/bidSuccess.bid";
		} else {
			return "failtest";
		}
	}
	
	@RequestMapping(value= "/bid/bidNow.bid" , method = RequestMethod.GET)
	public String bidNow(HttpServletRequest request) {
		
		BidCreateDto vo = (BidCreateDto)request.getSession().getAttribute("bidVO");
		request.getSession().removeAttribute("bidVO");
		
		if (bidding.transactionNow(vo) > 0 ) {
			return "redirect:/bid/buySuccess.bid";
		} else {
			return "failtest";
		}
	}
	
	@RequestMapping(value ="/bid/buySuccess.bid" , method = RequestMethod.GET)
	public String buySuccess() {
		return "buysuccess";
	}

	@RequestMapping(value ="/bid/bidSuccess.bid" , method = RequestMethod.GET)
	public String bidSuccess() {
		return "bidsuccess";
	}
	
	@RequestMapping(value ="/bid/PaymentFail.bid" , method = RequestMethod.GET)
	public String payFail(RedirectAttributes rttr, HttpServletRequest request) {
		BidCreateDto vo = (BidCreateDto)request.getSession().getAttribute("bidVO");
		request.getSession().removeAttribute("bidVO");
		rttr.addFlashAttribute("result", "결제에 실패했습니다");
		return "redirect:/bid/product_detail.bid?product_code="+vo.getProduct_code();
	}
	
	@RequestMapping(value ="/bid/PaymentCancle.bid" , method = RequestMethod.GET)
	public String payCancle(RedirectAttributes rttr, HttpServletRequest request) {
		BidCreateDto vo = (BidCreateDto)request.getSession().getAttribute("bidVO");
		request.getSession().removeAttribute("bidVO");
		rttr.addFlashAttribute("result", "결제를 취소했습니다");
		return "redirect:/bid/product_detail.bid?product_code="+vo.getProduct_code();
	}
	
	@RequestMapping(value= "/bid/order_buy_list.bid" , method = RequestMethod.GET)
	public String orderBuyList(Model model , HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDto data = (UserDto)session.getAttribute("user");
		String user_id = (data.getUser_id());
		model.addAttribute("buylist", order.OrderBidRead(user_id));
		return "buylist";
	}
	
	@RequestMapping(value= "/bid/order_sell_list.bid" , method = RequestMethod.GET)
	public String orderSellList(Model model , HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDto data = (UserDto)session.getAttribute("user");
		String user_id = (data.getUser_id());
		model.addAttribute("selllist", order.OrderSellRead(user_id));
		return "selllist";
	}
	
	@RequestMapping(value= "/bid/bid_list.bid" , method = RequestMethod.GET)
	public String bidList(Model model , HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDto data = (UserDto)session.getAttribute("user");
		String user_id = (data.getUser_id());
		model.addAttribute("bidlist", bidding.bidRead(user_id));
		return "bidlist";
	}
	
	@RequestMapping(value= "/bid/bid_cancle.bid" , method = RequestMethod.GET)
	public String bid_cancle(@RequestParam int bid_code , RedirectAttributes rttr) {
		
		if(bidding.bidCancle(bid_code) > 0) {
			rttr.addFlashAttribute("result", "입찰을 취소했습니다.");
		} else {
			rttr.addFlashAttribute("result", "오류가 발생했습니다.");
		}
		return "redirect:/bid/bid_list.bid";
	}
	
	@RequestMapping(value= "/bid/read_chart.bid" , method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public List<ChartResultDto> readChart(@RequestBody ChartParamDto dto) {
		return product.readChart(dto);
	}
	
	@RequestMapping(value = "/bid/admin_orderList.bid" , method=RequestMethod.GET)
	public String admin_order(Model model) {
		model.addAttribute("orderlist", order.OrderReadAll());
		return "admin_orderlist";
	}

	@RequestMapping(value = "/bid/admin_orderCancle.bid" , method=RequestMethod.GET)
	public String admin_orderCancle(@RequestParam int order_code, RedirectAttributes rttr) {
		if (order.OrderUpdateCancle(order_code) > 0) {
			rttr.addFlashAttribute("result", "주문을 취소시켰습니다.");
		} else {
			rttr.addFlashAttribute("result", "오류가 발생했습니다.");
		}
		return "redirect:/bid/admin_orderList.bid";
	}

	@RequestMapping(value = "/bid/admin_orderDone.bid" , method=RequestMethod.GET)
	public String admin_orderDone(@RequestParam int order_code, RedirectAttributes rttr) {
		if (order.OrderUpdateDone(order_code) > 0) {
			rttr.addFlashAttribute("result", "주문을 완료시켰습니다.");
		} else {
			rttr.addFlashAttribute("result", "오류가 발생했습니다.");
		}
		return "redirect:/bid/admin_orderList.bid";
	}

	@RequestMapping(value = "/bid/admin_orderDel.bid" , method=RequestMethod.GET)
	public String admin_orderDel(@RequestParam int order_code, RedirectAttributes rttr) {
		if (order.OrderDelete(order_code) > 0) {
			rttr.addFlashAttribute("result", "주문을 삭제시켰습니다.");
		} else {
			rttr.addFlashAttribute("result", "오류가 발생했습니다.");
		}
		return "redirect:/bid/admin_orderList.bid";
	}
	
	@RequestMapping(value= "/bid/admin_bid_list.bid" , method = RequestMethod.GET)
	public String admin_bidList(Model model) {
		model.addAttribute("bidlist", bidding.bidReadAll());
		return "admin_bidlist";
	}
	
	@RequestMapping(value= "/bid/admin_bid_cancle.bid" , method = RequestMethod.GET)
	public String admin_bid_cancle(@RequestParam int bid_code , RedirectAttributes rttr) {
		if(bidding.bidCancle(bid_code) > 0) {
			rttr.addFlashAttribute("result", "입찰을 취소시켰습니다.");
		} else {
			rttr.addFlashAttribute("result", "오류가 발생했습니다.");
		}
		return "redirect:/bid/admin_bid_list.bid";
	}
}