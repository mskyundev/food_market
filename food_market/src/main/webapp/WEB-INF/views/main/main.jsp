<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
<link rel="shortcut icon" type="image⁄x-icon" href="pd_img_upload/food market_LOGO.png"><title>FoodMarket</title>
<!-- all css here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/slinky.min.css">
<link rel="stylesheet" href="assets/css/meanmenu.min.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/ionicons.min.css">
<link rel="stylesheet" href="assets/css/bundle.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">


<script type="text/javascript">
	$(document).ready(function() {
		$('.slider').slider();
	});
</script>
<style type="text/css">
*{margin:0;padding:0;}
    ul,li{list-style:none;}
    .slider{width:1583px;overflow:hidden;}
    .slider ul{position:relative;height:830px;}
    .slider li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;animation:fade 12s infinite;}
    .slider li:nth-child(1){background:url("assets/img/slider/main1.jpg");animation-delay:0s }
    .slider li:nth-child(2){background:url("assets/img/slider/main0.jpg");animation-delay:3s}
    .slider li:nth-child(3){background:url("assets/img/slider/main2.jpg");animation-delay:6s}
    .slider li:nth-child(4){background:url("assets/img/slider/main3.jpg");animation-delay:9s}
     /* 100 / 8 = 12.5 */
    @keyframes fade {
      0% {opacity:0;}
      5% {opacity:1;}
      25% {opacity:1;}
      30% {opacity:0;}
      100% {opacity:0;}
}
.ban-font {text-align:center;position: absolute;bottom: 15px;left: 636px;}
.ban-font h2{font-size:45px;color:white;}
.ban-font h3{font-size:30px;color:white;}
</style>
</head>
<body>
	<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
	<div class="wrapper">
		<div class="body-overlay"></div>
		<div class="body-overlay"></div>
		<!-- 왼쪽 메인 메뉴바 -->
		<div class="sidebar-style">
			<div class="sidebar-style-all">

				<!-- 로고 위치  -->
				<div class="sidebar-logo-menu">
					<div class="sidebar-logo">
						<a href="/food_market/"> <img alt=""
							src="pd_img_upload/food market_LOGO.png"  width="200">
						</a>
					</div>

					<!-- 왼쪽 로고 메뉴 -->
					<div class="sidebar-main-menu main-menu">
						<nav>
							<ul>
								<li><a href="/food_market/">HOME</a></li>
								<li><a href="product/productList">전체상품
<!-- 								<span><i class="ion-ios-arrow-forward"></i></span> -->
								</a>
									<div class="mega-dropdown width-col3">
										<ul class="dropdown">
											<li><a href="product/productList">전체 상품</a></li>
                                                    <li><a href="product/productList?findType=과일">과일</a></li>
                                                    <li><a href="product/productList?findType=채소">채소</a></li>
                                                    <li><a href="product/productList?findType=곡식">곡식</a></li>
                                                    <li><a href="product/productList?findType=정육">정육</a></li>
                                                    <li><a href="product/productList?findType=수산">수산</a></li>
										</ul>
									</div></li>
										<c:choose>
											<c:when test="${sessionScope.mb_seller == '1' }"> <!-- 판매자 -->
											<li><a href="product/productSellerList">마이페이지</a>
												<div class="mega-dropdown width-col3">
													<ul class="dropdown">
														<li><a href="product/productSellerList">판매자 페이지</a></li>
														<li><a href="product/productWrite">상품 등록</a></li>
														<li><a href="member/info">회원정보 수정</a></li>
														<li><a href="member/sellerOrder">배송 관리</a></li>
													</ul>
												</div>
												</li>
											</c:when>
											<c:when test="${sessionScope.mb_seller == '2' }"> <!-- 구매자 -->
											<li><a href="member/myPage">마이페이지</a>
												<div class="mega-dropdown width-col3">
												<ul class="dropdown">
													<li><a href="member/info">회원정보 수정</a></li>
													<li><a href="member/modifyPw">비밀번호 변경</a></li>
													<li><a href="cart/list">장바구니</a></li>
													<li><a href="orders/orderlist">구매내역</a></li>
													<li><a href="product/productWishListMember">위시리스트</a></li>
												</ul>
												</div>
												</li>
											</c:when>
											<c:when test="${sessionScope.mb_seller == '3' }"> <!-- 관리자 -->
											<li><a href="admin/index">관리자페이지</a></li>
											</c:when>
											<c:otherwise>
												
											</c:otherwise>
										</c:choose>
								<li><a href="cs/ask">고객센터</a></li>
							</ul>
						</nav>
					</div>
				</div>

				<div class="sidebar-cart-contact">
					<!-- 로그인, 회원가입 / 내 정보, 로그아웃 -->
					 
					<div class="member-info">
						<c:choose>
							<c:when test="${sessionScope.mb_seller == null }">
								<input type="button" value="로그인"
									onclick="location.href='member/login#login'">
								<input type="button" value="회원가입"
									onclick="location.href='member/contract'">
<!-- 								<input type="button" value="장바구니" -->
<!-- 									onclick="location.href='member/login'"> -->
							</c:when>
							<c:when test="${sessionScope.mb_seller == 3 }">
								<b>${sessionScope.mb_name }</b><a> 님 환영합니다.</a> <br>
								<input type="button" value="관리자페이지"
									onclick="location.href='admin/index'"><br>
								<input type="button" value="로그아웃"
									onclick="location.href='member/logout'">
							</c:when>
							<c:when test="${sessionScope.mb_seller== 2}">
								<b>${sessionScope.mb_name}</b><a> 님 환영합니다.</a><br>
								<input type="button" value="마이페이지"
									onclick="location.href='member/myPage'">
								<br>
								<input type="button" value="장바구니"
									onclick="location.href='cart/list'">
								<br>
								<input type="button" value="로그아웃"
									onclick="location.href='member/logout'">
							</c:when>
							<c:when test="${sessionScope.mb_seller== 1}">
								<b>${sessionScope.mb_name}</b><a> 님 환영합니다.</a><br>
								<input type="button" value="마이페이지"
									onclick="location.href='product/productSellerList'">
								<br>
								<input type="button" value="로그아웃"
									onclick="location.href='member/logout'">
								<br>
							</c:when>
						</c:choose>
					</div>
					<div class="sidebar-contact">
						<p>Call Us : +8210 1234 5678 </p>
					</div>
				</div>
			</div>
			<!-- sidebar-cart-contact END -->
		</div>
	<div class="sidebar-wrapper">
		<!-- 메인 배너 -->
		<div class="slider">
			<ul>
				<li>
					<div class="ban-font" >
	                  <h2 class="animated">Fresh Market!</h2>
	                  <h3 class="animated">Buy Fresh Food!</h3>
	                  <a class="btn-hover slider-btn-toy" href="${path }/food_market/product/productList">상품 구경하기</a>
                	</div>
				</li>
				<li>
					<div class="ban-font">
	                    <h2 class="animated">Fresh Market!</h2>
	                    <h3 class="animated">Buy Fresh Food!</h3>
	                   <a class="btn-hover slider-btn-toy" href="${path }/food_market/product/productList">상품 구경하기</a>
                 	</div>
                </li>
				<li>
					<div class="ban-font">
                        <h2 class="animated">Fresh Market!</h2>
                        <h3 class="animated">Buy Fresh Food!</h3>
                       <a class="btn-hover slider-btn-toy" href="${path }/food_market/product/productList">상품 구경하기</a>
                  	</div>
				</li>
				<li>
					<div class="ban-font">
                        <h2 class="animated">Fresh Market!</h2>
                        <h3 class="animated">Buy Fresh Food!</h3>
                      <a class="btn-hover slider-btn-toy" href="${path }/food_market/product/productList">상품 구경하기</a>
                  	</div>
				</li>
			</ul>
		</div>

			<!-- 아래 상품 목록 -->
			<div class="toy-banner-shop gray-bg-5">
				<!-- 하단 목록 1 -->
				<div class="toy-banner-cart">
					<div class="shop-services-area">
						<div class="toy-services">
							<div class="single-shop-services-all">
								<div class="single-shop-services mb-30">
									<div class="single-shop-img">
										<img alt="" src="assets/img/icon-img/3.png">
									</div>
									<div class="single-shop-content">
										<h5>5만원 이상 구매 시 무료 배송!</h5>
										<p></p>
									</div>
								</div>
								<div class="single-shop-services mb-30">
									<div class="single-shop-img">
										<img alt="" src="assets/img/icon-img/4.png">
									</div>
									<div class="single-shop-content">
<!-- 										<h5>고객 문의</h5> -->
										<p>24시간 고객센터 운영 <br>불편사항을 도와드리겠습니다.</p>
									</div>
								</div>
								<div class="single-shop-services mb-30">
									<div class="single-shop-img">
										<img alt="" src="assets/img/icon-img/5.png">
									</div>
									<div class="single-shop-content">
										<h5>저렴한 가격</h5>
										<p>고퀄리티 품질으로 만나보세요</p>
									</div>
								</div>
								<div class="single-shop-services mb-30">
									<div class="single-shop-img">
										<img alt="" src="assets/img/icon-img/6.png">
									</div>
									<div class="single-shop-content">
										<h5>MEMBER DISCOUNT</h5>
										<p>차후 오픈 예정입니다.</p>
									</div>
								</div>
								<div class="single-shop-services mb-30">
									<div class="single-shop-img">
										<img alt="" src="assets/img/icon-img/mainicon0.png">
									</div>
									<div class="single-shop-content">
										<h5>타 사이트보다 좋은 품질, 가격의 자신감</h5>
										<p>직접 확인해보세요!</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 하단 목록1 END -->
				<c:if test="${pVO0.pd_img_name_f ne null }">
				<div class="section-title text-center mb-55 section-title-2">
					<h2>추천 상품</h2>
					<p>고객님들께 맞춤 상품들을 모아보았습니다.</p>
				</div>
				<div class="banner-area pt-70 pb-100" style="padding-top: 0px;">
					<div class="col-md-6 col-lg-4 col-xl-3 col-12">
						<div class="single-product mb-45">
							<div class="product-img">
								<a href="/food_market/product/productDetail?pd_idx=${pVO0.pd_idx }">
									<img src="pd_img_upload/${pVO0.pd_category }/${pVO0.pd_img_name_f }" width="305" height="350"></a>
							</div>
							<div style="margin-top: 5px;font-size: 15px;">
								<div class="product-title-price">
									<div class="product-title">
										<h4 style="overflow: hidden; text-overflow: ellipsis; width: 230px; white-space:nowrap;">
											<a href="/food_market/product/productDetail?pd_idx=${pVO0.pd_idx}">${pVO0.pd_category}&nbsp;&nbsp;/&nbsp;&nbsp;<b style="font-size: 24px; ">${pVO0.pd_name}</b></a>
										</h4>
									</div>
									<div class="product-price">
									<span>
										<b>￦&nbsp;</b>
						 <fmt:formatNumber type="number" maxFractionDigits="3" value="${pVO0.pd_price}" />
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				<c:if test="${pVO1.pd_img_name_f ne null }">
					<div class="col-md-6 col-lg-4 col-xl-3 col-12">
						<div class="single-product mb-45">
							<div class="product-img">
								<a href="/food_market/product/productDetail?pd_idx=${pVO1.pd_idx }">
									<img src="pd_img_upload/${pVO1.pd_category }/${pVO1.pd_img_name_f }" width="305" height="350"></a>
							</div>
							<div style="margin-top: 5px;font-size: 15px;">
								<div class="product-title-price">
									<div class="product-title">
										<h4 style="overflow: hidden; text-overflow: ellipsis; width: 230px; white-space:nowrap;">
											<a href="/food_market/product/productDetail?pd_idx=${pVO1.pd_idx}">${pVO1.pd_category}&nbsp;&nbsp;/&nbsp;&nbsp;<b style="font-size: 24px; ">${pVO1.pd_name}</b></a>
										</h4>
									</div>
									<div class="product-price">
									<span>
										<b>￦&nbsp;</b>
						 <fmt:formatNumber type="number" maxFractionDigits="3" value="${pVO1.pd_price}" />
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${pVO2.pd_img_name_f ne null }">
					<div class="col-md-6 col-lg-4 col-xl-3 col-12">
						<div class="single-product mb-45">
							<div class="product-img">
								<a href="/food_market/product/productDetail?pd_idx=${pVO2.pd_idx }">
									<img src="pd_img_upload/${pVO2.pd_category }/${pVO2.pd_img_name_f }" width="305" height="350"></a>
							</div>
							<div style="margin-top: 5px;font-size: 15px;">
								<div class="product-title-price">
									<div class="product-title">
										<h4 style="overflow: hidden; text-overflow: ellipsis; width: 230px; white-space:nowrap;">
											<a href="/food_market/product/productDetail?pd_idx=${pVO2.pd_idx}">${pVO2.pd_category}&nbsp;&nbsp;/&nbsp;&nbsp;<b style="font-size: 24px; ">${pVO2.pd_name}</b></a>
										</h4>
									</div>
									<div class="product-price">
									<span>
										<b>￦&nbsp;</b>
						 <fmt:formatNumber type="number" maxFractionDigits="3" value="${pVO2.pd_price}" />
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${pVO3.pd_img_name_f ne null }">
					<div class="col-md-6 col-lg-4 col-xl-3 col-12">
						<div class="single-product mb-45">
							<div class="product-img">
								<a href="/food_market/product/productDetail?pd_idx=${pVO3.pd_idx }">
									<img src="pd_img_upload/${pVO3.pd_category }/${pVO3.pd_img_name_f }" width="305" height="350"></a>
							</div>
							<div style="margin-top: 5px;font-size: 15px;">
								<div class="product-title-price">
									<div class="product-title">
										<h4 style="overflow: hidden; text-overflow: ellipsis; width: 230px; white-space:nowrap;">
											<a href="/food_market/product/productDetail?pd_idx=${pVO3.pd_idx}">${pVO3.pd_category}&nbsp;&nbsp;/&nbsp;&nbsp;<b style="font-size: 24px; ">${pVO3.pd_name}</b></a>
										</h4>
									</div>
									<div class="product-price">
									<span>
										<b>￦&nbsp;</b>
						 <fmt:formatNumber type="number" maxFractionDigits="3" value="${pVO3.pd_price}" />
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				</div>
				</c:if>
				<!-- 하단 목록2 END -->
				

				<!-- 인기상품 출력 -->
				<div class="product-collection-area">
					<div class="toy-product container-fluid p-0">
						<div class="section-title text-center mb-55 section-title-2">
							<h2>인기 상품</h2>
							<p>최근 고객님들께서 구매한 인기 상품들을 모아보았습니다.</p>
						</div>
						<div class="row">
							<c:forEach items="${popItem}" var="popItem">
							<div class="col-md-6 col-lg-4 col-xl-3 col-12">
								<div class="single-product mb-45">
								
									<div class="product-img">
										<a title="Quick View" class="animate-right"  data-toggle="modal" data-target="#exampleModal"
											href="${path }/food_market/product/productDetail?pd_idx=${popItem.pd_idx}">
											<img src="pd_img_upload/${popItem.pd_category}/${popItem.pd_img_name_f}" height="350"></a>
									</div>
									<div class="product-content">
										<div class="product-title-price">
											<div class="product-title">
												<h4 style="overflow: hidden; text-overflow: ellipsis; width: 230px; white-space:nowrap;">
													<a href="${path }/food_market/product/productDetail?pd_idx=${popItem.pd_idx}">${popItem.pd_category}&nbsp;&nbsp;/&nbsp;&nbsp;<b style="font-size: 24px; ">${popItem.pd_name}</b></a>
												</h4>
											</div>
											<div class="product-price">
											<span>
												<b>￦&nbsp;</b>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${popItem.pd_price}" />
												원
												</span>
											</div>
										</div>
										<div class="product-cart-categori">
											<div class="product-cart">
											</div>
											<div class="product-cart">
											</div>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							<div class="col-lg-12">
								<div class="load-more text-center">
									<a class="btn-hover load-more-style"
										href="/food_market/product/productList"><i class="ion-refresh">
										</i>더 많은 상품 보기</a>
								</div>
							</div>
						</div>
					</div>
				</div>	
				<!-- 인기상품 출력 END -->
			</div>
			<!-- 하단 목록 4 END -->
			<!-- footer -->
			<footer class="footer-area pt-100 pb-95 gray-bg-5 toys-footer"
				style="background-image: url(assets/img/bg/1.png)">
				<div class="container-fluid footer-plr">
					<div class="row">
						<div class="col-xl-3 col-lg-5 col-md-5 col-12">
							<div class="footer-widget">
								<div class="footer-widget-l-content">
									<h4>20 Years Experience</h4>
									<ul>
										<li><a href="#"><i class="ion-social-twitter"></i></a></li>
										<li><a href="#"><i class="ion-social-tumblr"></i></a></li>
										<li><a href="#"><i class="ion-social-facebook"></i></a></li>
										<li><a href="#"><i
												class="ion-social-instagram-outline"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-xl-6 col-lg-7 col-md-7 col-12">
							<div class="footer-widget">
								<div class="footer-widget-m-content text-center">
									<div class="footer-logo">
                                        <a href="${path }/food_market/"><img src="pd_img_upload/food market_LOGO.png" alt=""  width="200"></a>
                                    </div>
									<div class="footer-nav">
                                        <nav>
                                            <ul>
                                                <li><a href="/food_market/">home</a></li>
                                                <li><a href="product/productList">전체상품</a></li>
                                                <li><a href="member/orderlist">마이페이지</a></li>
                                                <li><a href="#">고객센터 </a></li>
                                            </ul>
                                        </nav>
                                    </div>
									<p>
										Copyright © <a href="https://hastech.company/">HasTech</a>
										2018 . All Right Reserved.
									</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-lg-12 col-md-12 col-12">
							<div class="footer-widget">
								<div class="footer-widget-r-content f-right">
									<ul>
										<li><span>연락처 :</span> +8210 1234 5678</li>
										<li><span>Email : </span> <a href="#">food_market@gmail.com</a></li>
										<li><span>주소 :</span> 부산광역시 부산진구 동천로 109 삼한골든게이트빌딩 7층 ITWILLBS 1강의장</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</footer>
			<!-- footer -->
		</div>
	</div>
<script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
