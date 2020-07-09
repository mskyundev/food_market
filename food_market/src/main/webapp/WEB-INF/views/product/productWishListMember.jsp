<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../inc/header.jsp"></jsp:include>
 <div class="breadcrumb-area pt-205 pb-210" style="background-image: url(../pd_img_upload/살구2.jpg)">
                <div class="container">
                    <div class="breadcrumb-content">
                        <h2 style="color: white;">wishlist</h2>
                        <ul>
                            <li><a href="#" style="color: white;">home</a></li>
                            <li style="color: white;"> wishlist </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- shopping-cart-area start -->
            <div class="cart-main-area pt-95 pb-100">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <h1 class="cart-heading">wishlist</h1>
                                <div class="table-content table-responsive">
                                
                                	<c:if test="${empty WishListMember}"> 
									<script type="text/javascript">
									alert("위시리스트가 비었습니다!");
									location.href="${path }/food_market/member/myPage";
									</script>
									</c:if>
                                
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="product-name">삭제</th>
                                                <th class="product-name">상품번호</th>
                                                <th class="product-price">images</th>
                                                <th class="product-name">Product</th>
                                                <th class="product-price">Price</th>
                                                <th class="product-price">찜한 날짜</th>
                                            </tr>
                                        </thead>
										<tbody>
				
											<!-- foreach문 돌리기 -->
											<c:forEach items="${WishListMember}" var="productVO">
				
												<tr>
													<!-- 삭제 버튼 -->
													<td class="product-remove"><i class="ion-android-close" id="wishTRUE${productVO.pd_idx }"></i></td>
													<td class="product-name" >${productVO.pd_idx }</td>
													<td class="product-thumbnail">
													<a
														href="productDetail${pagingMaker.makeURI(pagingMaker.cri.page)}&pd_idx=${productVO.pd_idx }">
															<img src="../pd_img_upload/${productVO.pd_category }/${productVO.pd_img_name_f }"
															width="100" height="100" alt="${productVO.pd_img_name_f }">
													</a>
													</td>
													<td class="product-name">
													<a
														href="productDetail${pagingMaker.makeURI(pagingMaker.cri.page)}&pd_idx=${productVO.pd_idx }">
															${productVO.pd_name } </a></td>
													<td class="product-price">
														<span class="amount">
															<b>￦&nbsp;</b>
                                			   				<fmt:formatNumber type="number" maxFractionDigits="3" value="${productVO.pd_price }" />
															원
														</span>
													</td>
				
													<td class="product-price"><span class="amount">${productVO.pd_wishlistVO.pd_wish_date }</span></td>
												</tr>
											</c:forEach>
											<!-- foreach문 돌리기 -->
										</tbody>
									</table>
								</div>
								<hr>
								<div style="margin-left: 150px;">
									<c:if test="${pagingMaker.prev}">
										<a class="btn btn-theme03"
											onclick="location.href='productWishListMember${pagingMaker.makeURI(pagingMaker.startPage-1)}'">◀</a>
									</c:if>
									<c:forEach begin="${pagingMaker.startPage}"
										end="${pagingMaker.endPage}" var="pNum">
			
										<a class="btn btn-theme03"
											onclick="location.href='productWishListMember${pagingMaker.makeURI(pNum)}'">${pNum}</a>
			
									</c:forEach>
									<c:if test="${pagingMaker.next&&pagingMaker.endPage > 0}">
										<a class="btn btn-theme03"
											onclick="location.href='productWishListMember${pagingMaker.makeURI(pagingMaker.endPage+1)}'">▶</a>
									</c:if>
								</div>
                        </div>
                    </div>
                </div>
            </div>
<script type="text/javascript">

$(document).ready(function() {
	var member_mb_id = "${sessionScope.mb_id }";
	
	$('[id^=wishTRUE]').on('click', function(e){
	// 	alert("wishFALSE 버튼 클릭!!! 찜 삭제!!!  "+member_mb_id+"   "+product_pd_idx);
	
		var id = $(this).attr("id");
		var product_pd_idx = id.replace("wishTRUE", ""); 

		$.ajax({
			type : 'delete',
			url : 'wishListDelete',
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			
			dataType : 'text',
			data :JSON.stringify({	                                    		 
			member_mb_id : member_mb_id,
			product_pd_idx : product_pd_idx
			}),
			
			success: function(result){
					alert("wishList에서 삭제 되었습니다!");
					location.reload();
					e.preventDefault(); 
				
			}
		});
	});	

})

</script>


<jsp:include page="../inc/footer.jsp"></jsp:include>