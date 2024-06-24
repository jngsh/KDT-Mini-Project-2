<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="webjars/bootstrap/5.3.3/css/bootstrap.min.css">
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#update").on("click", function(event) {
        event.preventDefault();

	        var formData = {
            	userId: $("#userId").val(),
            	userName: $("#userName").val(),
            	post: $("#post").val(),
            	addr1: $("#addr1").val(),
            	addr2: $("#addr2").val(),
        		phone1: $("#phone1").val(),
        		phone2: $("#phone2").val(),
        		phone3: $("#phone3").val(),
        		email1: $("#email1").val(),
        		email2: $("#email2").val()
        	};

        $.ajax({
            type: "POST",
            url: "updateMember",
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function(response) {
                alert("회원 정보가 수정되었습니다.");
            },
            error: function(xhr, status, error) {
                console.error(xhr);
            }
        });
    });
	
	$("#cancel").on("click", function(){
		this.action = "mypage";
		this.method = "get";
	});
	
	$("#email3").on("change", function(){
		$("#email2").val($("#email3").val());
	});
});

</script>

<style type="text/css">
	
	.mypage-container {
		display: grid;
		grid-auto-flow: column;
		grid-template-columns: 12% 80%;
	}
	
    .mypageSidebar {
        left: 20px;
        top: 50%;
        display: grid;
        grid-auto-flow: column;
        flex-direction: column;
        align-items: flex-start;
        grid-template-rows: 20%;
        margin-left: 10px;
        padding-left: 15px;
                
    }

    .pageLink {
        width: 120px;
        margin-bottom: 10px;
    }

    #mypage-form {
        margin-left: 10px;
        padding-left: 15px;
        border-left: 1px solid #ccc;
    }
</style>



<div class="mypage-container">
	<div class="mypage-sidebar">
		<div class="row g-3 m-4">
			<a id="updateMember-page" class="page-link" href="mypage">회원정보 수정</a>
			<a id="orderList-page" class="page-link" href="orderList">주문내역</a>
		</div>
	</div>
	<form class="row g-3 m-4" id="mypage-form">
		<h3>회원 정보</h3>
		<br>
		<hr>
		<div class="row mb-3">
			<label for="userId" class="col-sm-2 col-form-label">*아이디</label>
			<div class="col-auto">
				<input type="text" class="form-control" id="userId" name="userId"
					value="${member.userId}" disabled="disabled" required="required">
			</div>
		</div>

		<div class="row mb-3">
			<label for="userName" class="col-sm-2 col-form-label">*이름</label>
			<div class="col-auto">
				<input type="text" class="form-control" name="userName"
					id="userName" value="${member.userName}" required="required">
			</div>
		</div>
		<hr>
		<div class="row mb-3">
			<div class="col-auto">
				<label for="post" class="visually-hidden">post</label> <input
					type="text" name="post" value="${member.post}" class="form-control"
					id="post" placeholder="우편번호">
			</div>
			<div class="col-auto">
				<button type="button" class="btn btn-primary mb-3"
					onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-sm-5">
				<label for="addr1" class="visually-hidden">도로명주소</label>
				<input type="text" name="addr1" value="${member.addr1}"
					class="form-control" id="addr1" placeholder="도로명주소">
			</div>
			<div class="col-sm-5">
				<label for="addr2" class="visually-hidden">지번주소</label>
				<input type="text" name="addr2" value="${member.addr2}"
					class="form-control" id="addr2" placeholder="지번주소">
				<span id="guide" style="color: #999"></span>
			</div>
		</div>
		<hr>
		<div class="row mb-3">
			<label for="phone1" class="col-sm-2 col-form-label">전화번호</label>
			<div class="col-auto">
				<select name="phone1" class="form-control" id="phone1">
					<option value="010"
						<c:if test="${member.phone1 == '010'}">
			          	selected
			          </c:if>>010</option>
					<option value="011"
						<c:if test="${member.phone1 == '011'}">
			          	selected
			          </c:if>>011</option>
				</select>
			</div>
			<div class="col-auto">
				<label for="phone2" class="visually-hidden">전화번호2</label> <input
					type="text" name="phone2" value="${member.phone2}"
					class="form-control" id="phone2">
			</div>
			<div class="col-auto">
				<label for="phone3" class="visually-hidden">전화번호3</label> <input
					type="text" name="phone3" value="${member.phone3}"
					class="form-control" id="phone3">
			</div>
		</div>
		<div class="row mb-3">
			<label for="email1" class="col-sm-2 col-form-label">이메일:</label>
			<div class="col-auto">
				<input type="text" name="email1" value="${member.email1}"
					class="form-control" id="email1">
			</div>
			<div class="col-auto">
				<label for="xxx" class="visually-hidden">@</label>
				<span>@</span>
			</div>
			<div class="col-auto">
				<label for="email2" class="visually-hidden">이메일2</label> 
				<input type="text" name="email2" value="${member.email2}"
					class="form-control" id="email2" placeholder="직접입력">
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
		<hr>
		<div class="col-12">
			<button type="submit" class="btn btn-primary" id="update">수정</button>
			<button type="reset" class="btn btn-primary" id="cancel">취소</button>
		</div>
	</form>

</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullRoadAddr = data.roadAddress; 
						var extraRoadAddr = ''; 

						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						document.getElementById('post').value = data.zonecode; 
						document.getElementById('addr1').value = fullRoadAddr;
						document.getElementById('addr2').value = data.jibunAddress;

						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>