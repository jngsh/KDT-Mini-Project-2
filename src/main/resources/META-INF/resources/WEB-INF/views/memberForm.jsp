<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="webjars/bootstrap/5.3.3/css/bootstrap.min.css"  rel="stylesheet" >
</head>
<body>
       <div class="App">
		 	<jsp:include page="common/top.jsp" flush="true" /><br>
		 	<jsp:include page="member/memberForm.jsp" flush="true" />
		 	<jsp:include page="common/footer.jsp" flush="true" />
		</div>
	
</body>
</html>