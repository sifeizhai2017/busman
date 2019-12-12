<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2019/11/10
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录失败</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="./layui/css/layui.css">
    <link rel="stylesheet" href="./css/register.css">
    <style type="text/css">
        body {
            background-image: url("./img/register-bg.png");
            background-size: cover;
            background-position: 0 -136px;
            background-size: cover;
        }

        .container {
            width: 420px;
            height: 220px;
            min-height: 220px;
            max-height: 220px;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            margin: auto;
            padding: 30px;
            z-index: -10;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 3px 18px rgba(100, 0, 0, .5);
            font-size: 16px;
        }

        .close {
            background-color: white;
            border: none;
            font-size: 18px;
            margin-left: 410px;
            margin-top: -10px;
        }

        .layui-input {
            border-radius: 5px;
            width: 300px;
            height: 40px;
            font-size: 15px;
        }

        .layui-form-item {
            margin-left: -20px;
        }

        .layui-btn {
            margin-left: -50px;
            border-radius: 5px;
            width: 350px;
            height: 40px;
            font-size: 15px;
            margin-top: 16px;
        }

        .font-set {
            font-size: 13px;
            text-decoration: none;
            margin-left: 120px;
        }

        a:hover {
            text-decoration: underline;
        }

        .reg {
            text-align: center;
            font-size: 20px;
            margin-bottom: 15px;
        }

        .mask {
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            z-index: 999;
            position: relative;
        }

        .my-block {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto;
            padding-top: 70px;
            z-index: 9999;
        }
    </style>
    <script src="./layui/layui.js"></script>
    <script>
        function back() {
            history.back();
        }
    </script>
</head>
<body>
<%--<button data-method="notice" class="layui-btn">示范一个公告层</button>--%>

<div class="mask">
    <div class="layui-layer layui-layer-page my-block" id="layui-layer37" type="page" times="37" showtime="0"
         contype="object"
         style="z-index: 19891051; width: 360px; top: 65.5px; left: 469.5px;">
        <div id="" class="layui-layer-content">
            <div class="layui-card demo-component-layer layui-layer-wrap" style="display: block;">
                <div class="layui-card-header">肥肠爆欠</div>
                <div class="layui-card-body">
                    <blockquote class="layui-elem-quote">
                        用户名已被注册，<a href="javascript:;" onclick="back()">点击此处</a>将会重回注册界面。<br>
                        我什么都不会做的。
                    </blockquote>
                </div>
            </div>
        </div>
        <span class="layui-layer-setwin"><a class="layui-layer-ico layui-layer-close layui-layer-close2"
                                            href="javascript:;"></a></span><span class="layui-layer-resize"></span>
    </div>
</div>
<form class="layui-form" action="AddUserServlet" method="post">
    <div class="container">
        <p class="reg">注 册</p>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="uname" required lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="upwd" required lay-verify="required" placeholder="请输入密码"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo" type="submit">注册</button>
            </div>
        </div>
        <%--        <a href="" class="font-set">忘记密码</a> <a href="register.jsp" class="font-set">立即注册</a>--%>
    </div>
</form>
</body>
</html>
