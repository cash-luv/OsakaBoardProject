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
        <div class="col-lg-9 mx-5 my-4 mb-4">
            <%-- 여기서부터 본문내용 입력 --%>
            <h2 class="mb-3">마이페이지</h2>
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">회원정보수정</h5>
                    <p class="card-text">회원정보 수정 및 탈퇴를 할 수 있습니다</p>
                    <a href="/member/update" class="btn btn-primary">회원정보수정</a>
                    <a href="/member/delete" class="btn btn-danger">회원탈퇴</a>
                </div>
            </div>
            <h2 class="mb-3">내 글 보기</h2>
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">내 글</h5>
                    <p class="card-text">Display a list of posts authored by the user.</p>
                    <a href="/post/myposts" class="btn btn-primary">View My Posts</a>
                </div>
            </div>
            <h2 class="mb-3">내가 쓴 댓글</h2>
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">나의 댓글</h5>
                    <p class="card-text">Display a list of comments made by the user.</p>
                    <a href="/comment/mycomments" class="btn btn-primary">View My Comments</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../component/footer.jsp" %>


</body>
</html>
