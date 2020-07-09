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
        <h3 class="breadcrumb-header">회원 리스트 </h3>
    </div>
<div id="main-wrapper">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-white">
                <div class="panel-heading clearfix">
                	<form>
                    <select name="mb_seller" id="mb_seller" >
                    	<c:choose><c:when test="${mb_seller ==1 }">
	                    	<option value="0">---구분---</option>
						    <option value="1"selected="selected">Seller</option>
						    <option value="2">Customer</option>
                    	</c:when>
                    	<c:when test="${mb_seller ==2 }">
	                    	<option value="0">---구분---</option>
						    <option value="1">Seller</option>
						    <option value="2" selected="selected">Customer</option>
                    	</c:when><c:otherwise>
	                    	<option value="0" selected="selected">---구분---</option>
						    <option value="1">Seller</option>
						    <option value="2">Customer</option>
                    	</c:otherwise></c:choose>
					</select>
					<button type="submit">선택</button>
					</form>
                </div>
                <div class="panel-body">
                   <div class="table-responsive">
                    <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Name</th>
                                <th>ID</th>
                                <th>E-mail</th>
                                <th>전화번호</th>
                                <th>우편번호</th>
                                <th>주소</th>
                                <th>생년월일</th>
                                <th>판매자</th>
                                <th>가입일</th>
                                <th>정보 수정일</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${list}" var="mem">
                        		<c:choose><c:when test="${mem.mb_seller == 1 }">
                        			<tr onclick="location.href='/food_market/admin/sellerList?mb_id=${mem.mb_id}&productOrder=productList'"class="hover_link">
								 	<td>${mem.mb_idx }</td>
									<td>${mem.mb_name }</td>
									<td>${mem.mb_id }</td>
									<td>${mem.mb_email }</td>
									<td>${mem.mb_mobile }</td>
									<td>${mem.mb_postcode }</td>
									<td>${mem.mb_address } ${mem.mb_address1 }</td>
									<td>${mem.mb_birth }</td>
									<td><c:choose>
									<c:when test="${mem.mb_seller == 1 }">판매자</c:when>
									<c:otherwise>구매자</c:otherwise></c:choose></td>
									<td>${mem.mb_date }</td>
									<td>${mem.mb_rdate }</td></tr>
                        		</c:when>
                        		<c:otherwise>
                        			<tr onclick="location.href='/food_market/admin/detailCustomer?mb_id=${mem.mb_id}'"class="hover_link">
								 	<td>${mem.mb_idx }</td>
									<td>${mem.mb_name }</td>
									<td>${mem.mb_id }</td>
									<td>${mem.mb_email }</td>
									<td>${mem.mb_mobile }</td>
									<td>${mem.mb_postcode }</td>
									<td>${mem.mb_address } ${mem.mb_address1 }</td>
									<td>${mem.mb_birth }</td>
									<td><c:choose>
									<c:when test="${mem.mb_seller == 1 }">판매자</c:when>
									<c:otherwise>구매자</c:otherwise></c:choose></td>
									<td>${mem.mb_date }</td>
									<td>${mem.mb_rdate }</td></tr>
                        		</c:otherwise></c:choose> 
							</c:forEach>	
                        </tbody>
                       </table>
                       <div style="text-align:center"> 
	                       <c:if test="${pagingMaker.prev}">
								<a href="memberList${pagingMaker.makeURI(pagingMaker.startPage-1)}&mb_seller=${mb_seller}">
									<button type="button" class="btn btn-theme03">◀</button>
								</a>
							</c:if>
							<c:forEach begin="${pagingMaker.startPage}"
								end="${pagingMaker.endPage}" var="pNum">
								<a href="memberList${pagingMaker.makeURI(pNum)}&mb_seller=${mb_seller}">
									<button type="button"
										class="<c:out value="${pagingMaker.cri.page == pNum?'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
								</a>
							</c:forEach>
							<c:if test="${pagingMaker.next&&pagingMaker.endPage > 0}">
								<a
									href="memberList${pagingMaker.makeURI(pagingMaker.endPage+1)}&mb_seller=${mb_seller}">
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