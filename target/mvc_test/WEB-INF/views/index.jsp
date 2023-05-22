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
    <link rel="stylesheet" href="/resources/css/save.css">
    <link rel="stylesheet" href="/resources/css/rpg.css">

    /
</head>
<body class="pt-5">
<%@include file="./component/nav.jsp" %>
<div class="container">
    <div class="row">
        <%@include file="./component/category.jsp" %>


            <div class="col-lg-9 my-4 mb-4">
            <%--                여기서부터 본문내용 입력--%>
                <section class="bg-black">
                    <div class="container py-4">
                        <div class="row align-items-center justify-content-between">
                            <a class="navbar-brand h1 text-center" href="member/save">
                                <span class="text-dark h2">회원가입</span>
                            </a>
                        </div>
                        <form>
                            <div class="form-group">
                                <label for="memberEmail" class="form-label mt-4">아이디</label>
                                <input type="text" class="form-control" id="memberEmail"  aria-describedby="emailHelp">
                            </div>

                            <div class="form-group has-success">
                                <label class="form-label mt-4" for="memberPassword">비밀번호</label>
                                <input type="password" class="form-control is-valid" id="memberPassword">
                                <div class="valid-feedback"></div>
                            </div>

                            <div class="form-group has-danger">
                                <label class="form-label mt-4" for="memberPasswordCheck">비밀번호 재확인</label>
                                <input type="password" class="form-control is-invalid" id="memberPasswordCheck">
                                <div class="invalid-feedback">비밀번호가 일치하지 않습니다</div>
                            </div>

                            <div class="form-group">
                                <label for="memberName" class="form-label mt-4">이름</label>
                                <input type="text" class="form-control" id="memberName" aria-describedby="emailHelp">
                            </div>

                            <div class="bir_wrap">
                                <label class="form-label mt-4">생년월일</label>
                                <div class="bir_yy">
                                    <span class="ps_box">
                                        <input type="text" class="form-control" id="yy" placeholder="년(4자)" maxlength="4">
                                    </span>
                                </div>
                                <div class="bir_mm">
                                    <span class="ps_box focus">
                                        <select class="form-select" id="mm" id="memberBirth">
                                            <option>월</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                            <option>6</option>
                                            <option>7</option>
                                            <option>8</option>
                                            <option>9</option>
                                            <option>10</option>
                                            <option>11</option>
                                            <option>12</option>
                                        </select>
                                    </span>
                                </div>
                                <div class="bir_dd">
                                    <span class="ps_box">
                                        <input type="text" class="form-control" id="dd" placeholder="일" maxlength="2">
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="memberGender" class="form-label mt-4">성별</label>
                                <select class="form-select" id="memberGender">
                                    <option>남자</option>
                                    <option>여자</option>
                                    <option>비밀</option>
                                </select>
                            </div>
                            <div class="from-group">
                                <label for="memberEmail1" class="form-label mt-4">본인 확인 이메일</label>
                                <input type="email" class="form-control" id="memberEmail1" aria-describedby="emailHelp" placeholder="선택입력">
                            </div>
                            <div class="d-grid gap-2">
                                <button class="btn btn-primary btn-lg" type="button">가입하기</button>
                            </div>
                        </form>
                    </div>
                </section>
        </div>
    </div>
</div>
<%@include file="./component/footer.jsp" %>


</body>
</html>
