<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/top.jsp" %>
<!--
<body data-spy="scroll" data-target="page" data-offset="76">
-->
<body>

<!-- .app -->
<div class="app">
<!--[if lt IE 10]>
<div class="page-message" role="alert">You are using an <strong>outdated</strong> browser. Please <a class="alert-link" href="http://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</div>
<![endif]-->

<!-- .app-header -->
<%@include file="../layout/header.jsp" %>
<!-- /.app-header -->

!-- .app-main -->
<main class="app-main">
	<div class="row" style="margin:5px;">
		<div class="col" style="margin:5px;">
<%-- 			<a href="<c:url value='/bm/list'/>"><button class="float-right btn btn-sm btn-warning btnUserList" style="margin-left:5px;">사용자 조회</button></a>
			<button class="float-right btn btn-sm btn-warning" style="margin-left:5px;">도면 조회</button>
			<button class="float-right btn btn-sm btn-warning" style="margin-left:5px;">주문 조회</button>
			<button class="float-right btn btn-sm btn-warning" style="margin-left:5px;">거래처 조회</button> --%>
		</div>
	</div>
<!-- .wrapper -->
<div class="wrapper">
