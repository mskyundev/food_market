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
                        <h2>주문 page</h2>
                        <ul>
                            <li><a href="/food_market/">home</a></li>
                            <li> 주문내역 </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- shopping-cart-area start -->
            <div class="cart-main-area pt-95 pb-100">
            
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <h1 class="cart-heading">order</h1>


                                <div class="table-content table-responsive">
									<h2>주문내역</h2>
                                    <table border="1">
                                        <thead>
                                            <tr>
                                                <th>주문상품</th>
                                                <th>상품명</th>
                                                <th>상품금액</th>
                                                <th>수량</th>
                                                <th>주문금액</th>
                                                <th>리뷰 쓰러가기</th>
                                             
                                            </tr>
                                        </thead>

<tbody>
								<c:forEach items="${detail}" var="dl" varStatus="i">
                                            <tr>	
                                                <td>

                                                <a
											href="../product/productDetail?pd_idx=${dl.pd_idx }">

                                        <img src="../pd_img_upload/${dl.pd_category }/${dl.pd_img }" width = "200" height = "150">
                                               </a>
                                                </td>
                                                <td>
                                                <a
											href="../product/productDetail?pd_idx=${dl.pd_idx }">
                                               ${dl.pd_name}
                                               </a>
                                               <input type="hidden" name="pd_idx" 
                                               class="pd_idx" value="${dl.pd_idx }" 
                                               data-pd_idx="${dl.pd_idx}">
                                               
                                                </td>
                                                <td>
           											
           											<span>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${dl.price}" />
												원</span>
                                                </td>
                                                <td>
           											${dl.amount}	
                                                </td>
                                                <td>
           												
           											<span>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${dl.summoney}" />
												원</span>
                                                </td>
                                              	<td>
    		<input type="button" class="btnc" value="해당주문상품문의하러가기" 
    		onclick="location.href='../cs/odWrite?od_num=${od_num }&pd_idx=${dl.pd_idx }'" 
    		style="width: 300px; margin-bottom: 30px;">
    		
    		<input type="button" class="btnc" value="리뷰쓰러가기" 
    		onclick="location.href='../product/productReviewWrite?pd_idx=${dl.pd_idx }&od_idx=${dl.od_idx }'" 
    		style="width: 350px;">

                                    		</td>
                                    		</tr>
                                    </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <input type="hidden" name="od_num" id="od_num" value ="${od_num }">
                                 
			            <input type="button" value="주문목록" 
			            onclick="location.href='../orders/orderlist'" 
			            style="width: 80px; float: right;">
<c:choose>
    <c:when test="${od_delivery eq '배송준비중'}">
			            
			            <input type="button" value="주문취소" 
			            class="cancelbtn" 
			            style="margin-right:10px;  width: 80px; float: right;">
    </c:when>
   </c:choose>
                        </div>
                        
                      </div>
                  </div>
            </div>

 <jsp:include page="../inc/footer.jsp"></jsp:include>
 <script>
 $(".cancelbtn").click(function(){
	 
	  var confirm_val = confirm("선택하신 주문을 취소 하시겠습니까?");
	  
	  if(confirm_val) {
		  var od_num = $("#od_num").val();
	   var checkArr = new Array();
	   $("input[class='pd_idx']").each(function(){
		    checkArr.push($(this).attr("data-pd_idx"));
		   });
	    var alldata =
	    	{"chbox" : checkArr , "od_num" : od_num}
	   $.ajax({
	    url : "../orders/orderCancel",
	    type : "post",
	    data : alldata,
	    success : function(data){
	     	alert("주문 취소 완료");
	     	location.href="../orders/orderlist";
	    },
	    error : function(data){
	        alert("주문 실패" + rsp.error_msg);
	       }
	   });
	  } 
	 });
</script>
		
		
		
		
		
		
		
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
