<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2019/11/19
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
        request.setAttribute("path", basePath);
    %>
    <link rel="stylesheet" href="${path}/bootstrap/css/bootstrap.css">
    <script src="${path}/js/jquery-3.4.1.slim.min.js"></script>
    <script src="${path}/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${path}/fa/css/all.css">
    <style>
        a {
            text-decoration: none;
        }

        .my-navbar {
            padding: 0 150px;
        }

        .my-jumu {
            background-color: rgb(97, 71, 137);
        }

        .my-container {
            color: white;
        }

        .main-wrapper {
            width: 75%;
            margin: 0 auto;
        }

        .blank {
            width: 500px;
        }

    </style>
</head>
<body>
<div class="top-wrapper">
    <nav class="navbar navbar-inverse navbar-fixed-top my-navbar">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <a class="navbar-brand" href="#">
                <img src="${path}/img/xb.svg" height="30px" alt="" style="margin-top: -4px;">
            </a>
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${path}/main/index.jsp">奉贤新巴</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="${path}/main/ticket.jsp">车票购买 <span class="sr-only">(current)</span></a>
                    </li>

                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${path}/main/aboutus.jsp">关于我们</a></li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">个人中心 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">充值</a></li>
                            <li><a href="#">验票</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${path}/main/forgetpwd.jsp">忘记密码</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
<div class="tip-wrapper">
    <div class="jumbotron my-jumu">
        <div class="container my-container">
            <br><br>
            <h1>充值</h1>
            <p>您可以在这里对帐户充值</p>
        </div>
    </div>
</div>
<div class="main-wrapper">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">帐户余额充值</h3>
        </div>
        <div class="panel-body">
            <%
                int ubalance = (int) request.getAttribute("ubalance");
            %>
            <form action="${path}/AddBalanceServlet">
                <ul class="list-group">
                    <li class="list-group-item active">您当前的余额是</li>
                    <li class="list-group-item"><%=ubalance%></li>
                </ul>
                <br>
                <ul class="list-group">
                    <li class="list-group-item active">请输入充值金额</li>
                    <li class="list-group-item">
                        <input type="text" name="amount" class="form-control" placeholder="Enter your value here"><br>
                        <button type="submit" class="btn btn-primary btn-lg btn-block">充值</button>
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>
<footer class="footer ">
    <div class="container">
        <div class="row footer-top">
            <div class="col-md-6 col-lg-9">
                <h4>
                    <img src="${path}/img/xb.svg">
                </h4>
            </div>
            <div class="col-md-6  col-lg-2 col-lg-offset-1">
                <div class="row about">
                    <div class="col-sm-12">
                        <h4>特别致谢</h4>
                        <ul class="list-unstyled">
                            <li><a href="https://www.maoyuncloud.com/" target="_blank">猫云</a></li>
                            <li><a href="https://www.jdcloud.com/" target="_blank">京东云</a></li>
                            <li><a href="https://www.upyun.com" target="_blank">又拍云</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
        <hr>
        <div class="row footer-bottom">
            <ul class="list-inline text-center">
                <li><a href="http://www.miibeian.gov.cn/" target="_blank">京ICP备11008151号-6</a></li>
                <li>京公网安备11010802014853</li>
            </ul>
        </div>
    </div>
</footer>
</body>
</html>
