<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    

<script src="https://code.jquery.com/jquery-2.2.1.js"></script>

<!DOCTYPE html>
<style>
	#top{ background-color: #D3D3D3;
	background-color:rgba(211,211,211,0.4);
	height: 80px;
	font-family: 'Nanum Gothic', sans-serif;
	color: #696969;
	font-size: 25px;
	}
	#top h3{padding-top:20px; 
	}
	
	
	#bordercenter{border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  	margin : 20px 10px;
  	font-family: 'Nanum Gothic', sans-serif;}
  
  	#bordercenter th{ width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;}
    
  	#bordercenter td{width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;}
    
    .btn-theme{width: 80px;
    height: 40px;
	font-family: 'Nanum Gothic', sans-serif;
    }
    
</style>

<div id= "top">
<h3 align="center" >Q&A 답변</h3>
</div>

<div id = "body" align="center">
<table id="bordercenter" >
<form method="post" id="multiform2">
<input type = "hidden" name="qna_num" value="${qvo.qna_num}">
<input type = "hidden" name="qna_re_ref" value="${qvo.qna_re_ref}">
<input type = "hidden" name="qna_re_lev" value="${qvo.qna_re_lev}">
<input type = "hidden" name="qna_re_seq" value="${qvo.qna_re_seq}">
                           

<tr>
<th><label>상품번호</label></th>
<td><input type="text" class="form-control" value="${qvo.pd_idx}" name="pd_idx" readonly="readonly"><br> </td>
</tr> 

<tr>
<th><label>작성자</label></th>
<td><input type="text" name="mb_id" value="${qvo.mb_id}" class="form-control" readonly="readonly"><br></td>
</tr>
<tr>
<th><label>답변내용</label></th> 
<td><textarea rows="8" cols="50" class="form-control" id="qna_content" name="qna_content" >
</textarea><br></td>
</tr>
</form>
</table>
<button type="button" onclick="javascript:check(),self.close(),window.opener.location.reload();" class="btn btn-theme">확인</button>
</div>





		<script>	
		$(document).ready(function() { 
	
			$('.btn-theme').on("click", function(){
			
				if ($('#qna_content').val()=="") {
					$('#qna_content').html("답변 내용을 입력해주세요.");
					$('#qna_content').css('color', 'red');
					alert("답변 내용을 입력하세요 ");
					return false;
				}
			
				
				
				var formData = $('#multiform2').serialize();
				
				$.ajax({
					type:'post',
					url:'qnareplywrite',
					cache:false,
					data:formData,
					 success : onSuccess,
					   error : onError
	
				});

			});
	});
	
	function onSuccess(json, status){
	
			window.opener.location.reload();
			window.close();

	}
	function onError(data, status){
	 alert("error");
	}
		</script>
