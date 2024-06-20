<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="webjars/bootstrap/5.3.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
		
	$("#userId").on("keyup",function(){
  			 
		$.ajax({
			url:'userId-check',
  		  	method:'get',
  		  	dataType:"text",
  		  	data:{
  		  		"userId":$(this).val()
  		  		},
  		  		success:function(res, status ,xhr){
  		  			$("#result").text(res);
  		  		},
  		  		error:function(){}
  		});
	});
	
	// pw 확인
	$("#passwd2").on("keyup", function(){
		var passwd = $("#userPw").val();
		var passwd2 = $("#passwd2").val();
		var mesg = "비밀번호 일치";
		if(passwd != passwd2){
			mesg = "비밀번호 불일치";
		}
		
		$("#pwdcheck").text(mesg);
	});// end pw 확인
	
	
	
	// id 중복 체크
	$("#idDupulicatedcheck").on("click", function(){
		// jQuery Ajax
		$.ajax({
            method:"get",
            url:"idCheck", // MemberIDCheckServlet의 mapping값
            dataType:'text', // 응답되는 데이터 타입, (사용가능|사용불가)
            data:{
            	userId:$("#userId").val() // 세미콜론 안 붙임 value니까. 여러 개면 , 넣고 추가
            }, // json 형태로 데이터 입력, key:value
            success:function(data, status, xhr){ // 응답이 성공하면
                console.log("data:", data);
                console.log("status:", status);
                $("#idcheck").text(data);
            	// console.log($("#userId").val());
            },
            error:function(xhr, status, error){ // 응답이 실패하면
                console.log("error:", error);
            	// console.log($("#userId").val());
            }
        });
	});// end id 중복 체크
	
	// 회원가입 submit
	$("form").on("submit", function(){
		alert("회원가입되었습니다."); // submit 후 나타나는 알림창
	});
	
	// 이메일 select
	$("#email3").on("click", function(){
		$("#email2").val($("#email3").val());
	});
	
	
/* 	// 비밀번호 mask
	$("#userPw").on("keyup", function(){
		var userPw = $(this).val();
		var maskedPw = maskPw(userPw);
		$("#userPw").text(maskedPw);
	});
	
	function maskPw(pw){
		return '*'.repeat(pw.length);
	} */
	
});
</script>


<div class="TodoApp">
	<div class="container">
		<div class="Login">
			<h1>회원가입</h1>
            <div class="signUpForm">
            	<form:form  method="post" modelAttribute="member" action="signup">
          
          			<div class="row mb-3">
		    			<label for="userId" class="col-sm-2 col-form-label">*아이디</label>
		    			<div class="col-auto">
		      				<form:input type="text" class="form-control" path="userId" required="required"/>
		      				<form:errors path="userId" cssClass="text-warning"/>
		    			</div>
		    			<div class="col-auto">
			    			<button type="button" class="btn btn-primary mb-3" id="idDupulicatedcheck">아이디중복</button>
  						</div>
  						<div class="col-sm-3">
		         			<span id="idcheck" class="fs-5"></span>
		        		</div>
		  			</div>
		 
		 			<div class="row mb-3">
		    			<label for="userPw" class="col-sm-2 col-form-label">*비밀번호</label>
		    			<div class="col-auto">
		      				<form:input type="password" class="form-control" path="userPw" required="required"/>
		      				<form:errors path="userPw" cssClass="text-warning"/>
		    			</div>
		  			</div>
		  			<div class="row mb-3">
		    			<label for="passwd2" class="col-sm-2 col-form-label">*비밀번호확인</label>
		    			<div class="col-sm-5">
		      				<input type="password" class="form-control" name="passwd2" id="passwd2">
		    				</div>
		    			<div class="col-sm-3">
		      				<span id="pwdcheck" class="fs-5"></span>
		    			</div>
		  			</div>
		  			
		  			<div class="row mb-3">
		    			<label for="userName" class="col-sm-2 col-form-label">*이름</label>
		    			<div class="col-auto">
		      				<form:input type="text" class="form-control" path="userName" required="required"/>
		      				<form:errors path="userName" cssClass="text-warning"/>
		    			</div>
		  			</div>
		  
                <hr>
                <div class="row mb-3">
		      	<div class="col-auto">
			    	<label for="post" class="visually-hidden">post</label>
			    	<input type="text" name="post" class="form-control" id="post" placeholder="우편번호">
			  	</div>
			  	<div class="col-auto">
			    	<button type="button" class="btn btn-primary mb-3" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
  			  	</div>
		  	</div>
		   	<div class="row mb-3">
		    	<div class="col-sm-5">
			    	<label for="addr1" class="visually-hidden">도로명주소</label>
			    	<input type="text"  name="addr1" class="form-control" id="addr1" placeholder="도로명주소">
			  	</div>
				<div class="col-sm-5">
			    	<label for="addr2" class="visually-hidden">지번주소</label>
			    	<input type="text" name="addr2" class="form-control" id="addr2" placeholder="지번주소">
			    	<span id="guide" style="color:#999"></span>
			  	</div>
		  	</div>
		  	<hr>
		  	<div class="row mb-3">
		    	<label for="phone1" class="col-sm-2 col-form-label">전화번호</label>
		     	<div class="col-auto">
		      		<select name="phone1" class="form-control" id="phone1">
				 		<option value="010">010</option>
				 		<option value="011">011</option>
					</select>
			   	</div>	
				<div class="col-auto">
					<label for="phone2" class="visually-hidden">전화번호2</label>
			  		<input type="text" name="phone2" class="form-control" id="phone2">
				</div>
				<div class="col-auto">
			  		<label for="phone3" class="visually-hidden">전화번호3</label> 
			  		<input type="text" name="phone3" class="form-control" id="phone3">
				</div>
			</div>
		  	<div class="row mb-3">
				<label for="email1" class="col-sm-2 col-form-label">이메일</label>
		    	<div class="col-auto">
			  		<input type="text" name="email1" class="form-control" id="email1">
				</div>
				<div class="col-auto">
			  		<label for="xxx" class="visually-hidden">@</label>
			  		<span>@</span>
				</div>
				<div class="col-auto">
			  		<label for="email2" class="visually-hidden">이메일2</label>
			  		<input type="text" name="email2" class="form-control" id="email2" placeholder="직접입력">
				</div>
				<label for="email3" class="visually-hidden">이메일2</label>
		     	<div class="col-auto">
		      		<select name="email3" class="form-control" id="email3">
				  		<option value="daum.net">daum.net</option>
				  		<option value="google.com">google.com</option>
						<option value="naver.com">naver.com</option>
					</select>
			   	</div>	
				</div>
	                <div>
                    	<button name="login" class="btn btn-success m-5" >signup</button>
                	</div>
            	</form:form> 
            </div>
        </div>
	</div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullRoadAddr;
                document.getElementById('addr2').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>