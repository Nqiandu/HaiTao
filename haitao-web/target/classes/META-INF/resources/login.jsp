<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
request.setAttribute("path", path);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>HaiTao后台管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
		<!-- Javascript -->
        <script src="${pageContext.request.contextPath}/resource/js/jquery-1.8.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/jquery.backstretch.min.js"></script>
        <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
	<!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/font-awesome-3.2.1/css/font-awesome.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/form-elements.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/resource/layui/layui.js"></script>
        <!-- HTML5 Shiv and Respond.js IE8 支持 HTML5 元素和媒体查询 -->
        <!-- 警告: Respond.js 如果通过文件查看页面，则不起作用:// -->
        <!--如果从IE 9]-->
       <%--  <script src="${pageContext.request.contextPath}/resource/js/html5shiv.js"></script>
        <script src="${pageContext.request.contextPath}/resource/js/respond.min.js"></script> --%>
        <!--[结束]-->
        <!-- 图标 -->
        <%--<link rel="shortcut icon" href="${pageContext.request.contextPath}/resource/ico/favicon.png">--%>
        <link rel=icon href=/bitbug_favicon.ico>

		
		
  </head>
  
  <body>
		
        <!-- 顶部内容 -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>Hai Tao</strong> 后台登录</h1>
                            
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>登录到后台管理</h3>
                            		<p>输入您的用户名和密码登录:</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="icon-home"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form class="login-form" id="loginform">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">用户名</label>
			                        	<input type="text" name="username" placeholder="用户名..." class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">密码</label>
			                        	<input type="password" name="password" placeholder="密码..." class="form-password form-control" id="form-password">
			                        </div>
                                    <div class="form-group form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">记住我</label>
                                    </div>
			                        <div class="form-group" style="text-align:center">
			                        <a class="btn btn-warning btn-block" role="button" id="but" style="margin:0 auto;">登录</a>
			                        </div>
			                    </form>
			                    <!-- 登录 -->
			                    <script type="text/javascript">
									$("#but").click(function(){
										$.ajax({
											type:"post",
											url:"loginsaa",
											data:$("#loginform").serialize(),
											datatype:"json",
											success:function(data){
												if (data.code==200) {
													location.href="module/index.jsp";
												}else{
													layer.msg(data.msg);
												}
											}
										})
									})
								</script>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 </body>
 <script type="text/javascript">
 	layui.use(['element','layer'], function() {
 		var $ = layui.jquery;
		var element = layui.element;
		var layer = layui.layer;
 	});
 </script>
 <script type="text/javascript">
		jQuery(document).ready(function() {
		    $.backstretch([
						   "${pageContext.request.contextPath}/resource/img/backgrounds/log5.jpg"
						  ,"${pageContext.request.contextPath}/resource/img/backgrounds/log4.jpg"
						  ,"${pageContext.request.contextPath}/resource/img/backgrounds/log3.jpg"
			              ,"${pageContext.request.contextPath}/resource/img/backgrounds/log2.jpg"
			              ,"${pageContext.request.contextPath}/resource/img/backgrounds/log1.jpg"
			             ], {duration: 3000, fade: 750});
		    
		    $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
		    	$(this).removeClass('input-error');
		    });
		    
		    $('.login-form').on('submit', function(e) {
		    	
		    	$(this).find('input[type="text"], input[type="password"], textarea').each(function(){
		    		if( $(this).val() == "" ) {
		    			e.preventDefault();
		    			$(this).addClass('input-error');
		    		}
		    		else {
		    			$(this).removeClass('input-error');
		    		}
		    	});
		    });
		});
</script>
</html>
