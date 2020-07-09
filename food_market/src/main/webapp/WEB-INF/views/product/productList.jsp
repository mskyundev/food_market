<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../inc/header.jsp"></jsp:include>
<!doctype html>

<div class="breadcrumb-area pt-205 pb-210 bg-img" 
style="background-image: 
<c:set var="findType" value="${fCri.findType }" />
				<c:choose>
				    <c:when test="${findType == null || findType == ''}">
				  	url(../pd_img_upload/전체상품.jpg)
				    </c:when>
				    <c:when test="${findType != null}">
				    url(../pd_img_upload/${findType}.jpg)
				    </c:when>
				</c:choose>

">

	<div class="container">
		<div class="breadcrumb-content">
			<h2 style="color: white;">shop</h2>
			<ul>
				<li><a href="#" style="color: white;">home</a></li>
				<c:set var="findType" value="${fCri.findType }" />
				<c:choose>
				    <c:when test="${findType == null || findType == ''}">
				     <li style="color: white;">전체상품</li>
				    </c:when>
				    <c:when test="${findType != ''}">
				     <li style="color: white;">${fCri.findType }</li>
				    </c:when>
				</c:choose>
			</ul>
		</div>
	</div>
</div>

<div class="shop-page-wrapper hidden-items padding-filter">
	<div class="container-fluid">
		<div class="shop-filters-left">
			<div class="shop-sidebar">
				<div class="sidebar-widget mb-50">
					<h3 class="sidebar-title">전체 상품 검색하기 <br> Search Products</h3>
					<div class="sidebar-search">
						<form action="#">
							<c:if test="${findType != null}">
							<input type="hidden" name="findType" id="findType" value="${fCri.findType }">
							</c:if>
							
							<input placeholder="Search Products..." type="text" name="keyword" id="keyword" value="${fCri.keyword }">
							<button>
								<i class="ion-ios-search-strong" id="productFind"></i>
							</button>
							
						</form>
							<script type="text/javascript">
							
					      	$(document).ready(function() {
					      		$('#productFind').on("click", function(e){
					      			
					      			var findType = $("#findType").val();
					      			var keyword = $("#keyword").val();
					      			
						      			self.location ="productList"+"${pagingMaker.makeURI(1)}"
	 					      				+"&findType="+findType
						      				+"&keyword="+keyword
					      		});
					      	});
					      </script>
					</div>
				</div>
				<div class="sidebar-widget mb-40">
					<!--                                 <h3 class="sidebar-title">Filter by Price</h3> -->
					<!--                                 <div class="price_filter"> -->
					<!--                                     <div id="slider-range"></div> -->
					<!--                                     <div class="price_slider_amount"> -->
					<!--                                         <div class="label-input"> -->
					<!--                                             <label>price : </label> -->
					<!--                                             <input type="text" id="amount" name="price"  placeholder="Add Your Price" /> -->
					<!--                                         </div> -->
					<!--                                         <button type="button">Filter</button>  -->
					<!--                                     </div> -->
					<!--                                 </div> -->
				</div>
				<div class="sidebar-widget mb-45">
					<h3 class="sidebar-title">결과 내 카테고리 재검색</h3>
					<div class="sidebar-categories">
						<ul>
							<li id="findType과일" class="btn-hover">과일</li>
							<li id="findType채소" class="btn-hover">채소</li>
							<li id="findType곡식" class="btn-hover">곡식</li>
							<li id="findType정육" class="btn-hover">정육</li>
							<li id="findType수산" class="btn-hover">수산</li>
						</ul>
						<script type="text/javascript">
					      	$(document).ready(function() {
					      			$("[id^=findType]").click(function(){
					      				
					      				var id = $(this).attr("id");
					      				var findType = id.replace("findType", ""); 
					      				
					      				self.location ="productList"+"${pagingMaker.makeURI(1)}"
					      				+"&findType="+findType
					      				+"&keyword="+$("#keyword").val();
					      			})
					      	});
					      </script>
					</div>
				</div>
				<div class="sidebar-widget sidebar-overflow mb-45">
				</div>
				<div class="sidebar-widget mb-40">
				</div>
			<!-- 추천상품 -->
				<div class="sidebar-widget mb-50">
				</div>
			
				<!-- 추천상품 -->
			</div>
		</div>
		<div class="shop-filters-right">
			<div class="shop-bar-area pb-60">
				<div class="shop-bar">
					<div class="shop-found-selector">
					</div>
					<div class="shop-filter-tab">
						<div class="shop-filter">
							<c:if test="${!empty list}"> 
							<a class="shop-filter-active" href="#">Search  <i
								class="ion-android-options"></i></a>
							</c:if>
						</div>
						<div class="shop-tab nav" role=tablist>
						</div>
					</div>
				</div>
			</div>


			<div class="shop-product-content tab-content">
				<div id="grid-5-col1" class="tab-pane fade active show">
					<div class="row custom-row">


						<c:if test="${empty list}"> 
						<script type="text/javascript">
						alert("관련 상품이 없습니다. ");
						history.back();
// 						location.href="${path }/food_market/product/productList";
						</script>
						</c:if>
						
						<c:forEach items="${list}" var="productvo">
							<!-- foreach문 돌리기 -->
							<div class="custom-col-5 custom-col-style">
								<div class="single-product mb-35">
									<div class="product-img">
										<a
											href="productDetail${pagingMaker.makeFind(pagingMaker.cri.page)}&pd_idx=${productvo.pd_idx }">
											<img src="../pd_img_upload/${productvo.pd_category }/${productvo.pd_img_name_f }"	alt="${productvo.pd_name }" height="350"></a>
									</div>
									<div class="product-content">
										<div class="product-title-price">
											<div class="product-title">
												<h4 style="overflow: hidden; text-overflow: ellipsis; width: 200px; white-space:nowrap;">${productvo.pd_name }</h4>
											</div>
											<div class="product-price">
												<span>
												<b>￦&nbsp;</b>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${productvo.pd_price}" />
												원</span>
											</div>
										</div>
										
										<div class="product-cart-categori">
											<div class="product-cart">
											
												<c:if test="${productvo.pd_stock == 0 }">
										            <span style="color: red;">품절</span>
										        </c:if>
										        <c:if test="${productvo.pd_stock != 0 }">
													<span>장바구니 담기</span>
												</c:if>
											</div>
											<div class="product-categori">
											<!-- hidden -->
												<!-- 광준 form 장바구니 들고가기 -->
												<form name="form1" method="post" action="../cart/insert" id="form1${productvo.pd_idx }">
													<input type="hidden" name="pd_category"	value="${productvo.pd_category}">
													<input type="hidden" name="pd_name"	value="${productvo.pd_name}">
													<input type="hidden" name="pd_img"	value="${productvo.pd_img_name_f }">
													<input type="hidden" id="pd_idx" name="pd_idx"	value="${productvo.pd_idx }">
													<input type="hidden" name="price" value="${productvo.pd_price}">
													<input type="hidden" name="pd_size"	value="${productvo.pd_size}">
													<input type="hidden" class="cart-plus-minus-box" name="amount" value="1" readonly required="required">
													
									                <c:if test="${productvo.pd_stock != 0 }">
														<a href="#" onclick="document.getElementById('form1${productvo.pd_idx }').submit();"><i class="ion-bag"></i> Add to cart</a>
													</c:if>
													<c:if test="${productvo.pd_stock == 0 }">
										           		<span style="color: red;">품절</span>
										   			</c:if>
												</form>
												<!-- 광준 form 장바구니 들고가기 -->
											<!-- hidden -->
											</div>
										</div>
									</div>
								</div>
							</div>
							
							
						</c:forEach>



					</div>
				</div>
			</div>
		<div>
				
					<c:if test="${pagingMaker.prev}">
						<a
							href="productList${pagingMaker.makeFind(pagingMaker.startPage-1)}">
							<button type="button" class="btn btn-theme03">◀</button>
						</a>
					</c:if>
					<c:forEach begin="${pagingMaker.startPage}"
						end="${pagingMaker.endPage}" var="pNum">

						<a href="productList${pagingMaker.makeFind(pNum)}">
							<button type="button"
								class="<c:out value="${pagingMaker.cri.page == pNum?'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
						</a>
					</c:forEach>
					<c:if test="${pagingMaker.next&&pagingMaker.endPage > 0}">
						<a
							href="productList${pagingMaker.makeFind(pagingMaker.endPage+1)}">
							<button type="button" class="btn btn-theme03">▶</button>
						</a>
					</c:if>


			</div>

		</div>
	</div>
</div>
<jsp:include page="../inc/footer.jsp"></jsp:include>