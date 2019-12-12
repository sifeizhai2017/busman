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
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="./layui/css/layui.css">
    <link rel="stylesheet" href="./css/login.css">
    <style type="text/css">
        .container {
            width: 420px;
            height: 180px;
            min-height: 180px;
            max-height: 180px;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            margin: auto;
            padding: 30px;
            padding-bottom: 80px;
            z-index: 130;
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
            /*margin-bottom: 20px;*/
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
    </style>
    <script src="./layui/layui.js"></script>
</head>
<body>
<form class="layui-form" action="LoginServlet" method="post">
    <div class="container">
        <p class="reg">登 录</p>
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
                <button class="layui-btn" lay-submit lay-filter="formDemo">登陆</button>
            </div>
        </div>
        <a href="" class="font-set">忘记密码</a> <a href="register.jsp" class="font-set">立即注册</a>
    </div>
</form>
</body>
</html>
