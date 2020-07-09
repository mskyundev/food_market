package com.team3.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.page.PageCriteria;
import com.team3.service.AdminService;
import com.team3.service.CartService;
import com.team3.service.MemberService;
import com.team3.service.OrdersService;
import com.team3.vo.AdminVO;
import com.team3.vo.CartVO;
import com.team3.vo.MemberVO;
import com.team3.vo.OrdersVO;



@Controller
public class MemberController {

	@Inject
	private MemberService memberService;
	
	@Inject
	private AdminService AdminSerivce;
	
	@Inject
	private OrdersService OrdersService;
	
	@Inject
	private CartService CartService;
	
	// 0-1. 회원가입 약관
		@RequestMapping(value="/member/contract")
		public String contract() {
			
			return "/member/contract";
		}
	
	// 0-2. 회원가입 판매자/구매자 선택
	@RequestMapping(value="/member/preJoin")
	public String preJoin() {
		
		return "/member/preJoin";
	}
	
	// 1. 회원가입 페이지
	@RequestMapping(value = "/member/join")
	public String memberJoin() {
		return "/member/join";
	}
	
	// 1_2. 회원가입 기능
	@RequestMapping(value = "/member/memberJoin", method ={RequestMethod.POST, RequestMethod.GET})
	public String memberJoin(MemberVO mVO) throws Exception {
		memberService.MemberJoin(mVO); // MemberDAOImp
		return "redirect:/member/login";
	}
	
	// 1. 판매자 회원가입 페이지
	@RequestMapping(value = "/member/sellerJoin")
	public String sellerJoin() {
		return "/member/sellerJoin";
	}
		
	// 1_2. 판매자 회원가입 기능
	@RequestMapping(value = "/member/sellerJoin", method = RequestMethod.POST)
	public String sellerJoin(MemberVO mvo) throws Exception {
		memberService.MemberJoin(mvo); // MemberDAOImp
		return "redirect:/member/login";
	}

	// 2. 회원 로그인 페이지
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String userLogin() {
		return "/member/login";
	}

	// 2_1.회원 로그인 처리
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String Login(MemberVO mVO, AdminVO aVO, HttpSession session, 
			Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
		String page=null;
		
		aVO.setAm_id(mVO.getMb_id());
		aVO.setAm_pw(mVO.getMb_pw());
//		String referer = request.getHeader("Referer");
		 
		boolean result = memberService.Login(mVO, session);
		boolean resultAdmin = AdminSerivce.AdminLogin(aVO, session);
		if (resultAdmin) { // 관리자 로그인 후 메인 이동
			page="redirect:/";
		}else {
			if (result) { // 관리자 아닐 시 회원 로그인 후 메인 이동
				page="redirect:/"; // 서블릿으로 주소값을 받아오던지 스크립트 써서 history.go(-2)하던지
			}else {
				// 로그인 실패시 실패 메시지 전달
				page="/member/login";
				model.addAttribute("msg", "loginCancel");
			}
		}
		return page;
	}

	// 3. 회원 상세정보 조회
	@RequestMapping("/member/info")
	public String info(HttpSession session, MemberVO mVO,Model model) throws Exception {
		String returnPage ;
		String se_id = (String) session.getAttribute("mb_id");
		if (se_id == null) {
			returnPage = "redirect:/";
		}else {
			mVO.setMb_id(se_id);
			int seller=(Integer) session.getAttribute("mb_seller");
			model.addAttribute("seller",seller);
			returnPage="member/info";
		}
		return returnPage;
	}

	//3_1. 회원 정보 페이지 이동 및 정보 출력
	@RequestMapping(value="/member/modify", method= {RequestMethod.POST,RequestMethod.GET})
	public String modify(HttpSession session, MemberVO mVO, Model model) throws Exception {
		String returnPage ;
		String se_id = (String) session.getAttribute("mb_id");
		if (se_id == null) {
			returnPage = "redirect:/";
		}else {
			mVO.setMb_id(se_id);
			int seller=(Integer) session.getAttribute("mb_seller");
			
			boolean result=memberService.MemberCheck(mVO);
			if (result) {
				MemberVO mvo2 = memberService.MemberInfo(mVO);
				model.addAttribute("memInfo", mvo2);
				model.addAttribute("seller",seller);
				returnPage="member/modify";
			}else {
				model.addAttribute("msg","loginCancel");
				returnPage="member/info";
			}
		}
		return returnPage;
	}
	
	// 3_2. 회원 정보 수정 후 정보 출력
	@RequestMapping(value="/member/modifyPro", method={RequestMethod.POST,RequestMethod.GET})
	public String modify(MemberVO mVO, Model model,HttpSession session) throws Exception {
		String returnPage ;
		String se_id = (String) session.getAttribute("mb_id");
		if (se_id == null) {
			returnPage = "redirect:/";
		}else {
			mVO.setMb_id(se_id);
			int seller=(Integer) session.getAttribute("mb_seller");
			
			memberService.MemberModify(mVO); // 회원 정보 수정 서비스
			
			MemberVO mvo2 = memberService.MemberInfo(mVO); // 수정한 회원 정보 가져오기
			model.addAttribute("memInfo", mvo2);
			model.addAttribute("seller",seller);
			returnPage="member/modify";
		}
		return returnPage;
	}
	
	// 3_3.비밀번호 변경 페이지 이동
	@RequestMapping("/member/modifyPw")
	public String modifyPw(HttpSession session,MemberVO mVO,Model model) throws Exception {
		String returnPage ;
		String se_id = (String) session.getAttribute("mb_id");
		if (se_id == null) {
			returnPage = "redirect:/";
		}else {
			mVO.setMb_id(se_id);
			int seller=(Integer) session.getAttribute("mb_seller");
			model.addAttribute("seller",seller);
			returnPage="member/modifyPw";
		}
		return returnPage;
	}
	
	//	3_4. 비밀번호 변경 - 성공 시 로그아웃 및 로그인 페이지 이동 / 실패 시 이전 페이지 이동 및 msg전달
	@RequestMapping(value="/member/modifyPw", method=RequestMethod.POST)
	public String modifyPw(MemberVO mVO, Model model, HttpSession session) throws Exception {
		String returnPage ;
		String se_id = (String) session.getAttribute("mb_id");
		if (se_id == null) {
			returnPage = "redirect:/";
		}else {
			mVO.setMb_id(se_id);
			int seller=(Integer) session.getAttribute("mb_seller");
			System.out.println("mVO.getMb_pw2() : "+mVO.getMb_pw2());
			System.out.println("mVO.getMb_pw() : "+mVO.getMb_pw());
			System.out.println("mVO.getMb_id() : "+mVO.getMb_id());
			
			if (memberService.MemberCheck(mVO)) {
				memberService.MemberModifyPw(mVO);
				memberService.logout(session);
				model.addAttribute("seller",seller);
				returnPage="redirect:/member/login";
			}else {
				returnPage="member/modifyPw";
				model.addAttribute("msg","loginCancel");
				model.addAttribute("seller",seller);
			}
		}
		
		return returnPage;
	}
	
	// 	4. 비밀번호 찾기
	@RequestMapping("/member/findPw")
	public String find(@RequestParam("mb_id") String mb_id, Model model) {
		model.addAttribute("mb_id", mb_id);
		return "member/findPw";
	}
	@RequestMapping(value = "/member/changePw", method=RequestMethod.POST)
	public String findPw(MemberVO mVO, HttpSession session) throws Exception {
		memberService.ChangePw(mVO);
		
		return "redirect:/member/login";
	}
	@RequestMapping("/member/findCheck")
	public String findCheck(MemberVO mVO, HttpSession session) throws Exception {
		return "member/findCheck";
	}
	
	
	
//	String page=null;
//	String changePw=memberService.randomPw();
//	mVO.setMb_pw2(changePw);
//	mVO.setMb_id((String)session.getAttribute("mb_id"));
//	System.out.println(mVO.getMb_id());
//	System.out.println(mVO.getMb_pw2());
//	
//	memberService.ChangePw(mVO);
//	page="member/findPw";
//	
//	return page;
	
	// 5. 회원 탈퇴
	@RequestMapping("/member/delete")
	public String delete(MemberVO mVO, HttpSession session, Model model) throws Exception {
		String returnPage ;
		String se_id = (String) session.getAttribute("mb_id");
		if (se_id == null) {
			returnPage = "redirect:/";
		}else {
			mVO.setMb_id((String)session.getAttribute("mb_id"));
			int seller=(Integer) session.getAttribute("mb_seller");
			model.addAttribute("seller",seller);
			if (memberService.MemberCheck(mVO)) {
				memberService.logout(session);
				memberService.MemberDelete(mVO);
				returnPage="redirect:/";
			} else {
				returnPage="member/delete";
				model.addAttribute("msg", "Cancle");
				model.addAttribute("seller",seller);
			}
		}
		
		return returnPage;
	}
	// 6. 이메일 인증
	

	// 7. 로그아웃
	@RequestMapping(value = "/member/logout", method = {RequestMethod.GET,RequestMethod.POST})
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}

	// ★ 페이지 매핑
	@RequestMapping(value = "/member/myPage")
	public String memberOrder(OrdersVO odVO, CartVO CartVO, Model model,HttpSession session) {
		String returnPage ;
		String se_id = (String) session.getAttribute("mb_id");
		if (se_id == null) {
			returnPage = "redirect:/";
		}else {
			odVO.setMb_id(se_id);
			List<OrdersVO> orderList = OrdersService.listorder(odVO);
			
			String mb_id=se_id;
			List<CartVO> cartList = CartService.listcart(mb_id);
			
			model.addAttribute("cartList", cartList);
			model.addAttribute("orderList", orderList);
			
			returnPage="/member/myPage";
		}
		
		return returnPage;
	}
	
	@RequestMapping(value = "/member/firstJoin",method=RequestMethod.GET)
	public String firstJoin() {
		return "/member/firstJoin";
	}
	
	// 판매자 판매내역 페이지
	@RequestMapping(value="/member/sellerOrder", method=RequestMethod.GET)
	public String sellerOrder(MemberVO mVO, HttpSession session,Model model,PageCriteria pCri) throws Exception {
		String returnPage ;
		String se_id = (String) session.getAttribute("mb_id");
		if (se_id == null) {
			returnPage = "redirect:/";
		}else {
			String mb_id=se_id;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mb_id", mb_id);
			map.put("startPage", pCri.getStartPage());
			map.put("numPerPage", pCri.getNumPerPage());
			
			int seller=(Integer) session.getAttribute("mb_seller");
			List<OrdersVO> orderList = AdminSerivce.sellerOrderList(map);
			int size = orderList.size();
			model.addAttribute("size",size);
			model.addAttribute("orderList", orderList);
			model.addAttribute("seller",seller);
			returnPage="/member/sellerOrder";
		}
		return returnPage;
	}
	
}
