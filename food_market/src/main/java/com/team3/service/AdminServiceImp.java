package com.team3.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.team3.dao.AdminDAO;
import com.team3.dao.ProductDAO;
import com.team3.vo.AdminVO;
import com.team3.vo.CartVO;
import com.team3.vo.MemberVO;
import com.team3.vo.OrdersVO;
import com.team3.vo.ProductVO;
import com.team3.vo.RecommandVO;
@Service
public class AdminServiceImp implements AdminService {
	@Inject
	private AdminDAO adminDAO;
	@Inject
	private ProductDAO productDAO;
	
	
	// 관리자 로그인
	@Override
	public boolean AdminLogin(AdminVO avo,HttpSession session) throws Exception {
		boolean result=false;
		String adminID = adminDAO.AdminLogin(avo);
		
		if (adminID != null) {
			avo.setAm_id(adminID);
			session.setAttribute("mb_id", adminID);
			session.setAttribute("mb_name", "관리자");
			session.setAttribute("mb_seller", 3);
			
			result=true;
		}
		return result;
	}
	//====================	메인	=====================
	// 메인페이지 인기상품
	@Override
	public List<ProductVO> mostSoldItem() throws Exception {
		return adminDAO.mostSoldItem();
	}

	@Override
	public List<ProductVO> popularItem(Map<String, Integer> map) throws Exception {
		return adminDAO.popularItem(map);
	}
	
	// 방문자 정보 저장
	@Override
	public boolean todayVisit() throws Exception {
		boolean todayVisit = adminDAO.todayVisit();
		return todayVisit;
	}
	
	@Override
	public void insertTodayVisit() throws Exception{
		adminDAO.insertTodayVisit();
	}
	@Override
	public void updateChrome() throws Exception{
		adminDAO.updateChrome();
	}
	@Override
	public void updateEdge() throws Exception{
		adminDAO.updateEdge();
	}
	@Override
	public void updateExplorer() throws Exception{
		adminDAO.updateExplorer();
	}
	@Override
	public void updateSafari() throws Exception{
		adminDAO.updateSafari();
	}
	@Override
	public void updateEtc() throws Exception{
		adminDAO.updateEtc();
	}

	@Override
	public int visitCount() throws Exception {
		int visitCount = adminDAO.visitCount();
		return visitCount;
	}
	
	@Override
	public int chrome() throws Exception {
		int chrome = adminDAO.chrome();
		return chrome;
	}
	@Override
	public int edge() throws Exception {
		int edge = adminDAO.edge();
		return edge;
	}
	@Override
	public int explorer() throws Exception {
		int explorer = adminDAO.explorer();
		return explorer;
	}
	@Override
	public int safari() throws Exception {
		int safari = adminDAO.safari();
		return safari;
	}
	@Override
	public int etc() throws Exception {
		int etc = adminDAO.etc();
		return etc;
	}
	//==================== admin/index 페이지(빅데이터)  ============================
	// 신규 가입자
	@Override
	public int todayMember(Map<String, Object> map) throws Exception {
		int todayMember=adminDAO.todayMember(map);
		return todayMember;
	}
	
	@Override
	public int[] visit(int[] visit) throws Exception {
		
		System.out.println("서비스: " + visit);
		return visit;
	}

	// 당일 주문량
	@Override
	public int todayOrder(Map<String, Object> map) throws Exception {
		return adminDAO.todayOrder(map);
	}
	// 당일 매출액
	@Override
	public String todaySales(Map<String, Object> map) throws Exception {
		return adminDAO.todaySales(map);
	}
	// 달 별 주문내역
	@Override
	public List<OrdersVO> pdOrderList(String thisMonth) throws Exception {
		return adminDAO.pdOrderList(thisMonth);
	}
	// pd_idx로 카테고리 출력
	@Override
	public List<OrdersVO> productPd_category(Map<String, Object> orderMap) throws Exception {
		return adminDAO.productPd_category(orderMap);
	}
	
	@Override
	public List<AdminVO> monthVisit() throws Exception {
		return adminDAO.monthVisit();
	}
	@Override
	public int orderTotal(int od_idx) throws Exception {
		return adminDAO.orderTotal(od_idx);
	}
	
	//==================== chart test  ============================
	@Override
	public int categoryProduct(String pd_category) throws Exception {
		return adminDAO.categoryProduct(pd_category);
	}
	
//==================== 전체 회원/상품 리스트  ============================
	// 전체 회원 출력
	@Override
	public List<MemberVO> MemberList(Map<String, Object> map) throws Exception {
		return adminDAO.MemberList(map);
	}
	// 전체 회원수
	@Override
	public int MemberCount() throws Exception {
		return adminDAO.MemberCount();
	}
	// 전체 상품 출력
	@Override
	public List<ProductVO> ProductList(Map<String, Object> map) throws Exception {
		return adminDAO.ProductList(map);
	}
	// 전체 상품 수
	@Override
	public int ProductCount() throws Exception {
		return adminDAO.ProductCount();
	}
	// 판매자/구매자별 회원 목록
	@Override
	public List<MemberVO> SellerList(Map<String, Object> map) throws Exception {
		return adminDAO.SellerList(map);
	}
	// 판매자/구매자별 회원 수
	@Override
	public int SellerCount(Map<String, Object> map) throws Exception {
		return adminDAO.SellerCount(map);
	}
	// 카테고리별 상품 출력
	@Override
	public List<ProductVO> CategoryList(Map<String, Object> map) throws Exception {
		return adminDAO.CategoryList(map);
	}
	// 카테고리별 상품 수
	@Override
	public int categoryCount(Map<String, Object> map) throws Exception {
		return adminDAO.categoryCount(map);
	}
	
	
//==================== 판매자관련 리스트  ============================
	// 판매자별 상품 출력
	@Override
	public List<ProductVO> SellList(Map<String, Object> map) throws Exception {
		return adminDAO.SellList(map);
	}
	// 판매자별 상품 수
	@Override
	public int sellerProductCount(Map<String, Object> map) throws Exception {
		return adminDAO.sellerProductCount(map);
	}
	// 판매자+카테고리별 상품 출력
	@Override
	public List<ProductVO> sellerCategoryList(Map<String, Object> map) throws Exception {
		return adminDAO.sellerCategoryList(map);
	}
	// 판매자+카테고리별 상품 수
	@Override
	public int sellerCategoryCount(Map<String, Object> map) throws Exception {
		return adminDAO.sellerCategoryCount(map);
	}
	// 판매자별 판매 내역 - mb_id
	@Override
	public List<OrdersVO> sellerOrderList(Map<String, Object> map) throws Exception {
		return adminDAO.sellerOrderList(map);
	}
	@Override
	public int sellProductCount(Map<String, Object> map) {
		return adminDAO.sellProductCount(map);
	}

	
//==================== 구매자 관련 리스트  ============================
	// 구매자별 구매 내역
	@Override
	public List<OrdersVO> orderList(Map<String, Object> map) throws Exception {
		return adminDAO.orderList(map);
	}
	
	// 구매자별 구매 상품 수
	@Override
	public int customerOrderCount(Map<String, Object> map) throws Exception {
		return adminDAO.customerOrderCount(map);
	}
	// 구매자별 장바구니 목록
	@Override
	public List<CartVO> cartList(Map<String, Object> map) throws Exception {
		return adminDAO.cartList(map);
	}
	// 구매자별 장바구니 수
	@Override
	public int cartCount(Map<String, Object> map) throws Exception {
		return adminDAO.cartCount(map);
	}
	
//==================== 상품 관련 리스트  ============================
	
	// 상품 정보
	@Override
	public ProductVO detailProduct(int pd_idx) throws Exception {
		return productDAO.read(pd_idx);
	}
	
	
	
//============================ 추천상품  ============================
	// 1. od_num별 pd_idx 출력
	@Override
	public List<OrdersVO> selectOd_pd_idx(OrdersVO odvo) {
		return adminDAO.selectOd_pd_idx(odvo);
	}
	// 2. select recommand score : 기존에 입력되어있는 데이터가 있는지 확인
	@Override
	public int selectScore(RecommandVO rVO) {
		return adminDAO.selectScore(rVO);
	}
	// 3-1. insert recommand : 기존의 데이터가 없으면 insert
	@Override
	public void insertRecommand(RecommandVO rVO) {
		adminDAO.insertRecommand(rVO);
	}
	// 3-2. update recommand score : 기존의 데이터가 있으면 update score+1
	@Override
	public void updateScore(RecommandVO rVO) {
		adminDAO.updateScore(rVO);
	}
	// 최근 구매 상품
	@Override
	public int orderListMb_id(String mb_id) {
		return adminDAO.orderListMb_id(mb_id);
	}
	// 최근 구매 상품과 관련된 추천 상품 리스트
	@Override
	public List<RecommandVO> re_pd_idxList(int pd_idx) {
		return adminDAO.re_pd_idxList(pd_idx);
	}
	
}
