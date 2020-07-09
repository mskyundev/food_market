<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="pd_img_upload/food market_LOGO.png"><title>FoodMarket</title>
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
	<h2>고객문의</h2><br>
	${sessionScope.mb_id} 님의 고객문의 입니다.<br><br>
	<div class="table-content table-responsive">
	    <table>
        <thead>
            <tr>
                <th width="262px">카테고리</th>
                <th width="700px">제목</th>
                <th width="200px">작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${csList}" var="cs">
                <tr>
                    <td style="padding: 10px 10px;">
                    <c:choose>
                    	<c:when test="${cs.cs_type eq 0}">
                    	배송문의
                    	</c:when>
                    	<c:when test="${cs.cs_type eq 1}">
                    	주문결제
                    	</c:when>
                    	<c:when test="${cs.cs_type eq 2}">
                    	반품/교환/환불
                    	</c:when>
                    	<c:when test="${cs.cs_type eq 8}">
                    	기타
                    	</c:when>
                    </c:choose>
                    </td>
                    <td style="padding: 10px 10px;"><a href="../cs/view?cs_idx=${cs.cs_idx}">${cs.cs_subject}</a></td>
                    <td style="padding: 10px 10px;"><fmt:formatDate value="${cs.cs_date}" pattern="yyyy-MM-dd"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="pagination-style text-center">
                <ul>
					<c:if test="${pageMaker.prev }">
						<li>
						<a href='<c:url value="/cs/list?page=${pageMaker.startPage-1 }"/>'><i class="ion-chevron-left"></i></a>
						</li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
				    <li>
				        <a href='<c:url value="/cs/list?page=${pageNum }"/>'><i>${pageNum }</i></a>
				    </li>
				    </c:forEach>
				    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
				    <li>
				        <a href='<c:url value="/cs/list?page=${pageMaker.endPage+1 }"/>'><i class="ion-chevron-right"></i></a>
				    </li>
				    </c:if>
                </ul>
            </div>
        </div>
    </div>
    <div style="text-align: right;">
    <a href="../cs/write">글쓰기</a>
    </div>
 </div>
 </div>
 </div>
</div>
 <jsp:include page="../inc/footer.jsp"/>
</body>
</html>