package com.team3.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team3.page.PageCriteria;
import com.team3.page.PagingMaker;
import com.team3.service.AdminService;
import com.team3.service.CsService;
import com.team3.service.ProductReviewService;
import com.team3.vo.AdminVO;
import com.team3.vo.CartVO;
import com.team3.vo.CsVO;
import com.team3.vo.MemberVO;
import com.team3.vo.OrdersVO;
import com.team3.vo.ProductReviewVO;
import com.team3.vo.ProductVO;


@Controller
public class AdminController {
	@Inject
	private AdminService adminService;
	@Inject
	private ProductReviewService prService;
	@Inject
	private CsService csService;
	
	// 관리자 메인 페이지
	@RequestMapping("/admin/index")
	public String index(Model model, HttpSession session) throws Exception{
		String returnPage ;
		String se_id = (String) session.getAttribute("mb_id");
		if (se_id == null) {
			returnPage = "redirect:/";
		}else {
			
			// 오늘 날짜 yyyy-mm-dd
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat month = new SimpleDateFormat("yyyy-MM");
			Date today = new Date();
			String mb_date = date.format(today); // yyyy-MM-dd
			String thisMonth = month.format(today); // yyyy-MM
			model.addAttribute("thisMonth", thisMonth);
			Map<String, Object>map = new HashMap<String, Object>();
			map.put("mb_date", mb_date);
			
			// 신규 가입자수
			int todayMember = adminService.todayMember(map);
			model.addAttribute("todayMember", todayMember);
			// 당일 판매량
			int todayOrder = adminService.todayOrder(map);
			model.addAttribute("todayOrder", todayOrder);
			// 당일 판매 금액
			String todaySales = adminService.todaySales(map);
			model.addAttribute("todaySales", todaySales);
			// 당일 방문자 수
			int visitCount = adminService.visitCount();
			model.addAttribute("visitCount", visitCount);
			// 방문 브라우저 비율
			int chrome = adminService.chrome();
			int edge = adminService.edge();
			int explorer = adminService.explorer();
			int safari = adminService.safari();
			int etc = adminService.etc();
			model.addAttribute("chrome",chrome);
			model.addAttribute("edge",edge);
			model.addAttribute("explorer",explorer);
			model.addAttribute("safari",safari);
			model.addAttribute("etc",etc);
			// 카테고리별 상품 수 차트
			int category1=adminService.categoryProduct("과일");
			int category2=adminService.categoryProduct("채소");
			int category3=adminService.categoryProduct("정육");
			int category4=adminService.categoryProduct("곡식");
			int category5=adminService.categoryProduct("수산");
			model.addAttribute("category1", category1);
			model.addAttribute("category2", category2);
			model.addAttribute("category3", category3);
			model.addAttribute("category4", category4);
			model.addAttribute("category5", category5);
			
			Map<String, Object>orderMap = new HashMap<String, Object>();
			orderMap.put("od_date", thisMonth);
			
			// 방문자 통계(1달)
			List<AdminVO> monthVisit = adminService.monthVisit();
			for(int i=0;i<monthVisit.size();i++) {
				String day = monthVisit.get(i).getDate().toString();
				String[] days = day.split("-");
				int vYear = Integer.parseInt(days[0]);
				int vMonth = Integer.parseInt(days[1])-1;
				int vDay = Integer.parseInt(days[2]);
				int vChrome = monthVisit.get(i).getChrome();
				int vEdge = monthVisit.get(i).getEdge();
				int vExplorer = monthVisit.get(i).getExplorer();
				int vSafari = monthVisit.get(i).getSafari();
				int vEtc = monthVisit.get(i).getEtc();
				int vis = monthVisit.get(i).getVisits();
				model.addAttribute("year"+i, vYear);
				model.addAttribute("month"+i, vMonth);
				model.addAttribute("day"+i, vDay);
				model.addAttribute("chrome"+i, vChrome);
				model.addAttribute("edge"+i, vEdge);
				model.addAttribute("explorer"+i, vExplorer);
				model.addAttribute("safari"+i, vSafari);
				model.addAttribute("etc"+i, vEtc);
				model.addAttribute("vis"+i, vis);
			}
			
			
			// 카테고리별 주문 수 차트
			int fruit = 0;
			int vegetable = 0;
			int meat = 0;
			int rice = 0;
			int fish = 0;
			
			// 상품 카테고리별 결제 금액
			int fruitSales = 0;
			int vegetableSales = 0;
			int meatSales = 0;
			int riceSales = 0;
			int fishSales = 0;
			
			// 월별 주문수
			List<OrdersVO> pdList = adminService.pdOrderList(thisMonth);
			for (int i = 0; i < pdList.size() ; i++) {
				int od_idx = pdList.get(i).getOd_idx();
				orderMap.put("od_idx", od_idx);
				// 카테고리 출력
				List<OrdersVO> pd_category = adminService.productPd_category(orderMap);
				for (int j = 0; j < pd_category.size(); j++) {
					if (pd_category.get(j).getPd_category().equals("과일")) {
						fruit=fruit+pd_category.get(j).getAmount();
						fruitSales=fruitSales+pd_category.get(j).getPrice();
					}else if (pd_category.get(j).getPd_category().equals("채소")) {
						vegetable=vegetable+pd_category.get(j).getAmount();
						vegetableSales=vegetableSales+pd_category.get(j).getPrice();
					}else if (pd_category.get(j).getPd_category().equals("정육")) {
						meat=meat+pd_category.get(j).getAmount();
						meatSales=meatSales+pd_category.get(j).getPrice();
					}else if (pd_category.get(j).getPd_category().equals("곡식")) {
						rice=rice+pd_category.get(j).getAmount();
						riceSales=riceSales+pd_category.get(j).getPrice();
					}else if (pd_category.get(j).getPd_category().equals("수산")) {
						fish=fish+pd_category.get(j).getAmount();
						fishSales=fishSales+pd_category.get(j).getPrice();
					}
				}
			}
			model.addAttribute("fruit", fruit);
			model.addAttribute("vegetable", vegetable);
			model.addAttribute("meat", meat);
			model.addAttribute("rice", rice);
			model.addAttribute("fish", fish);
			
			model.addAttribute("fruitSales", fruitSales);
			model.addAttribute("vegetableSales", vegetableSales);
			model.addAttribute("meatSales", meatSales);
			model.addAttribute("riceSales", riceSales);
			model.addAttribute("fishSales", fishSales);
			returnPage="admin/index";
		}
		return returnPage;
				
	}
	
	
	
	// 전체 회원 리스트 페이지
	@RequestMapping("/admin/memberList")
	public String memberList(MemberVO mvo,Model model, PageCriteria pCri, HttpSession session) throws Exception {
		String returnPage ;
		String se_id = (String) session.getAttribute("mb_id");
		if (se_id == null) {
			returnPage = "redirect:/";
		}else {
			List<MemberVO> list = null;
			int page = pCri.getPage();
			int mb_seller = mvo.getMb_seller();
	
			pCri = new PageCriteria(page,25);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("mb_seller", mvo.getMb_seller());
			map.put("startPage", pCri.getStartPage());
			map.put("numPerPage", pCri.getNumPerPage());
			
			PagingMaker pm = new PagingMaker();
			pm.setCri(pCri);
			
			if (mvo.getMb_seller()==1 || mvo.getMb_seller()==2) {
				list = adminService.SellerList(map); // 판매자/구매자별 회원 목록
				pm.setTotalData(adminService.SellerCount(map)); // 판매자/구매자별 회원 수
			}else {
				list = adminService.MemberList(map); // 전체 회원 목록
				pm.setTotalData(adminService.MemberCount()); // 전체 회원 수
			}
			
			model.addAttribute("pagingMaker", pm);
			model.addAttribute("list",list);
			model.addAttribute("mb_seller",mb_seller);
			
			returnPage="admin/memberList";
		}
		return returnPage;
	}
	
	// 전체 상품 리스트 페이지
	@RequestMapping("/admin/productList")
	public String productList(ProductVO pvo,Model model,PageCriteria pCri,HttpSession session) throws Exception {
		String returnPage ;
		String se_id = (String) session.getAttribute("mb_id");
		if (se_id == null) {
			returnPage = "redirect:/";
		}else {
			List<ProductVO> list = null;
			int page=pCri.getPage();
			String pd_category=pvo.getPd_category();
			pCri = new PageCriteria(page,25);
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("pd_category", pvo.getPd_category());
			map.put("startPage", pCri.getStartPage());
			map.put("numPerPage", pCri.getNumPerPage());
			
			PagingMaker pm = new PagingMaker();
			pm.setCri(pCri);
			
			if (pvo.getPd_category()==null || pvo.getPd_category()=="") {
				list=adminService.ProductList(map); // 전체 상품 목록
				pm.setTotalData(adminService.ProductCount()); // 전체 상품 수
			}else {
				list=adminService.CategoryList(map); // 카테고리별 상품 목록
				pm.setTotalData(adminService.categoryCount(map)); // 카테고리별 상품 수
			}
			
			model.addAttribute("list",list);
			model.addAttribute("pagingMaker", pm);
			model.addAttribute("pd_category", pd_category);
			returnPage="admin/productList";
		}
		
		return returnPage;
	}
	
	// 판매자별 페이지
	@RequestMapping("/admin/sellerList")
	public String sellerList(ProductVO pvo, MemberVO mvo,Model model,PageCriteria pCri, HttpSession session,
			@RequestParam(value="productOrder",required = false)String productOrder) throws Exception {
		String returnPage ;
		String se_id = (String) session.getAttribute("mb_id");
		if (se_id == null) {
			returnPage = "redirect:/";
		}else {
			String mb_id=mvo.getMb_id();
			String pd_category=pvo.getPd_category();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mb_id", mb_id);
			map.put("pd_category", pd_category);
			map.put("startPage", pCri.getStartPage());
			map.put("numPerPage", pCri.getNumPerPage());
			PagingMaker pm = new PagingMaker();
			pm.setCri(pCri);
			if (productOrder.equals("productList")) {
				List<ProductVO> sellerProductList = null;
				int sellerProductCount = adminService.sellerProductCount(map); // 판매자별 상품 수
				int sellerCategoryCount = adminService.sellerCategoryCount(map); // 판매자+카테고리별 상품 수

				if (pvo.getPd_category()==null || pvo.getPd_category()=="") {
					sellerProductList=adminService.SellList(map); // 판매자별 상품 목록
					pm.setTotalData(sellerProductCount); 
				}else {
					sellerProductList=adminService.sellerCategoryList(map); // 판매자+카테고리별 상품 목록
					pm.setTotalData(sellerCategoryCount); 
				}
				model.addAttribute("sellerProductList",sellerProductList);
			}else if (productOrder.equals("sellList")) {
				List<OrdersVO> sellerOrderList = adminService.sellerOrderList(map); // 판매자별 판매 내역
				int sellProductCount = adminService.sellProductCount(map); // 판매자별 판매 수

				pm.setTotalData(sellProductCount);
				model.addAttribute("sellerOrderList",sellerOrderList);
			}
			model.addAttribute("productOrder", productOrder);
			model.addAttribute("pagingMaker", pm);
			model.addAttribute("seller_name",mb_id);
			model.addAttribute("pd_category",pd_category);
			model.addAttribute("pagingMaker", pm);
			returnPage="admin/sellerList";
		}
		return returnPage;
	}
	
	// 구매자별 페이지
	@RequestMapping("/admin/detailCustomer")
	public String detailCustomer(OrdersVO odvo,MemberVO mvo,Model model,PageCriteria pCri) throws Exception {
		List<OrdersVO> orderList = null;	
		String mb_id=mvo.getMb_id();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mb_id", mb_id);
		map.put("startPage", pCri.getStartPage());
		map.put("numPerPage", pCri.getNumPerPage());
		orderList = adminService.orderList(map); // 구매자별 주문 목록
		
		
		model.addAttribute("orderList",orderList);
		model.addAttribute("seller_name",mb_id);
		
		PagingMaker orderPm = new PagingMaker();
		orderPm.setCri(pCri);
		orderPm.setTotalData(adminService.customerOrderCount(map)); // 구매자별 주문 수
		model.addAttribute("orderPm", orderPm);
		
		List<CartVO> cartList = null;
		cartList = adminService.cartList(map); // 구매자별 장바구니 목록
		
		model.addAttribute("cartList",cartList);
		
		PagingMaker cartPm = new PagingMaker();
		cartPm.setCri(pCri);
		cartPm.setTotalData(adminService.cartCount(map)); // 구매자별 장바구니 수
		model.addAttribute("cartPm", cartPm);
		
		return "admin/detailCustomer";
	}
	
	// 상품 상세페이지
	@RequestMapping("/admin/detailProduct")

	public String detailProduct(Model model, ProductVO pvo, PageCriteria pCri, HttpSession session) throws Exception {
		String returnPage ;
		String se_id = (String) session.getAttribute("mb_id");
		if (se_id == null) {
			returnPage = "redirect:/";
		}else {
			String pd_name = pvo.getPd_name();
			int pd_idx = pvo.getPd_idx();
			ProductVO ProductVO = adminService.detailProduct(pd_idx); // 상품 정보 불러오기
			ProductReviewVO ProductReviewVO = new ProductReviewVO();
			ProductReviewVO.setProduct_pd_idx(pd_idx);
			int reviewCount = prService.reviewListCountData(ProductReviewVO); // 상품별 리뷰 수
			double star =0;
			if (reviewCount != 0) {
				star = prService.reviewStarAVG(pd_idx); // 상품 평균 평점
			}
			
			pCri = new PageCriteria();
			
			Map<String, Object>map = new HashMap<String, Object>();
			map.put("product_pd_idx", pd_idx);
			map.put("startPage", pCri.getStartPage());
			map.put("numPerPage", pCri.getNumPerPage());
			
			List<ProductReviewVO> reviewList = prService.reviewListCriteria(map); // 리뷰 리스트
			
			PagingMaker pm = new PagingMaker();
			pm.setCri(pCri);
			
			model.addAttribute("pagingMaker", pm);
			model.addAttribute("reviewList",reviewList);
			model.addAttribute("pd_name", pd_name);
			model.addAttribute("pd_idx", pd_idx);
			model.addAttribute("ProductVO", ProductVO);
			model.addAttribute("starAVG", star);
			model.addAttribute("reviewCount", reviewCount);
			returnPage="admin/detailProduct";
		}
		return returnPage;
	}
	
	@RequestMapping("/admin/csList")
	public String csList(CsVO cVO, Model model, PageCriteria pCri, HttpSession session) {
		String returnPage ;
		String se_id = (String) session.getAttribute("mb_id");
		if (se_id == null) {
			returnPage = "redirect:/";
		}else {
			List<CsVO> csList = null;
			int page=pCri.getPage();
			int cs_type=cVO.getCs_type();
			pCri = new PageCriteria(page,25);
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("cs_type", cs_type);
			map.put("pageStart", pCri.getStartPage());
			map.put("perPageNum", pCri.getNumPerPage());
			
			PagingMaker pm = new PagingMaker();
			pm.setCri(pCri);
			
			int csCount = csService.csCount(map); // 전체 리스트 count
			csList=csService.csList(map); // cs 전체 리스트
			pm.setTotalData(csCount); 
			
			model.addAttribute("csList",csList);
			model.addAttribute("pagingMaker", pm);
			returnPage="admin/csList";
		}
		return returnPage;
	}
	
	
}

