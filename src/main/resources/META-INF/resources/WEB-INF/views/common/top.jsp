<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
    String userId = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main?category">BookShop</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="main?category=comic">만화</a></li>
                        <li class="nav-item"><a class="nav-link" href="main?category=exambook">취업/수험서</a></li>
                        <li class="nav-item"><a class="nav-link" href="main?category=magazine">잡지</a></li>
                        <li class="nav-item"><a class="nav-link" href="main?category=nobel">소설</a></li>
                        <li class="nav-item"><a class="nav-link" href="main?category=poemessay">시/에세이</a></li>
                        
                    </ul>
                    <ul class="navbar-nav">

        					<sec:authorize access="isAnonymous()">
                             <li class="nav-item">
                               <a class="nav-link" href="login">login</a>
                            </li>
                            </sec:authorize>
                            <sec:authorize access="isAnonymous()">
                            <li class="nav-item">
                                <a class="nav-link" href="signup">signup</a>
                            </li>
                            </sec:authorize>
                            
                            <sec:authorize access="isAuthenticated()">
                            <li class="nav-item">
                                <a class="nav-link" href="logout">logout</a>
                            </li>
                            </sec:authorize>
                            <sec:authorize access="isAuthenticated()">
                            <li class="nav-item">
                                <a class="nav-link" href="mypage">mypage</a>
                            </li>
                            <form class="d-flex" action="cartItems" method="get">
    							<input type="hidden" name="userId" value="${userId}">
    							<button class="btn btn-outline-dark" type="submit">
        						<i class="bi-cart-fill me-1"></i>
        							Cart
        						<span class="badge bg-dark text-white ms-1 rounded-pill">${cartItemCount}</span>
    							</button>
							</form>

                            </sec:authorize>
                        </ul>
                    
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">BookShop</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With this Bookshop hompeage</p>
                </div>
            </div>
        </header>
        </body>
        </html>