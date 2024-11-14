<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<style>

</style>
<%@include file="../layout/top.jsp" %>

<body>
	<div id="my-spinner">
		<div>
			<span> <img src="<c:url value='/resources/assets/images/loader.gif'/>">
			</span>
		</div>
	</div>
		<!-- /.app -->
		<div class="app pda_mo_wrap">
			<main>
				<div id="messageBox" class="alert alert-danger has-icon d-none"	role="alert">
					<div class="alert-icon">
						<span class="fa fa-info"></span>
					</div>
					<h5>오류</h5>
					<span id="message"></span>
				</div>
					<div class="container-fluid" id="main" style="padding: 0px calc((100vw - 300px)/2);">
						<div class="row align-items-center h-100">
							<div class="text-center" style="flex: 0 0 auto; width: 100%;">
								<img src="<c:url value='/resources/assets/images/cbtp_login.png'/>" style="width: 200px; height: auto; margin: 20px 0px;">
								<form class="login-form" id="loginForm">
									<div class="form-mb">
										<input style="max-width: 100%" type="text" id="inputUser" class="form-control-lg" placeholder="아이디 - Mobile">
									</div>
									<div class="form-group">
										<input style="max-width: 100%" type="password" id="inputPassword" class="form-control-lg" placeholder="비밀번호">
									</div>
									<div class="form-mb mt-4">
										<button class="login_btn btn btn-lg btn-block" type="submit">로그인</button>
									</div>
								</form>
								<!-- /.auth-form -->
								<!-- <div class="form-mb mt-4">
									<a href="/resources/assets/file/drauto.apk">
										<button class="login_btn1 btn btn-lg btn-block" style="background: #006ec5!important;">
											APP 다운로드
										</button>
									</a>
								</div> -->
							</div>
						</div>
					</div>
			</main>
		</div>
		<!-- /.app -->
    
<%@include file="../layout/script.jsp" %>

<script>

	currentPage = "login";
	$('#loginForm').parsley();

	var loginUrl = '<c:url value="/tmsc0260"/>';

	$("#loginForm").submit(
			function(e) {
				e.preventDefault(e);
				//alert("login_ajax")
				$.ajax({
					type : 'POST',
					url : '<c:url value="/auth/login_ajax"/>',
					dataType : 'json',
					data : {
						userId : $('#inputUser').val(),
						userPw : $('#inputPassword').val(),
						rememberMe : $('input:checkbox[name="rememberMe"]').is(":checked"),
					},
					beforeSend : function() {
						$('#my-spinner').show();
						$('.btn-login').addClass('d-none');
						$('.btn-loading').removeClass('d-none');
					},
					success : function(res) {
						if (res.result === 'ok') {
							$(location).attr('href', loginUrl);
						} else {
							$('#password').val('');
							$('#message').text(res.message);
							$('#messageBox').removeClass('d-none');
						}
					},
					complete : function() {
						$('#my-spinner').hide();
						$('.btn-login').removeClass('d-none');
						$('.btn-loading').addClass('d-none');
					}
				});
			});
</script>
</body>
</html>
