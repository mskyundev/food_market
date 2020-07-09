<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../inc/header.jsp"></jsp:include>


 <div class="breadcrumb-area pt-205 pb-210" style="background-image:url(../pd_img_upload/살구2.jpg)">
                <div class="container">
                    <div class="breadcrumb-content">
                        <h2>register</h2>
                        <ul>
                            <li><a href="#">home</a></li>
                            <li> register </li>
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
                                    
                                    
                                        <form action="" method="post" enctype="multipart/form-data" >
                                    		<!-- radio box pd_category 카테고리에 넣기 -->
                                    		상품 카테고리 (반드시 하나는 선택해야합니다. ) 
                                    		<br>
                                    		<br>
                                    		<div>
                                    		<input type="radio" name="pd_category" value="과일" checked="checked">과일
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
                                        	상품번호 : <input type="text" name="pd_idx" placeholder="" required="required" value="${pd_idx }" readonly>
                                            <input type="text" name="pd_name" placeholder="상품명" required="required" maxlength="50">
                                            <input type="text" name="pd_price" placeholder="상품가격(숫자만 입력하세요)"required="required"  pattern="[0-9]+"  maxlength="7" > 
                                            <input type="text" name="pd_size" placeholder="포장단위별 용량(중량), 수량, 크기 (예: 1box(7kg 내외))"required="required"  maxlength="30">
                                            <input type="text" name="pd_origin" placeholder="제조국 또는 원산지 (예: 국내산)"required="required"maxlength="10">
                                            <input type="hidden" name="member_mb_id" value="${sessionScope.mb_id }"  required="required" maxlength="30" readonly>
                                            <input type="text" name="pd_stock" placeholder="상품 재고 갯수" required="required"  pattern="[0-9]+"  maxlength="3" > 
                                            <br>
                                    	        상품 대표 사진 : <input type="file" name="file1"  required="required">
											상품 상세 사진1 : <input type="file" name="file2" required="required">   
                                            <div class="button-box">
                                                <button type="submit" class="default-btn floatright">상품 등록하기</button>
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
