package com.team3.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.team3.service.MemberService;
import com.team3.service.OrdersService;
import com.team3.vo.MemberVO;
import com.team3.vo.OrdersVO;


@RestController
public class AjaxController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Inject
	private OrdersService OrdersService;
	

	// id 체크
	@RequestMapping(value="member/idCheck", method=RequestMethod.POST)
	public ResponseEntity<String> idCheck(MemberVO mVO) throws Exception {
		ResponseEntity<String> entity = null;
		String ck_id=memberService.idCheck(mVO);
		if (ck_id==null) {
			ck_id=memberService.adminId(mVO);
		}
		entity = new ResponseEntity<String>(ck_id ,HttpStatus.OK);
		return entity;
	}
	// 비밀번호 찾기 인증
	@RequestMapping(value="member/findCheck.do", method=RequestMethod.POST)
	public ResponseEntity<MemberVO> findCheck(MemberVO mVO,Model model) throws Exception {
		ResponseEntity<MemberVO> entity = null;
		MemberVO ckEmail=memberService.findCheck(mVO);
		model.addAttribute("mb_email", ckEmail);
		
		entity = new ResponseEntity<MemberVO>(ckEmail ,HttpStatus.OK);
		return entity;
	}
	
	// 비밀번호 찾기 인증
	@RequestMapping(value="/member/sendEmail", method = RequestMethod.POST)
	public Map<String, Object> sendEmail(HttpServletRequest request, Model model){
		int auth = new Random().nextInt(900000) + 100000;
		String setfrom = "wtissue0926@gmail.com";
		String tomail = request.getParameter("mb_email"); // 받는 사람 이메일
		String title = "FoodMarket 비밀번호 인증 메일입니다."; // 제목
		String content = "신선한 재료들을 만나볼 수 있는 FoodMarket입니다." +"\n"
				+ "안전한 비밀번호 변경을 위해 아래 인증번호를 비밀번호 찾기-인증번호 칸에 입력하시어 인증을 진행해주세요!"+"\n"
				+ "인증번호는 " + auth + "입니다."; // 내용
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("auth", auth);
		
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return map;
	}	
	
//	@RequestMapping(value="/member/emailCheck", method = RequestMethod.GET)
//	public void emailCheck(HttpServletRequest request) {
//		String setfrom = "wtissue0926@gmail.com";
//		String tomail = request.getParameter("mb_email"); // 받는 사람 이메일
//		String title = "회원가입을 위한 안내 메일입니다."; // 제목
//		String content = "이거슨 메일이다"; // 내용
//		System.out.println(tomail);
//		try {
//			MimeMessage message = mailSender.createMimeMessage();
//			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
//
//			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
//			messageHelper.setTo(tomail); // 받는사람 이메일
//			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
//			messageHelper.setText(content); // 메일 내용
//
//			mailSender.send(message);
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//
//	}
	
	
	// email 체크
	@RequestMapping(value="/member/emailCheck", method = RequestMethod.POST)
	public Map<String, Object> emailCheck(HttpServletRequest request, Model model){
		int auth = new Random().nextInt(900000) + 100000;
		String setfrom = "wtissue0926@gmail.com";
		String tomail = request.getParameter("mb_email"); // 받는 사람 이메일
		String title = "FoodMarket 회원가입 인증 메일입니다."; // 제목
		String content = "신선한 재료들을 만나볼 수 있는 FoodMarket입니다." +"\n"
				+ "안전한 회원 가입을 위해 아래 인증번호를 회원가입-이메일 인증 하단에 입력하시어 인증을 진행해주세요!"+"\n"
				+ "인증번호는 " + auth + "입니다."; // 내용
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("auth", auth);
		
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return map;
	}
	

	@RequestMapping(value="/member/delivery",method = RequestMethod.POST)
	public void delivery(@ModelAttribute OrdersVO odvo) {
		System.out.println("odvo.getOd_num()  :  "+odvo.getOd_num());
		System.out.println("odvo.getOd_delivery()   :   "+odvo.getOd_delivery());
		OrdersService.update_delivery(odvo);
	}
	
	
}


