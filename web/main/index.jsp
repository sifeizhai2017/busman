<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2019/11/17
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>奉贤新巴</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
        request.setAttribute("path", basePath);
    %>
    <script src="../js/jquery-3.4.1.slim.min.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <style>
        .my-navbar {
            padding: 0 150px;
        }

        .img-wrapper {
            /*width: 80%;*/
            /*height: 500px;*/
            margin: 0 auto;
        }

        .img-wrapper img {
            height: 500px;
        }

        .my-block {
            text-shadow: 2px 2px 2px black;
        }

        .card-wrapper {
            width: 80%;
            margin: 30px auto;
            display: flex;
            justify-content: space-between;
        }

        .card-wrapper div {
            width: 90%;
        }

        .my-card {
            /*display: inline-block;*/
        }
    </style>
</head>
<body>
<div class="top-wrapper">
    <nav class="navbar navbar-inverse navbar-fixed-top my-navbar">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <a class="navbar-brand" href="#">
                <img src="../img/xb.svg" height="30px" alt="" style="margin-top: -4px;">
            </a>
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">奉贤新巴</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="ticket.jsp">车票购买 <span class="sr-only">(current)</span></a></li>

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
<div class="img-wrapper">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="../img/carousel/1.jpg" alt="...">
                <div class="carousel-caption">
                    <h3>新巴服务&nbsp;&nbsp;日日进步</h3>
                    <p>新巴以客为先，努力维持高质素的巴士服务。我们致力营造开放、友善的沟通环境，透过多种不同的沟通渠道，加强与乘客的联系。</p>
                </div>
            </div>
            <div class="item">
                <img src="../img/carousel/2.jpg" alt="...">
                <div class="carousel-caption">
                    <h3>绿色新巴&nbsp;&nbsp;服务到家</h3>
                    <p>新巴一向致力保护环境，并订定一系列环保措施，不断作出各种自发性的强化项目，希望为市民提供高质素服务的同时，亦为社会带来更清新环境。我们同时更进一步将环保理念化为实践行动，融入公司的营运理念中。</p>
                </div>
            </div>
            <div class="item">
                <img src="../img/carousel/3.jpg" alt="...">
                <div class="carousel-caption">
                    <h3>心系生活每一程</h3>
                    <p>新巴与时并进，不断引进崭新科技，提升巴士服务水平，满足乘客的需要。公司推出崭新综合数据智能系统，优化路线查询服务及提升车队管理效率，同时加强与乘客的沟通。</p>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>

<div class="card-wrapper">
    <div class="row">
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <img src="../img/card/1.jpg" alt="...">
                <div class="caption">
                    <h3>一流的服务</h3>
                    <p>有空调有座位哪都到，差你一个就发车</p>
                    <p><a href="#" class="btn btn-primary" role="button">了解更多</a></p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <img src="../img/card/2.jpg" alt="...">
                <div class="caption">
                    <h3>二流的车长</h3>
                    <p>我们的车长均未考过驾驶证</p>
                    <p><a href="#" class="btn btn-primary" role="button">了解更多</a></p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <img src="../img/card/4.jpg" alt="...">
                <div class="caption">
                    <h3>三流的配车</h3>
                    <p>12年的客车我们争取用满20年，超越丧南指日可待</p>
                    <p><a href="#" class="btn btn-primary" role="button">了解更多</a></p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <img src="../img/card/5.jpg" alt="...">
                <div class="caption">
                    <h3>四流的素质</h3>
                    <p>我们绝对不会像素交一样强行让座</p>
                    <p><a href="#" class="btn btn-primary" role="button">了解更多</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="footer ">
    <div class="container">
        <div class="row footer-top">
            <div class="col-md-6 col-lg-9">
                <h4>
                    <img src="../img/xb.svg">
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
                <li><a href="http://www.miibeian.gov.cn/" target="_blank">京ICP备11008151号-6</a></li><li>京公网安备11010802014853</li>
            </ul>
        </div>
    </div>
</footer>
</body>
</html>
