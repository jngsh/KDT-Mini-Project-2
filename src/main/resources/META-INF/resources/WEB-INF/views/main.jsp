<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<jsp:include page="goods/goodsList.jsp" flush="true" />
	<jsp:include page="common/footer.jsp" flush="true" />
 </div>
</body>
</html>