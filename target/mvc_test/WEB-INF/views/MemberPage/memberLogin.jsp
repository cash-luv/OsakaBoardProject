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
<body class="pt-5">
<%@include file="../component/nav.jsp" %>
<div class="container">
    <div class="row">
        <%@include file="../component/category.jsp" %>
        <div class="col-lg-9 my-4 mb-4">
            <%-- 여기서부터 본문내용 입력 --%>
            <div class="container">
                <div class="row align-items-center justify-content-between">
                    <a class="navbar-brand h1 text-center" href="/member/login">
                        <span class="text-dark h2">로그인</span>
                    </a>
                </div>
                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-4">
                        <form action="/save" method="post" class="text-center">
                            <!-- ID 입력 -->
                            <div class="form-group">
                                <label for="userID" class="sr-only">ID</label>
                                <input type="text" name="userID" class="form-control"
                                       placeholder="Input ID" id="userID" required>
                            </div>
                            <!-- PW 입력 -->
                            <div class="form-group">
                                <label for="userPW" class="sr-only">Password</label>
                                <input type="password" name="userPW" class="form-control"
                                       placeholder="Input Password" id="userPW" required>
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

                        <%-- <%--%>
                        <%-- }--%>
                        <%-- %>--%>

                        <!-- 회원가입 성공, 로그인 실패 등 메세지가 있으면 경고창 출력 -->
                        <%
                            Object obj = session.getAttribute("loginMsg");
                            if (obj != null) {
                                String msg = (String) obj;
                        %>
                        <div class="alert alert-danger text-center mt-3" role="alert"><%=msg%>
                        </div>
                        <%
                                // 출력한 메세지는 지워줌
                                session.removeAttribute("loginMsg");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../component/footer.jsp" %>


</body>
</html>
