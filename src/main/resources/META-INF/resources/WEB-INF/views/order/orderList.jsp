<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="webjars/bootstrap/5.3.3/css/bootstrap.min.css">
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>

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

#order-content {
	margin-left: 10px;
	padding-left: 15px;
	border-left: 1px solid #ccc;
}

.notice-nothing {
	
}
</style>

</head>
<body>

	<div class="App">
		<jsp:include page="../common/top.jsp" flush="true" /><br>
		<div class="mypage-container">
			<div class="mypage-sidebar">
				<div class="row g-3 m-4">
					<a id="updateMember-page" class="page-link" href="mypage">회원정보 수정</a>
					<a id="orderList-page" class="page-link" href="orderList">주문내역</a>
				</div>
			</div>

			<!-- OrderList Section -->
			<div class="container mt-5" id="order-content">
				
				<c:choose>
					<c:when test="${empty orderList}">
						<br>
						<div class="text-center">
							<h5>주문내역이 없습니다.</h5>
						</div>
						<br><br>
					</c:when>
					<c:otherwise>
					<h3>주문내역</h3>
					<hr>
						<c:forEach var="dto" items="${orderList}">
							<div class="row">
								<p>
									<strong>주문번호:</strong> ${dto.orderId}
								</p>
								<p>
									<strong>주문날짜:</strong> ${dto.orderDate}
								</p>
								<div class="col-md-4">
									<img class="img-fluid" src="image/${dto.imageCode}.jpg"
										alt="Book Image" width="150" height="180" />
								</div>
								<div class="col-md-8">
									<h3>제목: ${dto.title}</h3>
									<hr>
									<p>
										<strong>책 코드:</strong> ${dto.bookId}
									</p>
									<p>
										<strong>수량:</strong> ${dto.cCount}
									</p>
									<p>
										<strong>총 가격:</strong> <span id="totalPrice">${dto.totalPrice}</span>원
									</p>
								</div>
							</div>
							<hr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<jsp:include page="../common/footer.jsp" flush="true" />
	</div>

</body>
</html>