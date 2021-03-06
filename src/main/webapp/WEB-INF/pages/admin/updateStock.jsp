<%--
  Created by IntelliJ IDEA.
  User: 10412
  Date: 2016/12/22
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>修改配件</title>

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
    <h1>SpringMVC 修改博客</h1>
    <hr/>
    <form:form action="/admin/stocks/updateStock" method="post" commandName="stock" role="form">
        <div class="form-group">
            <label for="title">配件号:</label>
            <input type="text" class="form-control" id="partNO" name="partNO" placeholder="配件号:" value="${stock.partNO}"/>
        </div>

        <div class="form-group">
            <label for="title">配件名称:</label>
            <input type="text" class="form-control" id="partName" name="partName" placeholder="配件名称:" value="${stock.partName}"/>
        </div>
        <div class="form-group">
            <label for="title">适用车型:</label>
            <input type="text" class="form-control" id="model" name="model" placeholder="适用车型:" value="${stock.model}"/>
        </div>
        <div class="form-group">
            <label for="title">库位:</label>
            <input type="text" class="form-control" id="loc" name="loc" placeholder="库位:" value="${stock.loc}"/>
        </div>
        <div class="form-group">
            <label for="title">数量:</label>
            <input type="text" class="form-control" id="quantity" name="quantity" placeholder="数量:" value="${stock.quantity}"/>
        </div>
        <div class="form-group">
            <label for="title">价格:</label>
            <input type="text" class="form-control" id="price" name="price" placeholder="价格:" value="${stock.price}"/>
        </div>
        <!-- 把 id 一并写入 blogP 中 -->
        <input type="hidden" id="id" name="id" value="${stock.id}"/>
        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
    </form:form>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>