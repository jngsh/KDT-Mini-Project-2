<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
		
	var loginFailed = ${loginFailed};
    if (loginFailed) {
    	alert("아이디 또는 비밀번호가 잘못되었습니다. 다시 입력해 주세요.");
    }
        
});

</script>

<div class="container">
	<div class="Login">
	<h1>로그인</h1>
    <form  action="auth"  method="post"  class="row g-3 m-4">
		  <div class="row mb-3">
		    <label for="userId" class="col-sm-2 col-form-label">아이디</label>
		    <div class="col-auto">
		      <input type="text" class="form-control" id="userId" name="userId" required="required">
		    </div>
		  </div>
		 <div class="row mb-3">
		    <label for="userPw" class="col-sm-2 col-form-label">비밀번호</label>
		    <div class="col-auto">
		      <input type="password" class="form-control" name="userPw" id="userPw" required="required">
		    </div>
		  </div>
		  <div class="col-12">
		    <button type="submit" class="btn btn-primary">로그인</button>
		    <button type="reset" class="btn btn-primary">취소</button>
		  </div>
 </form>
 </div>
</div> 
