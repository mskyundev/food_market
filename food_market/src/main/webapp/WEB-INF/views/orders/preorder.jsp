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
         <script src="https://cdn.bootpay.co.kr/js/bootpay-2.0.12.min.js" type="application/javascript"></script>
    </head>
    <body>
    

 <jsp:include page="../inc/header.jsp"></jsp:include>

            <div class="breadcrumb-area pt-205 pb-210 bg-img" style= "background-image: url(../pd_img_upload/전체상품.jpg)">
                <div class="container">
                    <div class="breadcrumb-content">
                        <h2>주문 페이지</h2>
                        <ul>
                            <li><a href="/food_market/">home</a></li>
                            <li> cart </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="cart-main-area pt-95 pb-100">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <h1 class="cart-heading">Cart</h1>
<!--                             <form action="../orders/payment" method ="post"> -->

		
                                <div class="table-content table-responsive">
<!--                                     <input type="checkbox1" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>  -->
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="product-price">간편이미지</th>
                                                <th class="product-name">상품명</th>
                                                <th class="product-quantity">수량</th>
                                                <th class="product-subtotal">판매가격</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="row" items="${map.list}" varStatus="i">
                                            <tr>
                                                <td class="product-thumbnail">
<!--                                                     <a href="#"><img src="assets/img/cart/1.jpg" alt=""></a> -->
                                                    <img src="../pd_img_upload/${row.pd_category }/${row.pd_img } " alt="${row.pd_img }" width = "200" height = "150">
                                                    <input type="hidden" name="od_pdimg" value="${row.pd_img}">
                                                </td>
                                                <td class="product-name">
                                                <a href="#">
                                                <input type="hidden" id= "od_pdname" name="od_pdname" value="${row.pd_name}">
                                                ${row.pd_name}
                                                
                                                </a>
                                                </td>
                                                <td class="product-price">
                                                <span class="amount">
<%--                                                 <input type="hidden" id="od_amount"name="od_amount" value="${row.amount}"> --%>
<%--                                                 <input type="hidden" name="od_amount" class="od_amount" value="${row.amount }"  --%>
<%--                     								data-amount="${row.amount}"> --%>
                                                ${row.amount}
                                                </span>
                                                </td>
                                                <td class="product-quantity">
                                                <input type="hidden" name="od_pdprice" value="${row.summoney}">
                                                <span>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${row.summoney}" />
												원</span>
<%--                                                     <input type="number"  name="amount" min="1" value="${row.amount }"> --%>
                    			<input type="hidden" name="pd_idx" 
                    			class="pd_idx" value="${row.pd_idx }" 
                    			data-pd_idx="${row.pd_idx}">
                                                </td>
                                            </tr>
                                            </c:forEach>
                                            <tr>
                                                    <td  style="font-size: 30px;"   class="product-quantity" colspan="5">
                                                    주문금액: 
                                                    <span>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${map.preSumMoney }" />
												원</span>
                                                    배송비 :  
                                                    <span>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${map.delivery }" />
												원</span>
                                                    총금액 :  
                                                    <span>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${map.allsum }" />
												원</span>
                                            		<input type="hidden" name="od_total" value="${map.allsum}">
                                            		</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                

                                
                                <div class="table-content table-responsive">
<!--                                     <input type="checkbox1" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>  -->
									<h2>주문자 정보</h2>
                                    <table border="1">
                                        <thead>
                                            <tr>
                                                <th class="product-price">주문자명</th>
                                                <th class="product-name">주소</th>
                                                <th class="product-quantity">휴대전화</th>
                                                <th class="product-subtotal">이메일</th>
                                                
                                             
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="product-thumbnail">
                                                ${mem.mb_name }
                                                </td>
                                                <td class="product-name">
                                                ${mem.mb_address }<br><br>
                                                ${mem.mb_address1 }
                                                </td>
                                                <td class="product-price">
                                                ${mem.mb_mobile }
                                                </td>
                                                <td class="product-quantity">
           										${mem.mb_email }	
                                                </td>
                            						</tr>
                                        </tbody>
                                    </table>
                                </div>
                                
                                <div class="table-content table-responsive">
                                  
									<h2>배송 정보</h2>
                                    <table>
                                        <thead>
                                            <tr>
                                                <td class="product-price">배송지 선택</td>
                                                <td>
                                                <input type="radio" name ="member" value="checkMem"/>주문자 정보와 동일
												<input type="radio" name ="member" value="checknew" />새로운배송지
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="product-thumbnail">
                                               	 받으시는분
                                                </td>
                                                <td class="product-name">
                                                <input type="text" name ="od_name" id = "od_name" class = "checknew" value ="${mem.mb_name }" required="required" />
                                                </td>
                                                </tr>
                                                <tr>
                                                <td class="product-price">
                                                	주소
                                                </td>
                                                <td>
           										<input type="text" name ="od_address" id = "od_address" class = "checknew" value ="${mem.mb_address }" required="required"/><br><br>
           										<input type="text" name ="od_address1" id = "od_address1"class = "checknew" value ="${mem.mb_address1 }" required="required"/>
                                                </td>
                            						</tr>
                            						<tr>
                                                <td class="product-price">
                                                	휴대전화
                                                </td>
                                                <td class="product-quantity" colspan="5">
           										<input type="text" name ="od_mobile" id="od_mobile" class = "checknew" value ="${mem.mb_mobile }" required="required">
                                                </td>
                            						</tr>
                            							<tr>
                                                <td class="product-price">
                                                	배송메세지
                                                </td>
                                                <td class="product-quantity">
           										<textarea rows="3" cols="30" name="od_msg" id = "od_msg" class = "checknew" 
           										placeholder="전달 메시지를 작성 해주세요"></textarea>
                                                </td>
                            						</tr>
                                        </tbody>
                                    </table>
                                </div>
        
                           
                                <div class="table-content table-responsive">
                                  
									<h2>결제 예정금액</h2>
                                    <table>
                                        <thead>
                                            <tr>
                                                <td class="product-price">총 주문 금액</td>
                                                <td class="product-price">
                                                	배송료
												</td>
												<td class="product-price">
                                                	최종 결제 금액
												</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="product-thumbnail">
                                               	 <span>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${map.preSumMoney }" />
												원</span>
                                                </td>
                                                <td class="product-thumbnail">
                                               	 
                                               	 <span>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${map.delivery }" />
												원</span>
                                                </td>
                                                 <td class="product-thumbnail" >
                                                 <input type="hidden" name="od_total" id="od_total" value ="${map.allsum }">
                                                  <span>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${map.allsum }" />
												원</span>
                                               	 
                                                </td>                                                
                                                </tr>                                               
                                        </tbody>
                                    </table>
                                     <input type="button" value="결제하기" class="order_btn" style="width: 150px; float: right;">
                                    <input type="button" value="결제취소" onclick="preorderCancel()"   style="width: 150px; float: right; margin-right: 20px;">
                                </div>
                        </div>
                        
                      </div>
                      
                  </div>
            </div>
            
 <script>
 function preorderCancel() {
	var confirm_pre = confirm("결제 취소하시겠습니까?");
	
	if(confirm_pre){
		location.href = "../orders/preorderDelete";
	}
	
};
 
 
 
 
 $(".order_btn").click(function(){
	 
	  var confirm_val = confirm("선택상품을 주문하시겠습니까?");
	  
	  if(confirm_val) {
		var od_pdname = $("#od_pdname").val();
		var od_name = $("#od_name").val();
		var od_address = $("#od_address").val();
		var od_address1 = $("#od_address1").val();
		var od_mobile = $("#od_mobile").val();
		var od_msg = $("#od_msg").val();
		var od_total = $("#od_total").val();
	   var checkArr = new Array();
	   $("input[class='pd_idx']").each(function(){
		    checkArr.push($(this).attr("data-pd_idx"));
		   });
	    var alldata =
	    	{"od_name" : od_name ,"od_address" : od_address,
	    		"od_address1" : od_address1, "od_mobile" : od_mobile,
	    		"od_msg" : od_msg, "od_total" : od_total , "chbox" : checkArr
	    	}
	   $.ajax({
	    url : "../orders/orderinsert",
	    type : "post",
	    data : alldata,
	    success : function(data){
	     	var url ="../orders/payment?od_total="+od_total + "&od_pdname="+od_pdname;
	 		window.open(
	url , "결제내역", "width=900,height=600,left=300,top=100");
	    },
	    error : function(data){
	        alert("주문 실패" + rsp.error_msg);
	    	location.href="../cart/cart";
	       }
	   });
	  } 
	 });
</script>


<script>
$(document).ready(function(){
	   $('input[name=member]').on('change',function(){
	      if($('input[name=member]:checked').val()=='checkMem'){
// 	         $('#name').val(mem.mb_name);
// 	         $('#address1').val(mem.mb_address1);
// 	         $('#address1').val(mem.mb_address2);
// 	         $('#address1').val(mem.mb_address3);
				location.reload();
	      } else {
	         $('.checknew').val('');
	      }
	      
	   });
	});

</script>
                
			
            <!-- shopping-cart-area end -->
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
