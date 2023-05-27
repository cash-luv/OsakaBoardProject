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
<link>
<body class="pt-5">
<%@include file="../component/nav.jsp" %>
<div class="container">
    <div class="row">
        <%@include file="../component/category.jsp" %>
        <div class="col-lg-10 my-4 mb-5">
            <%-- 여기서부터 본문내용 입력 --%>
            <section class="bg-white">
                <div class="container py-4">
                    <div class="row align-items-center justify-content-between">
                        <a class="navbar-brand h1 text-center" href="/member/save">
                            <span class="text-dark h2">게시글 작성</span>
                        </a>
                    </div>
                    <form action="/board/save" method="post" enctype="multipart/form-data"
                         >
                        <div class="mb-3">
                            <label for="board-category" class="form-label">카테고리</label>
                            <select id="board-category" class="form-select" name="boardCategory">
                                <option value="1">자유게시판</option>
                                <option value="2">가입인사</option>
                                <option value="3">정보게시판</option>
                                <option value="4">정보게시판</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="boardTitle" class="form-label">제목</label>
                            <input type="text" class="form-control form-control-lg" name="boardTitle" id="boardTitle" placeholder="제목을 입력해 주세요">
                        </div>

                        <div class="mb-3">
                            <label for="boardWriter" class="form-label">작성자</label>
                            <input type="text" class="form-control form-control-lg" name="boardWriter" id="boardWriter" value="${sessionScope.loginId}" readonly>
                        </div>

                        <div class="mb-3">
                            <label for="boardContents" class="form-label">내용</label>
                            <textarea class="form-control form-control-lg" rows="5" name="boardContents" id="boardContents"
                                      placeholder="내용을 입력해 주세요"></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="boardFile" class="form-label">파일</label>
                            <input type="file" id="boardFile" class="form-control form-control-lg" name="boardFile" multiple> <br>
                        </div>

                        <div class="mb-3">
                            <button type="submit" class="btn btn-primary btn-lg">작성</button>
                            <button type="button" class="btn btn-primary btn-lg">목록</button>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
</div>
<%@include file="../component/footer.jsp" %>


</body>
</html>
