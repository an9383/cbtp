<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp" %>

<!-- .app -->
<div class="app pda_mo_wrap">
	<header class="pda_mo_hd text-center">
		<a class="mo_logout p-2" href="<c:url value="/tm/logout"/>"><img class="mr-2" src="/resources/assets/images/mo_logout_bk.png">
			<span class="text-middle">로그아웃</span></a>
	<img class="p-2 text-center" src="/resources/assets/images/daerim_logo.svg">
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
				<div class="center"><h6 class="text-center">죄송합니다. PDA에 접근하실 수 있는 권한이 없습니다.</h6></div>
                  <div class="center" id="left-list" style="object-fit: cover; width:auto; height:auto;">
                     <img src="/resources/assets/images/mainPda1.png" style="width:100%;"/>
                  </div>
			</div>
		</div>
	</main>
</div>
<!-- /.app -->

<script>
	$(document).attr("title","PDA Main");
</script>

</body>
</html>
