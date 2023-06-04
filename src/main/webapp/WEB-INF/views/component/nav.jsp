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
                <c:choose>
                <c:when test="${not empty sessionScope.loginId}">
                <!-- 로그인한 경우 -->
                <c:if test="${sessionScope.loginId == 'admin'}">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/board/save">글작성</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/board/list">글목록</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/member/members">회원목록(관리자전용)</a>
                    </li>
                </ul>
                </c:if>
                <c:if test="${sessionScope.loginId != 'admin'}">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/board/save">글작성</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/board/list">글목록</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/member/mypage">마이페이지</a>
                    </li>
                </ul>
                </c:if>
                </c:when>
                <c:otherwise>
                <!-- 로그인하지 않은 경우 -->
                <ul class="navbar-nav ml-auto">
<%--                    <li class="nav-item"><a class="nav-link"--%>
<%--                                            href="/member/login">로그인</a></li>--%>
                    <li class="nav-item"><a class="nav-link"
                                            href="/member/save">회원가입</a></li>
                </ul>
                </c:otherwise>
                </c:choose>
                <ul class="navbar-nav ml-auto">
                <li class="nav-item" id="login-area" style="display: inherit">

                </li>
                </ul>
            </ul>
        </div>
    </div>
</nav>


<script>

    const loginArea = document.getElementById("login-area");
    const loginId = '${sessionScope.loginId}';
    console.log(loginId.length);

    if (loginId.length !== 0) {
        const welcomeLink = document.createElement("a");
        welcomeLink.classList.add("nav-link");
        welcomeLink.href = "/member/mypage";
        welcomeLink.style.color = "white";
        welcomeLink.innerText = `${loginId}님 환영해요!`;

        const logoutLink = document.createElement("a");
        logoutLink.classList.add("nav-link");
        logoutLink.href = "/member/logout";
        logoutLink.innerText = "로그아웃";


        loginArea.appendChild(welcomeLink);
        loginArea.appendChild(logoutLink);
    } else {
        const loginLink = document.createElement("a");
        loginLink.classList.add("nav-link");
        loginLink.href = "/member/login";
        loginLink.innerText = "로그인";
        loginArea.appendChild(loginLink);
    }


</script>