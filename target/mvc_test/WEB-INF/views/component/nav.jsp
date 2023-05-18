<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/">오사카한인커뮤니티</a>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a class="nav-link" href="/">홈
                    <span class="sr-only">(current)</span>
                </a></li>
                <li class="nav-item"><a class="nav-link"
                                        href="/member/login">로그인</a></li>
                <li class="nav-item"><a class="nav-link"
                                        href="/member/save">회원가입</a></li>
            </ul>
        </div>
    </div>
</nav>

<script>
    const loginArea = document.getElementById("login-area");
    const loginEmail = '${sessionScope.loginEmail}';
    console.log(loginEmail.length);

    if (loginEmail.length != 0) {
        loginArea.innerHTML = "<a href='/mypage' style='color: black;'>"+loginEmail +"님 환영해요!</a>"+
                                "<a href='/logout'>logout</a>";
    } else {
        loginArea.innerHTML = "<a href='/login'>login</a>";
    }
</script>