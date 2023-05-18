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
<body class="pt-5">
<%@include file="../component/nav.jsp" %>
<div class="container">
    <div class="row">
        <%@include file="../component/category.jsp" %>
        <div class="col-lg-9 my-4 mb-4">
            <%--                여기서부터 본문내용 입력--%>
            <div class="container">
                <div class="row">
                    <div class="col-lg-4"></div>
                    <!-- 입력폼 그리드 -->
                    <div class="col-lg-4">
                        <form action="/save" method="post">
                            <!-- ID입력 -->
                            <div class="input-group mt-3 mb-1">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">ID</span>
                                </div>
                                <input type="text" name="userID" class="form-control"
                                       placeholder="Input ID" aria-label="Input ID"
                                       aria-describedby="basic-addon1" required>
                            </div>
                            <!-- PW입력 -->
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon2">PW</span>
                                </div>
                                <input type="password" name="userPW" class="form-control"
                                       placeholder="Input Password" aria-label="Input Password"
                                       aria-describedby="basic-addon1" required>
                            </div>
                            <!-- 자동 로그인 -->
                            <div class="custom-control custom-checkbox mb-1">
                                <input type="checkbox" class="custom-control-input"
                                       name="isAutoLogin" value="true" id="customCheck1"> <label
                                    class="custom-control-label" for="customCheck1">로그인 유지</label>
                            </div>
                            <!-- 로그인 버튼 -->
                            <button type="submit" class="btn btn-dark btn-sm btn-block">
                                로그인 하기
                            </button>
                        </form>

                        <!-- 회원가입 버튼 -->
                        <button type="button" class="btn btn-dark btn-sm btn-block my-1"
                                onclick="location.href='/register'">회원가입 하기
                        </button>

<%--                        <%--%>
<%--                            }--%>
<%--                        %>--%>

                        <!-- 회원가입 성공, 로그인 실패 등 메세지가 있으면 경고창 출력 -->
                        <%
                            Object
                            obj
                            =
                            session
                            .
                            getAttribute
                            (
                            "loginMsg"
                            )
                            ;
                            if
                            (
                            obj
                            !=
                            null
                            )
                            {
                            String
                            msg
                            =
                            (
                            String
                            )
                            obj
                            ;
                        %>
                        <div class="alert alert-danger text-center" role="alert"><%=msg%>
                        </div>
                        <%
                            // 출력한 메세지는 지워줌
                            session
                            .
                            removeAttribute
                            (
                            "loginMsg"
                            )
                            ;
                            }
                        %>
                    </div>

                    <!-- 그림 넣을 그리드 -->
                    <div class="col-lg-4"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../component/footer.jsp" %>


</body>
</html>
