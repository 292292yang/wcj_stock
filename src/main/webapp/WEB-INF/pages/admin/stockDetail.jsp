<%--
  Created by IntelliJ IDEA.
  User: 10412
  Date: 2016/12/22
  Time: 18:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>配件详情</title>

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
    <h1>配件详情</h1>
    <hr/>

    <table class="table table-bordered table-striped">
        <tr>
            <th>ID</th>
            <td>${stock.id}</td>
        </tr>
        <tr>
            <th>配件号</th>
            <td>${stock.partNO}</td>
        </tr>
        <tr>
            <th>配件名称</th>
            <td>${stock.partName}</td>
        </tr>
        <tr>
            <th>适用车型</th>
            <td>${stock.model}</td>
        </tr>
        <tr>
            <th>库位</th>
            <td>${stock.loc}</td>
        </tr>
        <tr>
            <th>剩余数量</th>
            <td>${stock.quantity}</td>
        </tr>
        <tr>
            <th>价格</th>
            <td>${stock.price}</td>
        </tr>
    </table>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
