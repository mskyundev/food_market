package com.team3.controller;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team3.service.AdminService;
import com.team3.service.CartService;
import com.team3.service.MemberService;
import com.team3.service.OrdersService;
import com.team3.service.PreOrdersService;
import com.team3.vo.CartVO;
import com.team3.vo.MemberVO;
import com.team3.vo.OrdersVO;
import com.team3.vo.PreOrdersVO;
import com.team3.vo.RecommandVO;



@Controller
@RequestMapping("/orders/*")
public class OrdersController {
	
	@Inject
	PreOrdersService PreOrdersService;
	
	@Inject
	MemberService ms;
	
	@Inject
	OrdersService OrdersService;

	@Inject
	CartService CartService;
	
	@Inject
	AdminService adminService;

	//주문취소
	@RequestMapping(value="orderCancel" , method = RequestMethod.POST)
	public String orderCancel1(HttpSession session, @RequestParam(value="chbox[]") List<Integer> chbox, OrdersVO odVO, Model model) throws ParseException {

		int pd_idx = 0;
		
			for(int i : chbox) {
				pd_idx = i;
				odVO.setPd_idx(pd_idx);
				//주문취소된 상품 재고수량 추가
				OrdersService.updateAdd_pd_amount(odVO);
				//주문취소된 회원정보 삭제
				OrdersService.delete_order(odVO);
				//주문취소된 상품정보 삭제
				OrdersService.delete_order_pd(odVO);
			}
			return "/orders/orderlist";
	}
	
	//주문완료 정보 추가
	@RequestMapping(value="orderinsert" , method = RequestMethod.POST)
	public String orderinsert(HttpSession session, @RequestParam(value="chbox[]") List<Integer> chbox,  OrdersVO odVO,Model model) throws ParseException {
		
		//주문조회할 주문번호 생성
		 Calendar cal = Calendar.getInstance();
		 int year = cal.get(Calendar.YEAR);
		 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		 String subNum = "";
		 
		 for(int i = 1; i <= 6; i ++) {
		  subNum += (int)(Math.random() * 10);
		 }
		 //주문번호
		 String od_num = ymd + "_" + subNum;
		 
		 odVO.setOd_num(od_num);
		 
		String mb_id = (String)session.getAttribute("mb_id");
		odVO.setMb_id(mb_id);
		int pd_idx = 0;
		CartVO CartVO = new CartVO();
		CartVO.setMb_id(mb_id);
		
		PreOrdersVO prevo = new PreOrdersVO();
		prevo.setMb_id(mb_id);

		if(mb_id != null) {

			for(int i : chbox) {
				pd_idx = i;
				//주문 vo에 상품번호 값 넣기
				odVO.setPd_idx(pd_idx);
				//장바구니 vo에  상품번호 값 넣기
				CartVO.setPd_idx(pd_idx);
				//주문 정보 추가
				OrdersService.insertorder(odVO);
				//주문 상품정보 추가
				OrdersService.insertorder_pd(odVO);
				//주문완료된 상품 장바구니 내역 삭제
				OrdersService.deletecart(CartVO);
				//주문완료된 상품 재고수량 차감
				OrdersService.updateSub_pd_amount(odVO);
			}
			
			// 추천상품 : recommand db에 담기
			// 1. od_num별 pd_idx 출력
			List<OrdersVO> pd_idxList = adminService.selectOd_pd_idx(odVO); 
			
			RecommandVO rVO = new RecommandVO();
			for (int i = 0; i < pd_idxList.size(); i++) {
				for (int j = i+1; j < pd_idxList.size(); j++) {
					rVO.setRe_pd_idx(pd_idxList.get(i).getPd_idx());
					rVO.setRe_pd_idx2(pd_idxList.get(j).getPd_idx());
					// 2. select recommand score : 기존에 입력되어있는 데이터가 있는지 확인
					int score = adminService.selectScore(rVO);
					
					if (score>0) {
						rVO.setRe_score(score+1);
						// 3-1. insert recommand : 기존의 데이터가 없으면 insert
						adminService.updateScore(rVO);
					}else {
						//3 -2. update recommand score : 기존의 데이터가 있으면 update score+1
						adminService.insertRecommand(rVO);
					}
					
				}
			}
			//주문완료 후 임시결제 정보 삭제
			PreOrdersService.deletepre(mb_id);
			return "/orders/orderlist";
		}else {
			return "redirect:/member/login";
		}


	}

	@RequestMapping(value="orderinsert" , method = RequestMethod.GET)
	public String orderinsert1(HttpSession session ,
			@RequestParam(value="chbox[]") List<Integer> chbox ,
			@ModelAttribute OrdersVO odVO,Model model) throws ParseException {
		
		
		 Calendar cal = Calendar.getInstance();
		 int year = cal.get(Calendar.YEAR);
		 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		 String subNum = "";
		 
		 for(int i = 1; i <= 6; i ++) {
		  subNum += (int)(Math.random() * 10);
		 }
		 
		 String od_num = ymd + "_" + subNum;
		 
		 odVO.setOd_num(od_num);
		 
		String mb_id = (String)session.getAttribute("mb_id");
		odVO.setMb_id(mb_id);
		int pd_idx = 0;
//		int od_amount = 0;
		CartVO cartdto = new CartVO();
		cartdto.setMb_id(mb_id);
		
		PreOrdersVO prevo = new PreOrdersVO();
		prevo.setMb_id(mb_id);
		model.addAttribute("od_total" , odVO.getOd_total());
		System.out.println("인설트겟 : " + odVO.getOd_total());
		if(mb_id != null) {
//			for(int i=0; i < chbox.size(); i ++) {
//				pd_idx = chbox.get(i);
//				System.out.println("chbox.get(i)" + chbox.get(i));
//				odVO.setPd_idx(pd_idx);
//				od_amount = chbox1.get(i);
//				odVO.setOd_amount(od_amount);
//				
//				cartdto.setPd_idx(pd_idx);
//				
//				OrdersService.insertorder(odVO);
//				OrdersService.deletecart(cartdto);
//			}
			for(int i : chbox) {
				pd_idx = i;
				odVO.setPd_idx(pd_idx);
				
				cartdto.setPd_idx(pd_idx);
				
				OrdersService.insertorder(odVO);
				OrdersService.insertorder_pd(odVO);
				
//				OrdersService.deletecart(cartdto);
			}
		
//			PreOrdersService.deletepre(mb_id);
			return "redirect:/orders/payment";
		}else {
			return "redirect:/member/login";
			
		}

	}

	//완료주문 목록
	@RequestMapping("/orderlist")
	public String orderlist(HttpSession session , @ModelAttribute OrdersVO odVO, Model model) throws Exception {
		String returnPage ;
		String se_id = (String) session.getAttribute("mb_id");
		if (se_id == null) {
			returnPage = "redirect:/";
		}else {
		String mb_id = se_id;
		odVO.setMb_id(mb_id);

		List<OrdersVO> odlist1 = OrdersService.listorder(odVO);
		
		returnPage="orders/orderlist";
		model.addAttribute("odlist", odlist1);
		}
		return returnPage;
		
	}
	


	//완료주문 상세정보 조회
	@RequestMapping(value="orderDetailList", method = RequestMethod.GET)
	public void orderDetailList(HttpSession session ,
			@RequestParam("od_num") String od_num,
//			@RequestParam("od_delivery") String od_delivery,
			@ModelAttribute OrdersVO odVO ,Model model) {
		String mb_id = (String)session.getAttribute("mb_id");
		odVO.setMb_id(mb_id);

		odVO.setOd_num(od_num);
//		odVO.setOd_delivery(od_delivery);
		//주문번호 값
		model.addAttribute("od_num" , odVO.getOd_num());
		//배송상태 값
		model.addAttribute("od_delivery" , odVO.getOd_delivery());
		//완료주문 상세정보 조회
		List<OrdersVO> detail = OrdersService.orderdetail(odVO);
		System.out.println("orderDetailList ~~  "+detail);
		model.addAttribute("detail" , detail);
	}
	
	/*--------------------------------------------------------------------*/
	//임시 결제 주문 컨트롤러
	
	//임시 결제 추가
	@RequestMapping(value="preinsert" , method= RequestMethod.POST)
	public String insertpreorder(HttpSession session, @RequestParam(value= "chbox[]") List<String> chArr, PreOrdersVO pOdVO) throws Exception{
		
		String mb_id = (String)session.getAttribute("mb_id");
	
		int cart_idx = 0;
		//임시 결제내역 유무 조회
		int countpre = PreOrdersService.countpre(mb_id);
		
		if(countpre == 0) {

			pOdVO.setMb_id(mb_id);
			for(String i : chArr) {
				cart_idx = Integer.parseInt(i);
				//결제할 상품들 상품번호
				pOdVO.setCart_idx(cart_idx);
				//임시 결제 추가
				PreOrdersService.insertorder(pOdVO);
			}
			return "redirect:/orders/prelist";
		}else {
			return "redirect:/cart/cart";
		}
	}
	@RequestMapping("preorderDelete")
	public String preDelete(HttpSession session , OrdersVO odVO) {
		String mb_id = (String)session.getAttribute("mb_id");
		odVO.setMb_id(mb_id);
		
		PreOrdersService.deletepre(mb_id);
		
		return "redirect:/cart/list";
		
	}
	//결제 할 정보조회(회원 및 상품 정보)
	@RequestMapping("prelist")
	public ModelAndView listpreorder(HttpSession session , ModelAndView mav) throws Exception {
		
		String mb_id = (String)session.getAttribute("mb_id");
		MemberVO mvo = new MemberVO();
		mvo.setMb_id(mb_id);
		
		MemberVO membervo = ms.MemberInfo(mvo);

		Map<String, Object> map = new HashMap<String, Object>();
//		int countpre = PreOrdersService.countpre(mb_id);
		
			if(mb_id != null) {
				
				//결제할 정보 조회
				List<PreOrdersVO> preodlist = PreOrdersService.listpre(mb_id);
				
				//결제 총 합계 금액
				int preSumMoney = PreOrdersService.preSumMoney(mb_id);
				//배송비 확인
				int delivery = preSumMoney >= 30000 ? 0 : 2500;
				//장바구니 금액
				map.put("preSumMoney", preSumMoney);
				//배송비
				map.put("delivery" , delivery);
				//주문할 총금액
				map.put("allsum" , preSumMoney + delivery);
				//결제할 정보내역
				map.put("list", preodlist);
				//장바구니 상품갯수
				map.put("count" , preodlist.size());
				
				
				mav.setViewName("/orders/preorder");
				mav.addObject("map" , map);
				mav.addObject("mem" , membervo);
				
				return mav;
			}else {
				return new ModelAndView("redirect:/member/login" , "" , null);
			}
	}
//	
//	
//	@RequestMapping("trans")
//	public String trans(HttpSession session , @ModelAttribute OrdersVO odVO , 
//			Model model) {
//		
//		String mb_id = (String)session.getAttribute("mb_id");
//		odVO.setMb_id(mb_id);
//		
//		List<OrdersVO> odlist = OrdersService.listorder(odVO);
//		
//		model.addAttribute("odlist", odlist);
//		return "orders/trans";
//	}
		
	//주문 결제 api 팝업창
	@RequestMapping("/payment")
	public String pay(Model model , @RequestParam (value="od_total") int od_total, @RequestParam(value="od_pdname")String pd_name, OrdersVO odVO) throws Exception {
		odVO.setOd_total(od_total);
		odVO.setPd_name(pd_name);
		//주문할 총 합계 금액
		model.addAttribute("num" , odVO.getOd_total());
		//주문할 상품명
		model.addAttribute("pd_name" , odVO.getPd_name());
		
		return "/orders/payment";
	}
}














