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
<div class="app pda_mo_wrap">
	<header class="pda_mo_hd">
		<a href="<c:url value="/tmsc0260"/>" class="float-left"><img class="p-2" src="/resources/assets/images/mo_home_wh.png"></a> 
		<c:if test="${prcssGubun eq '001'}">
			<a href="/tmsc0100"><p class="mo_main_title">후가공</p></a>
		</c:if>
		<c:if test="${prcssGubun eq '002'}">
			<a href="/tmsc0100"><p class="mo_main_title">레이저</p></a>
		</c:if>
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
					<c:if test="${prcssGubun eq '001'}">	<!-- 봉제 -->
						<ul class="">
							<li><div><a href="<c:url value="tmsc0300"/>"><img src="/resources/assets/images/pda_list_img1.png"><h5 class="pda_list_name">현품표 조회</h5></a></div></li>
							<%-- <li><div><a href="<c:url value="tmsc0310"/>"><img src="/resources/assets/images/pda_list_img2.png"><h5 class="pda_list_name">출하요청</h5></a></div></li> --%>
							<li><div><a href="<c:url value="tmsc0320"/>"><img src="/resources/assets/images/pda_list_img3.png"><h5 class="pda_list_name">재고현황</h5></a></div></li>
							<%-- <li><div><a href="<c:url value="tmsc0330"/>"><img src="/resources/assets/images/pda_list_img4.png"><h5 class="pda_list_name">재고이동</h5></a></div></li> --%>
						 </ul>
					</c:if>
					<c:if test="${prcssGubun eq '002'}">	<!-- 사출 -->
						<ul class="">
							<li><div><a href="<c:url value="tmsc0070"/>"><img src="/resources/assets/images/pda_list_img1.png"><h5 class="pda_list_name">현품표 조회</h5></a></div></li>
							<%-- <li><div><a href="<c:url value="tmsc0250"/>"><img src="/resources/assets/images/pda_list_img2.png"><h5 class="pda_list_name">출하요청</h5></a></div></li> --%>
							<li><div><a href="<c:url value="tmsc0120"/>"><img src="/resources/assets/images/pda_list_img3.png"><h5 class="pda_list_name">재고현황</h5></a></div></li>
							<%-- <li><div><a href="<c:url value="tmsc0090"/>"><img src="/resources/assets/images/pda_list_img4.png"><h5 class="pda_list_name">재고이동</h5></a></div></li> --%>
						</ul>
					</c:if>
				</div>
			</div>
		</div>
	</main>
</div>
<!-- /.app -->

<script>
let sessionData = "${prcssGubun}";
console.log(sessionData)
	$(document).attr("title","PDA Main");
</script>

</body>
</html>
