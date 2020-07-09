<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="pd_img_upload/food market_LOGO.png"><title>FoodMarket</title>
<style type="text/css">
h6{background-color: #ccc;
padding: 10px;}
</style>
<script type="text/javascript">
function deleteCheck() {
	if (confirm("정말로 삭제하시겠습니까?")) {
		return true;
	}else{
		return false;
	}
}
</script>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
<div class="breadcrumb-area pt-205 pb-210" style="background-image: url(../assets/img/cs/cs.jpg)">
    <div class="container">
        <div class="breadcrumb-content">
            <h2 style="color: #333;">Contact Us</h2>
            <ul>
                <li><a href="#" style="color: #555;">home</a></li>
                <li style="color: #333;"> 고객문의 </li>
            </ul>
        </div>
    </div>
</div>
<div class="cart-main-area pt-95 pb-100">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<h2>고객 문의</h2><br>

    <div style="border: 1px solid #ddd; width:1200px; height:550px; padding: 50px;">
    <div class="formgroup">
		<h6 style="font-weight: 600; color: white;">문의항목</h6>
		<c:choose>
        	<c:when test="${read.cs_type eq 0}">
        	배송문의
        	</c:when>
        	<c:when test="${read.cs_type eq 1}">
        	주문결제
        	</c:when>
        	<c:when test="${read.cs_type eq 2}">
        	반품/교환/환불
        	</c:when>
        	<c:when test="${read.cs_type eq 8}">
        	기타
        	</c:when>
        </c:choose>
	</div><br>
	<div class="form-group">
		<h6 style="font-weight: 600; color: white;">제목</h6>
		${read.cs_subject}
	</div>
	<div class="form-group">
	<div style="height: 200px;">
		<h6 style="font-weight: 600; color: white;">내용</h6>
		${read.cs_content}
	</div>
	</div>
	<div class="form-group filed">
		<h6 style="font-weight: 600; color: white;">첨부파일</h6>
		<c:forEach var="row" items="${fileList}">
		<a href='<c:url value="/cs/downloadFile?idx=${row.idx}"/>'>${row.org_filename }</a>
		(${row.file_size}KB)
		</c:forEach>
	</div>
	</div>
	<!-- 고객, 관리자 여부에 따라 수정 삭제 답변 제어 -->
	<div style="text-align: right; margin-top: 20px">
	<c:choose>
	<c:when test="${sessionScope.mb_seller==3}">
	<a href="../admin/csList">목록</a>
	<c:if test="${read.cs_re_lev==1}">
	 | <a href="../cs/update?cs_idx=${read.cs_idx}">수정</a> |
    <a href="../cs/delete?cs_idx=${read.cs_idx}" onclick="return deleteCheck()">삭제</a> 
	</c:if>
	</c:when>
	<c:otherwise>
	<a href="../cs/list">목록</a>
	<c:if test="${read.cs_re_lev==0}"> | 
	<a href="../cs/update?cs_idx=${read.cs_idx}">수정</a> |
    <a href="../cs/delete?cs_idx=${read.cs_idx}" onclick="return deleteCheck()">삭제</a> 
	</c:if>
	</c:otherwise>
	</c:choose>
        <!-- 답글 버튼은 관리자 페이지에서 구현 예정 -->
        <c:if test="${read.cs_re_lev==0&&sessionScope.mb_seller==3}">
         | <a href="../cs/reply?cs_idx=${read.cs_idx}">답변하기</a>
        </c:if>
	</div>
 </div>
 </div>
</div>
</div>
 <jsp:include page="../inc/footer.jsp"/>
</body>
</html>