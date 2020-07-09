<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="../pd_img_upload/food market_LOGO.png"><title>FoodMarket</title>e>
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
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("[id^=btn]").click(function(){
		var id = $(this).attr("id");
		var num = id.replace("btn", ""); 
		var od_del = "배송준비중";
		var result = $('#od_delivery'+num).val();
		var id_od_num = $('#od_num'+num).val();
		
		if (result==2) {
			od_del="배송중";
		}else if (result==3) {
			od_del="배송완료";
		}
		
		$.ajax({
			url:"delivery",
			type:'POST',
			data:{od_delivery:od_del,
					od_num:id_od_num},
			success:function(data){
				location.reload();
			}
		});
	});
});
</script>
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
					<h2>배송 관리</h2>
					<ul>
						<li><a href="/food_market">home</a></li>
						<li>배송 관리</li>
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
								href="/food_market/member/sellerOrder">배송 관리</a></li>
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
					<div style="margin-left: 50px;">
						<table id="example" class="display table" style="width: 100%; cellspacing: 0;text-align: center;">
                        <thead>
                            <tr><th>No.</th>
                                <th>상품명</th>
                                <th>주문 번호</th>
                                <th>배송지</th>
                                <th>주문자</th>
                                <th>수령인</th>
                                <th>판매금액</th>
                                <th>주문일자</th>
                                <th>배송 상태</th>
                                <th colspan="2">배송</th></tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${orderList}" var="od" varStatus="i"><tr>
                        		<td>${size-i.index}</td>
								<td>${od.pd_name }</td>
								<td>${od.od_num }</td>
								<td>${od.od_address } ${od.od_address1 }</td>
								<td>${od.mb_id }</td>
								<td>${od.od_name }</td>
								<td>${od.od_total }</td>
								<td>${od.od_date }</td>
								<td>${od.od_delivery }</td>
								<c:choose><c:when test="${od.od_delivery == '배송준비중' }">
									<td><select name="od_delivery" id="od_delivery${i.index }" style="width: 100px;">
										<option value="0">---구분---</option>
										<option value="1" selected="selected">배송준비중</option>
										<option value="2">배송중</option>
										<option value="3">배송완료</option>
									</select></td>
								</c:when><c:when test="${od.od_delivery == '배송중' }">
									<td><select name="od_delivery" id="od_delivery${i.index }">
										<option value="0">---구분---</option>
										<option value="1">배송준비중</option>
										<option value="2" selected="selected">배송중</option>
										<option value="3">배송완료</option>
									</select></td>
								</c:when><c:when test="${od.od_delivery == '배송완료' }">
									<td><select name="od_delivery" id="od_delivery${i.index }">
										<option value="0">---구분---</option>
										<option value="1">배송준비중</option>
										<option value="2">배송중</option>
										<option value="3" selected="selected">배송완료</option>
									</select></td>
								</c:when></c:choose>
								<td><input type="button" id="btn${i.index }" value="변경">
									<input type="hidden" id="od_num${i.index }" value="${od.od_num }"></td>
							</tr></c:forEach>
                        </tbody>
	                    </table>
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
		var headroom = new Headroom(myElement);
		// initialise
		headroom.init();
	</script>
	<script src="assets/js/main.js"></script>
</body>
</html>