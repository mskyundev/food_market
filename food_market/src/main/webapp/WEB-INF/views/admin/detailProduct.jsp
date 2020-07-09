<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<link rel="shortcut icon" type="image⁄x-icon" href="../pd_img_upload/adminLogo.png"><title>관리자 페이지</title>
    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/plugins/icomoon/style.css" rel="stylesheet">
    <link href="assets/plugins/uniform/css/default.css" rel="stylesheet"/>
    <link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet"/>
    <link href="assets/plugins/summernote-master/summernote.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css"/>
  
    <!-- Theme Styles -->
    <link href="assets/css/ecaps.min.css" rel="stylesheet">
    <link href="assets/css/custom.css" rel="stylesheet">

</head>
<body>
<!-- Page Container -->
<div class="page-container">

<!-- Page Sidebar -->
<jsp:include page="leftMenu.jsp"></jsp:include>
<!-- /Page Sidebar -->
    
<!-- Page Content -->
<div class="page-content">            
<!-- Page Header -->
<div class="page-header">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
           <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
           		<!-- 사이드 메뉴 접기 / 펴기  -->
               <ul class="nav navbar-nav">
                   <li><a href="javascript:void(0)" id="collapsed-sidebar-toggle-button"><i class="fa fa-bars"></i></a></li>
               </ul>
           </div><!-- /.navbar-collapse -->
       </div><!-- /.container-fluid -->
    </nav>
</div><!-- /Page Header -->
	
 <!-- Page Inner -->
<div class="page-inner">
	<div class="page-title">
		<h3 class="breadcrumb-header">${pd_name }</h3>
	</div>
		<div id="main-wrapper">
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-md-6"  style="width: 35%;height: 500px;margin-bottom: 10px;">
					<div class="panel panel-white" style="width: 100%;height: 100%;">
						<div class="panel-body" style="text-align: center;">
							<img src="../pd_img_upload/${productVO.pd_category}/${productVO.pd_img_name_f}" style="width: 80%;height:450px;;">
						</div>
					</div>
				</div>
				<div class="col-md-6"style="width: 55%;height: 500px;margin-bottom: 10px;" >
					<div class="panel panel-white" style="width: 100%;height: 100%;">
						<div class="panel-body">
							<table class="display table" style="margin: 20px">
								<tr><th><b>상품 번호</b></th>
									<td>${productVO.pd_idx }</td>
									<th><b>판매자</b></th>
									<td>${productVO.member_mb_id }</td></tr>
								<tr><th><b>상품명</b></th>
									<td>${productVO.pd_name }</td>
									<th><b>카테고리</b></th>
									<td>${productVO.pd_category }</td></tr>
								<tr><th><b>원산지</b></th>
									<td colspan="3">${productVO.pd_origin }</td></tr>
								<tr><th><b>사이즈</b></th>
									<td colspan="3">${productVO.pd_size }</td></tr>
								<tr><th><b>재고</b></th>
									<td colspan="3">${productVO.pd_stock }</td></tr>
								<tr><th><b>등록일</b></th>
									<td colspan="3">${productVO.pd_date }</td></tr>
							</table>
							<!-- 별점 제어하기  -->	
	                   <div class="rating-number" style="margin-top: 50px;text-align: center;">
	                       <div class="quick-view-rating">
							<!-- 평균 값 기준으로 별 주기 -->
							<c:choose>
								<c:when test="${starAVG == null}">
							    <img src="../pd_img_upload/0.jpg" height="20">
							    </c:when>
							    <c:when test="${starAVG <= 2}">
							    <img src="../pd_img_upload/2.jpg" height="20">
							    </c:when>
							     <c:when test="${starAVG >2 && starAVG <= 4}">
								<img src="../pd_img_upload/4.jpg" height="20">
							    </c:when>
							     <c:when test="${starAVG >4 && starAVG <= 6}">
							     <img src="../pd_img_upload/6.jpg" height="20">
							    </c:when>
							     <c:when test="${starAVG >6 && starAVG <= 8}">
							     <img src="../pd_img_upload/8.jpg" height="20">
							    </c:when>
							     <c:when test="${starAVG >8 && starAVG <= 10}">
							     <img src="../pd_img_upload/10.jpg" height="20">
							    </c:when>
							</c:choose>
							<!-- 평균 값 기준으로 별 주기 -->
						</div>
						<div class="quick-view-number">
						<c:choose><c:when test="${starAVG != null }">
							<fmt:formatNumber value="${starAVG }" pattern=".00"/>점&nbsp;&nbsp;&nbsp;
						</c:when><c:otherwise>
							0 점&nbsp;&nbsp;&nbsp;
						</c:otherwise></c:choose>
						<c:choose><c:when test="${reviewCount != null }">
							${reviewCount } 개 상품평
						</c:when><c:otherwise>
							0 개 상품평
						</c:otherwise></c:choose>
	                  </div>
					</div>
				</div>	
				</div>	
			</div>
		</div><!-- Row -->
		
		<div class="row">
			<div class="col-md-12" style="width: 90%">
				<div class="panel panel-white" style="width: 100%;height: 100%;">
					<div class="panel-heading clearfix">
                           <h4 class="panel-title">상품평</h4>
                    </div>
					<div class="panel-body">
						<c:if test="${reviewCount != 0 }">
							<table class="display table">
								<tr><th>별점 평가</th>
									<th>상품번호</th>
									<th>주문번호</th>
									<th>리뷰 글번호</th>
									<th>상품평</th>
									<th>구매자</th>
									<th>작성일</th></tr>
								<c:forEach var="review" items="${reviewList }">
									<tr><td><c:choose>
										<c:when test="${review.pd_re_star == null}">
									    	<img src="../pd_img_upload/0.jpg" height="20">
									    </c:when>
									    <c:when test="${review.pd_re_star <= 2}">
									    	<img src="../pd_img_upload/2.jpg" height="20">
									    </c:when>
									    <c:when test="${review.pd_re_star >2 && review.pd_re_star <= 4}">
											<img src="../pd_img_upload/4.jpg" height="20">
									    </c:when>
									    <c:when test="${review.pd_re_star >4 && review.pd_re_star <= 6}">
									    	<img src="../pd_img_upload/6.jpg" height="20">
									    </c:when>
									    <c:when test="${review.pd_re_star >6 && review.pd_re_star <= 8}">
									    	<img src="../pd_img_upload/8.jpg" height="20">
									    </c:when>
									    <c:when test="${review.pd_re_star >8 && review.pd_re_star <= 10}">
									    	<img src="../pd_img_upload/10.jpg" height="20">
									    </c:when>
									</c:choose></td>
									<td>${review.product_pd_idx}</td>
									<td>${review.order_od_idx}</td>
									<td>${review.pd_re_idx}</td>
									<td>${review.pd_re_subject}</td>
									<td>${review.member_mb_id}</td>
									<td>${review.pd_re_date}</td></tr>
								</c:forEach>
							</table>
							<div style="text-align:center">
	                       <c:if test="${pagingMaker.prev}">
								<a
									href="detailProduct${pagingMaker.makeURI(pagingMaker.startPage-1)}&pd_idx=${productVO.pd_idx }">
									<button type="button" class="btn btn-theme03">◀</button>
								</a>
							</c:if>
							<c:forEach begin="${pagingMaker.startPage}"
								end="${pagingMaker.endPage}" var="pNum">
								<a href="detailProduct${pagingMaker.makeURI(pNum)}&pd_idx=${productVO.pd_idx }">
									<button type="button"
										class="<c:out value="${pagingMaker.cri.page == pNum?'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
								</a>
							</c:forEach>
							<c:if test="${pagingMaker.next&&pagingMaker.endPage > 0}">
								<a
									href="detailProduct${pagingMaker.makeURI(pagingMaker.endPage+1)}&pd_idx=${productVO.pd_idx }">
									<button type="button" class="btn btn-theme03">▶</button>
								</a>
							</c:if>
						</div>
						</c:if>
						<c:if test="${reviewCount == 0 }">
							상품평이 없습니다.
						</c:if>
						
					</div>
				</div>                         
			</div>
		</div>
</div><!-- Main Wrapper -->
</div><!-- /Page Inner -->
</div><!-- /Page Content -->
</div><!-- /Page Container -->


<!-- Javascripts -->
<script src="assets/plugins/jquery/jquery-3.1.0.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/plugins/uniform/js/jquery.uniform.standalone.js"></script>
<script src="assets/plugins/switchery/switchery.min.js"></script>
<script src="assets/plugins/summernote-master/summernote.min.js"></script>
<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
<script src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script src="assets/js/ecaps.min.js"></script>
<script src="assets/js/pages/form-elements.js"></script>
</body>
</html>