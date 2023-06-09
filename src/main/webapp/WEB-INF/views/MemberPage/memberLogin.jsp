<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-17
  Time: PM 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>OsakaBoard</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
</head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/save.css">
<link rel="stylesheet" href="/resources/css/rpg.css">
<body class="pt-5">
<%@include file="../component/nav.jsp" %>
<div class="container">
    <div class="row">
        <%@include file="../component/category.jsp" %>
        <div class="col-lg-9 my-4 mb-8">
            <%-- 여기서부터 본문내용 입력 --%>
            <div class="container">
                <div class="row align-items-center justify-content-between">
                    <a class="navbar-brand h1 text-center" href="/member/login">
                        <span class="text-dark h2">로그인</span>
                    </a>
                </div>
                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-4">
                        <form action="/member/login" method="post" class="text-center">
                            <!-- ID 입력 -->
                            <div class="form-group">
                                <label for="userID" class="sr-only">ID</label>
                                <input type="text" name="memberId" class="form-control"
                                       placeholder="ID" id="userID" required>
                            </div>
                            <!-- PW 입력 -->
                            <div class="form-group">
                                <label for="userPW" class="sr-only">Password</label>
                                <input type="text" name="memberPassword" class="form-control"
                                       placeholder="Password" id="userPW" required>
                            </div>
                            <!-- 자동 로그인 -->
                            <div class="custom-control custom-checkbox mb-3">
                                <input type="checkbox" class="custom-control-input"
                                       name="isAutoLogin" value="true" id="customCheck1">
                                <label class="custom-control-label" for="customCheck1">로그인 유지</label>
                            </div>
                            <!-- 로그인 버튼 -->
                            <button type="submit" class="btn btn-dark btn-block">
                                로그인 하기
                            </button>
                        </form>

                        <!-- 회원가입 버튼 -->
                        <button type="button" class="btn btn-dark btn-block mt-3"
                                onclick="location.href='/register'">회원가입 하기
                        </button>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../component/footer.jsp" %>


</body>
</html>
