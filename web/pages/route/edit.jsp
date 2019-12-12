<%@ page import="org.bus.entity.Bus" %>
<%@ page import="org.bus.entity.Route" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>添加订单-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <%--    解决请求转发后无法读取css/js的问题--%>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
        request.setAttribute("path", basePath);
//        System.out.println(path);
    %>
    <link rel="stylesheet" href="${path}/static/css/font.css">
    <link rel="stylesheet" href="${path}/static/css/weadmin.css">
    <link rel="stylesheet" href="${path}/fa/css/all.css">
    <script src="${path}/lib/layui/layui.js" charset="utf-8"></script>
    <%--    解决无法在请求转发后打开增加配车窗口的问题--%>
    <script src="${path}/static/js/admin.js" charset="utf-8"></script>
    <%--    通过ajax实现自动调用servlet--%>
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<%--    <link rel="stylesheet" href="../../static/css/font.css">--%>
<%--    <link rel="stylesheet" href="../../static/css/weadmin.css">--%>
<%--    <script src="../../lib/layui/layui.js" charset="utf-8"></script>--%>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<%
    Route route = (Route) request.getAttribute("route");
    System.out.println(route);
%>
<div class="weadmin-body">
    <form class="layui-form" method="post" action="${path}/UpdateRouteServlet">
        <div class="layui-form-item">
            <label class="layui-form-label">线路名</label>
            <div class="layui-input-block">
                <input type="text" name="name" lay-verify="title" autocomplete="off" value="<%=route.getName()%>"
                       class="layui-input" readonly="readonly">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">发车时间</label>
            <div class="layui-input-block">
                <input type="text" name="time" lay-verify="title" autocomplete="off" value="<%=route.getTime()%>"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">首站</label>
            <div class="layui-input-block">
                <input type="text" name="start" lay-verify="title" autocomplete="off" value="<%=route.getStart()%>"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">尾站</label>
            <div class="layui-input-block">
                <input type="text" name="end" lay-verify="title" autocomplete="off" value="<%=route.getEnd()%>"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">经停站</label>
            <div class="layui-input-block">
                <input type="text" name="via" lay-verify="title" autocomplete="off" value="<%=route.getVia()%>"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">购票人数</label>
            <div class="layui-input-block">
                <input type="text" name="count" lay-verify="title" autocomplete="off" value="<%=route.getCount()%>"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">票价</label>
            <div class="layui-input-block">
                <input type="text" name="price" lay-verify="title" autocomplete="off" value="<%=route.getPrice()%>"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">座位数</label>
            <div class="layui-input-block">
                <input type="text" name="seat" lay-verify="title" autocomplete="off" value="<%=route.getSeat()%>"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">修改</button>
            </div>
        </div>
    </form>
</div>
<script>
    layui.extend({
        admin: '{/}../../static/js/admin'
    });
    layui.use(['form', 'admin', 'jquery', 'table', 'layer'], function () {
        var form = layui.form,
            admin = layui.admin,
            $ = layui.jquery,
            table = layui.table,
            layer = layui.layer;

        //自定义验证规则
        form.verify({
            nikename: function (value) {
                if (value.length < 5) {
                    return '昵称至少得5个字符啊';
                }
            },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            repass: function (value) {
                if ($('#L_pass').val() != $('#L_repass').val()) {
                    return '两次密码不一致';
                }
            }
        });

        //监听提交
        form.on('submit(add)', function (data) {
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {
                icon: 6
            }, function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
        });

        var num = 3;

        window.addTable = function () {
            var tableHtml = "";
            tableHtml += '<tr id="tr' + num + '">' +
                '<td>' + num + '</td>' +
                '<td><div class="layui-input-inline"><input type="text" name="canshu1" class="layui-input"></div></td>' +
                '<td><div class="layui-input-inline"><input type="text" name="canshu2" class="layui-input"></div></td>' +
                '<td><div class="layui-input-inline"><input type="text" name="canshu3" class="layui-input"></div></td>' +
                '<td><div class="layui-input-inline"><input type="text" name="canshu4" class="layui-input"></div></td>' +
                '<td><a style="cursor: pointer; color: blue;" onclick="removeTr(' + num + ')">删除</a>' +
                '</td>' +
                '</tr>';
//				tableHtml +='<tr>'+
//								'<td>2</td>'+
//								'<td>haier海尔 BC-93TMPF 93升单门冰箱</td>'+
//								'<td>0.01</td>'+
//								'<td>984</td>'+
//								'<td>9.84</td>'+
//								'<td><a style="cursor: pointer; color: blue;" onclick="removeTr(2)">删除</a></td>'+
//							'</tr>';

            var elements = $("#myTable").children().length; //表示id为“mtTable”的标签下的子标签的个数

            $("#myTable").children().eq(elements - 1).after(tableHtml); //在表头之后添加空白行
            num++;
        }

        //删除行
        function removeTr(trNum) {
            $("#tr" + trNum).remove();
        }

    });
</script>
</body>

</html>