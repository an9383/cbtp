<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <title>MES 관제시스템</title>
    <!-- 폰트 -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/font/DoHyeon.css?ver=1'/>"> <!-- 도현체 -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/font/GoThic_A1.css?ver=1'/>"> <!-- Gothic A1 Bold 700 -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/font/NotoSansKR.css?ver=1.0'/>"> <!-- Noto Sans KR -->

    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/monitoring/vender/bootstrap/css/bootstrap-5.2.0.min.css'/>"> <!-- bootstrap -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/monitoring/vender/fontawesome-free-6.1.1-web/css/all.min.css'/>"> <!-- fontawesome -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/monitoring/vender/toastr-2.1.4/css/toastr.min.css'/>"> <!-- toastr 2.1.4 -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/monitoring/vender/bootstrap-toggle/bootstrap-toggle.min.css'/>"> <!-- bootstrap-toggle 2.2.2 -->
    <link rel="stylesheet" href="<c:url value='/resources/assets/monitoring/css/style.css?ver=7.4'/>"> <!-- style -->

    <!-- SCRIPT -->
    <script src="<c:url value='/resources/assets/monitoring/js/jquery.min.js'/>"></script> <!-- jquery -->
    <script src="<c:url value='/resources/assets/monitoring/vender/bootstrap/js/bootstrap-5.2.0.bundle.min.js'/>"></script> <!-- bootstrap -->
    <script src="<c:url value='/resources/assets/monitoring/vender/momentjs/moment.js'/>"></script> <!-- momentJs -->
    <script src="<c:url value='/resources/assets/monitoring/vender/toastr-2.1.4/js/toastr.min.js'/>"></script> <!-- toastr 2.1.4 -->
    <script src="<c:url value='/resources/assets/monitoring/vender/bootstrap-toggle/bootstrap-toggle.min.js'/>"></script> <!-- bootstrap-toggle 2.2.2 -->
    <script src="<c:url value='/resources/assets/monitoring/vender/chartjs/Chart.min.js?ver=1.0'/>"></script> <!-- Chart.js -->
	<script src="<c:url value='/resources/assets/monitoring/vender/chartjs/chartjs-plugin-datalabels.min.js?ver=1'/>"></script> <!-- chartjs-plugin-datalabels.js -->
	<script src="<c:url value='/resources/assets/monitoring/vender/chartjs/chartjs-plugin-annotation.min.js?ver=1'/>"></script> <!-- chartjs-plugin-datalabels.js -->
    <script src="<c:url value='/resources/assets/monitoring/vender/lodash/lodash.js'/>"></script> <!-- lodash -->
    <script src="<c:url value='/resources/assets/monitoring/vender/jsmpg/jsmpg.js?ver=1.0'/>"></script> <!-- jsmpg(CCTV 스트리밍) -->
    <script src="<c:url value='/resources/assets/monitoring/js/script.js'/>"></script> <!-- script -->
    <script>
	 	// promise 선언
		function _promise_() {
			return new Promise(function(resolve, reject) {
				resolve();
			});
		}

	 	// 상세창 닫기 버튼 click
		$(document).on('click', '#btn_dtlClose', function() {
			$('#title', parent.document).text($('#title', parent.document).data('title'));
			$('#subTitle', parent.document).text('대시보드');
			$('#dtlView', parent.document).css('width','0');
			$('#section_1000', parent.document).css('overflow','auto');
			$('#section_2000', parent.document).css('overflow','auto');
			$('#dtlView', parent.document).empty();
		});
    </script>
</head>