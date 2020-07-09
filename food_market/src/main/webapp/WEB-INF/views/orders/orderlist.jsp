<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html class="no-js" lang="">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link rel="shortcut icon" type="image⁄x-icon" href="pd_img_upload/food market_LOGO.png"><title>FoodMarket</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- all css here -->
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../assets/css/magnific-popup.css">
        <link rel="stylesheet" href="../assets/css/animate.css">
        <link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="../assets/css/slinky.min.css">
        <link rel="stylesheet" href="../assets/css/meanmenu.min.css">
        <link rel="stylesheet" href="../assets/css/slick.css">
        <link rel="stylesheet" href="../assets/css/ionicons.min.css">
        <link rel="stylesheet" href="../assets/css/bundle.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <link rel="stylesheet" href="../assets/css/responsive.css">
        <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
         
    </head>
    <body>
    

 <jsp:include page="../inc/header.jsp"></jsp:include>

            <div class="breadcrumb-area pt-205 pb-210 bg-img" style= "background-image: url(../pd_img_upload/전체상품.jpg)">
                <div class="container">
                    <div class="breadcrumb-content">
                        <h2>구매 내역</h2>
                        <ul>
                            <li><a href="/food_market/">home</a></li>
                            <li> 구매 내역 </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- shopping-cart-area start -->
            <div class="cart-main-area pt-95 pb-100">
	            <div style="float: left; padding:25px 30px 30px 200px;border-right:1ex solid #E3DEDD;">		
					<ul>
						<c:choose>
							<c:when test="${seller == 1 }">
								<li style="padding-top: 20px;"><a
									href="/food_market/product/productSellerList">내 상품 목록</a></li>
								<li style="padding-top: 20px;"><a
									href="/food_market/member/sellerOrder.do">배송 관리</a></li>
							</c:when>
							<c:otherwise>
								<li style="padding-top: 20px;"><a
									href="/food_market/cart/list">장바구니</a></li>
								<li style="padding-top: 20px;"><a
									href="/food_market/orders/orderlist">구매 내역</a></li>
							</c:otherwise>
						</c:choose>
						<li style="padding-top: 20px;"><a
							href="/food_market/member/info">회원정보 수정</a></li>
						<li style="padding-top: 20px;"><a
							href="/food_market/member/modifyPw">비밀번호 번경</a></li>
						<li style="padding-top: 20px;"><a
							href="/food_market/member/delete">회원 탈퇴</a></li>
					</ul>
				</div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <h1 class="cart-heading">order</h1>


                                <div class="table-content table-responsive">
									<h2>주문내역</h2>
                                    <table border="1">
                                        <thead>
                                            <tr>
                                                <th>주문번호</th>
                                                <th>주문일자</th>
                                                <th>배송상태</th>
                                                <th>결제금액</th>
                                            </tr>
                                        </thead>

<tbody>
								<c:forEach items="${odlist}" var="order" varStatus="i">
                                            <tr>	
                                                <td>
                                                <a href="orderDetailList?od_num=${order.od_num }&od_delivery=${order.od_delivery}">
                                                ${order.od_num }
                                               </a>
                                               </td>
                                                <td>
                                                <a href="orderDetailList?od_num=${order.od_num }&od_delivery=${order.od_delivery}">
                                     	          ${order.od_date}
                                               </a>
                                                </td>
                                                <td >
                                                	${order.od_delivery }
                                                </td>
                                                <td>
                                                <span>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${order.od_total}" />
												원</span>
           												
                                                </td>

                            				</tr>
                            				
                                    </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                        </div>

                      </div>
                  </div>
            </div>

 <jsp:include page="../inc/footer.jsp"></jsp:include>
		
		
		
		
		
		
		
		
		<!-- all js here -->
        <script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
        <script src="assets/js/popper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script src="assets/js/isotope.pkgd.min.js"></script>
        <script src="assets/js/imagesloaded.pkgd.min.js"></script>
        <script src="assets/js/jquery.counterup.min.js"></script>
        <script src="assets/js/waypoints.min.js"></script>
        <script src="assets/js/slinky.min.js"></script>
        <script src="assets/js/ajax-mail.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script type="text/javascript">
            // grab an element
            var myElement = document.querySelector(".intelligent-header");
            // construct an instance of Headroom, passing the element
            var headroom  = new Headroom(myElement);
            // initialise
            headroom.init(); 
        </script>

        <script src="assets/js/main.js"></script>
    </body>
</html>
