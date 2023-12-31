<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>DaDaNae (대구다이닝내비게이션)</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="resources/boot-shop/assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="resources/boot-shop/css/styles.css" rel="stylesheet" />

    <link href="resources/boot-shop/css/modal.css" rel="stylesheet">

    <!--  수정 필요함 
        	<link rel="stylesheet" href="resources/boot-shop/css/joinStyle.css">
        	<link href="resources/boot-shop/css/loginStyle.css" rel="stylesheet" />
        -->
</head>

<body>

    <!-- Header-->
    <tiles:insertAttribute name="header"></tiles:insertAttribute>
    <!-- Section-->
    <tiles:insertAttribute name="body"></tiles:insertAttribute>
    
    <a style="display:scroll;position:fixed;bottom:80px; right:30px;" rel="nofollow" href="#"
        style="font-size:2.0em"><img src="resources/images/top.png"></a>

    <a style="display:scroll;position:fixed;bottom:40px; right:30px;" rel="nofollow" href="#scrollbottom"
        style="font-size:2.0em"><img src="resources/images/down.png"></a>

    <div id="scrollbottom"></div>

    <!-- Footer-->
    <tiles:insertAttribute name="footer"></tiles:insertAttribute>

</body>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="resources/boot-shop/js/scripts.js"></script>

</html>
