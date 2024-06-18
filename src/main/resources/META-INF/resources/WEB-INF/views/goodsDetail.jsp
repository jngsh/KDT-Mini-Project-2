<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="webjars/bootstrap/5.3.3/css/bootstrap.min.css">
    <script src="webjars/jquery/3.7.1/jquery.min.js"></script>
    
    <script>
    function increaseQuantity() {
        var quantityElement = document.getElementById('quantity');
        var currentQuantity = parseInt(quantityElement.innerText);
        quantityElement.innerText = currentQuantity + 1;
    }

    function decreaseQuantity() {
        var quantityElement = document.getElementById('quantity');
        var currentQuantity = parseInt(quantityElement.innerText);
        
        // 수량이 0 이상인 경우에만 감소하도록 조건 추가
        if (currentQuantity > 0) {
            quantityElement.innerText = currentQuantity - 1;
        }
    }
	</script>
    
</head>
<body>
    <div class="App">
        <jsp:include page="common/top.jsp" flush="true" /><br>
        <!-- Book Details Section -->
        <div class="container mt-5">
            <c:choose>
                <c:when test="${not empty goodsRetrieve}" >
                    <div class="row">
                        <div class="col-md-4">
                            <img class="img-fluid" src="image/${goodsRetrieve.imageCode}.jpg" alt="Book Image" width="250" height="300"/>
                        </div>
                        <div class="col-md-8">
                            <h3>제목: ${goodsRetrieve.title}</h3>
                            <hr>
   
                            <p><strong>작가:</strong> ${goodsRetrieve.author}</p>
                            <p><strong>가격:</strong> ${goodsRetrieve.price}원</p>
                            <p><strong>분류:</strong>
    							<c:choose>
        							<c:when test="${goodsRetrieve.category eq 'comic'}">
            								만화
        							</c:when>
        							<c:when test="${goodsRetrieve.category eq 'poemessay'}">
            								시/에세이
        							</c:when>
        							<c:when test="${goodsRetrieve.category eq 'nobel'}">
            								소설
        							</c:when>
        							<c:when test="${goodsRetrieve.category eq 'magazine'}">
            								잡지
        							</c:when>
        							<c:when test="${goodsRetrieve.category eq 'exambook'}">
            								취업/수험서
        							</c:when>       						
    							</c:choose>
							</p>
                            <p><strong>출판사:</strong> ${goodsRetrieve.publisher}</p>
                            <p><strong>출판일:</strong> ${goodsRetrieve.publishDate}</p>
                            <p><strong>수량:</strong> 
                            	<button type="button" onclick="decreaseQuantity()">-</button>
    							<span id="quantity">1</span>
    							<button type="button" onclick="increaseQuantity()">+</button>
							</p>
							
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
    							<div class="row">
        							<div class="col text-start">
            							<a class="btn btn-outline-dark mt-auto" href="goodsDetail?bookId=${dto.bookId}">장바구니</a>
        							</div>
    							</div>
							</div>

                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <p>Book details not available.</p>
                </c:otherwise>
            </c:choose>
        </div>
        <hr>
        <jsp:include page="common/footer.jsp" flush="true" />
    </div>
</body>
</html>
