package com.team3.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team3.fileUpload.FileUtils;
import com.team3.fileUpload.FileVO;
import com.team3.page.FindCriteria;
import com.team3.page.PageCriteria;
import com.team3.page.PagingMaker;
import com.team3.service.ProductQnaService;
import com.team3.service.ProductReviewService;
import com.team3.service.ProductService;
import com.team3.vo.MemberVO;
import com.team3.vo.ProductQnaVO;
import com.team3.vo.ProductReviewVO;
import com.team3.vo.ProductVO;


@Controller
@RequestMapping("/product/*")
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductService ProductService;
	
	@Inject
	private ProductReviewService ProductReviewService;
	
	@Inject
	private ProductQnaService ProductQnaService;
	
	
	
	@RequestMapping(value="/productSellerList", method=RequestMethod.GET)
	public void productSellerList(MemberVO mvo, PageCriteria pCri, Model model, HttpSession session) throws Exception{
		logger.info("PageCriteria :  "+pCri.toString());
		
		//세션값 가져오기
		String mb_id = session.getAttribute("mb_id").toString();
		mvo.setMb_id(mb_id);
//		System.out.println("\n\n 세션값!!!!   "+mb_id+"\n\n");
		int seller=(Integer) session.getAttribute("mb_seller");
		model.addAttribute("seller",seller);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mb_id",mb_id);
		map.put("startPage", pCri.getStartPage());
		map.put("numPerPage", pCri.getNumPerPage());
		
		//파라미터값 2개 페이지값, member값
		model.addAttribute("list", ProductService.sellerListCriteria(map));
		
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setCri(pCri);
		
		
		pagingMaker.setTotalData(ProductService.sellerListCountData(mvo));
		
//		System.out.println("총 게시글 갯수 : "+ProductService.listCountData(pCri)+"\n");
		
		model.addAttribute("pagingMaker", pagingMaker);
	}
	
	
	
	//상품 목록 페이지
	@RequestMapping(value="/productList", method=RequestMethod.GET)
	public void list(@ModelAttribute("fCri") FindCriteria fCri, Model model) throws Exception{
		logger.info(fCri.toString());
		
//		model.addAttribute("list", ProductService.listCriteria(fCri));//기존 list
		model.addAttribute("list", ProductService.listFind(fCri));
//		System.out.println(ProductService.listFind(fCri));
		//join해서 list불러오기 
		
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setCri(fCri);
		
//		pagingMaker.setTotalData(ProductService.listCountData(fCri));//기존 list
		pagingMaker.setTotalData(ProductService.findCountData(fCri));
//		System.out.println("fCri.getFindType()   ====>  "+fCri.getFindType());
	
		model.addAttribute("pagingMaker", pagingMaker);		
	}
	
	//상품 상세 페이지
		@RequestMapping(value="/productDetail", method = RequestMethod.GET)
		public void productDetail(@RequestParam("pd_idx") int pd_idx, @ModelAttribute("fCri") FindCriteria fCri, ProductReviewVO ProductReviewVO, PageCriteria pCri, Model model,HttpSession session,@ModelAttribute ProductQnaVO qvo)
			throws Exception{
//			ProductService.hitUp(pd_idx); //조회수 증가
			
			//url만들기***********
			PagingMaker pagingMaker = new PagingMaker();
			pagingMaker.setCri(fCri);
			model.addAttribute("pagingMaker", pagingMaker);	
			//product 정보 가져오기 
			model.addAttribute("ProductVO",ProductService.read(pd_idx));
			
			//리뷰테이블
			//리뷰 갯수 구하기
			ProductReviewVO.setProduct_pd_idx(pd_idx);
			int reviewListCountData = ProductReviewService.reviewListCountData(ProductReviewVO);
			model.addAttribute("reviewListCountData", reviewListCountData);
			//해당 상품 평점 평균
			if(reviewListCountData!=0) { 
				double starAVG = ProductReviewService.reviewStarAVG(pd_idx);
				model.addAttribute("starAVG", starAVG);
			}
			
		
			
			//상품문의
			PagingMaker pagingMaker3 = new PagingMaker();
			pagingMaker.setCri(fCri);
			model.addAttribute("pagingMaker", pagingMaker3);	
		
			model.addAttribute("ProductVO",ProductService.read(pd_idx));
			//qna service.list(pd_idx)
			//review service.list(pd_idx)
			
			logger.info("PageCriteria :  "+pCri.toString());
			
			String mb_id = (String)session.getAttribute("mb_id");
			qvo.setMb_id(mb_id);
			
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("mb_id",mb_id);
			map.put("startPage", pCri.getStartPage());
			map.put("numPerPage", pCri.getNumPerPage());
			map.put("pd_idx", pd_idx);

			model.addAttribute("qnalist", ProductQnaService.list(map)); 
			PagingMaker pagingmaker = new PagingMaker();
			pagingmaker.setCri(pCri);
			
			pagingmaker.setTotalData(ProductQnaService.countData(pCri));
			model.addAttribute("pagingMaker", pagingmaker);	
			
			model.addAttribute("qvo",qvo);
			
		}
	 

	
	//상품 삭제하기
	@RequestMapping(value="/productSellerDelete", method = RequestMethod.GET)
	public String delPage(@RequestParam("pd_idx") int pd_idx, PageCriteria pCri,
			RedirectAttributes reAttr) throws Exception{
		
		ProductService.remove(pd_idx);
			
		reAttr.addAttribute("page", pCri.getPage());
		reAttr.addAttribute("numPerPage", pCri.getNumPerPage());
		
		reAttr.addFlashAttribute("result", "Success");
		
		return "redirect:/product/productSellerList";
	}
	

	
	
	//상품 수정하기
	//판매자가 수정할 수 있다. 
	@RequestMapping(value="/productSellerModify", method=RequestMethod.GET)
	public void modifyGET(@RequestParam("pd_idx") int pd_idx,PageCriteria pCri, Model model) 
			throws Exception{
		
		//url만들기***********
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setCri(pCri);
		model.addAttribute("pagingMaker", pagingMaker);		
		
		model.addAttribute("ProductVO",ProductService.read(pd_idx));
		
	}
	
	//판매자가 수정할 수 있다. 
	@RequestMapping(value="/productSellerModify", method=RequestMethod.POST)
	public String modifyPOST(ProductVO ProductVO, PageCriteria pCri, RedirectAttributes reAttr) throws Exception{
		
		logger.info(pCri.toString());
		
		ProductService.modify(ProductVO);
		
		reAttr.addAttribute("page", pCri.getPage());
		reAttr.addAttribute("numPerPage", pCri.getNumPerPage());
		
		reAttr.addFlashAttribute("result", "Success");
		
		logger.info(reAttr.toString());
				
		return "redirect:/product/productSellerList";
	}
	
	
	
	
	//상품 등록하기 페이지 이동
	@RequestMapping(value="/productWrite", method =RequestMethod.GET)
	public void writeGET(Model model) throws Exception{
		
		model.addAttribute("pd_idx", ProductService.listCountData()+1);		
		logger.info("writeGET()");
		
	}
	//상품 등록하기 insert
	@RequestMapping(value="/productWrite", method=RequestMethod.POST)
	public String writePOST(ProductVO ProductVO,FileVO fileVO,RedirectAttributes reAttr, HttpServletRequest request,FileUtils file) throws Exception{
		
		//파일 업로드하기 
		boolean isUpload = false;
		
		String Path = "C:\\Users\\mskyu\\git\\food_market\\food_market\\src\\main\\webapp\\resources\\\\pd_img_upload\\"+ProductVO.getPd_category()+"/";
		
		List<FileVO> fileList = file.FileUpload(fileVO,request,Path);
		for (int i = 0; i < fileList.size(); i++) {
			if(ProductVO.getPd_img_name_f()==null) {
				ProductVO.setPd_img_name_f(fileList.get(i).getStoredFileName());
			}else if(ProductVO.getPd_img_name_s()==null){
				ProductVO.setPd_img_name_s(fileList.get(i).getStoredFileName());
			}
			System.out.println("사진 0"+fileList.get(i).getStoredFileName());
			
		}
		System.out.println("사진 1"+ProductVO.getPd_img_name_f());
		System.out.println("사진 2"+ProductVO.getPd_img_name_s());
		
		if (ProductVO.getPd_img_name_f().length() > 0 && ProductVO.getPd_img_name_s().length() > 0) {
			isUpload=true;
		}
		
		if(isUpload){
			
			//여기서 vo객체로 insert하기 
			ProductService.write(ProductVO);
			reAttr.addFlashAttribute("result", "Success");	
			
		} else {
			reAttr.addFlashAttribute("result", "false");
		}
		
		return "redirect:/product/productSellerList";
	}
	
}

