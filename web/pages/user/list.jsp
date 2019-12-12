<%@ page import="java.sql.*" %>
<%@ page import="org.bus.entity.Bus" %>
<%@ page import="java.util.List" %>
<%@ page import="org.bus.service.IBusInfoService" %>
<%@ page import="org.bus.service.impl.BusInfoServiceImpl" %>
<%@ page import="org.bus.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>订单列表-WeAdmin Frame型后台管理系统-WeAdmin 1l.0</title>
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
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        layui.extend({
            admin: '{/}../../static/js/admin'
        });
        layui.use(['laydate', 'jquery', 'admin'], function () {
            var laydate = layui.laydate,
                $ = layui.jquery,
                admin = layui.admin;
            //执行一个laydate实例
            laydate.render({
                elem: '#start' //指定元素
            });
            //执行一个laydate实例
            laydate.render({
                elem: '#end' //指定元素
            });

            /*用户-停用*/
            function member_stop(obj, id) {
                layer.confirm('确认要停用吗？', function (index) {
                    if ($(obj).attr('title') == '启用') {
                        //发异步把用户状态进行更改
                        $(obj).attr('title', '停用')
                        $(obj).find('i').html('&#xe62f;');

                        $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                        layer.msg('已停用!', {
                            icon: 5,
                            time: 1000
                        });

                    } else {
                        $(obj).attr('title', '启用')
                        $(obj).find('i').html('&#xe601;');

                        $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                        layer.msg('已启用!', {
                            icon: 5,
                            time: 1000
                        });
                    }
                });
            }

            /*用户-删除*/
            function member_del(obj, id) {
                layer.confirm('确认要删除吗？', function (index) {
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {
                        icon: 1,
                        time: 1000
                    });
                });
            }

            function delAll(argument) {
                var data = tableCheck.getData();
                layer.confirm('确认要删除吗？' + data, function (index) {
                    //捉到所有被选中的，发异步进行删除
                    layer.msg('删除成功', {
                        icon: 1
                    });
                    $(".layui-form-checked").not('.header').parents('tr').remove();
                });
            }
        });

    </script>
    <style>
        .special-a {
            color: gray;
            cursor: pointer;
            pointer-events: none;
        }

        .weadmin-block {
            padding-left: 10px;
            padding-right: 30px;
        }
    </style>
</head>

<body>
<div class="weadmin-body">
    <div class="weadmin-block">

        <button class="layui-btn" onclick="WeAdminShow('添加订单','http://localhost:8080/BusManagement/pages/user/add.jsp')">
            <i class="fas">&#xf067;</i>&nbsp;&nbsp;添加
        </button>
        <button class="layui-btn layui-bg-blue">
            <a href="${path}/QueryAllUsersServlet" style="color: white">
                <i class="fas">&#xf021;</i>&nbsp;&nbsp;刷新数据
            </a>
        </button>
        <span class="fr" style="line-height:40px">
            <%
                final String URL = "jdbc:mysql://localhost:3306/bus?useSSL=false&serverTimezone=UTC";
                final String USERNAME = "root";
                final String PWD = "123456";
                Connection connection = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(URL, USERNAME, PWD);
                    String sql = "select count(*) from userinfo";
                    pstmt = connection.prepareStatement(sql);
                    rs = pstmt.executeQuery();
                    while (rs.next()) {
                        int count = rs.getInt(1);
                        out.println("共有数据" + count + "条");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) {
                            rs.close();
                        }
                        if (pstmt != null) {
                            pstmt.close();
                        }
                        if (connection != null) {
                            connection.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </span>
    </div>
    <form method="get" action="${path}/UpdateBusServlet?">
        <table class="layui-table">
            <thead>
            <tr>
                <th>用户名</th>
                <th>密码</th>
                <th>余额</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%
                // 获取request域中的数据
                List<User> users = (List<User>) request.getAttribute("users");
                System.out.println(users);
                if (users != null) {
                    for (User user : users) {
            %>
            <tr>
                <td>
                    <a href="QueryStudentBySnoServlet?sno=<%=user.getUname() %>" class="special-a">
                        <input type="text" id="number" name="number" value="<%=user.getUname()%>"
                               lay-verify="required|number" autocomplete="off"
                               class="layui-input" readonly="readonly">
                    </a>
                </td>
                <td>
                    <input type="text" id="brand" name="brand" value="<%=user.getUpwd()%>"
                           lay-verify="required|brand" autocomplete="off"
                           class="layui-input" readonly="readonly">
                </td>
                <td>
                    <input type="text" id="route" name="route" value="<%=user.getUbalance()%>"
                           lay-verify="required|route" autocomplete="off"
                           class="layui-input" readonly="readonly">
                </td>
                <td class="td-manage">
                    <button type="button" class="layui-btn layui-btn-sm layui-bg-cyan" style="color: white">
                        <a href="${path}/QueryUserByUnameServlet?uname=<%=user.getUname()%>" style="color: #fff;">
                            <i class="fas">&#xf0ad;</i>&nbsp;&nbsp;修改
                        </a>
                    </button>
                    <button type="button" class="layui-btn layui-btn-sm layui-btn-normal layui-bg-red">
                        <a title="删除" onclick="member_del(this,'要删除的id')" style="color: white"
                           href="${path}/DeleteUserServlet?uname=<%=user.getUname()%>">
                            <i class="fas" style="color: white">&#xf00d;</i>&nbsp;&nbsp;删除
                        </a>
                    </button>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </form>
</div>
</body>

</html>