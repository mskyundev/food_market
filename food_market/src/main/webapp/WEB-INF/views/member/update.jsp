<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!Doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<link rel="shortcut icon" type="image⁄x-icon" href="../pd_img_upload/food market_LOGO.png"><title>FoodMarket</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- all css here -->
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/magnific-popup.css">
<link rel="stylesheet" href="../assets/css/animate.css">
<link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="../assets/css/slinky.min.css">
<link rel="stylesheet" href="../assets/css/meanmenu.min.css">
<link rel="stylesheet" href="../assets/css/slick.css">
<link rel="stylesheet" href="../assets/css/ionicons.min.css">
<link rel="stylesheet" href="../assets/css/bundle.css">
<link rel="stylesheet" href="../assets/css/style.css">
<link rel="stylesheet" href="../assets/css/responsive.css">
<script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
//모든 공백 체크 정규식
// var empJ = /\s/g;
var idJ = /^[a-z0-9][a-z0-9_\-]{3,19}$/;
var pwJ = /^[A-Za-z0-9]{4,12}$/;
var pw2J = /^[A-Za-z0-9]{4,12}$/;
var nameJ = /^[가-힣]{2,5}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var phoneJ = /^01([0|1|7|9]?)?([0-9]{3,4})?([0-9]{4})$/;
var birthJ = false;
var address = $('#mb_address1');
$(document).ready(function() {
var address = $('#mb_address1');

//아이디 중복확인
$("#mb_id").blur(function() {
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
		url : 'idCheck',
		success : function(data) {
			if(data==$('#mb_id').val()){
				$('#id_check').text('중복된 아이디 입니다.');
				$('#id_check').css('color', 'red');
				$("#usercheck").attr("disabled", true);
				
			} else{
				if(idJ.test(mb_id)){
					$('#id_check').text('사용가능한 아이디 입니다.');
					$('#id_check').css('color', 'blue');
					$("#usercheck").attr("disabled", false);
				} else if(mb_id==''){
					$('#id_check').text('아이디를 입력해주세요.');
					$('#id_check').css('color', 'red');
					$("#usercheck").attr("disabled", true);
				} else{
					$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
					$('#id_check').css('color', 'red');
					$("#usercheck").attr("disabled", true);
				}
			}
		}
	});//ajax
	}//else if
});//blur(function)

// submit 가동 시 해당 role="form" 지정값들을 확인할수 있도록 설정
$('form').on('submit',function(){
var inval_Arr = new Array(8).fill(false);
	if (idJ.test($('#mb_id').val())) {
		inval_Arr[0] = true;
	} else {
		inval_Arr[0] = false;
		alert('아이디를 확인하세요.');
		return false;
	}
// 비밀번호가 같은 경우 && 비밀번호 정규식
	if (($('#mb_pw').val() == ($('#mb_pw2').val()))
		&& pwJ.test($('#mb_pw').val())) {
		inval_Arr[1] = true;
	} else {
		inval_Arr[1] = false;
		alert('비밀번호를 확인하세요.');
		return false;
	}
	// 이름 정규식
	if (nameJ.test($('#mb_name').val())) {
		inval_Arr[2] = true;
	} else {
		inval_Arr[2] = false;
		alert('이름을 확인하세요.');
	return false;
	}
	// 생년월일 정규식
	if (birthJ) {
		console.log(birthJ);
		inval_Arr[3] = true;
	} else {
		inval_Arr[3] = false;
		alert('생년월일을 확인하세요.');
		return false;
	}
	// 이메일 정규식
	if (mailJ.test($('#mb_email').val())){
		console.log(phoneJ.test($('#mb_email').val()));
		inval_Arr[4] = true;
	} else {
		inval_Arr[4] = false;
		alert('이메일을 확인하세요.');
		return false;
	}
	// 휴대폰번호 정규식
	if (phoneJ.test($('#mb_mobile').val())) {
		console.log(phoneJ.test($('#mb_mobile').val()));
		inval_Arr[5] = true;
	} else {
		inval_Arr[5] = false;
		alert('휴대폰 번호를 확인하세요.');
		return false;
	}
	//회원 구분
	if(member.mb_seller[0].checked==false&&member.mb_seller[1].checked==false){
		inval_Arr[6] = false;
		alert('구분을 체크해주세요.');
		return false;
	} else{
		inval_Arr[6] = true;
	}
	//주소확인
	if(address.val() == ''){
		inval_Arr[7] = false;
		alert('주소를 확인하세요.');
		return false;
	}else
		inval_Arr[7] = true;
	
	//전체 유효성 검사
	var validAll = true;
	for(var i = 0; i < inval_Arr.length; i++){
		if(inval_Arr[i] == false){
			validAll = false;
		}
	}
	if(validAll == true){ // 유효성 모두 통과
		alert('회원가입이 완료되었습니다.');
	} else{
		alert('정보를 다시 확인하세요.')
	}
});

// 표출되는 유효성

// 비밀번호 유효성
$('#mb_pw').blur(function() {
	if (pwJ.test($('#mb_pw').val())) {
		console.log('true');
		$('#pw_check').text('');
	} else {
		console.log('false');
		$('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
		$('#pw_check').css('color', 'red');
	}
});

//1~2 패스워드 일치 확인
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

//이름  유효성/특수문자 들어가지 않도록 설정
$("#mb_name").blur(function() {
	if (nameJ.test($(this).val())) {
		console.log(nameJ.test($(this).val()));
		$("#name_check").text('');
	} else {
		$('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
		$('#name_check').css('color', 'red');
		}
});
// 이메일 유효성
$("#mb_email").blur(function() {
	if (mailJ.test($(this).val())) {
		$("#email_check").text('');
	} else {
		$('#email_check').text('이메일 양식을 확인해주세요. Ex) id@mail.com');
		$('#email_check').css('color', 'red');
	}
});

// 생일 유효성 검사
var birthJ = false;
// 생년월일 유호성 / birthJ로 유효성 검사
$('#mb_birth').blur(function(){
var dateStr = $(this).val();
var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
var today = new Date(); // 날짜 변수 선언
var yearNow = today.getFullYear(); // 올해 연도 가져옴

	if (dateStr.length <=8) {
	// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환.
		if (year > yearNow || year < 1900 ){ // 년도설정
			$('#birth_check').text('생년월일을 확인해주세요');
			$('#birth_check').css('color', 'red');
		} else if (month < 1 || month > 12) { // 월 설정
			$('#birth_check').text('생년월일을 확인해주세요 ');
			$('#birth_check').css('color', 'red');
		} else if (day < 1 || day > 31) { // 일자 설렁
			$('#birth_check').text('생년월일을 확인해주세요 ');
			$('#birth_check').css('color', 'red');
		}else if ((month==4 || month==6 || month==9 || month==11) && day==31) { // 특정 월에 대한 31일 설정
			$('#birth_check').text('생년월일을 확인해주세요 ');
			$('#birth_check').css('color', 'red');
		}else if (month == 2) { // 2월은 30일도없어 퉤
		var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			if (day>29 || (day==29 && !isleap)) { // 2월로 인한 새로운 if
				$('#birth_check').text('생년월일을 확인해주세요 ');
				$('#birth_check').css('color', 'red');
			}else{
				$('#birth_check').text('');
				birthJ = true;
			}
		}else{
			$('#birth_check').text('');
			birthJ = true;
		}//end of if
	}else{
	//1.입력된 생년월일이 8자 초과할때 : auth:false
		$('#birth_check').text('생년월일을 확인해주세요 ');
		$('#birth_check').css('color', 'red');
	}
}); //생년월일 End of method /*
});
// 휴대전화 유효성
$('#mb_mobile').blur(function(){
	if(phoneJ.test($(this).val())){
		console.log(nameJ.test($(this).val()));
		$("#phone_check").text('');
	} else {
		$('#phone_check').text('휴대폰번호를 확인해주세요 ');
		$('#phone_check').css('color', 'red');
	}
});

// 상세주소 유효성
$('#mb_address1').blur(function(){
	if(phoneJ.test($(this).val())){
		console.log(nameJ.test($(this).val()));
		$("#mb_address1").text('');
	} else {
		$('#mb_address1').text('상세주소를 확인해주세요 ');
		$('#mb_address1').css('color', 'red');
	}
});

// 주소찾기 api 클릭 이벤트
function execPostCode() {
	new daum.Postcode({
		oncomplete: function(data) {
		// 주소찾기 검색창에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 도로명 조합형 주소 변수
			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if(fullRoadAddr !== ''){
				fullRoadAddr += extraRoadAddr;
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			console.log(data.zonecode);
			console.log(fullRoadAddr);
			/* var a = console.log(data.zonecode);
			var b = console.log(fullRoadAddr);
			if(a == null || b = null){
			alert("주소를 확인하세요.");
			return false;
			} */
			$("[name=mb_postcode]").val(data.zonecode);
			$("[name=mb_address]").val(fullRoadAddr);
			document.getElementById('mb_postcode').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('mb_address').value = fullRoadAddr;
			//document.getElementById('mb_address1').value = data.jibunAddress;
		}
	}).open();
}
</script>
<style type="text/css">

 .form-group input[type=radio] {
 margin-left: 1em;
 width:1.5em; 
 height: 1.5em;
 vertical-align: text-top;
 }
.se {
font-size: 18px;
margin-left: 7px;
}
.btn btn-primary
</style>

</head>
<body>
	<!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- header start -->
	<div class="wrapper">
		<jsp:include page="../inc/header.jsp"></jsp:include>

		<!-- main-search start -->
		<div class="main-search-active">
			<div class="sidebar-search-icon">
				<button class="search-close">
					<span class="ion-android-close"></span>
				</button>
			</div>
			<div class="sidebar-search-input">
				<form>
					<div class="form-search">
						<input id="search" class="input-text" value=""
							placeholder="Search Entire Store" type="search">
						<button>
							<i class="ion-ios-search-strong"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
		<!-- main-search start -->
		<div class="cur-lang-acc-active">
			<div class="wrap-sidebar">
				<div class="sidebar-nav-icon">
					<button class="op-sidebar-close">
						<span class="ion-android-close"></span>
					</button>
				</div>
				<div class="cur-lang-acc-all">
					<div class="single-currency-language-account">
						<div class="cur-lang-acc-title">
							<h4>
								Currency: <span>USD </span>
							</h4>
						</div>
						<div class="cur-lang-acc-dropdown">
							<ul>
								<li><a href="#">EUR Euro</a></li>
							</ul>
						</div>
					</div>
					<div class="single-currency-language-account">
						<div class="cur-lang-acc-title">
							<h4>
								Language: <span><img
									src="../assets/img/icon-img/english.png" alt=""> English
								</span>
							</h4>
						</div>
						<div class="cur-lang-acc-dropdown">
							<ul>
								<li><a href="#"><img
										src="../assets/img/icon-img/english.png" alt=""> English
								</a></li>
								<li><a href="#"><img
										src="../assets/img/icon-img/es.png" alt=""> spanish </a></li>
								<li><a href="#"><img
										src="../assets/img/icon-img/fr.png" alt=""> french </a></li>
								<li><a href="#"><img
										src="../assets/img/icon-img/ge.png" alt=""> german </a></li>
								<li><a href="#"><img
										src="../assets/img/icon-img/es.png" alt=""> spanish </a></li>
							</ul>
						</div>
					</div>
					<div class="single-currency-language-account">
						<div class="cur-lang-acc-title">
							<h4>My Account:</h4>
						</div>
						<div class="cur-lang-acc-dropdown">
							<ul>
								<li><a href="#">Compare Products </a></li>
								<li><a href="#">Default welcome msg!</a></li>
								<li><a href="register.html">register</a></li>
								<li><a href="wishlist.html">My Wish List</a></li>
								<li><a href="login.html">Sign In </a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="breadcrumb-area pt-205 pb-210"
			style="background-image: url(../assets/img/bg/breadcrumb.jpg)">
			<div class="container">
				<div class="breadcrumb-content">
					<h2>register</h2>
					<ul>
						<li><a href="/food_market/">home</a></li>
						<li>register</li>
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
									<form method="post" role="form" id="usercheck" name="member">
									<!-- 			action="memberjoinpro"  -->
									<!-- 아이디 -->
									<div class="form-group">
										<label for="mb_id">아이디</label> <input type="text"
											class="form-control" id="mb_id" name="mb_id" placeholder="ID">
										<div class="eheck_font" id="id_check"></div>
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
									<!-- 이름 -->
									<div class="form-group">
										<label for="mb_name">이름</label> <input type="text"
											class="form-control" id="mb_name" name="mb_name"
											placeholder="Name">
										<div class="eheck_font" id="name_check"></div>
									</div>
									<!-- 생년월일 -->
									<div class="form-group">
										<label for="mb_birth">생년월일</label> <input type="tel"
											class="form-control" id="mb_birth" name="mb_birth"
											placeholder="ex) 19990101">
										<div class="eheck_font" id="birth_check"></div>
									</div>
									<!-- 이메일 -->
									<div class="form-group">
										<label for="mb_email">이메일 주소</label> <input type="email"
											class="form-control" id="mb_email" name="mb_email"
											placeholder="E-mail">
										<div class="eheck_font" id="email_check"></div>
									</div>
									<!-- 휴대폰 -->
									<div class="form-group">
										<label for="mb_mobile">휴대폰 번호('-'없이 번호만 입력해주세요)</label> <input
											type="tel" class="form-control" id="mb_mobile"
											name="mb_mobile" placeholder="Phone Number">
										<div class="eheck_font" id="phone_check"></div>
									</div>
									<!-- 구분 -->
									<div class="form-group">
										<label for="mb_seller">구분 </label><br> 
										<input type="radio" id="mb_seller" name="mb_seller" value="0"><a class="se">seller</a>&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" id="mb_seller2" name="mb_seller" value="1"><a class="se">customer</a>
									</div>
									<!-- 주소(우편) -->
									<div class="form-group">
										<input class="form-control"
											style="width: 40%; display: inline;" placeholder="우편번호"
											name="mb_postcode" id="mb_postcode" type="text"
											readonly="readonly">
										<button type="button" class="btn btn-default"
											onclick="execPostCode();">
											<i class="fa fa-search"></i> 우편번호 찾기
										</button>
									</div>
									<!-- 주소(도로명/상세) -->
									<div class="form-group">
										<input class="form-control" style="top: 5px;"
											placeholder="도로명 주소" name="mb_address" id="mb_address"
											type="text" readonly="readonly" /> <input
											class="form-control" placeholder="상세주소" name="mb_address1"
											id="mb_address1" type="text" />
									</div>
									<!-- 버튼 -->
									<div class="form-group text-center">
										<button type="submit" class="btn btn-primary">회원가입</button>
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
		<footer class="footer-area gray-bg pt-100 pb-95">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-5 col-12">
						<div class="footer-widget">
							<div class="footer-widget-l-content">
								<h4>20 Years Experience</h4>
								<ul>
									<li><a href="#"><i class="ion-social-twitter"></i></a></li>
									<li><a href="#"><i class="ion-social-tumblr"></i></a></li>
									<li><a href="#"><i class="ion-social-facebook"></i></a></li>
									<li><a href="#"><i
											class="ion-social-instagram-outline"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-7 col-12">
						<div class="footer-widget">
							<div class="footer-widget-m-content text-center">
								<div class="footer-logo">
									<a href="#"><img src="../pd_img_upload/food market_LOGO.png"  width="200"></a>
								</div>
								<div class="footer-nav">
									<nav>
										<ul>
											<li><a href="index.html">home</a></li>
											<li><a href="about-us.html">about us</a></li>
											<li><a href="shop-grid-view-sidebar.html">shop </a></li>
											<li><a href="blog-left-sidebar.html"> blog </a></li>
											<li><a href="#">pages </a></li>
										</ul>
									</nav>
								</div>
								<p>
									Copyright <i class="fa fa-copyright"></i> 2018 <a
										href="https://freethemescloud.com/" target="_blank">Free
										Themes Cloud.</a> All rights reserved.
								</p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-12 col-12">
						<div class="footer-widget f-right">
							<div class="footer-widget-r-content">
								<ul>
									<li><span>Phone :</span> +00 123 54 0056</li>
									<li><span>Email : </span> <a href="#">neha@gmail.com</a></li>
									<li><span>Address :</span> Dhaka Bangladesh</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>

	<!-- all js here -->
	<script src="../assets/js/vendor/jquery-1.12.0.min.js"></script>
	<script src="../assets/js/popper.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/js/jquery.magnific-popup.min.js"></script>
	<script src="../assets/js/isotope.pkgd.min.js"></script>
	<script src="../assets/js/imagesloaded.pkgd.min.js"></script>
	<script src="../assets/js/jquery.counterup.min.js"></script>
	<script src="../assets/js/waypoints.min.js"></script>
	<script src="../assets/js/slinky.min.js"></script>
	<script src="../assets/js/ajax-mail.js"></script>
	<script src="../assets/js/owl.carousel.min.js"></script>
	<script src="../assets/js/plugins.js"></script>
	<script type="text/javascript">
		// grab an element
		var myElement = document.querySelector(".intelligent-header");
		// construct an instance of Headroom, passing the element
		var headroom = new Headroom(myElement);
		// initialise
		headroom.init();
	</script>
	<script src="../assets/js/main.js"></script>
</body>
</html>
