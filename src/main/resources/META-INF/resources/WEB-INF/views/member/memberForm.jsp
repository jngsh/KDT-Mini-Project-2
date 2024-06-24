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
	
	$("#passwd2").on("keyup", function(){
		var passwd = $("#userPw").val();
		var passwd2 = $("#passwd2").val();
		var mesg = "비밀번호 일치";
		if(passwd != passwd2){
			mesg = "비밀번호 불일치";
		}
		
		$("#pwdcheck").text(mesg);
	});
	
	
	$("#idDupulicatedcheck").on("click", function(){
		$.ajax({
            method:"get",
            url:"idCheck",
            dataType:'text',
            data:{
            	userId:$("#userId").val() 
            }, 
            success:function(data, status, xhr){
                console.log("data:", data);
                console.log("status:", status);
                $("#idcheck").text(data);
            },
            error:function(xhr, status, error){ 
                console.log("error:", error);
            }
        });
	});
	
	$("form").on("submit", function(){
		alert("회원가입되었습니다."); 
	});
	
	$("#email3").on("change", function(){
		$("#email2").val($("#email3").val());
	});
	
	
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
		      				<input type="password" class="form-control" name="passwd2" id="passwd2" required="required">
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
		      			<option selected disabled>선택하세요.</option>
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
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullRoadAddr = data.roadAddress; 
                var extraRoadAddr = ''; 

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                document.getElementById('post').value = data.zonecode; 
                document.getElementById('addr1').value = fullRoadAddr;
                document.getElementById('addr2').value = data.jibunAddress;

                if(data.autoRoadAddress) {
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