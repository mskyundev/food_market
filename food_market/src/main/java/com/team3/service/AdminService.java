package com.team3.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.team3.vo.AdminVO;
import com.team3.vo.CartVO;
import com.team3.vo.MemberVO;
import com.team3.vo.OrdersVO;
import com.team3.vo.ProductVO;
import com.team3.vo.RecommandVO;
import com.team3.vo.VisitVO;

public interface AdminService {
	public List<MemberVO> MemberList(Map<String, Object> map)throws Exception;
	public List<MemberVO> SellerList(Map<String, Object> map)throws Exception;
	// 방문자 정보 저장
	public boolean todayVisit() throws Exception;
	public void insertTodayVisit() throws Exception;	
	public void updateChrome() throws Exception;
	public void updateEdge() throws Exception;
	public void updateExplorer() throws Exception;
	public void updateSafari() throws Exception;
	public void updateEtc() throws Exception;
	// 방문자 통계	
	public int visitCount() throws Exception;
	public int chrome() throws Exception;
	public int edge() throws Exception;
	public int explorer() throws Exception;
	public int safari() throws Exception;
	public int etc() throws Exception;
	// 방문자 통계(1달)
	public List<VisitVO> monthVisit() throws Exception;
	
	// 인기상품(메인페이지)
	public List<ProductVO> mostSoldItem() throws Exception;
	public List<ProductVO> popularItem(Map<String, Integer> map) throws Exception;
	
	public boolean AdminLogin(AdminVO avo,HttpSession session) throws Exception;
	public List<ProductVO> ProductList(Map<String, Object> map)throws Exception;
	public List<ProductVO> CategoryList(Map<String, Object> map)throws Exception;
	public List<ProductVO> SellList(Map<String, Object> map)throws Exception;
	public int MemberCount()throws Exception;
	int ProductCount() throws Exception;
	public int todayMember(Map<String, Object> map) throws Exception;
	public List<OrdersVO> orderList(Map<String, Object> map) throws Exception;
	public int sellerProductCount(Map<String, Object> map) throws Exception;
	public int customerOrderCount(Map<String, Object> map) throws Exception;
	public int SellerCount(Map<String, Object> map) throws Exception;
	public int todayOrder(Map<String, Object> map) throws Exception;
	public String todaySales(Map<String, Object> map) throws Exception;
	public int categoryCount(Map<String, Object> map) throws Exception;
	public List<ProductVO> sellerCategoryList(Map<String, Object> map) throws Exception;
	public int sellerCategoryCount(Map<String, Object> map) throws Exception;
	public List<CartVO> cartList(Map<String, Object> map) throws Exception;
	public int cartCount(Map<String, Object> map) throws Exception;
	public int categoryProduct(String pd_category) throws Exception;
	public List<OrdersVO> sellerOrderList(Map<String, Object> map) throws Exception;
	public ProductVO detailProduct(int pd_idx) throws Exception;
	public int orderTotal(int od_idx) throws Exception;
	public List<OrdersVO> pdOrderList(String thisMonth) throws Exception;
	public List<OrdersVO> productPd_category(Map<String, Object> orderMap) throws Exception;
	public List<OrdersVO> selectOd_pd_idx(OrdersVO odvo);
	public void insertRecommand(RecommandVO rVO);
	public int selectScore(RecommandVO rVO);
	public void updateScore(RecommandVO rVO);
	public int orderListMb_id(String se_id);
	public List<RecommandVO> re_pd_idxList(int pd_idx);
	public int[] visit(int[] visit) throws Exception;
	public int sellProductCount(Map<String, Object> map);
}
