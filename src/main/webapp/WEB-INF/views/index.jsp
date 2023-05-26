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
<body class="pt-5">
<%@include file="./component/nav.jsp" %>
<div class="container">
    <div class="row">

        <%@include file="./component/category.jsp" %>
        <div class="col-lg-9 mx-3 my-4 mb-4">
            <%-- 여기서부터 본문내용 입력 --%>
                <div class="jumbotron">
                    <h1>Welcome to OsakaBoard!</h1>
                    <p>This is a community site for the Osaka Korean community.</p>
                    <p>Feel free to explore and participate in discussions.</p>
                    <a href="/board/paging" class="btn btn-primary">View Board</a>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Upcoming Events</h5>
                                <p class="card-text">Check out the latest events happening in Osaka.</p>
                                <a href="#" class="btn btn-primary">Learn More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Community Guidelines</h5>
                                <p class="card-text">Learn about our community guidelines and policies.</p>
                                <a href="#" class="btn btn-primary">Read Guidelines</a>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

    </div>
</div>
        </div>
        </section>
    </div>
</div>


<%@include file="./component/footer.jsp" %>


</body>
</html>
