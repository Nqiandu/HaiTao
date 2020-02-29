<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>Black Cat 物流</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="${pageContext.request.contextPath}/resource/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/jquery.backstretch.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/layui/css/layui.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/layui/layui.js"></script>
	<!-- ajax获取一级菜单和二级菜单 -->
	<script type="text/javascript">
			var addone = 0;
			var arr = new Array();
			$(function() {
				$.ajax({
					type: "post",
					url: "accordion",
					dataType: "json",
					async: false, 
					success: function(data) {
						$("div #rank").empty();
						var p = "";
						for(var i = 0; i < data.length; i++) {
							p = "<li id='tree-" + data[i].id + "' class='layui-nav-item '><a href='javascript:;'>" + data[i].name + "</a></li>";
							$("div #rank").append(p);
							var tid = data[i].id;
							arr.push(tid);
							$.ajax({
								type: "post",
								url: "permission?pid=" + arr[i],
								dataType: "json",
								async: false,
								success: function(node) {
									var t = "";
									for(var j = 0; j < node.length; j++) {
										t = "<dl class='layui-nav-child'  > <dd><a class='site-demo-active' data-url='" + node[j].url + "' data-id='" + node[j].id + "' data-title='" + node[j].text + "' data-type='tabAdd'>" + node[j].text + "</a></dd></dl>";
										$("#tree-" + arr[addone]).append(t);
									}
									addone++;
								}
							});
						}
					}
				});
			});
		</script>
		<!-- 验证是否登录 -->
		<script type="text/javascript">
		$(function(){
			$.ajax({
				type:"post",
				dataType:"json",
				url:"session",
				success:function(data){
					if (data.code==100) {
						alert(data.msg);
						window.location.href='login.jsp';
					}
				}
			});
		});
		</script>
		<script>
			//用户退出
			function out(){

				layer.confirm('确认退出？', {
					  skin: 'layui-layer-lan',
					  offset: '200px',
					  area: ['300px'],
					  btn: ['确认', '取消'] //可以无限个按钮
					}, function(index, layero){
						$.ajax({
							type:"post",
							dataType:"json",
							url:"/logout",
							success:function(){
								window.location.href='login.jsp';
							}
						}); 
					}, function(index){
						layer.closeAll('page');
					});
			}
			</script>
			<style type="text/css">
				.layui-layout-admin .layui-body{bottom:0;overflow: hidden;}
			</style>
  </head>
  
  <body class="layui-layout-body">
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
				<div class="layui-logo">Black Cat 物流后台管理</div>
				<span id="weather"></span>
				<!-- 头部区域（可配合layui已有的水平导航） -->
				<ul class="layui-nav layui-layout-left">
						
				</ul>
				<ul class="layui-nav layui-layout-right">
					<li class="layui-nav-item"><span id="systemdate"></span></li>
					<li class="layui-nav-item">
						<a href="javascript:;">
							<span id="username"></span>
						</a>
						<script type="text/javascript">
						$.ajax({
							type: "post",
							url: "getUsername",
							async: false,
							success: function(node) {
								$("#username").html(node);
							}
						});
						</script>
						<dl class="layui-nav-child">
							<dd>
								<a id="home">首页</a>
							</dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:out()">注销</a>
					</li>
				</ul>
			</div>
			
			<div class="layui-side layui-bg-black">
				<div class="layui-side-scroll">
					<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
					<ul id="rank" class="layui-nav layui-nav-tree" lay-shrink="all" lay-filter="test">
							
					</ul>
				</div>
			</div>
	
			<div class="layui-body">
				<div class="layui-tab" lay-filter="demo" lay-allowclose="true" style="margin-top: 0px;padding-top: 0px;">
					<ul class="layui-tab-title"></ul>
					<ul class="rightmenu" style="display: none;position: absolute;">
						<li style="height: 20px;"></li>
						<li data-type="closeall" class="layui-btn layui-btn-danger">关闭所有</li>
					</ul>
					<div class="layui-tab-content" style="padding:0px">
							
					</div>
				</div>
			</div>
			
		</div>
		
		
		<script>
			layui.use(['element','table', 'form', 'layer', 'laydate','layedit'], function() {
				
				var $ = layui.jquery;
				var element = layui.element;
				var layer = layui.layer;
				//触发事件
				var active = {
					//在这里给active绑定几项事件，后面可通过active调用这些事件
					tabAdd: function(url, id, name) {
						//新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
						//关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
						element.tabAdd('demo', {
							title: name,
							content: '<iframe data-frameid="' + id + '" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:99%;" onload="FrameWH()" frameborder="0"></iframe>',
							id: id //规定好的id
						});
						CustomRightClick(id); //给tab绑定右击事件
						FrameWH(); //计算ifram层的大小
					},
					tabChange: function(id) {
						//切换到指定Tab项
						element.tabChange('demo', id); //根据传入的id传入到指定的tab项
					},
					tabDeleteAll: function(ids) { //删除所有
						$.each(ids, function(i, item) {
							element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
						});
					}
				};
				
				function FrameWH() {
					var h = $(document).height() - 41 - 10 - 44 ;
					$("iframe").css("height", h + "px");
				}

				$(window).resize(function() {
					FrameWH();
				});
				
				//这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
				//在网页打开的时候就加载一个页面,不然什么都不显示会太空旷
				if($(".layui-tab-title  li[lay-id]").length <= 0) {
					//如果比零小，则直接打开新的tab项,并跳转
					active.tabAdd('module/personal/welcome.jsp', 9999, 'Welcome');
					active.tabChange("9999");
				}
				
				$("#home").click(function(){
					active.tabAdd('module/personal/welcome.jsp', 9999, 'Welcome');
					active.tabChange("9999");
				});
				
				//当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
				$('.site-demo-active').on('click', function() {
					var dataid = $(this);

					//这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
					if($(".layui-tab-title  li[lay-id]").length <= 0) {
						//如果比零小，则直接打开新的tab项
						active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
					} else {
						//否则判断该tab项是否以及存在

						var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
						$.each($(".layui-tab-title li[lay-id]"), function() {
							//如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
							if($(this).attr("lay-id") == dataid.attr("data-id")) {
								isData = true;
							}
						});
						if(isData == false) {
							//标志为false 新增一个tab项
							active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
						}
					}
					//最后不管是否新增tab，最后都转到要打开的选项页面上
					active.tabChange(dataid.attr("data-id"));
				});

				function CustomRightClick(id) {
					//取消右键  rightmenu属性开始是隐藏的 ，当右击的时候显示，左击的时候隐藏
					$('.layui-tab-title li').on('contextmenu', function() {
						return false;
					});
					$('.layui-tab-title,.layui-tab-title li').click(function() {
						$('.rightmenu').hide();
					});
					//桌面点击右击 
					$('.layui-tab-title li').on('contextmenu', function(e) {
						var popupmenu = $(".rightmenu");
						popupmenu.find("li").attr("data-id", id); //在右键菜单中的标签绑定id属性

						//判断右侧菜单的位置 
						l = ($(document).width() - e.clientX) < popupmenu.width() ? (e.clientX - popupmenu.width()) : e.clientX;
						t = ($(document).height() - e.clientY) < popupmenu.height() ? (e.clientY - popupmenu.height()) : e.clientY;
						popupmenu.css({
							left: l,
							top: t
						}).show(); //进行绝对定位
						//alert("右键菜单")
						return false;
					});
				}
				
				/* 关闭选项卡 */
				$(".rightmenu li").click(function() {
					//右键菜单中的选项被点击之后，判断type的类型，决定关闭所有还是关闭当前。
					if($(this).attr("data-type") == "closethis") {
						//如果关闭当前，即根据显示右键菜单时所绑定的id，执行tabDelete
						active.tabDelete($(this).attr("data-id"));
					} else if($(this).attr("data-type") == "closeall") {
						var tabtitle = $(".layui-tab-title li");
						var ids = new Array();
						$.each(tabtitle, function(i) {
							ids[i] = $(this).attr("lay-id");
						});
						//如果关闭所有 ，即将所有的lay-id放进数组，执行tabDeleteAll
						active.tabDeleteAll(ids);
					}
					$('.rightmenu').hide(); //最后再隐藏右键菜单
				});

			});

			/* 获取时间 */
			window.onload = function() {
				// nowTime
				var chId = document.getElementById("nowTime");

				function geTime() {
					var nTime = new Date();
					var nY = nTime.getFullYear();
					var nM = nTime.getMonth() + 1;
					var nD = nTime.getDate();
					var nH = nTime.getHours();
					var nMi = nTime.getMinutes();
					var nS = nTime.getSeconds();
					var nSe = ((nTime.getSeconds() % 2) == 1) ? ":" : " ";

					function initArray() {
						for(var i = 0; i < initArray.arguments.length; i++)
							this[i] = initArray.arguments[i];
					}
					var isnDays = new initArray("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日");
					nMi = nMi > 9 ? nMi : "0" + nMi;
					if(nH > 5 && nH < 12) {
						//nH=nH>9?nH:"0"+nH;
						nH = "上午" + nH;
					} else if(nH > 11 && nH < 18) {
						nH = nH - 12;
						//nH=nH>9?nH:"0"+nH;
						nH = "下午" + nH;
					} else if(nH > 17 && nH < 24) {
						nH = nH - 12;
						//nH=nH>9?nH:"0"+nH;
						nH = "晚上" + nH;
					} else {
						//nH="0"+nH;
						nH = "凌晨" + (nH);
					}
					nS = nS > 9 ? nS : "0" + nS;
					str = nY + "年" + nM + "月" + nD + "日  " + isnDays[nTime.getDay()] + " " + nH + ":" + nMi + ":" + nS;
					systemdate.innerHTML = str;
					setTimeout(geTime, 1000);
				}
				geTime();
			};
		</script>
	</body>
</html>
