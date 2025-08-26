<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="theme-color" content="#3063A0">
    <title>MES</title>
    <link rel="apple-touch-icon" sizes="144x144" href="<c:url value='/resources/assets/apple-touch-icon.png'/>">
    <link rel="shortcut icon" href="/resources/assets/images/favicon.png">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet"><!--소정추가-->
    <link rel="stylesheet" href="<c:url value='/resources/assets/vendor/open-iconic/css/open-iconic-bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/assets/vendor/fontawesome/css/all.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/assets/stylesheets/theme.css?version=20221031'/>" data-skin="default">    
    <link rel="stylesheet" href="<c:url value='/resources/assets/stylesheets/hygino_theme.css?version=20220404-004'/>"><!--하이지노css새로추가 소정-->
    <link rel="stylesheet" href="<c:url value='/resources/assets/stylesheets/theme-dark.min.css'/>" data-skin="dark">
    <link rel="stylesheet" href="<c:url value='/resources/assets/stylesheets/custom.css?version=20220406-001'/>">
    <link rel="stylesheet" href="<c:url value='/resources/assets/stylesheets/css/toastr.min.css?version=2.1.4'/>">
    <link rel="stylesheet" href="<c:url value='/resources/assets/stylesheets/css/alertify.min.css?version=1.13.1'/>">
    <link rel="stylesheet" href="<c:url value='/resources/assets/stylesheets/css/style.min.css?version=3.2.1'/>">
    <link rel="stylesheet" href="<c:url value='/resources/assets/vendor/popover/css/hunterPopup.css?ver=1'/>">
    <link rel="stylesheet" href="<c:url value='/resources/assets/vendor/jquery-contextMenu/jquery.contextMenu.min.css?ver=1.1'/>"> <!-- jquery contextMenu -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/vendor/bootstrap-toggle/bootstrap-toggle.min.css?ver=1.0'/>"> <!-- bootstrap toggle -->
   
   	<!-- dev -->
    <link rel="stylesheet" href="https://cdn3.devexpress.com/jslib/21.2.3/css/dx.light.css">
    <!-- 폰트 -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/font/DoHyeon.css?ver=1'/>"><!-- 도현체 -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/font/GoThic_A1.css?ver=1'/>"><!-- Gothic A1 Bold 700 -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/font/NotoSansKR.css?ver=1'/>"><!-- Noto Sans KR -->
    <!-- --- -->
    <!-- Disable unused skin immediately -->
    <script>
    var skin = localStorage.getItem('skin') || 'default';
    var isCompact = JSON.parse(localStorage.getItem('hasCompactMenu'));
    var disabledSkinStylesheet = document.querySelector('link[data-skin]:not([data-skin="'+ skin +'"])');
    // Disable unused skin immediately
    disabledSkinStylesheet.setAttribute('rel', '');
    disabledSkinStylesheet.setAttribute('disabled', true);
    // add flag class to html immediately
    if (isCompact == true) document.querySelector('html').classList.add('preparing-compact-menu');
    </script>
    <!-- END THEME STYLES -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/vendor/open-iconic/css/open-iconic-bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/assets/vendor/fontawesome/css/all.min.css'/>">
    <!-- datatables -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/stylesheets/css/datatables.min.css?version=1.10.20'/>">
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css">

    <!-- BEGIN PAGE LEVEL STYLES -->
    <style>
    .page-sidebar {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    width: 100%;
    display: flex;
    flex-direction: column;
    /*
    width: 30rem;
    max-width: 30rem;
    */
    width: 30rem;
    max-width: 22.5rem;
    background-color: #ffffff;
    border-left: 1px solid rgba(34, 34, 48, 0.1);
    box-shadow: none;
    overflow: auto;
    z-index: 1029;
    transform: translate3d(100%, 0, 0);
    transition: transform 200ms ease-in-out;
    }

    /*
    @media (min-width: 768px) {
    .has-sidebar-fluid .page-sidebar {
    width: calc(100vw - 30rem);
    max-width: calc(100vw - 30rem);
    }
    }
    */

    /*
    @media (min-width: 1200px) {
    .has-sidebar-fluid .page-sidebar {
    width: calc(100vw - 37.5rem);
    max-width: calc(100vw - 37.5rem);
    }
    }
    */

    @media (min-width: 576px) {
    .has-sidebar-expand-sm .app-main > .app-footer,
    .has-sidebar-expand-sm .page-inner {
    margin-right: 30rem;
    }
    .has-sidebar-expand-sm .page-sidebar {
    transform: translate3d(0, 0, 0);
    }
    .has-sidebar-open .has-sidebar-expand-sm .page-sidebar {
    position: absolute;
    top: 0;
    transform: translate3d(100%, 0, 0);
    }
    .has-sidebar-expand-sm.has-sidebar-fluid .page-inner {
    margin-right: calc(100vw - 37.5rem);
    }
    .has-sidebar-expand-sm.has-sidebar-fluid .page-sidebar {
    width: calc(100vw - 37.5rem);
    max-width: calc(100vw - 37.5rem);
    }
    }

    @media (min-width: 768px) {
    .has-sidebar-expand-md .app-main > .app-footer,
    .has-sidebar-expand-md .page-inner {
    margin-right: 30rem;
    }
    .has-sidebar-expand-md .page-sidebar {
    transform: translate3d(0, 0, 0);
    }
    .has-sidebar-open .has-sidebar-expand-md .page-sidebar {
    position: absolute;
    top: 0;
    transform: translate3d(100%, 0, 0);
    }
    .has-sidebar-expand-md.has-sidebar-fluid .page-inner {
    margin-right: calc(100vw - 37.5rem);
    }
    .has-sidebar-expand-md.has-sidebar-fluid .page-sidebar {
    width: calc(100vw - 37.5rem);
    max-width: calc(100vw - 37.5rem);
    }
    }

    @media (min-width: 992px) {
    .has-sidebar-expand-lg .app-main > .app-footer,
    .has-sidebar-expand-lg .page-inner {
    margin-right: 30rem;
    }
    .has-sidebar-expand-lg .page-sidebar {
    transform: translate3d(0, 0, 0);
    max-width: 30rem;
    }
    .has-sidebar-open .has-sidebar-expand-lg .page-sidebar {
    position: absolute;
    top: 0;
    transform: translate3d(100%, 0, 0);
    }
    .has-sidebar-expand-lg.has-sidebar-fluid .page-inner {
    margin-right: calc(100vw - 37.5rem);
    }
    .has-sidebar-expand-lg.has-sidebar-fluid .page-sidebar {
    width: calc(100vw - 37.5rem);
    max-width: calc(100vw - 37.5rem);
    }
    }

    @media (min-width: 1200px) {
    .has-sidebar-expand-xl .app-main > .app-footer,
    .has-sidebar-expand-xl .page-inner {
    margin-right: 30rem;
    }
    .has-sidebar-expand-xl .page-sidebar {
    transform: translate3d(0, 0, 0);
    }
    .has-sidebar-open .has-sidebar-expand-xl .page-sidebar {
    position: absolute;
    top: 0;
    transform: translate3d(100%, 0, 0);
    }
    .has-sidebar-expand-xl.has-sidebar-fluid .page-inner {
    margin-right: calc(100vw - 37.5rem);
    }
    .has-sidebar-expand-xl.has-sidebar-fluid .page-sidebar {
    width: calc(100vw - 37.5rem);
    max-width: calc(100vw - 37.5rem);
    }
    }

    .has-sidebar-expand .app-main > .app-footer,
    .has-sidebar-expand .page-inner {
    margin-right: 30rem;
    }
    
    .th_necessary {
    	color: #6593ff;
    }
    
    .input_max_width {
    	max-width:500px;
    }
    
    /* DataTable 정렬 화살표 없애기 ------------------------ */
    .dataTable > thead > tr > th[class*="sort"]:after{
       content: "" !important;
	}
	.dataTable > thead > tr > th[class*="sort"]:before{
       content: "" !important;
	}
	
	table.dataTable thead > tr > th.sorting_asc, 
	table.dataTable thead > tr > th.sorting_desc, 
	table.dataTable thead > tr > th.sorting, 
	table.dataTable thead > tr > td.sorting_asc, 
	table.dataTable thead > tr > td.sorting_desc, 
	table.dataTable thead > tr > td.sorting {
	       padding-right: 5px;
	       vertical-align: middle;
	}
	/* ------------------------ DataTable 정렬 화살표 없애기*/
	
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
	
	.popover{
	    max-width: 100%; /* Max Width of the popover (depending on the container!) */
	}
	
	
	#my-spinner {
      width: 100%; height: 100%;
      top: 0; left: 0;
      display: none;
      opacity: .6;
      background: silver;
      position: fixed;
      z-index: 9999;
    
	}
	
	#my-spinner div {
	   width: 100%; height: 100%;
	   display: table;
	}
	
	#my-spinner span {
	   display: table-cell;
	   text-align: center;
	   vertical-align: middle;
	}
	
	#my-spinner img {
	   background: white;
	   padding: 1em;
	   border-radius: .7em;      
	}
	
	
	#prcss-spinner {
      width: 100%; height: 100%;
      top: 0; left: 0;
      display: none;
      position: fixed;
      z-index: 9999;
    
	}
	
	#prcss-spinner div {
	   width: 100%; height: 100%;
	   display: table;
	   
	}
	
	#prcss-spinner .prcss-spinner-span {
	   display: table-cell;
	   text-align: center;
	   vertical-align: middle;
	   font-size: 3rem;
       font-weight: bold;
       opacity: .9;
	}
	
	#prcss-spinner img {
	   background: white;
	}
	
	@media print {
		body {
		  -webkit-print-color-adjust: exact !important;
		}
	    .workOrderTable_1 > th {
	        background-color: #cecece;
	    }
	}
	
	.endline{
		page-break-before:always
	}

	@keyframes blink-effect { 50% { background-color: #ffffff; color: #000000; } }
    </style>
    <!-- END PAGE LEVEL STYLES -->
</head>
