<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>欢迎页面-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<link rel="stylesheet" href="../static/css/font.css">
		<link rel="stylesheet" href="../static/css/weadmin.css">
		<link rel="stylesheet" href="./fa/css/all.css">
	</head>

	<body>
		<div class="weadmin-body">
			<blockquote class="layui-elem-quote">欢迎使用班车后台管理系统！</blockquote>
			<div class="layui-col-lg12 layui-collapse" style="border: none;">
				<div class="layui-col-lg6 layui-col-md12">
					<!--统计信息展示-->
					<fieldset class="layui-elem-field" style="padding: 5px;">
						<!--WeAdmin公告-->
						<div class="layui-card">
							<div class="layui-card-header layui-elem-quote">公告</div>
							<div class="layui-card-body">
								<div class="layui-carousel weadmin-notice" lay-filter="notice" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 280px;">
									<div carousel-item="">
										<div class="">
											<a href="javascript:;" target="_blank" class="layui-bg-red">2019年11月12日 奉南专线更名奉贤73路</a>
										</div>
										<div class="">
											<a href="javascript:;" target="_blank" class="layui-bg-blue">2019年11月13日 卫奉专线更名889路</a>
										</div>
										<div class="">
											<a href="javascript:;" target="_blank" class="layui-bg-green">2019年11月14日 奉柘专线更名1902路</a>
										</div>
										<div class="">
											<a href="javascript:;" target="_blank" class="layui-bg-black">2019年11月15日 奉柘专线由于客流原因撤线</a>
										</div>
									</div>
									<div class="layui-carousel-ind">
										<ul>
											<li class="layui-this"></li>
											<li></li>
										</ul>
									</div>
									<!--<button class="layui-icon layui-carousel-arrow" lay-type="sub"></button>
									<button class="layui-icon layui-carousel-arrow" lay-type="add"></button>-->
								</div>
							</div>
						</div>
						<!--<legend>信息统计</legend>-->
						<blockquote class="layui-elem-quote font16">信息统计</blockquote>
						<div class="">
							<table class="layui-table">
								<thead>
									<tr>
										<th colspan="2" scope="col">服务器信息</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th width="30%">服务器计算机名</th>
										<td><span id="lbServerName"><%=request.getRemoteAddr()%></span></td>
									</tr>
									<tr>
										<td>服务器IP地址</td>
										<td><%=request.getLocalAddr()%></td>
									</tr>
									<tr>
										<td>服务器域名</td>
										<td>FXNWSTBus.com</td>
									</tr>
									<tr>
										<td>服务器端口 </td>
										<td><%=request.getLocalPort()%></td>
									</tr>
									<tr>
										<td>本文件所在文件夹 </td>
										<td><%=request.getRealPath("/")%>></td>
									</tr>
									<%
										Calendar calendar= Calendar.getInstance();
										SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
									%>
									<tr>
										<td>WeAdmin时间 </td>
										<td id="firstTime"><%=dateFormat.format(calendar.getTime())%>></td>
									</tr>
									<tr>
										<td>上次更新时间 </td>
										<td id="lastTime">7210分钟</td>
									</tr>
								</tbody>
							</table>
						</div>
					</fieldset>
				</div>
				<div class="layui-col-lg6 layui-col-md12">
					<fieldset class="layui-elem-field we-changelog" style="padding: 5px;">
						<!--更新日志-->
						<blockquote class="layui-elem-quote font16">发展历程&amp;更新日志</blockquote>
						<ul class="layui-timeline" style="height: 729px; overflow-y: auto;">
							<li class="layui-timeline-item">
								<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
								<div class="layui-timeline-content layui-text">
									<div class="layui-timeline-title">
										<h3>新巴三汽彭奉专线开通！</h3>
										<span class="layui-badge-rim">2019-06-18</span>
									</div>
									<ul>
										<li>方便了共和新路沿线与奉贤校区的联系</li>
									</ul>
								</div>
							</li>
							<li class="layui-timeline-item">
								<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
								<div class="layui-timeline-content layui-text">
									<div class="layui-timeline-title">
										<h3>新巴二汽徐奉专线开通！</h3>
										<span class="layui-badge-rim">2019-01-15</span>
									</div>
									<ul>
										<li>方便了徐家汇与奉贤校区的联系</li>
									</ul>
								</div>
							</li>
							<li class="layui-timeline-item">
								<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
								<div class="layui-timeline-content layui-text">
									<div class="layui-timeline-title">
										<h3>新巴一汽陆奉专线开通！</h3>
										<span class="layui-badge-rim">2018-04-03</span>
									</div>
									<ul>
										<li>方便了曹杨地区与奉贤校区的联系</li>
									</ul>
								</div>
							</li>
							<li class="layui-timeline-item">
								<i class="layui-icon layui-timeline-axis">&#xe63f;</i>
								<div class="layui-timeline-content layui-text">
									<div class="layui-timeline-title">
										<h3>新巴五汽沪奉专线开通！</h3>
										<span class="layui-badge-rim">2018-03-28</span>
									</div>
									<ul>
										<li>方便了人民广场与奉贤校区的联系</li>
									</ul>
								</div>
							</li>
							<li class="layui-timeline-item">
								<i class="layui-icon layui-timeline-axis" style="color: #FF5722;">&#xe756;</i>
								<div class="layui-timeline-content layui-text">
									<div class="layui-timeline-title">
										<h3>新巴公司正式成立！</h3>
										<span class="layui-badge-rim">2018-02-05</span>
									</div>
									<blockquote class="layui-elem-quote">
										新巴公司方便了我市主城区与奉贤校区的联系
										<i class="fas fa-smile"></i>
									</blockquote>
									<ul>
										<li>新巴公司由新巴一汽、新巴二汽、新巴三汽、新巴四汽、新巴五汽组成</li>
										<li>五个公司分别连接奉贤校区与本市东南部、东北部、西南部、西北部与市中心的运行</li>
									</ul>
								</div>
							</li>
						</ul>
					</fieldset>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
		layui.extend({
			admin: '{/}../static/js/admin',
		});
		layui.use(['jquery', 'element','util', 'admin', 'carousel'], function() {
			var element = layui.element,
				$ = layui.jquery,
				carousel = layui.carousel,
				util = layui.util,
				admin = layui.admin;
			//建造实例
			carousel.render({
				elem: '.weadmin-shortcut'
				,width: '100%' //设置容器宽度				
				,arrow: 'none' //始终显示箭头	
				,trigger: 'hover'
				,autoplay:false
			});
			
			carousel.render({
				elem: '.weadmin-notice'
				,width: '100%' //设置容器宽度				
				,arrow: 'none' //始终显示箭头	
				,trigger: 'hover'
				,autoplay:true
			});
			
			$(function(){
				setTimeAgo(2018,0,1,13,14,0,'#firstTime');
				setTimeAgo(2019,5,20,16,0,0,'#lastTime');
			});
			function setTimeAgo(y, M, d, H, m, s,id){
			    var str = util.timeAgo(new Date(y, M||0, d||1, H||0, m||0, s||0));
			    $(id).html(str);
			    console.log(str);
			 };
		});
	</script>

</html>