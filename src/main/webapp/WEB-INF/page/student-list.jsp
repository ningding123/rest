<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="nun" uri="http://itcast.cn/common/" %>

<jsp:include page="top-menu.jsp"/>

<div class="tpl-page-container">

    <jsp:include page="left-menu.jsp"/>

    <div class="tpl-content-wrapper">
        <ol class="am-breadcrumb">
            <li><a href="index" class="am-icon-home">首页</a></li>
            <li><a href="javascript:void(0)">学生信息管理</a></li>
            <li class="am-active">学生信息列表</li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-code"></span> 学生信息列表
                </div>
                <div class="tpl-portlet-input tpl-fz-ml">
                    <div class="portlet-input input-small input-inline">
                        <div class="input-icon right"></div>
                    </div>
                </div>


            </div>
            <div class="tpl-block">
                <div class="am-g">
                    <div class="am-u-sm-12 am-u-md-6">
                        <div class="am-btn-toolbar">
                            <div class="am-btn-group am-btn-group-xs">
                                <button type="button" class="am-btn am-btn-default am-btn-success" onclick="window.location.href='student/add'"><span class="am-icon-plus"></span> 新增</button>
                            </div>
                        </div>
                    </div>
                    <div class="am-u-sm-12 am-u-md-3">

                    </div>
                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-input-group am-input-group-sm">
                            <input type="text" class="am-form-field" name="name" id="name" value=${vo.name }>
                            <span class="am-input-group-btn">
            <button class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"></button>
          </span>
                        </div>
                    </div>
                </div>
                <div class="am-g">
                    <div class="am-u-sm-12">
                        <form class="am-form">
                            <table class="am-table am-table-striped am-table-hover table-main">
                                <thead>
                                <tr>
                                    <th class="table-title">名字</th>
                                    <th class="table-type">联系方式</th>
                                    <th class="table-author am-hide-sm-only">性别</th>
                                    <th class="table-date am-hide-sm-only">入学年份</th>
                                    <th class="table-date am-hide-sm-only">学生性质</th>
                                    <th class="table-set">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                            <c:forEach items="${page.rows }" var="item">
                                <td name="name">${item.name }</td>
                                <td name="phone">${item.phone }</td>
                                <td name="sex">
                                    <c:if test="${item.sex ==0 }">男</c:if>
                                    <c:if test="${item.sex ==1 }">女</c:if>
                                </td>
                                <td class="am-hide-sm-only" name="eyear">${item.eyear }</td>
                                <td name="type">
                                    <c:if test="${item.type ==1 }">青年生</c:if>
                                    <c:if test="${item.type ==2 }">士兵生</c:if>
                                    <c:if test="${item.type ==3 }">提干生</c:if>
                                </td>
                                <td>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="window.location.href='student/echodata?id='+${item.id}"><span class="am-icon-pencil-square-o"></span> 编辑</button>
                                            <button type="button" class="am-btn am-btn-default am-btn-xs am-text-success am-hide-sm-only" onclick="deleteinfo(${item.id})"> <span class="am-icon-trash-o"></span>删除</button>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                            </c:forEach>
                                </tbody>
                            </table>
                            <div class="am-cf">

                                <div class="am-fr">
                                    <nun:page url="order/list"></nun:page>
                                </div>
                            </div>
                            <hr>

                        </form>
                    </div>

                </div>
            </div>
            <div class="tpl-alert"></div>
        </div>

    </div>

</div>

<jsp:include page="footer-menu.jsp"></jsp:include>
<script type="text/javascript">
    $('.am-icon-search').click(function () {
        alert($('#name').val())
        window.location.href='student/list?name='+$('#name').val()
    });
    function deleteinfo(id) {
        layer.confirm("是否要删除?", {
            icon: 1,
            skin: 'layui-layer-lan',
            //closeBtn: 0,
            btn: ['删除','取消'] //按钮
        }, function(){
            var url = "student/delete";
            data={};
            data["id"] = id;
            fajax(url,data,function(data){
                if(data.status=="succ"){
                    layer.msg("删除成功");
                    setTimeout(function(){ window.location.href="student/list";},1000)

                }else{
                    layer.msg("删除失败");
                }
            });
        });
    }
</script>