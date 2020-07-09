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
        <h3 class="breadcrumb-header">${seller_name}판매자</h3>
    </div>
<div id="main-wrapper">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-white">
            	<a href="sellerList?mb_id=${seller_name}&productOrder=productList"><span class="hover_link" style="font-size: 17px;font-weight: 500;">상품 목록</span></a><span style="font-size: 15px;font-weight: 500;">/</span>
                <a href="sellerList?mb_id=${seller_name}&productOrder=sellList"><span class="hover_link" style="font-size: 17px;font-weight: 500;">판매 내역</span></a>
                
               	<c:if test="${productOrder == null || productOrder == 'productList' }">
               	<br><br>
                <div class="panel-heading clearfix">
                <h4>상품 목록</h4>
                </div>
                <form>
                    <select name="pd_category" id="pd_category">
                    	<option value="" selected="selected">---구분---</option>
					    <option value="과일">과일</option>
					    <option value="채소">채소</option>
					   	<option value="곡식">곡식</option>
					   	<option value="정육">정육</option>
					   	<option value="수산">수산</option>
					</select>
					<input type="hidden" value="${seller_name }" id="mb_id" name="mb_id" >
					<button type="submit">선택</button>
				</form>
                
                <div class="panel-body">
                   <div class="table-responsive">
                    <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                        <thead>
                            <tr>
                            	<th>카테고리</th>
                                <th>No.</th>
                                <th>상품명</th>
                                <th>가격</th>
                                <th>사이즈</th>
                                <th>원산지</th>
                                <th>등록자</th>
                                <th>등록일</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:choose><c:when test="${sellerProductList == null }">
                        		<tr><td rowspan="8">등록 상품이 없습니다.</td></tr>
                        	</c:when>
                        	<c:otherwise>
	                        	<c:forEach items="${sellerProductList}" var="pd">
	                        	<tr><td>${pd.pd_category }</td>
									<td>${pd.pd_idx }</td>
									<td>${pd.pd_name }</td>
									<td>${pd.pd_price }</td>
									<td>${pd.pd_size }</td>
									<td>${pd.pd_origin }</td>
									<td>${pd.member_mb_id }</td>
									<td>${pd.pd_date }</td></tr>
								</c:forEach>
                        	</c:otherwise></c:choose>
                        </tbody>
                       </table>
                       <div style="text-align:center">
	                       <c:if test="${pagingMaker.prev}">
								<a
									href="sellerList${pagingMaker.makeURI(pagingMaker.startPage-1)}&productOrder=productList">
									<button type="button" class="btn btn-theme03">◀</button>
								</a>
							</c:if>
							<c:forEach begin="${pagingMaker.startPage}"
								end="${pagingMaker.endPage}" var="pNum">
								<a href="sellerList${pagingMaker.makeURI(pNum)}&mb_id=${seller_name}&productOrder=productList">
									<button type="button"
										class="<c:out value="${pagingMaker.cri.page == pNum?'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
								</a>
							</c:forEach>
							<c:if test="${pagingMaker.next&&pagingMaker.endPage > 0}">
								<a
									href="sellerList${pagingMaker.makeURI(pagingMaker.endPage+1)}&productOrder=productList">
									<button type="button" class="btn btn-theme03">▶</button>
								</a>
							</c:if>
						</div>
                    </div>
                </div>
                </c:if>
                <c:if test="${productOrder == 'sellList' }">
                <div class="panel-heading clearfix">
                <h4>판매 내역</h4>
                </div>
                <div class="panel-body">
                   <div class="table-responsive">
                    <table id="example" class="display table" style="width: 100%; cellspacing: 0;">
                        <thead>
                            <tr>
                            	<th>상품 번호</th>
                                <th>상품명</th>
                                <th>주문 번호</th>
                                <th>배송지</th>
                                <th>주문자</th>
                                <th>수령인</th>
                                <th>판매금액</th>
                                <th>주문일자</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${sellerOrderList}" var="od"><tr>
                       			<td>${od.pd_idx }</td>
								<td>${od.pd_name }</td>
								<td>${od.od_num }</td>
								<td>${od.od_address } ${od.od_address1 }</td>
								<td>${od.mb_id }</td>
								<td>${od.od_name }</td>
								<td>${od.od_total }</td>
								<td>${od.od_date }</td>
							</tr></c:forEach>
                        </tbody>
                       </table> 
                       <div style="text-align:center">
	                       <c:if test="${pagingMaker.prev}">
								<a
									href="sellerList${pagingMaker.makeURI(pagingMaker.startPage-1)}&productOrder=sellList">
									<button type="button" class="btn btn-theme03">◀</button>
								</a>
							</c:if>
							<c:forEach begin="${pagingMaker.startPage}"
								end="${pagingMaker.endPage}" var="pNum">
								<a href="sellerList${pagingMaker.makeURI(pNum)}&mb_id=${seller_name}&productOrder=sellList">
									<button type="button"
										class="<c:out value="${pagingMaker.cri.page == pNum?'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
								</a>
							</c:forEach>
							<c:if test="${pagingMaker.next&&pagingMaker.endPage > 0}">
								<a
									href="sellerList${pagingMaker.makeURI(pagingMaker.endPage+1)}&productOrder=sellList">
									<button type="button" class="btn btn-theme03">▶</button>
								</a>
							</c:if>
						</div> 
                    </div>
                </div>
                </c:if>
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