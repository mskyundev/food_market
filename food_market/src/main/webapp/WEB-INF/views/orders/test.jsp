<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="pd_img_upload/food market_LOGO.png"><title>FoodMarket</title>
</head>
<body>

									<select name="od_delivery" id="od_delivery">
										<option value="0">---구분---</option>
										<option value="1" selected="selected">배송준비중</option>
										<option value="2">배송중</option>
										<option value="3">배송완료</option>
									</select>
<%-- 								</c:when><c:when test="${od.od_delivery == '배송중' }"> --%>
<!-- 									<select name="od_delivery" id="od_delivery"> -->
<!-- 										<option value="0">---구분---</option> -->
<!-- 										<option value="1">배송준비중</option> -->
<!-- 										<option value="2" selected="selected">배송중</option> -->
<!-- 										<option value="3">배송완료</option> -->
<!-- 									</select> -->
<%-- 								</c:when><c:wCen test="${od.od_delivery == '배송완료' }"> --%>
<!-- 									<select name="od_delivery" id="od_delivery"> -->
<!-- 										<option value="0">---구분---</option> -->
<!-- 										<option value="1">배송준비중</option> -->
<!-- 										<option value="2">배송중</option> -->
<!-- 										<option value="3" selected="selected">배송완료</option> -->
<!-- 									</select> -->
<input type="button" value="변경" id="btn">

<script>
	 $("#btn").click(function(){
		 var od_delivery;
	      if($('#od_delivery').val()=='2'){
	    	  od_delivery = "배송중";
				
	      } else if ($('#od_delivery').val()=='3'){
	    	  od_delivery = "배송완료";
	      }
	      $.ajax({
	  	    url : "../orders/update",
	  	    type : "post",
	  	    data : od_delivery,
	  	    success : function(data){
	  	     	alert("변경완료");
	  	    },
	  	    error : function(data){
	  	        alert("오류메세지"+rsp.error_msg);
	  	    	location.href="history.back()";
	  	       }
	  	   });
	      
	   });

</script>
<script>
$("#btn").click(function(){
	var od_delivery;
	if($('#od_delivery').val()=='2'){
		  od_delivery = "배송중"; 
    } else if ($('#od_delivery').val()=='3'){
  	  od_delivery = "배송완료";
    }
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
	url , "배송조회", "width=900,height=600,left=300,top=200");
	    },
	    error : function(data){
	        alert("주문 실패" + rsp.error_msg);
	    	location.href="../cart/cart";
	       }
	   });
	  
	 });
	 </script>
</body>
</html>