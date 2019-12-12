<%@ page import="org.bus.entity.Route" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2019/11/19
  Time: 7:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>确认购票信息</title>
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
            color: white;
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
                            <li><a href="${path}/ChargeAccountServlet">充值</a></li>
                            <li><a href="${path}/main/showtickets.jsp">验票</a></li>
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
            <h1>确认订票信息</h1>
            <p>请确认您的订票信息，如果错误，请按下方返回按钮返回</p>
        </div>
    </div>
</div>
<div class="main-wrapper">
    <div class="page-header">
        <h1>信息确认 <small>Check Info</small></h1>
    </div>
    <%
        Route route = (Route) request.getAttribute("route");
    %>
    <div class="panel panel-info">
        <!-- Default panel contents -->
        <div class="panel-heading">购票信息</div>
        <div class="panel-body">
            <form action="BuyTicketServlet" method="post">
                线路名：<input type="text" name="name" class="form-control" placeholder="Text input" readonly="readonly"
                           value="<%=route.getName()%>"><br>
                发车时间：<input type="text" name="time" class="form-control" placeholder="Text input" readonly="readonly"
                            value="<%=route.getTime()%>"><br>
                首站：<input type="text" name="start" class="form-control" placeholder="Text input" readonly="readonly"
                          value="<%=route.getStart()%>"><br>
                经停：<input type="text" name="via" class="form-control" placeholder="Text input" readonly="readonly"
                          value="<%=route.getVia()%>"><br>
                尾站：<input type="text" name="end" class="form-control" placeholder="Text input" readonly="readonly"
                          value="<%=route.getEnd()%>"><br>
                票价：<input type="text" name="price" class="form-control" placeholder="Text input" readonly="readonly"
                          value="<%=route.getPrice()%>"><br>
                当前购票人数：
                <input type="text" name="count" class="form-control" placeholder="Text input" readonly="readonly"
                       value="<%=route.getCount()%>"><br>
                座位数：
                <input type="text" name="seat" class="form-control" placeholder="Text input" readonly="readonly"
                       value="<%=route.getSeat()%>">
                <br>
                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-danger">
                            <a href="${path}/main/ticket.jsp">
                                <i class="fas fa-arrow-left"></i>&nbsp;&nbsp;返回
                            </a>
                        </button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success">提交</button>
                    </div>
                </div>
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
