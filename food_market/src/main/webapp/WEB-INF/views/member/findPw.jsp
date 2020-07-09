<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="../pd_img_upload/food market_LOGO.png"><title>FoodMarket-비밀번호 찾기</title>
<link rel="stylesheet" href="../assets/css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
var pwJ = /^[A-Za-z0-9]{4,12}$/;
var pw2J = /^[A-Za-z0-9]{4,12}$/;
$(document).ready(function(){
	$('#mb_pw2').blur(function() {
		if ($('#mb_pw').val() != $(this).val()) {
			$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
			$('#pw2_check').css('color', 'red');
		} 
		else if($('#mb_pw').val() == $(this).val()) {
			$('#pw2_check').text('비밀번호 일치 확인!');
			$('#pw2_check').css('color', 'green');
		} else {
			$('#pw2_check').text('');
		}
	});
	
	$('form').on('submit',function(){
	var inval_Arr = new Array(1).fill(false);
	if (($('#mb_pw').val() == ($('#mb_pw2').val()))
			&& pwJ.test($('#mb_pw').val())) {
			inval_Arr[0] = true;
		} else {
			inval_Arr[0] = false;
			alert('비밀번호를 확인하세요.');
			$('#mb_pw').focus();
			return false;
		}
	
	if(inval_Arr[0] == true){ // 유효성 모두 통과
		var formData = $('#userCheck').serialize();
		$.ajax({
			async : true,
			type : 'POST',
			data : formData,
			url : 'changePw',
			success : function(data) {
				alert('비밀번호 변경이 완료되었습니다.');
				window.close();
			}
		});
	} else{
		alert('입력 값을 다시 확인해주세요.')
	}
		
		
	});
});

</script>
</head>
<body>
<div class="register-area ptb-100">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-12 col-lg-6 col-xl-6 ml-auto mr-auto">
					<div class="login">
						<div class="login-form-container">
							<div class="login-form">
								
								<form method="post" name="userCheck" action="changePw" role="form">
									<label id="fp">비밀번호 찾기</label>
									<!-- 아이디 -->
									<div>
									<input type="hidden" name="mb_id" value="${mb_id}">
									</div>
										<!-- 비번 -->
										<div class="form-group">
											<label for="mb_pw">비밀번호</label> <input type="password"
												class="form-control" id="mb_pw" name="mb_pw"
												placeholder="Password">
											<div class="eheck_font" id="pw_check"></div>
										</div>
										<!-- 비번2 -->
										<div class="form-group">
											<label for="mb_pw2">비밀번호 확인</label> <input type="password"
												class="form-control" id="mb_pw2" name="mb_pw2"
												placeholder="Password Check">
											<div class="eheck_font" id="pw2_check"></div>
										</div>
									<div class="button-box">
										<input type="submit" class="default-btn floatright" value="인증">
									</div>
									
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>