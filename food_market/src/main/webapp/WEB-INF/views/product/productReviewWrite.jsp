<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../inc/header.jsp"></jsp:include>
<style type="text/css">
.starR{
  background: url('../pd_img_upload/star.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
 .starR.on{background-position:0 0;} 
</style>



 <div class="breadcrumb-area pt-205 pb-210" style="background-image: url(../pd_img_upload/전체상품.jpg)">
                <div class="container">
                    <div class="breadcrumb-content">
                        <h2>register</h2>
                        <ul>
                            <li><a href="#">home</a></li>
                            <li> 상품평 작성 </li>
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
											<br>
											<div align="center">★리뷰는 최초 작성 후 수정, 삭제 할 수 없습니다★</div>
											<br>
											<!-- hidden주기 -->
											회원아이디<input type="text" name="member_mb_id" value="${sessionScope.mb_id }" placeholder="회원 아이디" required="required" readonly> 
						<!-- url에서 들고오기 od_idx-->주문번호<input type="text" name="order_od_idx" value="${od_idx }" readonly> 
                        <!-- url에서 들고오기 pd_idx-->상품번호<input type="text" name="product_pd_idx"  value="${pd_idx }" readonly> 
                        <!-- 최대 갯수 생성하기 -->리뷰번호<input type="text" name="pd_re_idx" value="${pd_re_idx }" required="required" readonly >
                                            
                                            <!-- hidden주기 -->
											평점
											<!-- 별점 누르기 -->
											<div class="starRev">
												<span class="starR on" id="2"></span> 
												<span class="starR" id="4"></span>
												<span class="starR" id="6"></span> 
												<span class="starR" id="8"></span> 
												<span class="starR" id="10"></span>
											</div>
											<input type="text" name="pd_re_star" id = "pd_re_star" required="required" value="2" readonly>
                                            <!-- 별점 누르기 -->
                           			                
                                            
                            		                상품평 입력(최대 50자)
                                            <input type="text" name="pd_re_subject" placeholder="상품평을 입력하세요(최대 50자)" required="required" maxlength="50" > 
                                            
                                            <br>
                                    	        리뷰 사진 : <input type="file" name="file1"  required="required">
                                            <div class="button-box">
                                                <button type="submit" class="default-btn floatright">리뷰 등록하기</button>
                                                <button type="button" class="default-btn floatright" onclick="location.href='${path}/food_market/' ">결제 내역 페이지로 돌아가기</button>
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
<!-- //https://miuus.tistory.com/2 -->
<script type="text/javascript">
$(document).ready(function() {
	
	$('.starRev span').click(function(e){
		
		
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  
		  e.preventDefault();
		  
		  var star = $(this).attr("id");
		  
// 		  alert("별점  : "+star);
		  $('#pd_re_star').val(star); 
		  return false;
	});

//class에 on갯수 구해서 갯수 만큼 수 넣기 ajax




})


</script>
