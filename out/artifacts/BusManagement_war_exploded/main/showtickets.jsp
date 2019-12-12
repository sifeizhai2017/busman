<%@ page import="org.bus.entity.Ticket" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2019/11/19
  Time: 22:28
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
                            <li><a href="${path}/ChargeAccountServlet">充值</a></li>
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
            <h1>您的购票信息</h1>
            <p>您当前的购票信息如下</p>
        </div>
    </div>
</div>
<div class="main-wrapper">
    <div class="page-header">
        <h1>购票 <small>Buy tickets</small></h1>
    </div>
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="panel panel-default">
                <div class="panel-body">
                    <p class="bg-info" style="padding: 10px; border-radius: 4px;">
                        所有已经购买车次如下，如果出现无法显示数据的情况，请点击下方刷新数据按钮</p>
                    <button type="button" class="btn btn-primary">
                        <a href="${path}/ShowAllTicketsServlet" style="color: white">
                            <i class="fas fa-recycle"></i>&nbsp;&nbsp;刷新数据
                        </a>
                    </button>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <th>ID</th>
                    <th>用户名</th>
                    <th>线路名</th>
                </thead>
                <tbody>
                <%
                    //                  获取request域中的数据
                    List<Ticket> tickets = (List<Ticket>) request.getAttribute("tickets");
//                System.out.println(routes);
                    if (tickets != null) {
                        for (Ticket ticket : tickets) {
//                            System.out.println(ticket.getName());
                %>
                <tr>
                    <td>
                        <input type="text" name="id" class="form-control" placeholder="Text input" readonly="readonly"
                               value="<%=ticket.getUid()%>">
                    </td>
                    <td>
                        <input type="text" name="name" class="form-control" placeholder="Text input" readonly="readonly"
                               value="<%=ticket.getUname()%>">
                    </td>
                    <td>
                        <input type="text" name="start" class="form-control" placeholder="Text input"
                               readonly="readonly"
                               value="<%=ticket.getUticket()%>">
                    </td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
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
