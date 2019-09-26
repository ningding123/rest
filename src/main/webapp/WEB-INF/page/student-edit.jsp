<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top-menu.jsp"></jsp:include>
<jsp:include page="left-menu.jsp"/>

<div class="tpl-content-wrapper">
    <ol class="am-breadcrumb">
        <li><a href="index" class="am-icon-home">首页</a>
        </li>
        <li><a href="javascript:void(0)">学生管理</a>
        </li>
        <li class="am-active">学生更新</li>
    </ol>
    <div class="tpl-portlet-components">
        <div class="portlet-title">
            <div class="caption font-green bold">
                <span class="am-icon-code"></span> 学生更新
            </div>
            <div class="tpl-portlet-input tpl-fz-ml">
                <div class="portlet-input input-small input-inline">
                    <div class="input-icon right">
                    </div>
                </div>
            </div>
        </div>
        <div class="tpl-block ">
            <div class="am-g tpl-amazeui-form">
                <div class="am-u-sm-12 am-u-md-9">
                    <form  id="art_insert_form" class="am-form am-form-horizontal" action="student/update" method="post">
                        <input type="hidden" name="id" value="${student.id}">
                        <div class="am-form-group">
                            <label  class="am-u-sm-3 am-form-label">姓名</label>
                            <div class="am-u-sm-9">
                                <input type="text" placeholder="请输入姓名" name="name" value="${student.name}" required>
                            </div>
                        </div>
                        <input type="hidden" name="amId">
                        <div class="am-form-group">
                            <label  class="am-u-sm-3 am-form-label">单位</label>
                            <div class="am-u-sm-9">
                                <input type="text" name="company" placeholder="请输入单位名" value="${student.company}"  required>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">入学年份</label>
                            <div class="am-u-sm-9">
                                <input type="text"  placeholder="请输入入学年份" name="eyear" value="${student.eyear}" required>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">年龄</label>
                            <div class="am-u-sm-9">
                                <input type="text"  placeholder="请输入年龄" name="year" value="${student.year}" required>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="user-phone" class="am-u-sm-3 am-form-label">电话</label>
                            <div class="am-u-sm-9">
                                <input type="tel" id="user-phone"
                                       placeholder="输入你的电话号码 / Telephone" name="phone" value="${student.phone}"  required>
                                <div id="phone"></div>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label  class="am-u-sm-3 am-form-label">性别</label>
                            <div class="am-u-sm-9">
                                <select  name="sex">
                                    <option value=0 <c:if test="${student.sex}==0">check="check"</c:if>>男</option>
                                    <option value=1 <c:if test="${student.sex}==q">check="check"</c:if>>女</option>
                                </select>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label  class="am-u-sm-3 am-form-label">学生性质</label>
                            <div class="am-u-sm-9">
                                <select  name="type">
                                    <option value=1 <c:if test="${student.type}==1">check="check"</c:if>>青年生</option>
                                    <option value=2 <c:if test="${student.type}==2">check="check"</c:if>>士兵生</option>
                                    <option value=3 <c:if test="${student.type}==3">check="check"</c:if>>提干生</option>
                                </select>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="user-phone" class="am-u-sm-3 am-form-label">长期病情</label>
                            <div class="am-u-sm-9">
                                <input type="text" placeholder="请输入文字描述" name="studentdesc" value="${student.studentdesc}"  required>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <div class="am-u-sm-9 am-u-sm-push-3">
                                <button type="button" onclick="checkphone()" class="am-btn am-btn-primary" id="edit">编辑学生</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer-menu.jsp"></jsp:include>
<script type="text/javascript">
    $(function(){
        $("#user-phone").blur(function(){
            var phone = document.getElementById("user-phone").value;
            var phoneReg = /^[1][3,4,5,7,8][0-9]{9}$/;
            if (phoneReg.test(phone)) {
                $("#phone").html("");
            } else {
                $("#phone").html("<small>手机号格式错误</small>");
            }
        });
    });

    function checkphone(){
        var flag;
        var phone = document.getElementById("user-phone").value;
        var phoneReg = /^[1][3,4,5,7,8][0-9]{9}$/;
        if (phoneReg.test(phone)) {
            $("#phone").html("");
        } else {
            flag = false;
            $("#phone").html("<small style='color:red'>手机号格式错误</small>");
        }
        if(flag==false)
            return false;
        else{
            var index=layer.load(1, {shade: [0.5,'#000']});
            /**
             *验证 return fasle;
             */
            fpost("art_insert_form",function(data){
                if(data.status=="succ"){
                    layer.close(index);
                    layer.confirm("编辑成功!", {
                        icon: 1,
                        skin: 'layui-layer-lan',
                        btn: ['确定'] //按钮
                    }, function(){

                        window.location.href="student/list";

                    });
                }else{
                    layer.close(index);
                    layer.msg("编辑失败");
                }
            });
        }

    }
</script>