<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2019/11/19
  Time: 22:49
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
                    <li><a href="#">关于我们</a></li>
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
            <h1>关于我们</h1>
            <p>了解有关新巴的历史</p>
        </div>
    </div>
</div>
<div class="main-wrapper">
    <div class="page-header">
        <h1>新世界第一巴士 <small>New World First Bus</small></h1>
    </div>
    <p>新世界第一巴士服务有限公司（「新巴」）在1998年3月31日透过公开竞投，赢得政府批出中华汽车有限公司(「中巴」)88条港岛 巴士路线的专营权，并于同年9月1日开展服务。新巴专业的服务队伍不遗馀力地为乘客提供安全、可靠、环保、高效率及物有所值的巴士服务。  </p>
    <p>在2000年，「新巴资讯旅程」启用，为乘客在旅途中提供即时资讯及娱乐，并推出第一组八达通巴士转乘优惠计划。至年底，新巴 率先购入欧盟三型巴士，成为全港首间订购欧盟三型巴士的公司，并宣佈全线车队转用超低硫燃油。</p>
    <div class="page-header">
        <h1>董事总经理致辞 <small>General Manager's Words</small></h1>

    </div>
    <p>
        新巴城巴是新创建集团全资拥有的附属公司。两巴一共有5,000多名员工，车队超过1,600辆巴士，行走约200条路线，每日接载超过100万乘客人次。
    </p>
    <p>
        我们持续引入市场上最环保的巴士、更新维修设备，以及引进崭新科技，配合专业的管理团队及热诚投入的员工，为乘客提供安全、舒适及可靠的巴士服务。乘客资讯方面，我们的网站载有详尽的公司介绍，亦有手机应用程式方便乘客「智慧出行」，随时随地浏览路线资料。
    </p>
    <p>
        我们会继续贯彻引进创新技术及保护环境的理念，为大家提供可持续的优质公共巴士服务。希望每一天都能接载您！
    </p>
    <p>
        董事总经理 钟泽文
    </p>
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
