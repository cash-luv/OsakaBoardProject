<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-17
  Time: PM 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <div class="col-lg-9 my-4 mb-4">
            <%-- 여기서부터 본문내용 입력 --%>
            <div class="container">
                <c:choose>
                    <c:when test="${boardCategory == 1}">
                        <h3>자유게시판</h3>
                    </c:when>
                    <c:when test="${boardCategory == 2}">
                        <h3>가입인사</h3>
                    </c:when>
                    <c:when test="${boardCategory == 3}">
                        <h3>정보게시판</h3>
                    </c:when>
                    <c:otherwise>
                        <h3>전체글보기</h3>
                    </c:otherwise>
                </c:choose>
                <!-- 검색 -->
                <c:if test="${boardCategory != 0}">
                    <div id="search-area" class="container">
                        <form action="/board/list" method="get">
                            <input type="text" name="boardCategory" hidden="hidden" value="${boardCategory}">
                            <input type="text" name="q" placeholder="검색어 입력">
                            <input type="submit" value="검색">
                        </form>
                    </div>
                </c:if>
                <c:if test="${sessionScope.loginid == 'loginId'}">
                    <a href="/board/data?boardCategory=${boardCategory}">데이터</a>
                </c:if>
                <!-- 조회된 글 리스트 -->
                <div class="container" id="list">
                    <table class="table table-hover">
                        <tr>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                            <th>좋아요</th>
                            <th>파일</th>
                        </tr>
                        <c:forEach items="${boardList}" var="board">
                            <tr onclick="window.location='/board/detail?id=${board.id}&boardCategory=${boardCategory}&page=${paging.page}&q=${q}'" style="cursor: pointer;">
                                <td>${board.id}</td>
                                <td>${board.boardTitle}</td>
                                <td>${board.boardWriter}</td>
<%--                                <!-- <td>${board.boardContents}</td> -->--%>
                                <td>${board.boardCreatedTime}</td>
                                <td>${board.boardHits}</td>
                                <td>${board.board_like}</td>
                                <td>${board.fileAttached}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <!-- 페이징 -->
                <div class="container">
                    <ul class="pagination justify-content-center">
                        <c:choose>
                            <%--                현재 페이지에서 이전 페이지 없으면 클릭되지 않게 비활성화--%>
                            <c:when test="${paging.page<=1}">
                                <li class="page-item disabled">
                                    <a class="page-link">[이전]</a>
                                </li>
                            </c:when>
                            <%--                현재 페이지에서 이전 페이지가 있으면 버튼 활성화--%>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link"
                                       href="/board/list?boardCategory=${boardCategory}&page=${paging.page-1}&q=${q}">[이전]</a>
                                </li>
                            </c:otherwise>
                        </c:choose>

                        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                            <c:choose>
                                <%--                    현재 페이지의 경우 클릭되지 않게 비활성화 --%>
                                <c:when test="${i eq paging.page}">
                                    <li class="page-item active">
                                        <a class="page-link">${i}</a>
                                    </li>
                                </c:when>

                                <c:otherwise>
                                    <li class="page-item">
                                        <a class="page-link"
                                           href="/board/list?boardCategory=${boardCategory}&page=${i}&q=${q}">${i}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:choose>
                            <%--                현재 페이지에서 다음 페이지 없으면 클릭되지 않게 비활성화--%>
                            <c:when test="${paging.page>=paging.maxPage}">
                                <li class="page-item disabled">
                                    <a class="page-link">[다음]</a>
                                </li>
                            </c:when>
                            <%--                현재 페이지에서 다음 페이지가 있으면 버튼 활성화--%>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link"
                                       href="/board/list?boardCategory=${boardCategory}&page=${paging.page+1}&q=${q}">[다음]</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
    <%@include file="../component/footer.jsp" %>


</body>
</html>
