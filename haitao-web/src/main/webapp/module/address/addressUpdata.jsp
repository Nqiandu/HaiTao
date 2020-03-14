<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>地址修改</title>

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
    <style type="text/css">
        form {
            margin: 25px;
        }
    </style>
</head>

<body>
<div class="layui-col-md10">   <!-- -->

    <form class="layui-form layui-form-pane" lay-filter="formDemo" id="formDemo">
        <div class="layui-form-item">
            <div class="layui-input-block" style="width: 200px;display: none;">
                <input value="" type="text" name="id" id="id" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">

            <label class="layui-form-label">地址别名：</label>
            <div class="layui-input-inline">
                <input type="text" name="othername" id="othername" lay-verify="othername" placeholder="请输入2-8位字符~"
                       autocomplete="off" class="layui-input">
            </div>

            <label class="layui-form-label">姓名：</label>
            <div class="layui-input-inline">
                <input type="text" name="name" id="name" lay-verify="name" placeholder="请输入2-8位字符~" autocomplete="off"
                       class="layui-input">
            </div>

        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">电话：</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" id="phone" lay-verify="required|phone" placeholder="请输入11位手机号码~"
                       autocomplete="off" class="layui-input">
            </div>

            <label class="layui-form-label">省：</label>
            <div class="layui-input-inline">
                <select name="province" id="province" lay-filter="province">
                    <option value="">请选择省</option>
                </select>
            </div>

        </div>

        <div class="layui-form-item">

            <label class="layui-form-label">市：</label>
            <div class="layui-input-inline">
                <select name="city" id="city" lay-filter="city">
                    <option value="">请选择市</option>
                </select>
            </div>

            <label class="layui-form-label">区：</label>
            <div class="layui-input-inline">
                <select name="area" id="area" lay-filter="area">
                    <option value="">请选择区</option>
                </select>
            </div>

        </div>

        <%--<div class="layui-form-item">
            <label class="layui-form-label">设为默认：</label>
            <div class="layui-input-block">
                <input type="checkbox" name="switch" lay-skin="switch">
            </div>
        </div>--%>

        <div class="layui-form-item">
            <label class="layui-form-label">详细地址：</label>
            <div class="layui-input-block" style="width: 500px">
                <input type="text" name="detailadress" id="detailadress" required lay-verify="required" placeholder="请输入详细地址" autocomplete="off"
                       required lay-verify="detailadress|required"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-form-item">
                <label class="layui-form-label">备注：</label>
                <div class="layui-input-block" style="width: 500px;">
                    <textarea name="remarks" id="remarks"
                              class="layui-textarea"></textarea>
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 170px;">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="editsub" id="bth">
                        提交
                    </button>
                    <button type="reset" class="layui-btn layui-btn-primary" lay-filter="reset">重置</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    layui.use(['table', 'form', 'layer', 'jquery', 'laydate'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;
        $ = layui.jquery;
        $form = $('form');
        form.render();//渲染表单
        var raw = null;
        var inited = false;
        var register = false;

        //数据填充
        //id:pid 地域的父ID
        //uri:地区数据的请求地址
        function fillData(id,uri){

            var firstHtml = "";
            var range = "city";

            switch (uri) {
                case "getCity" :
                    //填充地级市的数据
                    // data.value
                    $("#city").empty();
                    break;
                case "getArea":
                    //填充县级市/区的数据
                    //$("#city").val()
                    $("#area").empty();
                    range = "area";
                    break;
                case "getProvance":
                    //获取所有省份
                    $.get(uri, function (set) {
                        for (var i = 0; i < set.length; i++) {
                            firstHtml += "<option  value=" + set[i].id + ">" + set[i].name + "</option>";
                        }
                        //初始化数据
                        $("#province").append(firstHtml);

                        if (raw != null){
                            form.val("formDemo", {
                                "province": raw.province
                            });
                        }else{
                            form.val("formDemo", {
                                "province": set[0].id
                            });
                        }
                        form.render();
                        fillData($("#province").val(),"getCity");
                    });
                    return;
            }

            $.post(uri, {"pid":id}, function (res) {

                for (var i = 0; i < res.length; i++) {
                    firstHtml += "<option value=" + res[i].id + ">" + res[i].name + "</option>";
                }
                //插入html到指定位置
                $("#" + range).append(firstHtml);

                if ("getCity" === uri) {
                    if (raw != null){
                        form.val("formDemo", {
                            "city": raw.city
                        });
                    }else{
                        form.val("formDemo", {
                            "city": res[0].id
                        });
                    }
                    fillData($("#city").val(),"getArea");
                }else if("getArea" === uri){
                    if (raw != null) {
                        form.val("#formDemo", {
                            "area": raw.area
                        });
                    }else{
                        form.val("formDemo", {
                            "area": res[0].id
                        });
                    }
                }
                form.render();
            });

        }

        //获取用户信息
        (function(){
            /* 根据id为表单赋值 */
            function flash(res) {
                console.log(typeof res)
                form.val("formDemo", {
                    "othername": res.obj[0].othername,
                    "name": res.obj[0].name,
                    "phone": res.obj[0].phone,
                    "state": res.obj[0].state,
                    "detailadress": res.obj[0].detailadress
                });
                raw = res.obj[0];
                form.render();
                inited = true;
                fillData(null,"getProvance");
            };

            if (!inited) {
                var addressId = $("#id").val();
                if (addressId === ""){
                    register = true;
                    fillData(null,"getProvance");
                    return;
                }
                $.ajax({
                    type: "post",
                    dataType: "json",
                    url: "/address/" + addressId,
                    success: flash
                });
            }
        })()

        //city 地级市 area 县级市/区 p 省份
        form.on('select(province)', function (data) {
            fillData(data.value,"getCity");
        });

        /* 监听city下拉框选中事件 */
        form.on('select(city)', function (data) {
            fillData(data.value,"getArea");
            $("#area").empty();

        });

        /* 添加 修改地址信息 */
        form.on('submit(editsub)', function (data) {
            var uid = $("#id").val();
            var urltwo = "/addressadd";
            if (uid != "") {
                urltwo = "/addressupdate";
            }
            $.ajax({
                type: "post",
                dataType: "json",
                data: data.field,
                url: urltwo,
                success: function (res) {
                    if (res.code == 200) {
                        layer.msg(res.msg, {time: 1000}, function () {
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        });
                    } else {
                        layer.msg(res.msg);
                    }
                }
            });
        });

        //select下拉框验证是否选择
        $("#detailaddress").focus(function () {
            $("#detailaddress").attr("readonly", true);
            if ($("#province").val() == "") {
                layer.msg("请选择省");
                $("#bth").addClass("layui-btn-disabled");
                $("#bth").attr("disabled", true);
            }  else {
                $("#bth").removeClass("layui-btn-disabled");
                $("#bth").attr("disabled", false);
                shijiao();
            }
        });

        function shijiao() {
            $("#detailaddress").attr("readonly", false);
        }

        //正则
        form.verify({
            name: [/^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,8}$/, '请输入2-8位汉字或字母!']
        });

    });
</script>
</body>
</html>
