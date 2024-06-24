<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="webjars/bootstrap/5.3.3/css/bootstrap.min.css">
    <style>
        .custom-checkbox {
            width: 1.5rem; 
            height: 1.5rem;
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
                                        <input type="checkbox" name="selectedBooks" value="${cartDto.bookId}" class="custom-checkbox">
                                    </div>
                                    <div class="col-md-3">
                                        <img class="img-fluid" id="bookImage-${cartDto.bookId}" src="image/${cartDto.goodsList[0].imageCode}.jpg" alt="Book Image" width="150" height="200"/>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h3 class="card-title" id="bookTitle-${cartDto.bookId}">제목: ${cartDto.goodsList[0].title}</h3>
                                            <hr>
                                            <p id="bookId-${cartDto.bookId}"><strong>책 코드:</strong> ${cartDto.bookId}</p>
                                            <p><strong>작가:</strong> ${cartDto.goodsList[0].author}</p>
                                            <p id="bookCount-${cartDto.bookId}"><strong>수량:</strong> ${cartDto.cCount}</p>
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="row align-items-center">
                                                    <div class="col text-start">
                                                        <strong>가격: </strong><span id="totalPrice-${cartDto.bookId}">${cartDto.totalPrice}</span>원
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
                    <button type="button" class="btn btn-outline-dark mt-auto" onclick="purchaseSelectBooks()">구매하기</button>
                    <button type="button" class="btn btn-outline-dark mt-auto" onclick="deleteSelectedBooks()">삭제하기</button>
                </div>
            </form>
        </div>
        <br>
        <jsp:include page="common/footer.jsp" flush="true" />
    </div>
    
    <script>
    function deleteSelectedBooks() {
        var form = document.getElementById("purchaseForm");
        var checkboxes = form.querySelectorAll('input[type="checkbox"]:checked');
        var selectedBookIds = []; 
        
        if (checkboxes.length === 0) {
            alert("삭제할 책을 선택하세요.");
            return;
        }
        
        checkboxes.forEach(function(checkbox) {
            selectedBookIds.push(checkbox.value);
        });
        
        if (confirm("선택한 책을 삭제하시겠습니까?")) {
            var selectedBooksInput = document.createElement("input");
            selectedBooksInput.setAttribute("type", "hidden");
            selectedBooksInput.setAttribute("name", "selectedBookIds");
            selectedBooksInput.setAttribute("value", selectedBookIds.join(",")); 
            form.appendChild(selectedBooksInput); 
            
            var userIdInput = document.createElement("input");
            userIdInput.setAttribute("type", "hidden");
            userIdInput.setAttribute("name", "userId");
            userIdInput.setAttribute("value", "${userId}"); 
            form.appendChild(userIdInput);
            
            form.submit(); 
        }
    }

    function purchaseSelectBooks() {
        var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
        var selectedBooks = [];
        
        if (checkboxes.length === 0) {
            alert("구매할 책을 선택하세요.");
            return;
        }
        
        checkboxes.forEach(function(checkbox) {
            var bookId = checkbox.value;
            
            var cCountText = document.getElementById('bookCount-' + bookId).innerText.trim(); 
            var cCount = parseInt(cCountText.split('수량: ')[1]);
            var totalPriceText = document.getElementById('totalPrice-'+bookId).innerText.trim(); 
            var totalPrice = parseInt(totalPriceText.split('원')[0]); 
            var title = document.getElementById('bookTitle-' + bookId).innerText.split(': ')[1];;
            var imageCode = document.getElementById('bookImage-' + bookId).src.split('/').pop().split('.')[0];
            
            selectedBooks.push({
                bookId: bookId,
                cCount: cCount,
                totalPrice: totalPrice,
                title: title,
                imageCode: imageCode
            });
        });
        
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