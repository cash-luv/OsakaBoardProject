<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.4.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/save.css">
    <link rel="stylesheet" href="/resources/css/rpg.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

</head>

<link>
<body class="pt-5">
<%@include file="../component/nav.jsp" %>
<div class="container">
    <div class="row">
        <%@include file="../component/category.jsp" %>
        <div class="col-lg-9 my-4 mb-4">
            <%-- 여기서부터 본문내용 입력 --%>
            <div id="section">
                <table class="table table-bordered">
                    <tr>
                        <td>[${board.id}]</td>
                        <td class="title" colspan="3">${board.boardTitle}</td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td class="writer">${board.boardWriter}</td>
                        <td>작성일자</td>
                        <td class="date">
                            <fmt:formatDate value="${board.boardCreatedTime}"
                                            pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                        </td>
                    </tr>
                    <tr>
                        <td>조회수</td>
                        <td>${board.boardHits}</td>
                        <td>좋아요</td>
                        <td id="like-ea">${board.board_like}</td>
                    </tr>
                    <tr>
                        <h5>
                            <td colspan="4" id="board-contents">${board.boardContents}</td>
                        </h5>
                    </tr>
                    <c:if test="${board.fileAttached == 1}">
                        <tr>
                            <td colspan="4">
                                <c:forEach items="${boardFileList}" var="boardFile">
                                    <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}">
                                </c:forEach>
                            </td>
                        </tr>
                    </c:if>
                </table>
                <button class="btn btn-primary" onclick="board_list()">목록</button>
                <div id="like-container">
                    <c:choose>
                        <c:when test="${board_like == 1}">
                            <button id="Like-button" class="btn btn-primary" onclick="UnLike()">좋아요취소</button>
                        </c:when>
                        <c:otherwise>
                            <button id="unLike-button" class="btn btn-primary" onclick="Like()">좋아요</button>
                        </c:otherwise>
                    </c:choose>
                </div>
                <c:if test="${editable}">
                    <button class="btn btn-primary" onclick="board_update()">수정</button>
                    <button class="btn btn-danger" onclick="board_delete()">삭제</button>
                </c:if>


                <div id="comment-write-area" class="mt-3">
                    <input type="text" id="comment-writer" name="commentWriter" value="${sessionScope.loginId}" readonly
                           class="form-control">
                    <input type="text" id="comment-contents" name="commentContents" placeholder="댓글 내용"
                           class="form-control">
                    <button class="btn btn-success" onclick="comment_write()">댓글작성</button>
                </div>
                <div id="comment-list" class="mt-3">
                    <c:choose>
                        <c:when test="${commentList == null}">
                            <h2>작성된 댓글이 없습니다.</h2>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-bordered">
                                <tr>
                                    <th>id</th>
                                    <th>작성자</th>
                                    <th>내용</th>
                                    <th>작성시간</th>
                                </tr>
                                <c:forEach items="${commentList}" var="comment">
                                    <tr>
                                        <td>${comment.id}</td>
                                        <td>${comment.commentWriter}</td>
                                        <td>${comment.commentContents}</td>
                                        <td>
                                            <fmt:formatDate value="${comment.commentCreatedTime}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                        </td>
                                        <td>
                                            <c:if test="${editable}">
                                                <button class="btn btn-primary" onclick="comment_update()">수정</button>
                                            </c:if>
                                        </td>

                                        <!-- Display delete button if the logged-in user is the owner of the comment -->
                                        <td>
                                            <c:if test="${editable}">
                                                <button class="btn btn-danger" onclick="comment_delete()">삭제</button>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="../component/footer.jsp" %>
<script>
    const comment_write = () => {
        const commentWriter = document.getElementById("comment-writer").value;
        const commentContents = document.getElementById("comment-contents").value;
        const boardId = '${board.id}';
        const result = document.getElementById("comment-list");
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                "commentWriter": commentWriter,
                "commentContents": commentContents,
                "boardId": boardId
            },
            success: function (res) {
                console.log(res);
                let output = "<table class='table table-bordered'>";
                output += "<tr>";
                output += "<th>id</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th>";
                output += "</tr>";
                for (let i in res) {
                    output += "<tr>";
                    output += "<td>" + res[i].id + "</td>";
                    output += "<td>" + res[i].commentWriter + "</td>";
                    output += "<td>" + res[i].commentContents + "</td>";
                    output += "<td>" + moment(res[i].commentCreatedTime).format("YYYY-MM-DD HH:mm:ss") + "</td>";
                    output += "</tr>";
                }
                output += "</table>";
                result.innerHTML = output;
                document.getElementById("comment-contents").value = "";
            },
            error: function () {
                console.log("실패");
            }
        });
    }

    const comment_update = () => {
        const result = document.getElementById("comment-list");
        const boardId = '${board.id}';
        const memberId = '${comment.memberId}'
        const commentContents = document.getElementById("comment-contents").value;
        $.ajax({
            type: "post",
            url: "/comment/update",
            data: {
                "memberId": memberId,
                "commentContents": commentContents,
                "boardId": boardId
            },
            success: function (res) {
                console.log(res);
                let output = "<table class='table table-bordered'>";
                // Generate the updated comment list HTML using the response data
                output += "</table>";
                result.innerHTML = output;
            },
            error: function () {
                console.log("Update failed");
            }
        });
    };

    const comment_delete = () => {
        const result = document.getElementById("comment-list");
        $.ajax({
            type: "post",
            url: "/comment/delete",
            data: {
                "commentId": commentId,
                "boardId": boardId
            },
            success: function (res) {
                console.log(res);
                let output = "<table class='table table-bordered'>";
                // Generate the updated comment list HTML using the response data
                output += "</table>";
                result.innerHTML = output;
            },
            error: function () {
                console.log("Delete failed");
            }
        });
    };


    const board_list = () => {
        location.href = "/board/list?id=${board.id}&boardCategory=${boardCategory}&page=${paging.page}&q=${q}";
    }
    const board_update = () => {
        location.href = "/board/update?id=${board.id}&boardCategory=${boardCategory}&page=${paging.page}&q=${q}";
    }
    const board_delete = () => {
        const id = '${board.id}';
        location.href = "/board/delete?id=" + id;
    }

    const Like = () => {
        const boardId = '${board.id}';
        const memberId = '${sessionScope.id}';
        const result = document.getElementById("like-container");
        const eaResult = document.getElementById("like-ea");
        const eaValue = parseInt(eaResult.innerHTML);

        $.ajax({
            type: "post",
            url: "/board/likeUp",
            data: {
                "boardId": boardId,
                "memberId": memberId
            },
            success: function () {
                let output = "<button id='Like-button' class='btn btn-primary' onclick='UnLike()'>좋아요취소</button>";
                result.innerHTML = output;
                eaResult.innerHTML = eaValue + 1;
            },
            error: function () {
                console.log("실패");
            }
        })
    }

    const UnLike = () => {
        const boardId = '${board.id}';
        const memberId = '${sessionScope.id}';
        const result = document.getElementById("like-container");
        const eaResult = document.getElementById("like-ea");
        const eaValue = parseInt(eaResult.innerHTML);

        $.ajax({
            type: "post",
            url: "/board/likeDown",
            data: {
                "boardId": boardId,
                "memberId": memberId
            },
            success: function () {
                let output = "<button id='unLike-button' class='btn btn-primary' onclick='Like()'>좋아요</button>";
                result.innerHTML = output;
                eaResult.innerHTML = eaValue - 1;
            },
            error: function () {
                console.log("실패");
            }
        })
    }
    /*const toggleLike = () => {
        const likeButton = document.getElementById("like-button");

        if (likeButton.classList.contains("active")) {
            // Remove like
            likeButton.classList.remove("active");
            likeButton.innerText = "좋아요";
        } else {
            // Add like
            likeButton.classList.add("active");
            likeButton.innerText = "좋아요 취소";
        }
    }*/
    const likeVal = '${board.board_like}';
    const boardNo = '${board.id}';
    const userNo = '${sessionScope.loginId}';

    const toggleLike = () => {
        const likeButton = document.getElementById("like-button");

        if (likeButton.classList.contains("active")) {
            // Remove like
            likeButton.classList.remove("active");
            likeButton.innerText = "좋아요";
            // AJAX call to decrease like count
            $.ajax({
                type: 'post',
                url: "/board/likeUp",
                contentType: 'application/json',
                data: JSON.stringify({
                    "board_no": boardNo,
                    "user_no": userNo
                }),
                success: function (data) {
                    console.log("Like removed");
                }
            });
        } else {
            // Add like
            likeButton.classList.add("active");
            likeButton.innerText = "좋아요 취소";
            // AJAX call to increase like count
            $.ajax({
                type: 'post',
                url: "/board/likeDown",
                contentType: 'application/json',
                data: JSON.stringify({
                    "board_no": boardNo,
                    "user_no": userNo
                }),
                success: function (data) {
                    console.log("Like added");
                }
            });
        }
    };

</script>

</body>
</html>
