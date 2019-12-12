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
    <title>注册</title>
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
    </style>
    <script src="./layui/layui.js"></script>
</head>
<body>
<%
    //    error: adderror 失败
//    否则：1 确实执行了增加 2 直接访问查询成功页面
    String error = (String) request.getAttribute("error");
    if (error != null) {
        if (error.equals("addError")) {
            out.print("增加失败！");
        } else if (error.equals("noaddError")) {
            out.print("增加成功！");
        } // 根本没有执行增加
    }
%>
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
