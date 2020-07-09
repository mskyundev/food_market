<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="shortcut icon" type="image⁄x-icon" href="pd_img_upload/food market_LOGO.png"><title>FoodMarket</title>
<script src="../assets/js/vendor/jquery-1.12.0.min.js"></script>
<script src="../assets/js/main.js"></script>
<script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
<script type="text/javascript">
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
                <li style="color: #333;"> FAQ </li>
            </ul>
        </div>
    </div>
</div>
<div class="cart-main-area pt-95 pb-100">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <h1 class="cart-heading">자주 묻는 질문</h1>
                            <div class="sidebar-search">
    <form action="" method="get">
 	<input type="text" name="keyword" id="keyword" placeholder="자주 묻는 질문 검색">
<!--  	<input type="submit" class="ion-ios-search-strong"> -->
<button>
<i class="ion-ios-search-strong" id="searchAsk"></i>
</button>
<script type="text/javascript">
					      	$(document).ready(function() {
					      		$('#searchAsk').on("click", function(e){
					      			self.location ="cs/ask&keyword="+$("#keyword").val();
					      		});
					      	});
					      </script>
    </form>
    </div>
    <div class="menu-center" style="height: 80px;">
    <div class="main-menu">
    <nav>
    	<ul>
    		<li><a href="/food_market/cs/ask">전체보기</a></li>
    		<li><a href="/food_market/cs/ask?type=0">배송문의</a></li>
    		<li><a href="/food_market/cs/ask?type=1">주문결제</a></li>
    		<li><a href="/food_market/cs/ask?type=2">반품/교환/환불</a></li>
    		<li><a href="/food_market/cs/ask?type=3">회원서비스</a></li>
    		<li><a href="/food_market/cs/ask?type=8">기타</a></li>
    	</ul>
    </nav>
    </div>
    </div>
    </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="coupon-accordion">
                <!-- ACCORDION START -->
                <c:forEach items="${askList}" var="ask" varStatus="status">
                <h3>
                <c:choose>
                    	<c:when test="${ask.ask_type eq 0}">[배송문의]</c:when>
                    	<c:when test="${ask.ask_type eq 1}">[주문결제]</c:when>
                    	<c:when test="${ask.ask_type eq 2}">[반품/교환/환불]</c:when>
                    	<c:when test="${ask.ask_type eq 3}">[회원서비스]</c:when>
                    	<c:when test="${ask.ask_type eq 8}">[기타]</c:when>
                    </c:choose>
                <span id="showlogin${status.count}">${ask.ask_subject}</span></h3>                
                
                <div id="checkoutlogin${status.count}" class="coupon-content">
                    <div class="coupon-info">
                        <p class="coupon-text">${ask.ask_content}</p>
                    </div>
                </div>
                </c:forEach>
                <!-- ACCORDION END -->						
            </div>
        </div>
    </div>
 <div class="row">
        <div class="col-md-12">
            <div class="pagination-style text-center">
                <ul>
                	<!-- 검색시, 카테고리 지정시, 전체 보기 시 각각 따로 페이징 처리 -->
                	<c:choose>
                		<c:when test="${param.type != null}">
                			<c:if test="${pageMaker.prev }">
								<li>
								<a href='<c:url value="/cs/ask?type=${param.type}&page=${pageMaker.startPage-1 }"/>'><i class="ion-chevron-left"></i></a>
								</li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						    <li>
						        <a href='<c:url value="/cs/ask?type=${param.type}&page=${pageNum }"/>'><i>${pageNum }</i></a>
						    </li>
						    </c:forEach>
						    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
						    <li>
						        <a href='<c:url value="/cs/ask?type=${param.type}&page=${pageMaker.endPage+1 }"/>'><i class="ion-chevron-right"></i></a>
						    </li>
						    </c:if>
                		</c:when>
                		<c:when test="${param.keyword != null}">
                			<c:if test="${pageMaker.prev }">
								<li>
								<a href='<c:url value="/cs/ask?keyword=${param.keyword}&page=${pageMaker.startPage-1 }"/>'><i class="ion-chevron-left"></i></a>
								</li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						    <li>
						        <a href='<c:url value="/cs/ask?keyword=${param.keyword}&page=${pageNum }"/>'><i>${pageNum }</i></a>
						    </li>
						    </c:forEach>
						    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
						    <li>
						        <a href='<c:url value="/cs/ask?keyword=${param.keyword}&page=${pageMaker.endPage+1 }"/>'><i class="ion-chevron-right"></i></a>
						    </li>
						    </c:if>
                		</c:when>
                		<c:otherwise>
							<c:if test="${pageMaker.prev }">
								<li>
								<a href='<c:url value="/cs/ask?page=${pageMaker.startPage-1 }"/>'><i class="ion-chevron-left"></i></a>
								</li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						    <li>
						        <a href='<c:url value="/cs/ask?page=${pageNum }"/>'><i>${pageNum }</i></a>
						    </li>
						    </c:forEach>
						    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
						    <li>
						        <a href='<c:url value="/cs/ask?page=${pageMaker.endPage+1 }"/>'><i class="ion-chevron-right"></i></a>
						    </li>
						    </c:if>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
        </div>
    </div>
 </div>
 </div>
 <jsp:include page="../inc/footer.jsp"/>
</body>
</html>