package com.team3.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team3.page.PageCriteria;
import com.team3.page.PagingMaker;
import com.team3.service.ProductWishListService;
import com.team3.vo.ProductVO;
import com.team3.vo.ProductWishListVO;


@Controller
@RequestMapping("/product/*")
public class ProductWishListController {

	private static final Logger logger = LoggerFactory.getLogger(ProductWishListController.class);

	@Inject
	private ProductWishListService ProductWishListService;
	
	
	//get으로 존재하는지 가져오기 
	//버튼을 두개 준다.
	//등록 버튼과 삭제 버튼
	//댓글 목록 가져오기
	
		//RequestMethod.GET
		@RequestMapping(value = "/wishListSelect", method = RequestMethod.POST)
		public @ResponseBody ResponseEntity<Map<String, Object>> wishListSelect(@RequestBody ProductWishListVO ProductWishListVO) {

			ResponseEntity<Map<String, Object>> resEntity = null;
			try {          
				
				Map<String, Object> wishListProductMap = new HashMap<String, Object>();

				int wishListProductCountData = ProductWishListService.wishListProductCountData(ProductWishListVO.getProduct_pd_idx());
				int wishListSelectCount = ProductWishListService.wishListSelect(ProductWishListVO);
				
				wishListProductMap.put("wishListProductCountData",wishListProductCountData);
				wishListProductMap.put("wishListSelectCount",wishListSelectCount);
				
				resEntity = new ResponseEntity<Map<String, Object>>(wishListProductMap, HttpStatus.OK); //200번
//				System.out.println("\n"+wishListProductMap.toString()+"\n");
				
//				System.out.println(ProductWishListVO.getProduct_pd_idx()+"번 상품 찜 갯수 : "+wishListProductCountData);
//				if(wishListSelectCount==0) {
//					System.out.println("wishListSelectCount 는 "+wishListSelectCount +"    찜 할 수 있다!");
//				}else {
//					System.out.println("wishListSelectCount 는 "+wishListSelectCount +"    찜 할 수 없다!");
//				}
				
			} catch (Exception e) {
				e.printStackTrace();
				resEntity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);  //400번
			} 
			return resEntity; // 상태코드를 리턴한다. 
		}
	
	//등록 버튼
	@RequestMapping(value = "/wishListWrite", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Integer> wishListWrite(@RequestBody ProductWishListVO ProductWishListVO) {
		
		ResponseEntity<Integer> resEntity = null;
//		System.out.println("세션값!!!   "+ProductWishListVO.getMember_mb_id());

		//예외처리
		try {
			ProductWishListVO.setPd_wish_idx(ProductWishListService.wishListCountData()+1);
			
			ProductWishListService.wishListWrite(ProductWishListVO);
			
			int wishListProductCountData = ProductWishListService.wishListProductCountData(ProductWishListVO.getProduct_pd_idx());
			resEntity = new ResponseEntity<Integer>(wishListProductCountData, HttpStatus.OK);//200번
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST); //400번
		}
		return resEntity; // 상태코드를 리턴한다. 
	}
	
	
	//삭제 버튼 눌렀을 때 
	//RequestMethod.DELETE
	@RequestMapping(value = "/wishListDelete", method = RequestMethod.DELETE)
	public  @ResponseBody ResponseEntity<Integer> wishListDelete(@RequestBody ProductWishListVO ProductWishListVO) {

		ResponseEntity<Integer> resEntity = null;

		try {
			
			ProductWishListService.wishListDelete(ProductWishListVO);
			int wishListProductCountData = ProductWishListService.wishListProductCountData(ProductWishListVO.getProduct_pd_idx());
			
			resEntity = new ResponseEntity<Integer>(wishListProductCountData, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
		return resEntity;
	}
	
	
	
	
	
//-----------------------------------------------------------------------------------------------------------	
//-----------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------	
	
	
	
	//구매자 마이페이지에서 불러오기 
	//기존 게시판 목록과 같은 형식
	@RequestMapping(value="/productWishListMember", method=RequestMethod.GET)
	public void productWishListMember(ProductVO ProductVO ,ProductWishListVO ProductWishListVO, PageCriteria pCri, Model model, HttpSession session) throws Exception{
		//세션값 가져오기
		String mb_id = session.getAttribute("mb_id").toString();
				
		//id값 기준으로 
		//wishList를 불러와서 
		//list의 pd_idx기준으로 상세 정보 불러오기 
		
		Map map = new HashMap();
		map.put("mb_id",mb_id);
		map.put("startPage", pCri.getStartPage());
		map.put("numPerPage", pCri.getNumPerPage());
		
		//join
		List<ProductVO> WishListMember = ProductWishListService.wishListMember(map);
		
		model.addAttribute("WishListMember",WishListMember);
		
		PagingMaker pagingMaker = new PagingMaker();
		pagingMaker.setCri(pCri);		
		pagingMaker.setTotalData(ProductWishListService.wishListMemberCountData(mb_id));
		model.addAttribute("pagingMaker", pagingMaker);
		
		
		System.out.println("WishListMember :     "+WishListMember);
		//WishListMember :     [ProductVO [pd_category=과일, pd_idx=0, pd_name=콩, pd_price=22320, pd_size=00755665, 
		//pd_origin=0084, pd_img_name_f=콩_1592293928337.jpg, pd_img_name_s=콩_1592293928337.jpg, pd_stock=4, pd_date=null, 
		//member_mb_id=null, 
		//ProductWishListVO=ProductWishListVO [pd_wish_idx=13, member_mb_id=test2, product_pd_idx=60, pd_wish_date=2020-06-25], 
		//mvo=null]]
		System.out.println(mb_id+"의 찜 갯수 :     "+ProductWishListService.wishListMemberCountData(mb_id));
	}
	
}

