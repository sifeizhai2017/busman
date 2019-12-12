<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>班车后台管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="shortcut icon" href="./favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="./static/css/font.css">
    <link rel="stylesheet" href="./static/css/weadmin.css">
    <link rel="stylesheet" href="./fa/css/all.css">
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script>
        window.onload = function () {
            let myFrame = document.getElementById("my-frame");
            let menu1 = document.getElementById("menu1");
            let menu2 = document.getElementById("menu2");
            let menu3 = document.getElementById("menu3");
            let homepg = document.getElementById("homepg");
            menu1.onclick = (ev) => {
                // console.log(myFrame);
                myFrame.src = "./QueryAllBusesServlet";

            };

            menu2.onclick = (ev) => {
                // console.log(myFrame);
                // myFrame.src = "./pages/route/list.jsp";
                // myFrame.src = "./QueryAllBusesServlet";
                myFrame.src = "./QueryAllRoutesServlet";

            };

            menu3.onclick = (ev) => {
                myFrame.src = "./pages/user/list.jsp";
            };

            homepg.onclick = (ev) => {
                myFrame.src = "./pages/welcome.jsp";
            }
        }
    </script>
</head>

<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="index.jsp">班车后台管理系统</a>
    </div>

    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">Admin</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="WeAdminShow('个人信息','http://www.baidu.com')">个人信息</a>
                </dd>
                <dd>
                    <a onclick="WeAdminShow('切换帐号','./login.html')">切换帐号</a>
                </dd>
                <dd>
                    <a class="loginout" href="./login.html">退出</a>
                </dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index">
            <a href="https://www.jiuwei.com/" target="_blank">前台首页</a>
        </li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <div id="nav" class="nav">
            <li id="homepg">
                <a>
                    <i class="fas fa-home"></i>
                    <cite>返回首页</cite>
                </a>
            </li>
            <li id="menu1">
                <a id="aaa">
                    <i class="fas fa-bus"></i>
                    <cite>配车管理</cite>
                </a>
            </li>
            <li id="menu2">
                <a _href="">
                    <i class="fas fa-route"></i>
                    <cite>路线管理</cite>
                </a>
            </li>
            <li id="menu3">
                <a _href="">
                    <i class="fas fa-user"></i>
                    <cite>用户管理</cite>
                </a>
            </li>
        </div>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content" style="margin-top: -36px;">
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <iframe src='pages/welcome.jsp' frameborder="0" scrolling="yes" class="weIframe" id="my-frame"></iframe>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">Copyright ©2019 FXNWSTBus v1.0 All Rights Reserved</div>
</div>
<!-- 底部结束 -->
<script type="text/javascript">
    // layui扩展模块的两种加载方式-示例
    // layui.extend({
    //   admin: '{/}../../static/js/admin' // {/}的意思即代表采用自有路径，即不跟随 base 路径
    // });
    // //使用拓展模块
    // layui.use('admin', function(){
    //   var admin = layui.admin;
    // });
    layui.config({
        base: './static/js/'
        , version: '101100'
    }).extend({ //设定模块别名
        admin: 'admin'
        , menu: 'menu'
    });
</script>
</body>
<!--Tab菜单右键弹出菜单-->
<ul class="rightMenu" id="rightMenu">
    <li data-type="fresh">刷新</li>
    <li data-type="current">关闭当前</li>
    <li data-type="other">关闭其它</li>
    <li data-type="all">关闭所有</li>
</ul>

</html>