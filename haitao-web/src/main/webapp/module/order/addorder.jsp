<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addorder.jsp' starting page</title>
    
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
	 <script type="text/javascript" src="${pageContext.request.contextPath}/resource/layui/layui.js"></script>
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/layui/css/layui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/layui/css/layui.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/layui/layui.js"></script>
  </head>
  
	
  <style>
	  	#divDemo{
	  		margin-top:50px;
			margin-left:70px;
			margin-right:150px;
			margin-bottom:100px;
		}
	</style>
  <body>
    <div id="divDemo">   <!--  -->
    	<form class="layui-form layui-form-pane" lay-filter="formDemo" id="formDemo">

			<!-- 寄件人 -->
    		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  				<legend><font color="red">寄件人信息</font></legend>
			</fieldset>
					<div class="layui-input-inline" style="display: none;">
						<input type="text" name="senderid" id="senderid" lay-verify="senderid" class="layui-input">
					</div>
			<div class="layui-form-item">
					<label class="layui-form-label" style="margin-left:10px;">寄件人姓名:</label>
					<div class="layui-input-inline">
						<input type="text" name="sendername" id="sendername" lay-verify="sendername|required" placeholder="请输入长度为2-8位字符" class="layui-input">
					</div>
					<label class="layui-form-label" style="margin-left:10px;">寄件人电话:</label>
					<div class="layui-input-inline">
							<input type="text" name="senderphone" id="senderphone" lay-verify="required|phone|codee" placeholder="请输入11位手机号码" class="layui-input">
					</div>
					<label class="layui-form-label" style="margin-left:10px;">身份证号:</label>
					<div class="layui-input-inline">
							<input type="text" name="senderidcar" id="senderidcar" lay-verify="required|identity|shen" placeholder="请输入第二代身份证" class="layui-input">
					</div>
			</div>
    		
			<div class="layui-form-item">
					<label class="layui-form-label" style="margin-left:10px;">省：</label>
					<div class="layui-input-inline">
						<select name="senderprovince" id="senderprovince" lay-filter="senderprovince">
							<option value="">请选择省</option>
						</select>
					</div>
					<label class="layui-form-label" style="margin-left:10px;">市：</label>
					<div class="layui-input-inline">
						<select name="sendercity" id="sendercity" lay-filter="sendercity">
							<option value="">请选择市</option>
						</select>
					</div>
					<label class="layui-form-label" style="margin-left:10px;">区/县：</label>
					<div class="layui-input-inline">
						<select name="senderarea" id="senderarea" lay-filter="senderarea">
							<option value="">请选择区/县</option>
						</select>
					</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label" style="margin-left:10px;">详细地址</label>
				<div class="layui-input-inline" style="width:830px;">
					<input type="text" name="senderaddress" id="senderaddress" lay-verify="senderaddress|required" placeholder="请输入详细地址" class="layui-input">
				</div>
			</div>
			
			<!-- 收件人 -->
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  				<legend><font color="red">收件人信息</font></legend>
			</fieldset>
					<div class="layui-input-inline" style="display: none;">
						<input type="text" name="recipientid" id="recipientid" lay-verify="recipientid" class="layui-input">
					</div>
			<div class="layui-form-item">
					<label class="layui-form-label" style="margin-left:10px;">收件人姓名:</label>
					<div class="layui-input-inline">
						<input type="text" name="recipientname" id="recipientname" lay-verify="recipientname|required" placeholder="请输入长度为2-8位字符" class="layui-input">
					</div>
					<label class="layui-form-label" style="margin-left:10px;">收件人电话:</label>
					<div class="layui-input-inline">
							<input type="text" name="recipientphone" id="recipientphone" lay-verify="required|phone|codee" placeholder="请输入11位手机号码" class="layui-input">
					</div>
			</div>
    		
			<div class="layui-form-item">
					<label class="layui-form-label" style="margin-left:10px;">省：</label>
					<div class="layui-input-inline">
						<select name="recipientprovince" id="recipientprovince" lay-filter="recipientprovince">
							<option value="">请选择省</option>
						</select>
					</div>
					<label class="layui-form-label" style="margin-left:10px;">市：</label>
					<div class="layui-input-inline">
						<select name="recipientcity" id="recipientcity" lay-filter="recipientcity">
							<option value="">请选择市</option>
						</select>
					</div>
					<label class="layui-form-label" style="margin-left:10px;">区/县：</label>
					<div class="layui-input-inline">
						<select name="recipientarea" id="recipientarea" lay-filter="recipientarea">
							<option value="">请选择区/县</option>
						</select>
					</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label" style="margin-left:10px;">详细地址</label>
				<div class="layui-input-inline" style="width:830px;">
					<input type="text" name="recipientaddress" id="recipientaddress" lay-verify="recipientaddress|required" placeholder="请输入详细地址" class="layui-input">
				</div>
			</div>
			
			<!-- 货物 -->
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  				<legend><font color="red">货物信息</font></legend>
			</fieldset>
					<div class="layui-input-inline" style="display: none;">
						<input type="text" name="goodsid" id="goodsid" lay-verify="goodsid" class="layui-input">
					</div>
			<div class="layui-form-item">
					<label class="layui-form-label" style="margin-left:10px;">货物名称:</label>
					<div class="layui-input-inline">
						<input type="text" name="goodsname" id="goodsname" lay-verify="goodsname|required|recipientname" placeholder="请输入货物名称" class="layui-input">
					</div>
					<label class="layui-form-label" style="margin-left:10px;">货物价值:</label>
					<div class="layui-input-inline">
							<input type="text" name="goodssprice" id="goodssprice" lay-verify="goodssprice|required|number|fu" placeholder="单位：（元）" class="layui-input">
					</div>
					<label class="layui-form-label" style="margin-left:10px;">货物类别：</label>
					<div class="layui-input-inline">
						<select name="goodsclass" id="goodsclass" lay-filter="goodsclass">
							<option value="">请选择货物类别</option>
						</select>
					</div>
			</div>
    		
			<div class="layui-form-item">
					<label class="layui-form-label" style="margin-left:10px;">货物体积:</label>
					<div class="layui-input-inline">
						<input type="text" name="goodvolume" id="goodvolume" lay-verify="goodvolume|required|number|fu" placeholder="单位：（m³）" class="layui-input">
					</div>
					<label class="layui-form-label" style="margin-left:10px;">货物重量:</label>
					<div class="layui-input-inline">
						<input type="text" name="goodsweight" id="goodsweight" lay-verify="goodsweight|required|number|fu" placeholder="单位：（Kg）" class="layui-input">
					</div>
					<label class="layui-form-label" style="margin-left:10px;">防护措施：</label>
					<div class="layui-input-inline">
						<select name="protec" id="protec" lay-filter="protec">
							<option value="">请选择防护措施</option>
						</select>
					</div>
			</div>
			
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  				<legend><font color="red">运单价格</font></legend>
			</fieldset>
			<div class="layui-form-item">
				<label class="layui-form-label" style="margin-left:10px;">保价金额:</label>
				<div class="layui-input-inline">
					<input type="text" name="insurance" id="insurance" lay-verify="insurance|number|fu" placeholder="单位：（元）" class="layui-input">
				</div>
				<label class="layui-form-label" style="margin-left:10px;"><font color="red">运单金额:</font></label>
				<div class="layui-input-inline">
					<input type="text" name="moneyinput" id="moneyinput" lay-verify="moneyinput" class="layui-input" >
				</div>
				<div class="layui-input-inline">
					<span style="color:red;font-size:12px">运单价格说明:运单价格 =(重量*5)+(体积/6000)+保价费</span><br>
					<span style="color:red;font-size:12px">本价格是系统计算 如果觉得不符合 可手动调整</span>
				</div>
			</div>
			
			<div class="layui-form-item" style="margin-left: 300px">
				<div class="layui-input-block">
					<button type="button" class="layui-btn layui-btn-normal" lay-submit  lay-filter="addOrder" id="bth">提交</button>
					<button type="reset" class="layui-btn layui-btn-primary" lay-filter="reset">重置</button>
				</div>
			</div>
			
    	</form>
    </div>
  </body>
  
  <script type="text/javascript">
  	layui.use(['form', 'table', 'layer', 'laydate','layedit'], function(){
		var layedit = layui.layedit;
		var table = layui.table;
		var form = layui.form;
		var laydate = layui.laydate;
		var $ = layui.jquery;
		var layer = layui.layer;
		var oper=layer.open;
		
		form.render();//渲染表单

		/* $("#telephone") */
		//寄件人获取所有省份
		$.get("getProvance",function(data){
				var senderprovince ="";
	            for (var i = 0; i < data.length; i++) {
	            	senderprovince+= "<option  value="+data[i].id+">"+data[i].name+"</option>";
	            }
	            //初始化数据
            	$("#senderprovince").append(senderprovince);
	            form.render();
		});
		/* 监听省份下拉框事件 */
		form.on('select(senderprovince)', function(data){
			$.post("getCity",{"pid" : data.value},function(res){
					var recipientcity ="";
					$("#sendercity").empty();
					$("#senderarea").empty();
		            for (var i = 0; i < res.length; i++) {
		            	recipientcity+= "<option value="+res[i].id+">"+res[i].name+"</option>";
		            }
		            //初始化数据
	            	$("#sendercity").append(recipientcity);
	            	$.post("getArea",{"pid" : $("#sendercity").val()},function(res){
						var senderarea ="";
						$("#senderarea").empty();
			            for (var i = 0; i < res.length; i++) {
			            	senderarea+= "<option value="+res[i].id+">"+res[i].name+"</option>";
			            }
			            //初始化数据
		            	$("#senderarea").append(senderarea);
		            	form.render();
				});
	            	form.render();
			});
		}); 
		/* 监听city下拉框选中事件 */
		form.on('select(recipientcity)', function(data){
			$.post("getArea",{"pid" : data.value},function(res){
					var senderarea ="";
					$("#senderarea").empty();
		            for (var i = 0; i < res.length; i++) {
		            	senderarea+= "<option value="+res[i].id+">"+res[i].name+"</option>";
		            }
		            //初始化数据
	            	$("#senderarea").append(senderarea);
	            	form.render();
			});
		});
		//收件人获取所有省份
		$.get("getProvance",function(data){
			var recipientprovince ="";
	            for (var i = 0; i < data.length; i++) {
	            	recipientprovince+= "<option  value="+data[i].id+">"+data[i].name+"</option>";
	            }
	            //初始化数据
            	$("#recipientprovince").append(recipientprovince);
	            form.render();
		});
		/* 监听省份下拉框事件 */
		form.on('select(recipientprovince)', function(data){
			$.post("getCity",{"pid" : data.value},function(res){
					var recipientcity ="";
					$("#recipientcity").empty();
					$("#recipientarea").empty();
		            for (var i = 0; i < res.length; i++) {
		            	recipientcity+= "<option value="+res[i].id+">"+res[i].name+"</option>";
		            }
		            //初始化数据
	            	$("#recipientcity").append(recipientcity);
	            	$.post("getArea",{"pid" : $("#recipientcity").val()},function(res){
						var recipientarea ="";
						$("#recipientarea").empty();
			            for (var i = 0; i < res.length; i++) {
			            	recipientarea+= "<option value="+res[i].id+">"+res[i].name+"</option>";
			            }
			            //初始化数据
		            	$("#recipientarea").append(recipientarea);
		            	form.render();
				});
	            	form.render();
			});
		}); 
		/* 监听city下拉框选中事件 */
		form.on('select(recipientcity)', function(data){
			$.post("getArea",{"pid" : data.value},function(res){
					var recipientarea="";
					$("#recipientarea").empty();
		            for (var i = 0; i < res.length; i++) {
		            	recipientarea+= "<option value="+res[i].id+">"+res[i].name+"</option>";
		            }
		            //初始化数据
	            	$("#recipientarea").append(recipientarea);
	            	form.render();
			});
		});
		
		//获取所有商品类别
		$.get("getGoodsClass",function(data){
			var goodsclass ="";
	            for (var i = 0; i < data.length; i++) {
	            	goodsclass+= "<option  value="+data[i].goodsclassid+">"+data[i].goodsname+"</option>";
	            }
	            //初始化数据
            	$("#goodsclass").append(goodsclass);
	            form.render();
		});
		
		//获取所有防护措施
		$.get("getTion",function(data){
			var protec="";
	            for (var i = 0; i < data.length; i++) {
	            	protec+= "<option  value="+data[i].id+">"+data[i].protectiontype+"</option>";
	            }
	            //初始化数据
            	$("#protec").append(protec);
	            form.render();
		});
		
		form.on('submit(addOrder)', function(data){
			  //发送请求
			  $.ajax({
	          	type:"post",
	          	dataType:"json",
	          	data:data.field,
	          	url:"addOrders",
	          	success:function(result){
	          		if (result.code==200) {
	    		    	layer.msg(result.msg,{time:1000},function() {
	    		    		layer.open({
	    		    	        type: 1
	    		    	        ,title: false //不显示标题栏
	    		    	        ,area: '300px;'
	    		    	        ,shade: 0.8
	    		    	        ,offset: '100px'
	    		    	        ,btnAlign: 'c'
	    		    	        ,moveType: 1 //拖拽模式，0或者1
	    		    	        ,content: "<div style='padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;'>下单成功<br><br>订单编号为:<br>"+result.information+"</div>"
	    		    	        ,end:function(){
	    		                    location.reload("#formDemo");
	    		                }
	    		    		});
  						});
	    			}else{
	    				layer.msg(result.msg);
	    			}
	          	}
	          }); 
		});
		
		//失去焦点计算价格
		$("#goodsweight").blur(function(){
			calculateThePrice();
		});
		$("#insurance").blur(function(){
			calculateThePrice();
		});
		//计算价格
		function calculateThePrice(){
			//获取体积
			var goodvolume = parseInt(($("#goodvolume").val()=="" ? '0' : $("#goodvolume").val()));
			//获取重量
			var goodsweight = parseInt(($("#goodsweight").val()=="" ? '0' : $("#goodsweight").val()));
			//获取保价金额
			var insurance = parseInt(($("#insurance").val()=="" ? '0' : $("#insurance").val()));
			//计算价格
			var money=0;
			if (insurance==0) {
				money = (goodvolume / 6000) + (goodsweight * 5);
			}else{				
				money = (goodvolume / 6000) + (goodsweight * 5) + insurance;
			}
			console.log(money);
			//写入价格(四舍五入取整)
			$("#moneyinput").val(Math.round(money));
		}
		
		 //寄件人select下拉框验证是否选择
   		$("#senderaddress").focus(function(){
   			$("#senderaddress").attr("readonly",true);
   			if($("#senderprovince").val()=="") {
   				layer.msg("请选择省");
   				$("#bth").addClass("layui-btn-disabled");
   				$("#bth").attr("disabled",true);
   			}else{
   				$("#bth").removeClass("layui-btn-disabled");
   				$("#bth").attr("disabled",false);
   				sendshijiao();
   			}
   		});
   		function sendshijiao(){ 
			$("#senderaddress").attr("readonly",false);
		}
   	 	//收件人select下拉框验证是否选择
   		$("#recipientaddress").focus(function(){
   			$("#recipientaddress").attr("readonly",true);
   			if($("#recipientprovince").val()=="") {
   				layer.msg("请选择省");
   				$("#bth").addClass("layui-btn-disabled");
   				$("#bth").attr("disabled",true);
   			}else{
   				$("#bth").removeClass("layui-btn-disabled");
   				$("#bth").attr("disabled",false);
   				recipientshijiao();
   			}
   		});
   		function recipientshijiao(){ 
			$("#recipientaddress").attr("readonly",false);
		}
   		//货物select下拉框验证是否选择
   		$("#goodsweight").focus(function(){
   			$("#goodsweight").attr("readonly",true);
   			if($("#goodsclass").val()=="") {
   				layer.msg("请选择类别!");
   				$("#bth").addClass("layui-btn-disabled");
   				$("#bth").attr("disabled",true);
   			}else if($("#protec").val()=="") {
   				layer.msg("请选择防护措施!");
   				$("#bth").addClass("layui-btn-disabled");
   				$("#bth").attr("disabled",true);
   			}else{
   				$("#bth").removeClass("layui-btn-disabled");
   				$("#bth").attr("disabled",false);
   				goodshijiao();
   			}
   		});
   		function goodshijiao(){ 
			$("#goodsweight").attr("readonly",false);
		}
   		
		//正则
		form.verify({
			  sendername:[/^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,8}$/,'请输入2~8位汉字!'],
			  recipientname:[/^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,8}$/,'请输入2~8位汉字!'],
			  fu:[/^\d+(\.\d+)?$/,'不能输入负数'],
			  codee:[/^(13[0-9]|14[5-9]|15[012356789]|166|17[0-8]|18[0-9]|19[8-9])[0-9]{8}$/,'格式不正确'],
			  shen:[/^[1-9]\d{5}(18|19|20)\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/,'格式不正确']
		});
  });
  </script>
</html>
