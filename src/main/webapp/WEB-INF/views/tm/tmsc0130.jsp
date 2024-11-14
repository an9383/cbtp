<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp" %>

<body>
<!-- .app -->
<div class="app pda_mo_wrap" style="display: flex;flex-direction: column;height: 100%;">
	<header class="pda_mo_hd">
		<a href="<c:url value="tmsc0100"/>" class="float-left"><img class="p-2" src="/resources/assets/images/mo_home_wh.png"></a> <a href="/tmsc0060"><p class="mo_main_title">승인처리</p></a>
	</header>
	<div class="mo_sortbox">
		<div class="main_btn_list row">
			<ul class="">
				<li><div><a href="<c:url value="tmsc0140"/>"><img src="/resources/assets/images/pda_list_img1.png"> <h6 class="pda_list_name">수입검사</h6></a></div></li>
				<li><div><a href="<c:url value="tmsc0150"/>"><img src="/resources/assets/images/pda_list_img2.png"> <h6 class="pda_list_name">자재입고</h6></a></div></li>
				<li><div><a href="<c:url value="tmsc0160"/>"><img src="/resources/assets/images/pda_list_img4.png"> <h6 class="pda_list_name">생산투입</h6></a></div></li>
				<li><div><a href="<c:url value="tmsc0170"/>"><img src="/resources/assets/images/pda_list_img3.png"> <h6 class="pda_list_name">완제품검사</h6></a></div></li>
				<li><div><a href="<c:url value="tmsc0180"/>"><img src="/resources/assets/images/pda_list_img3.png"> <h6 class="pda_list_name">제품입고</h6></a></div></li>
				
				<%--
				<li><div><a href="<c:url value="pdsc0050"/>"><img src="/resources/assets/images/pda_list_img5.png"> <h6 class="pda_list_name">재고실사(자재)</h6></a></div></li>
				<li><div><a href="<c:url value="pdsc0060"/>"><img src="/resources/assets/images/pda_list_img6.png"> <h6 class="pda_list_name">재고실사(제품)</h6></a></div></li>
				--%>
			</ul>
		</div>
	</div>
</div>
<!-- /.app -->

<script>
	$(document).attr("title","PDA Main");
</script>

</body>
