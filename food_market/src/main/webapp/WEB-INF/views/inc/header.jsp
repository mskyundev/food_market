<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html class="no-js" lang="zxx">
    <head>
    <style type="text/css">
   div.radio-wrap {
  display: inline-flex !important;
  align-items: center  !important;
}

input[type='radio'],
input[type='radio']:checked {
  appearance: none  !important;
  width: 0.9rem  !important;
  height: 0.9rem  !important;
  border-radius: 100%  !important;
  margin-right: 0.1rem  !important;
}
   </style>
    <script src="../assets/js/jquery-1.12.4"></script>
    <script src="../assets/js/vendor/jquery-1.12.0.min.js"></script>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link rel="shortcut icon" type="image⁄x-icon" href="../pd_img_upload/food market_LOGO.png"><title>FoodMarket</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="${path }/food_market/">
		
		<!-- all css here -->
		
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../assets/css/magnific-popup.css">
        <link rel="stylesheet" href="../assets/css/animate.css">
        <link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="../assets/css/slinky.min.css">
        <link rel="stylesheet" href="../assets/css/meanmenu.min.css">
        <link rel="stylesheet" href="../assets/css/jquery-ui.css">
        <link rel="stylesheet" href="../assets/css/slick.css">
        <link rel="stylesheet" href="../assets/css/ionicons.min.css">
        <link rel="stylesheet" href="../assets/css/bundle.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <link rel="stylesheet" href="../assets/css/responsive.css">
        <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <header class="pl-155 pr-155 intelligent-header">
                <div class="header-area header-area-2">
                    <div class="container-fluid p-0">
                        <div class="row no-gutters">
                            <div class="col-lg-3 col-md-6 col-6">
                                <div class="logo">
                                    <a href="${path }/food_market/"><img src="../pd_img_upload/food market_LOGO.png"  width="200" alt="" /></a>
                                </div>
                            </div>
                            <div class="col-lg-6 menu-none-block menu-center">
                                <div class="main-menu">
                                    <nav>
                                       <ul>
                                            <li><a href="/food_market">home</a></li>
                                            <li><a href="${path }/food_market/product/productList">상품</a>
                                          		<ul class="dropdown">
                                          			<li><a href="${path }/food_market/product/productList">전체 상품</a></li>
                                                    <li><a href="${path }/food_market/product/productList?findType=과일">과일</a></li>
                                                    <li><a href="${path }/food_market/product/productList?findType=채소">채소</a></li>
                                                    <li><a href="${path }/food_market/product/productList?findType=곡식">곡식</a></li>
                                                    <li><a href="${path }/food_market/product/productList?findType=정육">정육</a></li>
                                                    <li><a href="${path }/food_market/product/productList?findType=수산">수산</a></li>
                                                </ul>
                                            </li>
                                            <c:choose>
											<c:when test="${sessionScope.mb_seller == '1' }"> <!-- 판매자 -->
											<li><a href="${path }/food_market/product/productSellerList">마이페이지</a>
													<ul class="dropdown">
														<li><a href="${path }/food_market/product/productSellerList">판매자 페이지</a></li>
														<li><a href="${path }/food_market/product/productWrite">상품 등록</a></li>
														<li><a href="${path }/food_market/member/sellerOrder">배송 관리</a></li>
														<li><a href="${path }/food_market/member/info">회원정보 수정</a></li>
														<li><a href="${path }/food_market/member/modifyPw">비밀번호 변경</a></li>
													</ul>
												</li>
											</c:when>
											<c:when test="${sessionScope.mb_seller == '2' }"> <!-- 구매자 -->
											<li><a href="${path }/food_market/member/myPage">마이페이지</a>
													<ul class="dropdown">
														<li><a href="${path }/food_market/cart/list">장바구니</a></li>
														<li><a href="${path }/food_market/orders/orderlist">구매내역</a></li>
														<li><a href="${path }/food_market/member/myPage">회원정보 수정</a></li>
														<li><a href="${path }/food_market/member/modifyPw">비밀번호 변경</a></li>
														<li><a href="${path }/food_market/product/productWishListMember">위시리스트</a></li>
													</ul>
											</li>
											</c:when>
											<c:when test="${sessionScope.mb_seller == '3' }"> <!-- 관리자 -->
											<li><a href="${path }/food_market/admin/index">관리자페이지</a></li>
											</c:when>
											<c:otherwise>
												
											</c:otherwise>
										</c:choose>
                                            <li><a href="/food_market/cs/list">고객센터</a>
                                                <ul class="dropdown">
                                                    <li><a href="/food_market/cs/ask">자주찾는질문 </a></li>
                                                    <li>
                                                    <c:choose>
                                                    	<c:when test="${sessionScope.mb_id == null}">
                                                    	<a href="${path }/food_market/member/login">고객문의</a>
                                                    	</c:when>
	                                                	<c:otherwise>
	                                                    <a href="/food_market/cs/list">고객문의</a>
	                                                	</c:otherwise>
                                                    </c:choose>
                                                    </li>
                                                </ul>
                                            </li>                                            
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-6">
                                <div class="header-search-cart">
<!--                                     <div class="header-search common-style"> -->
<!--                                         <button class="sidebar-trigger-search"> -->
<!--                                             <span class="ion-ios-search-strong"></span> -->
<!--                                         </button> -->
<!--                                     </div> -->
<!--                                     <div class="header-cart common-style"> -->
<!--                                         <button class="sidebar-trigger"> -->
<!--                                             <span class="ion-bag"></span> -->
<!--                                         </button> -->
<!--                                     </div> -->
                                    <div class="header-sidebar common-style">
                                    <c:choose>
	                                    <c:when test="${sessionScope.mb_seller != null}">
	                                    	<b>${sessionScope.mb_id }</b>님 |
	                                    	<a href="${path }/food_market/member/logout">로그아웃</a>
	                                    </c:when>
	                                    <c:otherwise>
	                                  		<a href="${path }/food_market/member/login">로그인</a>|
	                                  		<a href="${path }/food_market/member/contract">회원가입</a>
	                                    </c:otherwise>
                                    </c:choose>
<!--                                         <button class="header-navbar-active"> -->
<!--                                             <span class="ion-navicon"></span> -->
<!--                                         </button> -->
                                    </div>
                                </div>
                            </div>
							
                        </div>
                    </div>
                </div>
            </header>
            </div>
            <div class="header-space"></div>
            <!-- header end -->