<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-17
  Time: PM 2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>

<div class="col-lg-2">
  <h3 class="my-4 text-center">카테고리</h3>
  <div class="list-group mt-4 my-3 mb-3">
    <a class="list-group-item list-group-item-action text-center font-weight-bold">인기글</a>
    <a href="/board/list"
       class="list-group-item list-group-item-action text-center font-weight-bold">전체글보기</a>
    <a href="/board/list?boardCategory=1"
       class="list-group-item list-group-item-action text-center font-weight-bold">자유게시판</a>
    <a href="/board/list?boardCategory=2"
       class="list-group-item list-group-item-action text-center font-weight-bold">가입인사</a>
    <a href="/board/list?boardCategory=3"
       class="list-group-item list-group-item-action text-center font-weight-bold">정보게시판</a>
    <a href="/board/list?boardCategory=4"
       class="list-group-item list-group-item-action text-center font-weight-bold">정보게시판</a>
    <a href="#"
       class="list-group-item list-group-item-action text-center font-weight-bold">정보게시판</a>
    <a href="#"
       class="list-group-item list-group-item-action text-center font-weight-bold">정보게시판</a>

  </div>

</div>


</body>
</html>
