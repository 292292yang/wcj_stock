<%--
  Created by IntelliJ IDEA.
  User: 10412
  Date: 2016/12/22
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>库存管理</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <h1>库存列表</h1>
    <hr/>

    <h3>所有配件 <a href="/admin/stocks/add" type="button" class="btn btn-primary btn-sm">添加</a></h3>
    <form action="/admin/stocks/queryStock" method="post" role="form">
        <input type="text" id="qPartName" name="partName" placeholder="配件名称" width="20" value=""/>
        <input type="submit" value="查询"/>
    </form>
    <!-- 如果博文列表为空 -->
    <c:if test="${empty stockList}">
        <div class="alert alert-warning" role="alert">
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>库存表为空，请<a href="/admin/stocks/add" type="button" class="btn btn-primary btn-sm">添加</a>
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>返回<a href="/admin/stocks" type="button" class="btn btn-primary btn-sm">首页</a>
        </div>
    </c:if>

    <!-- 如果博文列表非空 -->
    <c:if test="${!empty stockList}">
        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>配件号</th>
                <th>配件名称</th>
                <th>适用车型</th>
                <th>库位</th>
                <th>数量</th>
                <th>价格</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${stockList}" var="stock">
                <tr>
                    <td>${stock.id}</td>
                    <td>${stock.partNO}</td>
                    <td>${stock.partName}</td>
                    <td>${stock.model}</td>
                    <td>${stock.loc}</td>
                    <td>${stock.quantity}</td>
                    <td>${stock.price}</td>
                    <td>
                        <a href="/admin/stocks/show/${stock.id}" type="button" class="btn btn-sm btn-success">详情</a>
                        <a href="/admin/stocks/update/${stock.id}" type="button" class="btn btn-sm btn-warning">修改</a>
                        <a href="/admin/stocks/delete/${stock.id}" type="button" onclick="return confirm('确定删除吗？')" class="btn btn-sm btn-danger">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
