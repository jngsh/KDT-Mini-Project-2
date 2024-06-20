<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="webjars/bootstrap/5.3.3/css/bootstrap.min.css">
    <style>
        /* 추가된 CSS */
        .custom-checkbox {
            width: 1.5rem; /* 원하는 크기로 조정 */
            height: 1.5rem; /* 원하는 크기로 조정 */
        }
    </style>
    <script src="webjars/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <div class="App">
        <jsp:include page="common/top.jsp" flush="true" /><br>
        
        <!-- Cart Details Section -->
        <div class="container mt-5">
            <form id="purchaseForm" action="cartDelete" method="post">
                <div class="row">
                    <c:forEach var="cartDto" items="${cartList}">
                        <div class="col-md-12 mb-4">
                            <div class="card">
                                <div class="row g-0">
                                    <div class="col-md-1">
                                        <!-- 각 책의 체크박스 -->
                                        <input type="checkbox" name="selectedBooks" value="${cartDto.bookId}" class="custom-checkbox">
                                    </div>
                                    <div class="col-md-3">
                                        <!-- 책 이미지 -->
                                        <img class="img-fluid" id="bookImage-${cartDto.bookId}" src="image/${cartDto.goodsList[0].imageCode}.jpg" alt="Book Image" width="150" height="200"/>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <!-- 책 정보 -->
                                            <h3 class="card-title" id="bookTitle-${cartDto.bookId}">제목: ${cartDto.goodsList[0].title}</h3>
                                            <hr>
                                            <p id="bookId-${cartDto.bookId}"><strong>책 코드:</strong> ${cartDto.bookId}</p>
                                            <p><strong>작가:</strong> ${cartDto.goodsList[0].author}</p>
                                            <p id="bookCount"><strong>수량:</strong> ${cartDto.cCount}</p>
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="row align-items-center">
                                                    <div class="col text-start">
                                                        <!-- 가격 표시 -->
                                                        <span id="totalPrice">${cartDto.totalPrice}</span>원
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
                
                <div class="text-center">
                    <!-- 구매하기 버튼 -->
                    <button type="button" class="btn btn-outline-dark mt-auto" onclick="purchaseSelectBooks()">구매하기</button>
                    <!-- 삭제하기 버튼 -->
                    <button type="button" class="btn btn-outline-dark mt-auto" onclick="deleteSelectedBooks()">삭제하기</button>
                </div>
            </form>
        </div>
        
        <hr>
        <jsp:include page="common/footer.jsp" flush="true" />
    </div>
    
    <script>
    function deleteSelectedBooks() {
        var form = document.getElementById("purchaseForm");
        var checkboxes = form.querySelectorAll('input[type="checkbox"]:checked');
        var selectedBookIds = []; // 선택된 책의 bookId를 저장할 배열
        
        if (checkboxes.length === 0) {
            alert("삭제할 책을 선택하세요.");
            return;
        }
        
        // 선택된 체크박스의 value 즉, bookId를 배열에 저장
        checkboxes.forEach(function(checkbox) {
            selectedBookIds.push(checkbox.value);
        });
        
        // 사용자에게 확인 메시지 표시
        if (confirm("선택한 책을 삭제하시겠습니까?")) {
            // 선택된 책들의 bookId를 hidden input에 설정
            var selectedBooksInput = document.createElement("input");
            selectedBooksInput.setAttribute("type", "hidden");
            selectedBooksInput.setAttribute("name", "selectedBookIds");
            selectedBooksInput.setAttribute("value", selectedBookIds.join(",")); // 배열을 쉼표로 구분된 문자열로 변환
            form.appendChild(selectedBooksInput); // hidden input을 폼에 추가
            
            // userId를 hidden input으로 설정
            var userIdInput = document.createElement("input");
            userIdInput.setAttribute("type", "hidden");
            userIdInput.setAttribute("name", "userId");
            userIdInput.setAttribute("value", "${userId}"); // JSP에서 userId 값을 가져와서 설정
            form.appendChild(userIdInput); // hidden input을 폼에 추가
            
            form.submit(); // 폼 제출
        }
    }

    function purchaseSelectBooks() {
        var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
        var selectedBooks = []; // 선택된 책 정보를 저장할 배열
        
        if (checkboxes.length === 0) {
            alert("구매할 책을 선택하세요.");
            return;
        }
        
        // 선택된 체크박스의 정보를 배열에 저장
        checkboxes.forEach(function(checkbox) {
            var bookId = checkbox.value;
            
            var cCountText = document.getElementById('bookCount').innerText.trim(); // 텍스트 가져오기
            var cCount = parseInt(cCountText.split('수량: ')[1]);
            var totalPriceText = document.getElementById('totalPrice').innerText.trim(); // 책 가격 텍스트 가져오기
            var totalPrice = parseInt(totalPriceText.split('원')[0]); // 정수형으로 변환
            var title = document.getElementById('bookTitle-' + bookId).innerText.split(': ')[1];;
            var imageCode = document.getElementById('bookImage-' + bookId).src.split('/').pop().split('.')[0];
            
          
            
           // var imageCode = document.getElementById('bookImage-' + bookId).src.split('/').pop().split('.')[0]; // 이미지 코드 가져오기
            
            
            selectedBooks.push({
                bookId: bookId,
                cCount: cCount,
                totalPrice: totalPrice,
                title: title,
                imageCode: imageCode
            });
        });
        
        // Ajax 요청으로 서버에 데이터 전송
        $.ajax({
            type: "POST",
            url: "purchaseBook",
            contentType: "application/json",
            data: JSON.stringify(selectedBooks),
            success: function(response) {
                alert(response.message);
                window.location.href = response.redirect + "?userId=${userId}";
            },
            error: function(xhr, status, error) {
                console.error("구매 중 오류 발생:", error);
                alert("구매 중 오류가 발생했습니다.");
            }
        });
    }

    </script>
    
</body>
</html>
