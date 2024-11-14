<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp" %>
<style>
 body{
  overflow:hidden;
 }
</style>
<!-- .app -->
<div id="my-spinner">
	<div>
		<span> <img src="<c:url value='/resources/assets/images/loader.gif'/>">
		</span>
	</div>
</div>
<div class="app pda_mo_wrap">
	<header class="pda_hd_wh text-center">
		<a class="mo_logout p-2" href="<c:url value="/tm/logout"/>"><img class="mr-2" src="/resources/assets/images/mo_logout_bk.png">
			<span class="text-middle">로그아웃</span></a>
	<img class="p-2 text-center" src="/resources/assets/images/logo/login_bg.png" style="width: 150px; height: auto;">
	</header>
	<main>
		<div class="container-fluid" id="main">
			<div class="login_inf">
				<div class="login_inf_fp text-center">
					<ul class="p-0">
						<li><img src="/resources/assets/images/profile_img.png"> </li>
						<li class="login_inf_name">${userNm}님 안녕하세요!</li>
						<li class="login_inf_id">로그인 ID : ${userId}</li>
					</ul>
				</div>
				<div class="main_btn_list row">
					<ul class="">
						<li><div><a href="<c:url value="tmsc0100_2" />"><img src="/resources/assets/images/pda_list_img2.png"> <h5 class="pda_list_name">레이저</h5></a></div></li>
						<li><div><a href="<c:url value="tmsc0100_1" />"><img src="/resources/assets/images/pda_list_img1.png"> <h5 class="pda_list_name">후가공</h5></a></div></li>
						<li><div><a href="/mtsc1000"><img src="/resources/assets/images/pda_list_img2.png"> <h5 class="pda_list_name">관제시스템<br>레이저</h5></a></div></li>
						<li><div><a href="/mtsc2000"><img src="/resources/assets/images/pda_list_img2.png"> <h5 class="pda_list_name">관제시스템<br>후가공</h5></a></div></li>
						<%--<li><div><a href="<c:url value="tmsc0130"/>"><img src="/resources/assets/images/pda_list_img3.png"> <h6 class="pda_list_name">승인처리</h6></a></div></li>
						<li><div><a href="<c:url value="pdsc0050"/>"><img src="/resources/assets/images/pda_list_img5.png"> <h6 class="pda_list_name">재고실사(자재)</h6></a></div></li>
						<li><div><a href="<c:url value="pdsc0060"/>"><img src="/resources/assets/images/pda_list_img6.png"> <h6 class="pda_list_name">재고실사(제품)</h6></a></div></li>
						--%>
					</ul>
				</div>
			</div>
		</div>
	</main>
</div>
<!-- /.app -->
<script type="text/javascript" src="/resources/assets/javascript/pages/calendar.js"></script>
<%@include file="../layout/script.jsp" %>
<script>
	//$(document).attr("title","PDA Main");
	
	$('a').bind('click', function(event) {
		event.preventDefault();
		$('#my-spinner').show();
		
		let url = $(this).attr('href');

		setTimeout(function() {
			location.href = url;
		}, 100);
	});
</script>

</body>
</html>
