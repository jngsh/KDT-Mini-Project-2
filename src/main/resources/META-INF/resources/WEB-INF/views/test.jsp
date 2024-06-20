<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="webjars/bootstrap/5.3.3/css/bootstrap.min.css">
    <script src="webjars/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <div class="App">
        <jsp:include page="common/top.jsp" flush="true" /><br>
        
        <!-- Cart Details Section -->
        <div class="container mt-5">
            <div class="row">
                <c:forEach var="dto" items="${cartList}">
                    <div class="col-md-12 mb-4">
                        <div class="card">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img class="img-fluid" src="image/${dto.imageCode}.jpg" alt="Book Image" width="250" height="300"/>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h3 class="card-title">제목: ${dto.title}</h3>
                                        <hr>
                                        <p><strong>책 코드:</strong> ${dto.bookId}</p>
                                        <p><strong>작가:</strong> ${dto.author}</p>
                                        <p><strong>수량:</strong> ${dto.cCount}</p>
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="row align-items-center">
                                                <div class="col text-start">
                                                    <!-- 가격 표시 -->
                                                    <span id="totalPrice">${dto.totalPrice}</span>원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
            <div class="text-left">
                <button type="submit" class="btn btn-outline-dark mt-auto" onclick="">구매하기</button>
            </div>
        </div>
        
        <hr>
        <jsp:include page="common/footer.jsp" flush="true" />
    </div>
</body>
</html>
