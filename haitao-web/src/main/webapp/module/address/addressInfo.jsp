<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>地址管理</title>

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

</head>

<body>

<div class="layui-card" style=" margin: 10px;">
    <div class="layui-card-header">
        <i class="layui-icon layui-icon-username" style="font-size: 30px;">地址管理</i>
    </div>
    <div class="layui-card-body">
        <table class="layui-table"  lay-skin="nob" id="demo" lay-filter="test">
            <div class="layui-inline">
                <button class="layui-btn" id="addbtn"  lay-event="addbtn">
                    <i class="layui-icon">&#xe608;</i>添加用户
                </button>
            </div>
            <div style="float: right;">
                <div class="layui-inline" >姓名：</div>
                <div class="layui-inline">
                    <input id="ename" name="ename" type="text"  class="layui-input">
                </div>
                <div class="layui-inline">电话：</div>
                <div class="layui-inline">
                    <input id="telephone" name="telephone" type="text" class="layui-input">
                </div>
                <div class="layui-inline">
                    <button class="layui-btn" id="search" data-type="reload">查询</button>
                </div>
            </div>
        </table>

    </div>
</div>
</body>

<!-- 编辑 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<!-- layui 代码部分-->
<script>

    layui.use(['form', 'table', 'layer', 'laydate','layedit'], function(){
        var layedit = layui.layedit;
        var table = layui.table;
        var form = layui.form;
        var laydate = layui.laydate;
        var $ = layui.jquery;
        var layer = layui.layer;
        var oper=layer.open;

        form.render();//渲染表单

        /* 加载所有员工信息 */
        table.render({
            id:'testReload'
            ,elem: '#demo'
            ,defaultToolbar: ['filter']
            ,cellMinWidth:80
            ,limit:15
            ,url:'/getAllAddress' //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,request: {
                pageName: 'currentPage' //页码的参数名称，默认：page
                ,limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
            ,page: true
            ,fit:true
            ,cols: [[
                ,{field:'id', title: 'ID' , hide:true,sort: true}
                ,{field:'othername', title: '地址别名', sort: true,align: 'center'}
                ,{field:'name', title: '姓名', align: 'center',sort: true}
                ,{field:'phone', title: '电话', align: 'center'}
                ,{field:'pca', title: '省市区', sort: true, align: 'left'}
                ,{field:'detailadress', title: '详细地址', sort: true, align: 'center'}
                ,{field:'remarks', title: '备注', sort: true, align: 'center'}
                ,{field:'province', title: '省', sort: true, align: 'center',hide:true}
                ,{field:'city', title: '市', sort: true, align: 'center',hide:true}
                ,{field:'area', title: '区', sort: true, align: 'center',hide:true}
                ,{field:'defaultaddress', title: '默认', sort: true ,align: 'center',hide:true}
                ,{fixed: 'right', title:'编辑',width:150, align:'center', toolbar: '#barDemo'}
            ]]
            ,parseData: function(res){
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.message, //解析提示文本
                    "count": res.total, //解析数据长度
                    "data": res.obj //解析数据列表
                };
            }


        });
        form.render();
        /*监听工具条 */
        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            if(obj.event === 'edit'){ //查看
                layer.open({
                    type: 2,
                    anim: 5,
                    title: ['修改信息', 'font-size:18px;'],
                    skin: 'layui-layer-rim', //加上边框
                    area : [ '750px', '600px' ],
                    offset: '10px',
                    content:"module/address/addressUpdata.jsp",
                    //检测弹窗关闭 一旦关闭 刷新页面
                    end:function(){
                        location.reload();
                    },success:function(layero, index){
                        var body = layer.getChildFrame('body', index);
                        var iframeWin = window[layero.find('iframe')[0]['name']];
                        body.find('#id').val(data.id);
                        if (data.esex==2) {
                            body.find('#sextwo').attr("checked",true);
                        }
                        form.render();
                    }
                });
            } else if(obj.event === 'del'){ //删除
                layer.confirm('确定删除吗？',{
                    skin: 'layui-layer-lan',
                    offset: '200px',
                    area: ['300px'],
                    btn: ['确认', '取消'] //可以无限个按钮
                },function(index){
                    layer.close(index);
                    $.ajax({
                        type:"post",
                        dataType:"json",
                        data:data,
                        url:"/addressdelete/"+data.id,
                        success:function(res){
                            if (res.code==200) {
                                layer.msg(res.msg,{time:1000},function() {
                                    location.reload();
                                });
                            }else{
                                layer.msg(res.msg);
                            }
                        }
                    });
                });
            }
        });

        /* 添加 */
        $("#addbtn").click(function() {
            layer.open({
                type : 2,
                title : "添加地址",
                area : [ '750px', '600px' ],
                skin: 'layui-layer-rim', //加上边框
                offset: '10px',
                content : "module/address/addressUpdata.jsp",
                end:function(){
                    location.reload();
                }
            });
        });

        //表格重载
        function tableload(){
            var ename = $("#ename").val();
            var telephone= $("#telephone").val();
            var beginDate = $("#beginDate").val();
            var endDate = $("#endDate").val();
            if (beginDate != "" && endDate != "") {
                if (beginDate>endDate) {
                    layer.msg("请选择正确的日期范围");
                    return false;
                }
            }
            table.reload('testReload', {
                where: {
                    ename:ename
                    ,telephone:telephone
                    ,beginDate: beginDate
                    ,endDate: endDate
                }
            });
        }

        //绑定搜索事件
        $("#search").click(function(){
            tableload();
        });
    });
</script>

<!-- 表格状态重定义 -->
<%--<script type="text/html" id="whatsex">
    {{# if (d.esex=== 1) { }}
    <span>男</span>
    {{# } else if(d.esex=== 2) { }}
    <span>女</span>
    {{# } else { }}
    <span>不男不女</span>
    {{# } }}
</script>
<script type="text/html" id="whatsname">
    {{# if (d.sname=== 1) { }}
    <span>正常</span>
    {{# } else if(d.sname=== 2) { }}
    <span>配送中</span>
    {{# } else if(d.sname=== 3) { }}
    <span>空闲</span>
    {{# } else if(d.sname=== 4) { }}
    <span>休假</span>
    {{# } else { }}
    <span>离职</span>
    {{# } }}
</script>--%>
</html>
