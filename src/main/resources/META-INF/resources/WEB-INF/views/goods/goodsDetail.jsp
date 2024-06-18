<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <jsp:include page="/common/top.jsp" flush="true" /><br>
        <hr>
        
        <!-- Book Details Section -->
        <div class="container mt-5">
            <c:choose>
                <c:when test="${not empty goodsRetrieve}">
                    <div class="row">
                        <div class="col-md-4">
                            <img class="img-fluid" src="image/${goodsRetrieve.imageCode}.jpg" alt="Book Image" />
                        </div>
                        <div class="col-md-8">
                            <h3>${goodsRetrieve.title}</h3>
                            <p><strong>Author:</strong> ${goodsRetrieve.author}</p>
                            <p><strong>Price:</strong> ${goodsRetrieve.price}</p>
                            <p><strong>Category:</strong> ${goodsRetrieve.category}</p>
                            <p><strong>Publisher:</strong> ${goodsRetrieve.publisher}</p>
                            <p><strong>Publish Date:</strong> ${goodsRetrieve.publishDate}</p>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <p>Book details not available.</p>
                </c:otherwise>
            </c:choose>
        </div>
        
        <jsp:include page="/common/footer.jsp" flush="true" />
    </div>
</body>
</html>
