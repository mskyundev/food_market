package com.team3.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team3.service.AdminService;
import com.team3.service.ProductService;
import com.team3.vo.ProductVO;
import com.team3.vo.RecommandVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController{
	int visit = 0;
	int edge = 0;
	int explorer = 0;
	int chrome = 0;
	int safari = 0;
	int etc=0;
	
	@Inject
	private AdminService adminService;
	@Inject
	private ProductService productService;
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession session, 
			HttpServletResponse response,HttpServletRequest request) throws Exception {
		
//		Cookie cookie = new Cookie("cookie", cookie);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		String se_id=(String) session.getAttribute("mb_id");
		int pd_idx = adminService.orderListMb_id(se_id); // 최근 구매 상품
		
		if (pd_idx != 0) {
			
			// 최근 구매 상품과 관련된 추천 상품 리스트
			List<RecommandVO> re_pd_idxList = adminService.re_pd_idxList(pd_idx);
			ProductVO pVO = null;
			int re_pd_idx = 0;
			for (int i = 0; i < re_pd_idxList.size(); i++) {
				if (re_pd_idxList.get(i).getRe_pd_idx()==pd_idx) {
					re_pd_idx = re_pd_idxList.get(i).getRe_pd_idx2();
					// 상품 정보
					pVO = productService.read(re_pd_idx);
				}else {
					re_pd_idx = re_pd_idxList.get(i).getRe_pd_idx();
					pVO = productService.read(re_pd_idx);
				}
				model.addAttribute("pVO"+i,pVO);
			}
			model.addAttribute("pd_idx",pd_idx);
		}
		model.addAttribute("serverTime", formattedDate );

		boolean todayVisit = adminService.todayVisit();
		
		
		// 메인페이지 인기상품 출력
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<ProductVO> pdIdx = adminService.mostSoldItem(); // 판매순위 구분하기
		for(int i=0;i<pdIdx.size();i++) {
			int idx = pdIdx.get(i).getPd_idx();
			map.put("pd_idx"+i,idx );
		}
		List<ProductVO> popItem = adminService.popularItem(map); // 인기상품 정보값불러오기
		
		model.addAttribute("popItem", popItem);
		
		
		// 메인페이지 방문자 확인 및 저장
		String Agent = request.getHeader("User-Agent"); 
		if(Agent !=null) {
			if(todayVisit==true) {
				if(Agent.indexOf("Edg") > -1) {
					edge = edge+1;
					adminService.updateEdge();
				} else if(Agent.indexOf("Trident") > -1) {
					explorer=explorer+=1;
					adminService.updateExplorer();
				} else if(Agent.indexOf("Chrome") > -1) {
					chrome=chrome+=1;
					adminService.updateChrome();
				} else if(Agent.indexOf("Safari") > -1) {
					safari=safari+=1;
					adminService.updateSafari();
				} else {
					etc=etc+=1;
					adminService.updateEtc();
				}
			} else {
				adminService.insertTodayVisit();
				if(Agent.indexOf("Edg") > -1) {
					edge = edge+1;
					adminService.updateEdge();
				} else if(Agent.indexOf("Trident") > -1) {
					explorer=explorer+=1;
					adminService.updateExplorer();
				} else if(Agent.indexOf("Chrome") > -1) {
					chrome=chrome+=1;
					adminService.updateChrome();
				} else if(Agent.indexOf("Safari") > -1) {
					safari=safari+=1;
					adminService.updateSafari();
				} else {
					etc=etc+=1;
					adminService.updateEtc();
				}
			}
		}
		return "main/main";
	}
	
}
