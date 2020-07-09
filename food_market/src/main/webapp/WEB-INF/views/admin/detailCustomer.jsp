<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="../pd_img_upload/adminLogo.png"><title>관리자 페이지</title>
<!-- Styles -->
        <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/plugins/icomoon/style.css" rel="stylesheet">
        <link href="assets/plugins/uniform/css/default.css" rel="stylesheet"/>
        <link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet"/>
        <link href="assets/plugins/datatables/css/jquery.datatables.min.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/datatables/css/jquery.datatables_themeroller.css" rel="stylesheet" type="text/css"/>	
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
      
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
        <h3 class="breadcrumb-header">${seller_name} 구매자</h3>
    </div>
<div id="main-wrapper">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-white">
                <div class="panel-heading clearfix">
                <h4>구매 내역</h4>
                </div>
                <div class="panel-body">
                   <div class="table-responsive">
                    <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                        <thead>
                            <tr>
                            	<th>No.</th>
                                <th>주문번호</th>
                                <th>상품 번호</th>
                                <th>배송지</th>
                                <th>수령인 연락처</th>
                                <th>수령인</th>
                                <th>수량</th>
                                <th>가격</th>
                                <th>주문일</th>
                                <th>배송 상태</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${orderList}" var="od"><tr>
                       			<td>${od.od_idx }</td>
								<td>${od.od_num }</td>
								<td>${od.pd_idx }</td>
								<td>${od.od_address } ${od.od_address1 }</td>
								<td>${od.od_mobile }</td>
								<td>${od.od_name }</td>
								<td>${od.amount }</td>
								<td>${od.amount*od.price }</td>
								<td>${od.od_date }</td>
								<td>${od.od_delivery }</td>
							</tr></c:forEach>
                        </tbody>
                       </table>
                       <div style="text-align:center">
	                       <c:if test="${orderPm.prev}">
								<a
									href="productSellerList${orderPm.makeURI(pagingMaker.startPage-1)}">
									<button type="button" class="btn btn-theme03">◀</button>
								</a>
							</c:if>
							<c:forEach begin="${orderPm.startPage}"
								end="${orderPm.endPage}" var="pNum">
								<a href="detailCustomer${orderPm.makeURI(pNum)}&mb_id=${seller_name}">
									<button type="button"
										class="<c:out value="${orderPm.cri.page == pNum?'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
								</a>
							</c:forEach>
							<c:if test="${orderPm.next&&pagingMaker.endPage > 0}">
								<a
									href="productSellerList${orderPm.makeURI(pagingMaker.endPage+1)}">
									<button type="button" class="btn btn-theme03">▶</button>
								</a>
							</c:if>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- Row -->
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-white">
                <div class="panel-heading clearfix">
                	<h4>장바구니</h4>
                </div>
                <div class="panel-body">
                   <div class="table-responsive">
                    <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                        <thead>
                            <tr>
                            	<th>No.</th>
                                <th>상품 번호</th>
                                <th>상품 이름</th>
                                <th>사이즈</th>
                                <th>가격</th>
                                <th>수량</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${cartList}" var="cart"><tr>
                       			<td>${cart.cart_idx }</td>
								<td>${cart.pd_idx }</td>
								<td>${cart.pd_name }</td>
								<td>${cart.pd_size }</td>
								<td>${cart.price }</td>
								<td>${cart.amount }</td>
							</tr></c:forEach>
                        </tbody>
                       </table> 
                       <div style="text-align:center">
	                       <c:if test="${cartPm.prev}">
								<a
									href="productSellerList${cartPm.makeURI(pagingMaker.startPage-1)}">
									<button type="button" class="btn btn-theme03">◀</button>
								</a>
							</c:if>
							<c:forEach begin="${cartPm.startPage}"
								end="${cartPm.endPage}" var="pNum">
								<a href="detailCustomer${cartPm.makeURI(pNum)}&mb_id=${seller_name}">
									<button type="button"
										class="<c:out value="${cartPm.cri.page == pNum?'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
								</a>
							</c:forEach>
							<c:if test="${cartPm.next&&pagingMaker.endPage > 0}">
								<a
									href="productSellerList${cartPm.makeURI(pagingMaker.endPage+1)}">
									<button type="button" class="btn btn-theme03">▶</button>
								</a>
							</c:if>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- Row -->
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
    <script src="assets/plugins/d3/d3.min.js"></script>
    <script src="assets/plugins/nvd3/nv.d3.min.js"></script>
    <script src="assets/plugins/flot/jquery.flot.min.js"></script>
    <script src="assets/plugins/flot/jquery.flot.time.min.js"></script>
    <script src="assets/plugins/flot/jquery.flot.symbol.min.js"></script>
    <script src="assets/plugins/flot/jquery.flot.resize.min.js"></script>
    <script src="assets/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="assets/plugins/flot/jquery.flot.pie.min.js"></script>
    <script src="assets/plugins/chartjs/chart.min.js"></script>
    <script src="assets/js/ecaps.min.js"></script>
    <script src="assets/js/pages/dashboard.js"></script>
</body>
</html>