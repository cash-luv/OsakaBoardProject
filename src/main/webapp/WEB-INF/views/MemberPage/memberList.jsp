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
        <div class="col-lg-9 my-4 mb-4">
            <%-- 여기서부터 본문내용 입력 --%>
            <div id="section">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>회원번호</th>
                        <th>ID</th>
                        <th>Password</th>
                        <th>이름</th>
                        <th>생년월일</th>
                        <th>성별</th>
                        <th>주소</th>
                        <th>Email</th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${memberList}" var="member">
                        <tr>
                            <td><a href="#" onclick="member_detail_ajax('${member.member_id}')">${member.member_id}</a>
                            </td>
                            <td>${member.memberId}</td>
                            <td>${member.memberPassword}</td>
                            <td>${member.memberName}</td>
                            <td>${member.memberBirth}</td>
                            <td>${member.memberGender}</td>
                            <td>${member.memberAddress} ${member.memberAddress1} ${member.memberAddress2} ${member.memberAddress3}</td>
                            <td>${member.memberEmail}</td>
<%--                            <td>--%>
<%--                                <button class="btn btn-primary" style="white-space: nowrap;"--%>
<%--                                        onclick="member_detail('${member.member_id}')">수정--%>
<%--                                </button>--%>
<%--                            </td>--%>
                            <td>
                                <button class="btn btn-danger" style="white-space: nowrap;"
                                        onclick="member_delete('${member.member_id}')">삭제
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div id="detail-area"></div>
            </div>
        </div>

    </div>
</div>
<%@include file="../component/footer.jsp" %>


</body>
<script>
    const member_detail_ajax = (id) => {
        const resultArea = document.getElementById("detail-area");
        $.ajax({
            type: "get",
            url: "/detail-ajax",
            data: {
                "id": id
            },
            success: function (res) {
                let result = "<table>";
                result += "<tr>";
                result += "<td>" + res.member_id + "</td>";
                result += "<td>" + res.memberId + "</td>";
                result += "<td>" + res.memberPassword + "</td>";
                result += "<td>" + res.memberName + "</td>";
                result += "<td>" + res.memberBirth + "</td>";
                result += "<td>" + res.memberGender + "</td>";
                result += "<td>" + res.memberName + "</td>";
                result += "<td>" + res.memberAddress + res.memberAddress1 + res.memberAddress2 + res.memberAddress3 + "</td>";
                result += "<td>" + res.memberEmail + "</td>";
                result += "</tr>";
                result += "</teble>";
                resultArea.innerHTML = result;
            },
            error: function () {
                alert("일치하는 정보가 없습니다!")
            }
        })
    }
    const member_detail = (id) => {
        location.href = "/member?id=" + id;
    }
    const member_delete = (id) => {
        location.href = "/delete?id=" + id;
    }
</script>
</html>
<%--int page; // 현재 페이지--%>
<%--int maxPage; // 전체페이지갯수--%>
<%--int startPage; // 하단에 보여지는 시작 페이지 번호--%>
<%--int endPage; // 하단에 보여지는 마지막 페이지 번호--%>
<%--int blockLimit; // 한화면에 보여줄 피이지 번호 갯수--%>
<%--int boardCount;--%>
<%--// 보드에 필요한 필드--%>
<%--int pageLimit; // 한화면에 보여줄 게시글--%>
<%--int pageStart; // 게시글 시작번호--%>

<%--public void setPage(int page) {--%>
<%--this.page = page;--%>
<%--}--%>
<%--public void setPageLimit(int pageLimit) {--%>
<%--this.pageLimit = pageLimit;--%>
<%--this.pageStart = (page -1) * this.pageLimit;--%>
<%--}--%>
<%--public void setBlockLimit(int blockLimit) {--%>
<%--this.blockLimit = blockLimit;--%>
<%--this.startPage =(((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;--%>
<%--}--%>
<%--public  void setBoardCount(int boardCount) {--%>
<%--this.boardCount = boardCount;--%>
<%--this.maxPage = (int)(Math.ceil((double)boardCount / this.pageLimit));--%>
<%--this.endPage = this.startPage + this.blockLimit -1;--%>
<%--}--%>