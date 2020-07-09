<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="../pd_img_upload/food market_LOGO.png"><title>FoodMarket</title>
<link rel="stylesheet" href="../assets/css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
#fp {
text-align: center;
font-size: 27px;
color:gray;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
// 	$('#mb_email').hide();
	$('#em').hide();
	$('#eco').hide();
})
var idJ = /^[a-z0-9][a-z0-9_\-]{3,19}$/;
function emCheck() {
	if($('#mb_id').val()==''){
		$('#id_check').text('아이디를 입력하세요.');
		$('#id_check').css('color', 'red');
	} else if(idJ.test($('#mb_id').val())!=true){
		$('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
		$('#id_check').css('color', 'red');
	} else if($('#mb_id').val()!=''){	
	var mb_id=$('#mb_id').val();
		$.ajax({
		async : true,
		type : 'POST',
		data : {mb_id:$('#mb_id').val()}, //mb_id라는 이름으로 mb_id라는 데이터를 @WebServlet("/idsearch")에 보낸다
		url : 'findCheck.do',
		success : function(data) {
			if(data!=null){
				mb_email = data.mb_email;
				$("#mb_email").val(mb_email)
				$("#userCheck").attr("disabled", true);
				$("#em").click();
				alert("확인중입니다.")
			} else{
				alert('아이디를 정확히 입력해주세요')
				$('#mb_id').focus();
			}
			}
		});//ajax
	};
	}//else if
	
function email() {
	if($('#mb_email').val()!=''){	
		$.ajax({
			async : true,
			type : 'POST',
			data : {mb_email:$('#mb_email').val()},
			url : 'sendEmail',
			success : function(data) {
			alert("이메일이 발송되었습니다.")
			auth=data.auth;
			$('#authNum').val(auth);
			$('#eco').show();
			$('#user').hide();
			}
		});
	}
}
function codeCheck(){
	if($('#ecode').val()==''){
		$('#ecode_check').text('인증번호를 입력해주세요.');
		$('#ecode_check').css('color', 'red');
		$("#usercheck").attr("disabled", true);		
	}else if($('#ecode').val()==$('#authNum').val()){
		$('#ecode_check').text('인증번호 일치!');
		$('#ecode_check').css('color', 'green');
		$('#ecode').attr("readonly",true);
		$("#usercheck").attr("disabled", false);
		$('#submit').css("display","block")
		document.userCheck.submit();
	}else{
		$('#ecode_check').text('인증번호가 일치하지 않습니다.');
		$('#ecode_check').css('color', 'red');
		$("#usercheck").attr("disabled", true);
	}
}
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
								<div id="user">
								<form method="post" name="userCheck"  action="findPw">
									<label id="fp">비밀번호 찾기</label><br>
									<!-- 아이디 -->
										<div class="form-group">
											<label for="mb_id">아이디</label> 
											<input type="text" class="form-control" id="mb_id" name="mb_id"
												placeholder="ID">
											<div class="eheck_font" id="id_check"></div>
										</div>
										<input type="hidden" class="form-control" id="mb_email" name="mb_email">
									<div class="button-box">
										<input type="button" class="default-btn floatright" value="확인" onclick="emCheck()">
									</div>
									<div class="button-box">
											<input type="button" class="default-btn floatright" value="발송" id="em" onclick="email()">
									</div>
								</form>
								</div>
								<div id="eco">
								<form name="findPw">
								<label id="fp">비밀번호 찾기</label><br>
								<div class="form-group">								
									<label for="email_code">인증번호 입력</label> <input type="text"
										id="ecode" name="ecode">
									<div class="button-box">
									<input type="button" id="ecodeCheck" onclick="codeCheck();" value="인증">
									</div>
									<input type="hidden" id="authNum" name="authNum">
									<div class="eheck_font" id="ecode_check"></div></div>
								</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>