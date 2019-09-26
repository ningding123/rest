<%--
  Created by IntelliJ IDEA.
  User: xdell
  Date: 2019/9/22
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="nun" uri="http://itcast.cn/common/" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="../css/test.css">
</head>

<body>
<!--startprint-->
<div class="content">
    <div class="header">
        <h3>武警警官学院医院学院送检单</h3>
    </div>
    <div class="list">
        <div class="box text ">姓名</div>
        <div class="box name line">${student.name}</div>
        <div class="box text ">学号</div>
        <div class="box number line">${student.id}</div>
        <div class="box text ">性别</div>
        <div class="box sex line">
            <c:if test="${student.sex ==0 }">男</c:if>
            <c:if test="${student.sex ==1 }">女</c:if>
        </div>
        <div class="box text ">年龄</div>
        <div class="box age">${student.eyear}</div>
    </div>
    <div class="list">
        <div class="box text1">入学年份</div>
        <div class="box date line">${student.year}</div>
        <div class="box text1 ">联系方式</div>
        <div class="box tel line">${student.type}</div>
        <div class="box text ">单位</div>
        <div class="box address">
            <c:if test="${student.type ==1 }">青年生</c:if>
            <c:if test="${student.type ==2 }">士兵生</c:if>
            <c:if test="${student.type ==3 }">提干生</c:if>
        </div>
    </div>
    <div class="list">
        <div class="box text2 line">长期病情</div>
        <div class="box date">${student.studentdesc}</div>
    </div>
    <div class="list">
        <div class="box text2 line">药物过敏</div>
        <div class="box date ">暂无</div>
    </div>
    <div class="list1">
        <div class="garyline">诊断病情：</div>
        <div class="textarea "> ${order.studesc}</div>
    </div>
    <div class="list">
        <div class="box text3">诊断医生:</div>
        <div class="box date ">${admin.amName}</div>
    </div>
    <div class="list">
        <div class="box text3">诊断时间:</div>
        <div class="box date">2019.09.23</div>
    </div>
    <div class="list3">
        <div class="garyline">送检意见：${order.cause}</div>
        <div class="box">学员队意见：</div>
        <div class="box">
            <input type="text" value="同意${student.name}同学请假" style="width: 300px;">
        </div>
            <div class="box text3">审核时间:</div>
            <div class="box date">${order.createtime}</div>
    </div>

    <!--endprint-->
    <div class="btn" onclick="printtest()">打印</div>
</div>
</body>
<script type="text/javascript">
    function  printtest() {
        bdhtml=window.document.body.innerHTML;
        sprnstr="<!--startprint-->";
        eprnstr="<!--endprint-->";
        prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17);
        prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));
        window.document.body.innerHTML=prnhtml;
        window.print();
        window.location.href="checklist";
    }
</script>
</html>
