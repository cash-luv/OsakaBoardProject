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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/save.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

    <link rel="stylesheet" href="/resources/css/rpg.css">
</head>
<body class="pt-5">
<%@include file="../component/nav.jsp" %>
<div class="container">
    <div class="row">
        <%@include file="../component/category.jsp" %>
        <div class="col-lg-9 my-4 mb-4">
            <%--                여기서부터 본문내용 입력--%>
            <section class="bg-white">
                <div class="container py-4">
                    <div class="row align-items-center justify-content-between">
                        <a class="navbar-brand h1 text-center" href="/member/delete">
                            <span class="text-dark h2">회원탈퇴</span>
                        </a>
                    </div>
                    <form action="/member/delete" method="post" onsubmit="return password_check()">
                        <div class="form-group" id="passwordFormGroup">
                            <label class="form-label mt-4" for="nowPasswordCheck">비밀번호 확인</label>
                            <div class="row">
                                <div class="col-8">
                                    <input type="text" class="form-control " id="nowPasswordCheck" placeholder="현재 비밀번호" >
                                </div>
                                <div class="col-4">
                                    <input type="button" class="btn btn-primary" id="now-password-check"
                                           value="비밀번호 확인" onclick="password_check2()">
                                </div>
                            </div>
                        </div>

                        <div class="d-grid gap-2">
                            <input class="btn btn-danger btn-lg" type="submit" id="submitBtn" value="탈퇴하기" onclick="password_check()">
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
</div>
<%@include file="../component/footer.jsp" %>


</body>
<script>

    // 현재 비밀번호 확인
    const password_check = () => {
        const nowPassword = document.getElementById("nowPasswordCheck");
        const password = '${member.memberPassword}';

        if (nowPassword.value == password) {
            if(!confirm("정말로 탈퇴하시겠습니까?")){
                return false;
            }else{
                return true;
            }
        }else {
            alert("비밀번호가 다릅니다. 다시 입력해주세요");
            nowPassword.value = "";
            nowPassword.focus();
            return false;
        }
    }

    const password_check2 = () => {
        const nowPassword = document.getElementById("nowPasswordCheck");
        const password = '${member.memberPassword}';

        if (nowPassword.value == password) {
            alert("확인 완료");
            return true;
        }else {
            alert("비밀번호가 다릅니다. 다시 입력해주세요");
            nowPassword.value = "";
            nowPassword.focus();
            return false;
        }
    }





</script>
</html>
