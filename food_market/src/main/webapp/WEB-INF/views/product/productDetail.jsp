<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../inc/header.jsp"></jsp:include>
<head>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<style type="text/css">
.scale {
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transform: scale(1);

  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.scale:hover {
  -webkit-transform: scale(6);
  -moz-transform: scale(6);
  -ms-transform: scale(6);
  -o-transform: scale(6);
  transform: scale(6);
}

.scale img {width:50px; height:50px; overflow:hidden } 

</style>
</head>
<!doctype html>

<div class="breadcrumb-area bg-img border-top-1 pt-55">
	<div class="container">
		<div class="breadcrumb-content-2">
			<ul>
				<li><a class="active" href="#">home</a></li>
				<li><a class="active" href="${path }/food_market/product/productList">전체 상품</a></li>
				<li><a class="active" href="${path }/food_market/product/productList?findType=${productVO.pd_category}">${productVO.pd_category} </a></li>
				<li><a class="active" href="#">${productVO.pd_name} </a></li>
			</ul>
		</div>
	</div>
</div>
<div class="product-details ptb-100 pb-90">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="product-details-btn">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-lg-7 col-12">
				<div class="product-details-img-content">
					<div class="product-details-tab mr-70">
						<div class="product-details-large tab-content">
							<div class="tab-pane active show fade" id="pro-details1"
								role="tabpanel">
								<div class="">
								 <img
										src="../pd_img_upload/${productVO.pd_category }/${productVO.pd_img_name_f }"
										width="600" height="550" 
										alt="${productVO.pd_img_name_f }">
								
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 col-lg-5 col-12">
				<div class="product-details-content">
				
                 
                                <h3>${productVO.pd_name}</h3>

                 <!-- hidden --><input type = "hidden" name = "pd_name" value="${productVO.pd_name}">
                 <!-- hidden --><input type = "hidden" name = "pd_img" value = "${productVO.pd_img_name_f }">
                 <input type = "hidden" name = "pd_category" value = "${productVO.pd_category }">
                                <!-- 별점 제어하기  -->	
                                <div class="rating-number">
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
                                      <c:if test="${starAVG != null }">
										 <span> <fmt:formatNumber value="${starAVG }" pattern=".00"/>점&nbsp;&nbsp;&nbsp;
										</c:if>
										<c:if test="${starAVG == null }">
										 <span>0 점&nbsp;&nbsp;&nbsp;
										</c:if>
                                       ${reviewListCountData } 개 상품평</span>
                                        
                                      
                                    </div>
                                </div>
                                <!-- 별점 end -->
                              
                                <div class="details-price">
                                    <span><b>￦&nbsp;</b>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${productVO.pd_price}" />
                                   </span>
                                </div>
                                <p></p>
                                <p></p>
                                <div class="quick-view-select">
                                    <div class="select-option-part">
                                        <label>포장단위별 용량(중량), 수량, 크기</label>
                                       <p>&nbsp;&nbsp;${productVO.pd_size}</p>
                                    </div>
                                    <div class="select-option-part">
                                        <label>원산지</label>
                                       <p>&nbsp;&nbsp;${productVO.pd_origin}</p>
<%--                                        <input type = "hidden" name = "pd_origin" value="${productVO.pd_origin}"> --%>
                                    </div>
                                    <div class="select-option-part">
                                        <label>재고 수량</label>
                                       <p>&nbsp;&nbsp;${productVO.pd_stock}&nbsp;개</p>
<%--                                        <input type = "hidden" name = "pd_origin" value="${productVO.pd_origin}"> --%>
                                    </div>
                                </div>

                    <c:if test="${productVO.pd_stock == 0 }">
              	    <p style="color: red;"> 재고가 없습니다.</p>
                    </c:if>


					<c:if test="${productVO.pd_stock != 0 }">
								<!-- 광준 form 장바구니 들고가기 -->
								<form name="form1" method="post" action="../cart/insert">
									<!-- hidden -->
									<input type="hidden" name="pd_category"	value="${productVO.pd_category}">
									<input type="hidden" name="pd_name"	value="${productVO.pd_name}">
									<input type="hidden" name="pd_img"	value="${productVO.pd_img_name_f }">
									<input type="hidden" id="pd_idx" name="pd_idx"	value="${productVO.pd_idx }">
									<input type="hidden" name="price" value="${productVO.pd_price}">
									<input type="hidden" name="pd_size"	value="${productVO.pd_size}">
					     <div class="quickview-plus-minus">
                                    <div class="cart-plus-minus">
									<!-- text 갯수 들고가기 -->
                                      		<input type="text" class="cart-plus-minus-box" name="amount" value="1" readonly required="required">
                                    </div>
                                    <div class="quickview-btn-cart">
                                       <input type="submit"	class="contact-form-style submit input button "	value="add to cart">
                                    </div>
                                    <!-- 위시리스트에 넣기 -->
                                    <div class="quickview-btn-wishlist" id="wishlistDIV" >
                                    </div>
                         </div>
								</form><!-- 광준 form 장바구니 들고가기 -->
                                    <div class="" id="wishListProductCountData"	style="text-align: right;">
                                    </div>
                                    <!-- 위시리스트에 넣기 -->
					</c:if>
					
					<div class="product-categories product-cat-tag">
						<ul>
							<li class="categories-title">Categories :</li>
							 <li><a href="${path }/food_market/product/productList?findType=과일">과일</a></li>
                             <li><a href="${path }/food_market/product/productList?findType=채소">채소</a></li>
                             <li><a href="${path }/food_market/product/productList?findType=곡식">곡식</a></li>
                             <li><a href="${path }/food_market/product/productList?findType=정육">정육</a></li>
                             <li><a href="${path }/food_market/product/productList?findType=수산">수산</a></li>
						</ul>
					</div>
					<div class="product-tags product-cat-tag">
						<ul>
						</ul>
					</div>
					<div class="product-share">
						<ul>
							<li class="categories-title">Share :</li>
							<li><a href="#"> <i class="ion-social-twitter"></i>
							</a></li>
							<li><a href="#"> <i class="ion-social-tumblr"></i>
							</a></li>
							<li><a href="#"> <i class="ion-social-facebook"></i>
							</a></li>
							<li><a href="#"> <i class="ion-social-instagram-outline"></i>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<hr>


<div class="product-description-review-area pb-100">
	<div class="container">
		<div class="product-description-review text-center">
			<div class="description-review-title nav" role=tablist>
				<a class="active" href="#pro-dec" data-toggle="tab" role="tab"
					aria-selected="true" id="Description"> Description </a>
				<a href="#pro-review"	data-toggle="tab" role="tab" 
					aria-selected="false" id="Review"> Reviews (${reviewListCountData })
				</a> 
				<a href="#pro-qna" data-toggle="tab" role="tab"
					aria-selected="false" id="Qna"> 상품 문의 
				</a>
			</div>
			<div class="description-review-text tab-content">

				<!-- 상품 상세 설명 -->
				<div class="tab-pane active show fade" id="pro-dec" role="tabpanel" style="overflow:auto;">
					<div>
						<img src="../pd_img_upload/${productVO.pd_category }/${productVO.pd_img_name_s }" alt="" >
					</div>
				</div>
				<!-- 상품 상세 설명 -->
				
				
<!-- ------------------------------------------------------------------------------------------------------ -->
<!-- ------------------------------------------------------------------------------------------------------ -->
			
				<!-- 리뷰 페이지 -->
				<div class="tab-pane fade" id="pro-review" role="tabpanel">
<!-- 					<a href="productReviewWrite">Be the first to write your review!</a> -->
					<hr>
					<!-- 리뷰 목록 테이블  -->
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<h1 class="cart-heading">상품평</h1>
							<div class="table-content table-responsive">
							
							<c:if test="${reviewListCountData != 0 }">
							
								<table>
									<thead>
										<tr>
											<th class="product-name">별점 평가</th>
<!-- 											<th class="product-quantity">상품번호</th> -->
<!-- 											<th class="product-quantity">주문번호</th> -->
<!-- 											<th class="product-quantity">리뷰 글번호</th> -->
											<th style =" width: 100em;" class="product-price">상품평</th>
											<th class="product-name">구매자</th>
											<th style =" width: 10em;" class="product-price">작성일</th>
										</tr>
									</thead>
									<tbody id = "reply">
										<!-- 숫자에따라 별 ( 채워진, 비워진  ) 지정해서 출력하기 -->
									</tbody>
								</table>
							<div class="pgeNumList">
							</div>
							</c:if>
							<c:if test="${reviewListCountData == 0 }">
							상품평이 없습니다.
							</c:if>
							
							</div>
						</div>
					</div>
					<!-- 리뷰 목록 테이블  -->
				</div>
				<!-- 리뷰 목록  페이지-->
				
<!-- ------------------------------------------------------------------------------------------------------ -->
<!-- ------------------------------------------------------------------------------------------------------ -->
	
							<!-- 상품 문의 페이지 -->
				
				<!-- hidden --><form role="form" method="get">
				<!-- hidden --><input type="hidden" name="mb_id" id="mb_id" value="${sessionScope.mb_id}">
				<!-- hidden --><input type="hidden" name="pd_idx" id="pd_idx" value="${productVO.pd_idx}">
				<!-- hidden --><input type="hidden" name="qna_num" value="${qvo.qna_num}">
				<!-- hidden --><input type = "hidden" name="qna_re_ref" value="${qvo.qna_re_ref}">
				<!-- hidden --><input type = "hidden" name="qna_re_lev" value="${qvo.qna_re_lev}">
				<!-- hidden --><input type = "hidden" name="qna_re_seq" value="${qvo.qna_re_seq}">
				</form>
				<div class="tab-pane fade" id="pro-qna" role="tabpanel">
					<c:if test="${sessionScope.mb_id != null }">
						<c:if test="${productVO.member_mb_id != sessionScope.mb_id }">

							<!-- 상품문의 작성 버튼 -->
							<a class="contact-form-style button submit btn-hover input "
								id='popupBtn' href="#">상품 문의 작성하기 </a>
						</c:if>
					</c:if>
					<hr>

					<script type="text/javascript">
				$(document).ready(function() {
					$('#popupBtn').on("click",function(){
						var option = "width = 600, height = 450, top = 100, left = 200, location = no, status=no, menubar=no, toolbar=no, resizable=no"
						var pd_idx = $('#pd_idx').val();
						window.open("qnawrite?pd_idx="+pd_idx,"_blank",option).focus();
					});
				});
	
				</script>

					<!-- 리뷰 게시판 목록 띄우기  review list -->
					<!-- shopping-cart-area start -->
					<!-- 					<div class="cart-main-area pt-95 pb-100"> -->
					<!-- 						<div class="container"> -->
					<!-- hidden -->
					<form role="form" id="formdata" method="get">
						<!-- hidden -->
						<input type="hidden" name="mb_id" id="mb_id"
							value="${sessionScope.mb_id}">
						<!-- hidden -->
						<input type="hidden" name="pd_idx" id="pd_idx"
							value="${productVO.pd_idx}">
						<!-- hidden -->
						<input type="hidden" name="qna_num" id="qna_num"
							value="${qvo.qna_num}">
						<!-- hidden -->
						<input type="hidden" name="qna_re_ref" id="qna_re_ref"
							value="${qvo.qna_re_ref}">
						<!-- hidden -->
						<input type="hidden" name="qna_re_lev" id="qna_re_lev"
							value="${qvo.qna_re_lev}">
						<!-- hidden -->
						<input type="hidden" name="qna_re_seq" id="qna_re_seq"
							value="${qvo.qna_re_seq}">
					</form>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<h1 class="cart-heading">상품 문의</h1>
							<!-- 									<form action="#"> -->
							<div class="table-content table-responsive">
							    <c:if test="${empty qnalist}">
							                              상품문의 내용이 없습니다.
							    </c:if>
		                           
		                        <c:if test="${!empty qnalist}">   
								<table border="1">
									<thead>
										<tr>

											<th class="product-price">상품 문의 내용</th>
											<th class="product-name">작성자</th>
											<th class="product-price">날짜</th>
										</tr>
									</thead>
									<tbody>
										<!-- ------------------------------------------------------- -->
										<!-- for each문 돌리기 -->
										<c:forEach items="${qnalist}" var="qvo">
											<tr>
												<!-- 판매자 아닐 때  -->
												<c:if
													test="${productVO.member_mb_id != sessionScope.mb_id }">

													<c:if test="${qvo.qna_re_lev == 0}">
														<td class="product-name">${qvo.qna_content}</td>
													</c:if>

													<c:if test="${qvo.qna_re_lev != 0}">
														<td class="product-name"><img
															src="../pd_img_upload/next.png" width="20" height="20">&nbsp;&nbsp;${qvo.qna_content}</td>
													</c:if>
												</c:if>
												<!-- 판매자 일 때  -->
												<c:if
													test="${productVO.member_mb_id == sessionScope.mb_id }">

													<!-- 답글X 문의글일때 -->
													<c:if test="${qvo.qna_re_lev == 0}">



														<td class="product-name" id='btnpopup2'><a
															href="qnareplywrite?qna_num=${qvo.qna_num}&pd_idx=${productVO.pd_idx}
                                             &qna_re_ref=${qvo.qna_re_ref}
                                               &qna_re_lev=${qvo.qna_re_lev}
                                               &qna_re_seq=${qvo.qna_re_seq}"
															onclick="window.open(this.href,'','width = 600, height = 450, top = 100, left = 200, location = no, status=no, menubar=no, toolbar=no, resizable=no'); return false;">${qvo.qna_content}</a></td>
													</c:if>
													<!-- 답글일때 -->
													<c:if test="${qvo.qna_re_lev != 0}">

														<td class="product-name"><img
															src="../pd_img_upload/next.png" width="20" height="20">&nbsp;&nbsp;${qvo.qna_content}</td>

													</c:if>

												</c:if>
												<td class="product-price">${qvo.mb_id}</td>
												<td class="product-subtotal"><fmt:formatDate
														pattern="yyyy/MM/dd HH:mm" value="${qvo.qna_data}" /></td>
											</tr>
										</c:forEach>

										<!-- for each문 돌리기 -->
										<!-- ------------------------------------------------------- -->

									</tbody>



								</table>

								<div class="btn-group">
									<c:if test="${pagingMaker.prev}">
										<a
											href="productDetail${pagingMaker.makeURI(pagingMaker.startPage-1)}">
											<button type="button" class="btn btn-theme03">◀</button>
										</a>
									</c:if>
									<c:forEach begin="${pagingMaker.startPage}"
										end="${pagingMaker.endPage}" var="pNum">
										<a
											href="productDetail${pagingMaker.makeURI(pNum)}&pd_idx=${productVO.pd_idx}">
											<button type="button"
												class="<c:out value="${pagingMaker.cri.page == pNum?'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
										</a>
									</c:forEach>
									<!-- 													getCri()메소드 호출 =>cri 얻어옴 =>getpage()호출 -->
									<!-- 													저기저 page는 model을 거쳐서 오니까 model안에포함되어있는 pagingMaker,pagingcriteria가 다 포함이되어있다. -->
									<!-- 													이 넘어온 page값과 pNum의 값이 같으면  -->
									<c:if test="${pagingMaker.next&&pagingMaker.endPage > 0}">
										<a
											href="productDetail${pagingMaker.makeURI(pagingMaker.endPage+1)}">
											<button type="button" class="btn btn-theme03">▶</button>
										</a>
									</c:if>

								</div>
</c:if>
							</div>
						</div>
					</div>
					<!-- shopping-cart-area end -->
				</div>
				<!-- 상품 문의 페이지 -->	
	<!-- ------------------------------------------------------------------------------------------------------ -->
	<!-- ------------------------------------------------------------------------------------------------------ -->
	


			</div>
		</div>
	</div>
</div>
<div class="product-collection-area pb-60">
	<div class="container"></div>
</div>

<jsp:include page="../inc/footer.jsp"></jsp:include>

<!-- ------------------------------------------------------------------------------------------------------ -->
<!-- ------------------------------------------------------------------------------------------------------ -->
	
<!-- -----------------리뷰 테이블 ------------------ -->

<script type="text/javascript">
$(document).ready(function() {
	 var pd_idx = $('#pd_idx').val(); 
	 
	$.getJSON('productReviewList2/'+pd_idx+'/1',function(data){
		var str = "";
	
// 		alert("getJSON");
		
		$.each(data.list,function(){
			
			//리뷰 리스트
		str +="<tr>"
			+"<td class='product-thumbnail'><img src='../pd_img_upload/"+this.pd_re_star+".jpg' height='10'></td>"
// 			+"<td class='product-remove'>"+this.product_pd_idx+"</td>"
// 			+"<td class='product-remove'>"+this.order_od_idx+"</td>"
// 			+"<td class='product-remove'>"+this.pd_re_idx+"</td>"
			+"<td class='product-name'>"+this.pd_re_subject+"<br>"
			+"<img src='../pd_img_upload/productReviewImg/"+this.pd_re_img_name+"' alt='' height='50' width='50' class='scale'></td>"
			+"<td class='product-price'>"+this.member_mb_id+"</td>"
			+"<td class='product-subtotal'>"+moment(this.pd_re_date).format('YYYY-MM-DD')+"</td>"
			+"</tr>";
					
		});
		$("#reply").html(str);
		showPageNum(data.pagingMaker);
	});
	
	function getPgeNum(page){
	
		$.getJSON('productReviewList2/'+pd_idx+'/'+page,function(data){
			var str = "";
			$.each(data.list,function(){
				
				//리뷰 리스트
				str +="<tr>"
					+"<td class='product-thumbnail'><img src='../pd_img_upload/"+this.pd_re_star+".jpg' height='10'></td>"
// 					+"<td class='product-remove'>"+this.product_pd_idx+"</td>"
// 					+"<td class='product-remove'>"+this.order_od_idx+"</td>"
// 					+"<td class='product-remove'>"+this.pd_re_idx+"</td>"
					+"<td class='product-name'>"+this.pd_re_subject+"<br>"
					+"<img src='../pd_img_upload/productReviewImg/"+this.pd_re_img_name+"' alt='' height='50' width='50' class='scale'></td>"
					+"<td class='product-price'>"+this.member_mb_id+"</td>"
					+"<td class='product-subtotal'>"+moment(this.pd_re_date).format('YYYY-MM-DD')+"</td>"
					+"</tr>";
			});
			
			$("#reply").html(str);
			showPageNum(data.pagingMaker);
		});
	}

	function showPageNum(pagingMaker){
	 	var str = "";
	 	
	 	if(pagingMaker.prev){
	 		str +="<br><br><br><br><button type='button' class='button btn-hover' id='repage"+(pagingMaker.startPage-1)+"'>◀</button>";
	 	}
	 	for(var i=pagingMaker.startPage, end=pagingMaker.endPage; i <= end; i++){			
	 		str +="&nbsp;<button type='button' class='button btn-hover' id='repage"+i+"'>"+i+"</button>&nbsp;";	
	 	}
	 	if(pagingMaker.next){
	 		str +="<button type='button' class='button btn-hover' id='repage"+(pagingMaker.endPage+1)+"'>▶</button><br><br><br><br>";
	 	}
	 	$(".pgeNumList").html(str);
	}; //showPageNum()

	
// 	페이지번호를 클릭시 이벤트 발생
	$(".pgeNumList").on('click','button',function(e){
		
		var id = $(this).attr("id");
		var Page = id.replace("repage", ""); 
		
	 	e.preventDefault(); // <a> 태그의 화면전환이 일어나지 않도록 하는 역할을 한다.
	 	getPgeNum(Page);
		
	});
	
})
</script>


                     
<!-- ------------------------------------------------------------------------------------------------------ -->
<!-- ------------------------------------------------------------------------------------------------------ -->
	
<!----------------------- 찜하기 버튼 ---------------------->
                       
                                    <script type="text/javascript">

                                    
                                    $(document).ready(function() {
                                    	
                                    	var member_mb_id = "${sessionScope.mb_id }";
                                    	var product_pd_idx = "${productVO.pd_idx }";
                                    	var mb_seller = "${sessionScope.mb_seller}";
                                    	
                                    	//{sessionScope.mb_seller == '2' } <!-- 구매자 -->
//                                     	alert("아이디 : "+member_mb_id+"   "+product_pd_idx);
                                    	
                                    	$.getJSON({
                                    		
                                    		type : "POST",
                                    		url : 'wishListSelect',
                                    		headers:{
                                    			"Content-Type" : "application/json",
                                    			"X-HTTP-Method-Override" : "POST"
                                    		},
                                    		
                                    		dataType : 'text',
                                    		data :JSON.stringify({	                                    		 
                                    		member_mb_id : member_mb_id,
                                    		product_pd_idx : product_pd_idx
                                    		}),
                                    		
                                    		success: function(result){
												//text를 json 객체로 변환                                    			
                                    			var wishListProductMap = JSON.parse(result);
                                    			var str="";
                                    			
											//result 가	wishListSelectCount 이다.
											//0이면 찜할 수 있다.
											//0이 아니면 목록에 있다. 찜 할 수 없다. 
											
											//구매자 일때만
												if(mb_seller == 2){
		                                			
	                                    			if(wishListProductMap.wishListSelectCount == 0 ){
	//	                                    				alert("result는 0!!! 찜 할수 있다.");
														str +="<img src='../pd_img_upload/wishFALSE.png' height='50' id ='wishFALSE'>"
	                                    			}else {
	//	                                    				alert("result는 0아니다!!! 찜 할수 없다.");
	                                    				str +="<img src='../pd_img_upload/wishTRUE.png' height='50' id ='wishTRUE'>"
	                                    			}
	                                    			
												}else{
// 													alert("아이디 없습니다.");
	                                				str +="	<a class='btn-hover' href='#' ><i class='ion-ios-heart-outline' id ='wishLOGIN' ></i></a>"
												}
											
                                    			$("#wishlistDIV").html(str);
                                    			$("#wishListProductCountData").html("<br>"+wishListProductMap.wishListProductCountData+"명이 이 상품을 찜했어요!");
                                    		}
										});
                                    	
                                    	//동적으로 생성한 태그 버튼 클릭하기 
                                    	//https://velog.io/@surim014/jQuery-%EA%B8%B0%EC%B4%88-%EC%A7%80%EC%8B%9D-%EC%A0%95%EB%A6%AC%ED%95%98%EA%B8%B0-3-%EC%9D%B4%EB%B2%A4%ED%8A%B8-Ajax-%EB%8B%A4%EC%96%91%ED%95%9C-%ED%95%A8%EC%88%98
	                                 	//버튼 RequestMethod.POST
	                                    $(document).on('click', '#wishFALSE', function(){
// 	                                    	alert("wishTRUE 버튼 클릭!!! 찜하기!!!!  "+member_mb_id+"   "+product_pd_idx);
	                                    	$.ajax({
	                                    		type : 'post',
	                                    		url : 'wishListWrite',
	                                    		headers:{
	                                    			"Content-Type" : "application/json",
	                                    			"X-HTTP-Method-Override" : "POST"
	                                    		},
	                                    		
	                                    		dataType : 'text',
	                                    		data :JSON.stringify({	                                    		 
	                                    		member_mb_id : member_mb_id,
	                                    		product_pd_idx : product_pd_idx
	                                    		}),
	                                    		
	                                    		success: function(result){
// 	                                    				alert("wishList에 추가 되었습니다!");
	                                    				var str="<img src='../pd_img_upload/wishTRUE.png' height='50'  id ='wishTRUE'>";
	        											$("#wishlistDIV").html(str);
	        											$("#wishListProductCountData").html("<br>"+result+"명이 이 상품을 찜했어요!");
	                                    		}
	                                    	});
	                                    });	
	                                 	
	                                 	
	                                 	//버튼 RequestMethod.DELETE
//  										$("#wishTRUE").on("click",function(){
										 $(document).on('click', '#wishTRUE', function(){
// 	                                    	alert("wishFALSE 버튼 클릭!!! 찜 삭제!!!  "+member_mb_id+"   "+product_pd_idx);
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
// 	                                    				alert("wishList에서 삭제 되었습니다!");
	                                    				var str="<img src='../pd_img_upload/wishFALSE.png'  height='50'  id ='wishFALSE'>";
	        											$("#wishlistDIV").html(str);
	        											$("#wishListProductCountData").html("<br>"+result+"명이 이 상품을 찜했어요!");
	                                    		}
	                                    	});
	                                    });	
	                                 	
										 $(document).one('click', '#wishLOGIN', function(e){
											 var str="";
											 if(mb_seller == 1){
												 str+="&nbsp;&nbsp;&nbsp;구매자 전용!";
											 }else{
												 str+="&nbsp;&nbsp;&nbsp;로그인하세요!";
											 }
												 $("#wishlistDIV").append(str);
	        								
											 	e.preventDefault(); // <a> 태그의 화면전환이 일어나지 않도록 하는 역할을 한다.
		                                    });	
	                                    
                                    })
                                    
                                    </script>

                                    <!-- 위시리스트에 넣기 -->

<!-- ------------------------------------------------------------------------------------------------------ -->
<!-- ------------------------------------------------------------------------------------------------------ -->