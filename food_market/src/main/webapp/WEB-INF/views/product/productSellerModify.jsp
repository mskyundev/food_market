<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../inc/header.jsp"></jsp:include>


 <div class="breadcrumb-area pt-205 pb-210" style="background-image: url(../pd_img_upload/살구2.jpg)">
                <div class="container">
                    <div class="breadcrumb-content">
                        <h2>register</h2>
                        <ul>
                            <li><a href="#">home</a></li>
                            <li>상품 수정하기</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- register-area start -->
            <div class="register-area ptb-100">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12 col-12 col-lg-6 col-xl-6 ml-auto mr-auto">
                            <div class="login">
                                <div class="login-form-container">
                                    <div class="login-form">
                                    
                                    
                                        <form action="" method="post" enctype="multipart/form-data">
                                    		
                                    		상품 카테고리 : ${productVO.pd_category}<br><br>
                                        	상품번호 : ${productVO.pd_idx}<br><br>
                                        	등록일자 : <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${productVO.pd_date }"/><br>
                                            <hr>
                                            <!-- radio box pd_category 카테고리에 넣기 -->
                                    		상품 카테고리 (반드시 하나는 선택해야합니다. ) 
                                            <br>
                                    		<br>
                                    		<div>
                                    		<input type="radio" name="pd_category" value="과일">과일
                                    		</div>
                                    		<div>
											<input type="radio" name="pd_category" value="채소">채소
											</div>
											<div>
											<input type="radio" name="pd_category" value="곡식">곡식
											</div>
											<div>
											<input type="radio" name="pd_category" value="정육">정육
											</div>
											<div>
											<input type="radio" name="pd_category" value="수산">수산
											</div>
											<br>
											<br>
                                         	상품명 : <input type="text" name="pd_name" placeholder="상품명" required="required" maxlength="50" value="${productVO.pd_name}"><br>
						                                        상품가격(숫자만 입력하세요) : <input type="text" name="pd_price" placeholder="상품가격(숫자만 입력하세요)"required="required"  pattern="[0-9]+"  maxlength="7" value="${productVO.pd_price}"> <br>
						                                        포장단위별 용량(중량), 수량, 크기 (예: 1box(7kg 내외)) : <input type="text" name="pd_size" placeholder="포장단위별 용량(중량), 수량, 크기 (예: 1box(7kg 내외))"required="required"  maxlength="30" value="${productVO.pd_size}"><br>
						                                        제조국 또는 원산지 (예: 국내산) : <input type="text" name="pd_origin" placeholder="제조국 또는 원산지 (예: 국내산)"required="required"maxlength="10" value="${productVO.pd_origin}"><br>
                                  		        상품 재고 갯수(숫자만 입력하세요) : <input type="text" name="pd_stock" placeholder="상품 재고 갯수" required="required"  pattern="[1-9]+"  maxlength="3" value="${productVO.pd_stock}"> 
                                            <input type="hidden" name="member_mb_id" value="${sessionScope.mb_name }"  required="required" maxlength="30" readonly><br>
                                            <br>
                                            <br>
                                            	 ※ 사진은 수정할 수 없습니다. 상품 삭제 후 재등록 해야합니다. ※
                                            <br>
                                            <br>
                                    	        상품 대표 사진 : <img src="../pd_img_upload/${productVO.pd_img_name_f }" alt="">${productVO.pd_img_name_f}<br>
											<br>
											상품 상세 사진1 : <img src="../pd_img_upload/${productVO.pd_img_name_s }" alt="">${productVO.pd_img_name_s}
                                            <hr>
                                            <div class="button-box" align="center">
                                                <button type="submit" class="default-btn floatright">상품 수정하기</button>
                                                <button type="button" class="default-btn floatright" onclick="location.href='productSellerList' ">판매자 페이지로 돌아가기</button>
                                            </div>
                                            
                                        </form>
                                        
                                        
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- register-area end -->
<jsp:include page="../inc/footer.jsp"></jsp:include>
