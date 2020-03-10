<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Home</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="${pageContext.request.contextPath}/resource/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/echarts.js"></script>
    <script src="${pageContext.request.contextPath}/resource/js/jquery.backstretch.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/layui/layui.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/layui/css/layui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
	<style type="text/css">
		#addnotice{
			margin:5px;
		}
		#div1{
			text-align:center;
		}
	</style>
  </head>
  
  <body class="layui-bg-black">
    <div class="layui-fluid ">
    	<div class="layui-container ">
    		
    		<div class="layui-row">
			    <div class="layui-col-md9">
			      
						<div class="layui-card">
							<div class="layui-card-header">
								<h3 class="glyphicon glyphicon-menu-right">&nbsp<font color="#2F4056">欢迎<span id="username"></span>！您本次登陆时间为<span id="ltime"></span></font></h3>
							</div>		
							<script type="text/javascript">
							$.ajax({
								type: "post",
								url: "/getLasttimeById",
								async: false,
								success: function(node) {
									$("#username").html(node[0].name);
									$("#ltime").html(node[0].landingtime);
								}
							});


                            function ChangeDateFormat(val) {
                                if (val != null) {
                                    var date = new Date(parseInt(val.replace("/Date(", "").replace(")/", ""), 10));
                                    //月份为0-11，所以+1，月份小于10时补个0
                                    var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                                    var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
                                    var hour = date.getHours();
                                    var minute = date.getMinutes();
                                    var second = date.getSeconds();
                                    var dd = date.getFullYear() + "-" + month + "-" + currentDate + " "+hour+":"+minute+":"+second;
                                    alert(dd);
                                    return dd;
                                }

                                return "";
                            }
							</script>
						  <div class="layui-card-body">
						    	
						    	
						    	
						    	
						    	<!-- 弹弹珠小游戏 -->
						    	<div class="layui-card">
								  <div class="layui-card-body">
								    	<iframe src='/module/87879/index.html' frameborder="0" scrolling="no" style="width: 800px;height:450px"></iframe>
								  </div>
								</div>
						    	
								
								<!-- Echars 图表 -->
						    	<div class="layui-card">
								  <div class="layui-card-header">地图</div>
								  <div class="layui-card-body">
								    	<iframe src='/module/27448/index.html' frameborder="0" scrolling="no" style="width: 800px;height:450px"></iframe>
								  </div>
								</div>
						    	
						    	
						  </div>
						</div>

			    </div>
			    <div class="layui-col-md3" height="100%">
			     		<div class="layui-card">
						  <div class="layui-card-header">公告栏</div>
						  <div id="div1">
						  		<a class="btn btn-default" id="addnotice">添加公告</a>
						  </div>
						  <div class="layui-card-body">
						    		
						    		<ul class="layui-timeline">
						    		
										<!-- 公告插入到这个位置 -->
										
									  	<li class="layui-timeline-item" id="information">
										    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
										    <div class="layui-timeline-content layui-text">
										      <div class="layui-timeline-title">只显示最近6条</div>
										    </div>
									  </li>
									</ul>
									<!-- 获取公告信息 -->
						    		<script type="text/javascript">
						    		$.ajax({
						    			      url : "/getAllNotice",//请求地址
						    			      dataType : "json",//数据格式 
						    			      type : "post",//请求方式
						    			      async : false,//是否异步请求
						    			      success : function(data) {   //如何发送成功
						    			      var html ="";
						    			     for(var i=0;i<data.length;i++){   //遍历data数组
						    			            var is=data[i];
						    			     		html ="<li class='layui-timeline-item'>"+
												    				"<i class='layui-icon layui-timeline-axis'>&#xe63f;</i>"+
												    				"<div class='layui-timeline-content layui-text'>"+
													      				"<h3 class='layui-timeline-title'>"+is.releasetime+"</h3>"+
													      				"<p>"+is.notice+
												      					"</p>"+
												      					"<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp-----"+is.ename+"</p>"+
												    				"</div>"+
												  				"</li>";
									    		 	$("#information").prepend(html);
						    			     }
						    			     },
						    		 });
									</script>
						  </div>
						</div>
			     		
			    </div>
		   </div>
    		
    	</div>	
	</div>
	
	<!-- 弹出框 -->
	<script type="text/javascript">
		layui.use(['table', 'form', 'layer', 'laydate','layedit'], function(){
			var layedit = layui.layedit;
			var table = layui.table;
			var form = layui.form;
			var laydate = layui.laydate;
			var $ = layui.jquery;
			var layer = layui.layer;
			var oper=layer.open;
			
			/* 公告系统*/
			$("#addnotice").click(function(){
                layer.open({
                    type: 1,
                    anim: 5,
                    title: ['添加公告', 'font-size:18px;'],
                    skin: 'layui-layer-rim', //加上边框
                    offset: '100px',
                    area: ['600px', '450px'],
                    content:$("#n-form"),
                    //检测弹窗关闭 一旦关闭 刷新页面
                    end:function(){
                        location.reload();
                    }
                });
			});
				
			/* 富文本编辑器 不知道为什么功能不能用了 */
			var index=layedit.build('demo', {
			    tool: ['face']
		  	});
			
			/* 发布公告 */
			form.on('submit(notice)', function(data){
				 data.field=layedit.getText(index);
				 //console.log(data.field); //当前容器的全部表单字段，名值对形式：{name: value}
				 if (data.field=="") {
					  layer.msg("你没有输入任何内容！！！");
				}else{
					$.ajax({
						type:"post",
						data:"notice="+data.field,
						dataType:"json",
						url:"/addNotice",
						success:function(res){
						layer.msg("添加成功");
						layer.closeAll('page');
					}
					});
				}
				return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});  
				  
		});	
	</script>
	
	<!-- 公告模板 -->
	<div class="layui-fluid" style="display: none;" id="n-form">
		<form class="layui-form" id="aaaform">
			   <textarea id="demo" class="layui-textarea"></textarea>
			  <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="notice">发布</button>
		</form>
	</div>
	
  </body>
</html>
