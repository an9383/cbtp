<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/top.jsp" %>
<!--
<body data-spy="scroll" data-target="page" data-offset="76">
-->
<body style="overflow:hidden">

<!-- .app -->
<div class="app" id="main-wrapper" data-navbarbg="skin6" data-theme="light" data-layout="vertical" data-sidebartype="full" data-boxed-layout="full">

<!--[if lt IE 10]>
<div class="page-message" role="alert">You are using an <strong>outdated</strong> browser. Please <a class="alert-link" href="http://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</div>
<![endif]-->

<!-- .app-header -->
<%@include file="../layout/header.jsp" %>
<!-- /.app-header -->

<!-- .app-aside -->
<%@include file="../layout/aside.jsp" %>
<!-- /.app-aside -->

