package com.team3.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.service.MemberService;
import com.team3.service.ProductQnaService;
import com.team3.vo.MemberVO;
import com.team3.vo.ProductQnaVO;
import com.team3.vo.ProductVO;


@Controller
@RequestMapping("/product/*")
public class ProductQnaController {

	@Inject
	ProductQnaService ProductQnaService ;
	
	@Inject
	MemberService memservice;
	
	
	private static final Logger logger = LoggerFactory.getLogger(ProductQnaController.class);

	
	//----------------------   상품문의 입력페이지  ---------------------------
	
	@RequestMapping(value ="/qnawrite", method = RequestMethod.GET)
	public void writeGET(@RequestParam(value="pd_idx",defaultValue="0") int pd_idx, ProductVO ProductVO,MemberVO mvo, ProductQnaVO qvo, Model model,HttpSession session)throws Exception {
		
		logger.info("게시글 입력~~~");
	
		String mb_id = (String)session.getAttribute("mb_id");
		qvo.setMb_id(mb_id);
		
		qvo.setPd_idx(pd_idx);
		model.addAttribute("qvo",qvo);
		
		System.out.println("세션2"+mb_id);
		System.out.println(qvo.getMb_id());
		System.out.println(qvo.getPd_idx());
	
	}
	


	//-----------------------  상품문의 처리페이지  ---------------------------
		@RequestMapping(value ="/qnawrite", method = RequestMethod.POST)
		@ResponseBody
		public void writePost(@RequestParam(value="pd_idx",required = false) Integer pd_idx,ProductVO ProductVO,ProductQnaVO qvo, Model model, RedirectAttributes reAttr,HttpServletRequest request)throws Exception{		//리턴타입 string 이라는거는 직접view를 보여주겠다!
		logger.info("롸이트포스트!  "); 
		logger.info(qvo.toString());
	
	
		model.addAttribute("qvo",qvo);

		System.out.println("컨트롤러:"+ qvo.getMb_id());
		System.out.println("컨트롤러:"+ qvo.getPd_idx());
		System.out.println("컨트롤러:"+ qvo.getQna_content());
		
	
		ProductQnaService.qnainsert(qvo);		//처리  
		
		
		reAttr.addFlashAttribute("result", "success"); 

		}
		
		

	
		
	//------------------------  답글 작성화면 페이지   ----------------------------
	@RequestMapping(value ="/qnareplywrite", method = RequestMethod.GET)
	public void replywriteGET(@RequestParam(value="pd_idx",defaultValue="0") int pd_idx,@RequestParam("qna_num")int qna_num,@ModelAttribute ProductQnaVO qvo, Model model,HttpServletRequest request ,HttpSession session)throws Exception {
		logger.info("게시글 입력~~~");

		String mb_id = (String)session.getAttribute("mb_id");
		qvo.setMb_id(mb_id);
		qvo.setPd_idx(pd_idx);
		
		
		model.addAttribute("qvo",qvo);

		
		System.out.println("reply Mb_id:"+qvo.getMb_id());
		System.out.println("reply Pd_idx:"+qvo.getPd_idx());
		System.out.println("reply:"+qvo.getQna_re_ref());
		System.out.println("reply:"+qvo.getQna_re_lev());
		System.out.println("reply:"+qvo.getQna_re_seq());
		System.out.println("reply Qna_num:"+qvo.getQna_num());

		
		
	}
	
	
	
//----------------------   답글작성 처리페이지  ------------------------------
	
	
	@RequestMapping(value ="/qnareplywrite", method = RequestMethod.POST)
	@ResponseBody
	public void replywritePost(HttpSession session,ProductQnaVO qvo,Model model, RedirectAttributes reAttr)throws Exception{		//리턴타입 string 이라는거는 직접view를 보여주겠다!
	logger.info("답변답변ㅂ답변입니당!  "); 
	logger.info(qvo.toString());
	
	String mb_id = (String)session.getAttribute("mb_id");
	qvo.setMb_id(mb_id);
	
	System.out.println(qvo.getQna_content());
	ProductQnaService.qnareplyupdate(qvo);
	System.out.println("업데이답답답");
	ProductQnaService.qnareplywrite(qvo);
	System.out.println("인설트리플 완료 ");

	
	reAttr.addFlashAttribute("result", "success"); 
	

	}
		

	
	
	
}

