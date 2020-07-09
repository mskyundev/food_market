package com.team3.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team3.service.CartService;
import com.team3.service.MemberService;
import com.team3.service.PreOrdersService;
import com.team3.vo.CartVO;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Inject
	CartService cartservice;

	@Inject
	MemberService memservice;
	
	@Inject
	PreOrdersService odservice;
	
	//장바구니 상품추가(insert)
	@RequestMapping("insert")
	public String insertcart(@ModelAttribute CartVO cartdto ,HttpSession session, 
			HttpServletResponse response) {
		String mb_id = (String)session.getAttribute("mb_id");
		cartdto.setMb_id(mb_id);
		//장바구니 리스트 안에 해당 상품 유무 카운트
		int count = cartservice.countCart(mb_id, cartdto.getPd_idx());

		if(mb_id == null) {

	         return "redirect:/member/login";
	      }else {
	    	  int mb_seller = (Integer) session.getAttribute("mb_seller");
	         if (mb_seller != 2) {
	            response.setContentType("text/html; charset=UTF-8");
	            
	            try {
	               PrintWriter out = response.getWriter();
	               out.println("<script>alert('판매자 계정입니다.'); history.back();</script>");
	               out.flush();
	            } catch (IOException e) {
	               e.printStackTrace();
	            }
	         }
	      }

		
		if(count == 0) {
			//해당상품 없을 시 장바구니추가 
			cartservice.insert(cartdto);
		}else {
			//해당상품 있을 시 수량 변경
			cartservice.updateCart(cartdto);
		}
		
		
		return "redirect:/cart/list";
	}
		
	//장바구니 목록
	@RequestMapping("list")
	public ModelAndView listcart(HttpSession session , 
			ModelAndView mav, @ModelAttribute CartVO cartdto) {
		
		String mb_id = (String)session.getAttribute("mb_id");

		Map<String, Object> map = new HashMap();
		int count = cartservice.countCart(mb_id, cartdto.getPd_idx());
		
		if(mb_id != null) {
			
			//장바구니 목록 리스트
			List<CartVO> list = cartservice.listcart(mb_id);
			System.out.println("장바구니 리스트 ~~~~   "+list.toString());
			//장바구니 총금액
			int cartmoney = cartservice.cartmoney(mb_id);
			//배송비			
			int delivery = (cartmoney > 30000 ) ? 0 : 2500;
			//장바구니 금액
			map.put("cartmoney", cartmoney);
			//배송비
			map.put("delivery" , delivery);
			//주문할 총금액
			map.put("allsum" , cartmoney + delivery);
			//장바구니 리스트
			map.put("list", list);
			//장바구니 상품갯수 
			map.put("count" , list.size());
			
			
			mav.setViewName("/cart/cart");
			mav.addObject("map" , map);
			System.out.println("장바구니 ~~~~ "+map);
			
			return mav;
		}else {
			return new ModelAndView("redirect:/member/login" , "" , null);
		}
	}
	
	//장바구니 상품삭제
	@RequestMapping(value="/delete" , method = RequestMethod.POST)
	public String deleteCart(HttpSession session,
			@RequestParam(value= "chbox[]") List<String> chArr, 
			CartVO cartdto) throws Exception{
		
		String mb_id = (String)session.getAttribute("mb_id");
	
		int cart_idx = 0;
		
		if(mb_id != null) {
			cartdto.setMb_id(mb_id);
			
			for(String i : chArr) {
				cart_idx = Integer.parseInt(i);
				cartdto.setCart_idx(cart_idx);
				cartservice.delete(cartdto);
			}
		}
		return "redirect:/cart/list";
	}
	
	
	//장바구니 상품 수량변경
	@RequestMapping("update")
	public String update(@RequestParam int[] amount,@RequestParam int[] pd_idx,
			HttpSession session) {
		String mb_id =(String)session.getAttribute("mb_id");
				
		
		for(int i = 0; i <pd_idx.length; i++) {
			CartVO cartdto = new CartVO();
			cartdto.setMb_id(mb_id);
			cartdto.setAmount(amount[i]);
			cartdto.setPd_idx(pd_idx[i]);
			cartservice.modifyCart(cartdto);
		}
		return "redirect:/cart/list";
	}
		
}




