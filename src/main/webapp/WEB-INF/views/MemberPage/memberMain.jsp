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
        <section>
            <%@include file="../component/category.jsp" %>
            <div class="col-lg-9 my-4 mb-4">
                <%-- 여기서부터 본문내용 입력 --%>
                <div class="container">

                </div>
        </section>
    </div>
</div>
<%@include file="../component/footer.jsp" %>


</body>
</html>
