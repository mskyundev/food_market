<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../inc/header.jsp"></jsp:include>

<div class="breadcrumb-area pt-205 pb-210 bg-img"
	style="background-image: url(../pd_img_upload/채소2.jpg)">
	<div class="container">
		<div class="breadcrumb-content">
			<h2>shop</h2>
			<ul>
				<li><a href="#">home</a></li>
				<li>seller</li>
			</ul>
		</div>
	</div>
</div>

<div class="shop-page-wrapper hidden-items padding-filter">
	<div class="container-fluid">
		<div class="shop-filters-left">
			<div class="shop-sidebar">
				<div class="sidebar-widget mb-50">
					<!-- 					<h3 class="sidebar-title">Search Products</h3> -->
					<!-- 					<div class="sidebar-search"> -->
					<!-- 						<form action="#"> -->
					<!-- 							<input placeholder="Search Products..." type="text"> -->
					<!-- 							<button> -->
					<!-- 								<i class="ion-ios-search-strong"></i> -->
					<!-- 							</button> -->
					<!-- 						</form> -->
					<!-- 					</div> -->
				</div>
				<!--                             <div class="sidebar-widget mb-40"> -->
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
				<!--                             </div> -->
				<!-- 				<div class="sidebar-widget mb-45"> -->
				<!-- 					<h3 class="sidebar-title">Categories</h3> -->
				<!-- 					<div class="sidebar-categories"> -->
				<!-- 						<ul> -->

				<!-- <!-- 							<li><a href="#">채소<span></span></a></li> -->
				<!-- <!-- 							<li><a href="#">곡식<span></span></a></li> -->
				<!-- <!-- 							<li><a href="#">정육 <span></span></a></li> -->
				<!-- <!-- 							<li><a href="#">수산<span></span></a></li> -->
				<!-- 							<li><a href="productSellerList">판매자 상품 목록<span></span></a></li> -->
				<!-- 						</ul> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
				<!--                             <div class="sidebar-widget sidebar-overflow mb-45"> -->
				<!--                                 <h3 class="sidebar-title">color</h3> -->
				<!--                                 <div class="product-color"> -->
				<!--                                     <ul> -->
				<!--                                         <li class="red">b</li> -->
				<!--                                         <li class="pink">p</li> -->
				<!--                                         <li class="blue">b</li> -->
				<!--                                         <li class="sky">b</li> -->
				<!--                                         <li class="green">y</li> -->
				<!--                                         <li class="purple">g</li> -->
				<!--                                     </ul> -->
				<!--                                 </div> -->
				<!--                             </div> -->
				<!--                             <div class="sidebar-widget mb-40"> -->
				<!--                                 <h3 class="sidebar-title">size</h3> -->
				<!--                                 <div class="product-size"> -->
				<!--                                     <ul> -->
				<!--                                         <li><a href="#">xl</a></li> -->
				<!--                                         <li><a href="#">m</a></li> -->
				<!--                                         <li><a href="#">l</a></li> -->
				<!--                                         <li><a href="#">ml</a></li> -->
				<!--                                         <li><a href="#">lm</a></li> -->
				<!--                                     </ul> -->
				<!--                                 </div> -->
				<!--                             </div> -->


				<div class="sidebar-widget mb-50">
					<h3 class="sidebar-title"></h3>
					<div class="sidebar-top-rated-all">

						<!-- 인기 상품 -->
						<!-- 						<div class="sidebar-top-rated mb-30"> -->
						<!-- 							<div class="single-top-rated"> -->
						<!-- 								<div class="top-rated-img"> -->
						<!-- 									<a href="#"><img -->
						<!-- 										src="../assets/img/product/sidebar-product/4.jpg" alt=""></a> -->
						<!-- 								</div> -->
						<!-- 								<div class="top-rated-text"> -->
						<!-- 									<h4> -->
						<!-- 										<a href="#">Flying Drone</a> -->
						<!-- 									</h4> -->
						<!-- 									<div class="top-rated-rating"> -->
						<!-- 										<ul> -->
						<!-- 											<li><i class="reting-color ion-android-star"></i></li> -->
						<!-- 											<li><i class="reting-color ion-android-star"></i></li> -->
						<!-- 											<li><i class="ion-android-star-outline"></i></li> -->
						<!-- 											<li><i class="ion-android-star-outline"></i></li> -->
						<!-- 											<li><i class="ion-android-star-outline"></i></li> -->
						<!-- 										</ul> -->
						<!-- 									</div> -->
						<!-- 									<span>$140.00</span> -->
						<!-- 								</div> -->
						<!-- 							</div> -->
						<!-- 						</div> -->



					</div>
				</div>
			</div>
		</div>
		<div class="shop-filters-right">
			<div class="shop-bar-area pb-60">
				<div class="shop-bar">
					<!--                                 <div class="shop-found-selector"> -->
					<!--                                     <div class="shop-found"> -->
					<!--                                         <p><span>23</span> Product Found of <span>50</span></p> -->
					<!--                                     </div> -->
					<!--                                     <div class="shop-selector"> -->
					<!--                                         <label>Sort By : </label> -->
					<!--                                         <select name="select"> -->
					<!--                                             <option value="">Default</option> -->
					<!--                                             <option value="">A to Z</option> -->
					<!--                                             <option value=""> Z to A</option> -->
					<!--                                             <option value="">In stock</option> -->
					<!--                                         </select> -->
					<!--                                     </div> -->
					<!--                                 </div> -->
					<div class="shop-filter-tab">
						<div class="shop-filter">
							<!-- 							<a class="shop-filter-active" href="#">Filters <i class="ion-android-options"></i></a> -->
						</div>
						<!--                                     <div class="shop-tab nav" role=tablist> -->
						<!--                                        <a class="active" href="#grid-5-col1" data-toggle="tab" role="tab" aria-selected="false"> -->
						<!--                                             <i class="ion-android-apps"></i> -->
						<!--                                         </a> -->
						<!--                                         <a href="#grid-5-col2" data-toggle="tab" role="tab" aria-selected="true"> -->
						<!--                                             <i class="ion-android-menu"></i> -->
						<!--                                         </a> -->
						<!--                                     </div> -->
					</div>
				</div>
			</div>
			<div align="center">
				<h5>판매자 이름 : ${sessionScope.mb_id }</h5>
				<hr>
				<a class="contact-form-style button submit btn-hover input "
					href="productWrite">상품 등록하기 </a>
			</div>
			<hr>
			<div class="shop-product-content tab-content">
				<div id="grid-5-col1" class="tab-pane fade active show">
					
					<div  style="float: left;  ">
						<ul>
							<c:choose>
							<c:when test="${seller == 1 }">
								<li style="padding-top: 20px;"><a
									href="/food_market/product/productSellerList">내 상품 목록</a></li>
								<li style="padding-top: 20px;"><a
									href="/food_market/member/sellerOrder">주문 내역</a></li>
							</c:when>
							<c:otherwise>
								<li style="padding-top: 20px;"><a
									href="/food_market/orders/orderlist">주문 내역</a></li>
							</c:otherwise>
							</c:choose>
							<li style="padding-top: 20px;"><a
								href="/food_market/member/info">회원정보 수정</a></li>
							<li style="padding-top: 20px;"><a
								href="/food_market/member/modifyPw">비밀번호 번경</a></li>
							<li style="padding-top: 20px;"><a
								href="/food_market/member/delete">회원 탈퇴</a></li>
						</ul>
					</div>
					<div class="row custom-row" style="margin-left: 150px;">
						<c:forEach items="${list}" var="productvo">
							<!-- foreach문 돌리기 -->
							<div class="custom-col-5 custom-col-style">
								<div class="single-product mb-35">
									<div class="product-img">
										<a
											href="productDetail${pagingMaker.makeURI(pagingMaker.cri.page)}&pd_idx=${productvo.pd_idx }">
											<img src="../pd_img_upload/${productvo.pd_category }/${productvo.pd_img_name_f }"
											alt="${productvo.pd_name }" width="auto" height="150"><span></span>
										</a>
									</div>
									<div class="product-content">
										<div class="product-title-price">
											<div class="product-title">
												<a
													href="productDetail${pagingMaker.makeURI(pagingMaker.cri.page)}&pd_idx=${productvo.pd_idx }"><h4>${productvo.pd_name }</h4></a>
											</div>
										</div>
										<br>
										<div class="product-title">
											<span><a
												href="productSellerModify${pagingMaker.makeURI(pagingMaker.cri.page)}&pd_idx=${productvo.pd_idx}">상품
													수정하기</a></span>
										</div>
										<br>
										<div class="product-title">
											<span><a
												href="productSellerDelete${pagingMaker.makeURI(pagingMaker.cri.page)}&pd_idx=${productvo.pd_idx}">상품
													삭제하기 (클릭하면 바로 삭제됩니다!)</a></span>
										</div>


										<!-- 										<div class="product-cart-categori"> -->
										<!-- 											<div class="product-cart"> -->
										<!-- 												<span>장바구니 담기</span> -->
										<!-- 											</div> -->
										<!-- 											<div class="product-categori"> -->
										<!-- 												<a href="cart"><i class="ion-bag"></i> Add to cart</a> -->
										<!-- 											</div> -->
										<!-- 										</div> -->
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<hr>
			<div style="margin-left: 150px;">
				<c:if test="${pagingMaker.prev}">
						<a class="btn btn-theme03" 
						onclick="location.href='productSellerList${pagingMaker.makeURI(pagingMaker.startPage-1)}'">◀</a>
				</c:if>
				<c:forEach begin="${pagingMaker.startPage}"
					end="${pagingMaker.endPage}" var="pNum">
			
						<a class="btn btn-theme03" 
						onclick="location.href='productSellerList${pagingMaker.makeURI(pNum)}'"
							>${pNum}</a>
		
				</c:forEach>
				<c:if test="${pagingMaker.next&&pagingMaker.endPage > 0}">
						<a class="btn btn-theme03"
						onclick="location.href='productSellerList${pagingMaker.makeURI(pagingMaker.endPage+1)}'">▶</a>
				</c:if>
			</div>
		</div>
	</div>
</div>


<jsp:include page="../inc/footer.jsp"></jsp:include>