<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="../pd_img_upload/food market_LOGO.png"><title>FoodMarket</title>
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
</head>

<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
<div class="wrapper">
<!-- header -->
<jsp:include page="../inc/header.jsp"></jsp:include>
<!-- header -->
<div class="header-space"></div>
<div class="container" style="margin-top: 50px;">
    <div class="breadcrumb-content">
        <h2>회원 탈퇴</h2>
        <ul>
            <li><a href="/food_market">home</a></li>
            <li><a href="/food_market/member/info">Info</a></li>
            <li> 회원 탈퇴 </li>
        </ul>

    </div>
</div>
<!-- login-area start -->
<div class="register-area ptb-100">
	<div style="float: left; padding:25px 30px 30px 200px;border-right:1ex solid #E3DEDD;height:100%;">
				
				<ul>
					<c:choose>
						<c:when test="${seller == 1 }">
							<li style="padding-top: 20px;"><a
								href="/food_market/product/productSellerList">내 상품 목록</a></li>
							<li style="padding-top: 20px;"><a
								href="/food_market/member/sellerOrder">주문 내역</a></li>
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
            <div class="col-md-12 col-12 col-lg-6 col-xl-6 ml-auto mr-auto">
                <div class="login">
                    <div class="login-form-container">
                        <div class="login-form">
                            <form method="post" id="login">
                                <label>아이디</label><input type="text" name="mb_id" value="${sessionScope.mb_id }" readonly style="background-color: #e2e2e2; font-size:16px; font-weight:bold;">
                                <label>비밀번호</label><input type="password" name="mb_pw">
                                <div class="button-box">
                                    
                                    <input type="submit" value="탈퇴">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- login-area end -->
<!-- footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>
<!-- footer -->
</div>









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