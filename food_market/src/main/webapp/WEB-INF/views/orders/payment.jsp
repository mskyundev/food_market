<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="pd_img_upload/food market_LOGO.png"><title>FoodMarket</title>
</head>
<body>

<script>

IMP.init('imp46107716');

IMP.request_pay({
    pg : 'inicis', 
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '${pd_name}....',
    amount : '${num}', 
    buyer_email : 'iamport@siot.do',
    buyer_name : '{od_name}',
    buyer_tel : '{od_name}',
    buyer_addr : '{od_name}',
    buyer_postcode : '{od_name}'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제 이동하러 가기';
        msg += '에러 내용: ' + rsp.error_msg;
        
    } else {
        var msg = "결제완료  주문페이지로 이동합니다";
    }
    alert(msg);
    opener.location.href="../orders/orderlist";
    window.close();
});
</script>

</body>

</html>