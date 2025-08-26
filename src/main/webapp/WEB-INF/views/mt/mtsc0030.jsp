<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="./top.jsp" %>
<body>
	<div id="my-spinner">
		<div>
			<span> <img src="<c:url value='/resources/assets/images/loader.gif'/>">
			</span>
		</div>
	</div>
	<div class="container-fluid"
		style="position: relative; background-color: #111217;
			height: 100vh; width: 100vw;
			padding: 40px 0px 0px 0px;">
		
		<!-- 닫기 버튼 -->
		<i class="fa-regular fa-circle-xmark" id="btn_dtlClose"
			style="position: absolute; top: 10px; right: 10px;
					color: #ffff00; cursor: pointer; font-size: 30px;"></i>
		<div class="row" style="background-color: #171823; height: calc(100vh - 45px); margin: 0px;">
        	<div class="col-md-12 mt-3" style="text-align:center;">
				<img src="/resources/assets/images/welcome_background.png" id="welcomeImg" style="height: 69rem;width: 100%;text-align:center;">
					<textarea rows="4" id="welcomeText" style="font-size: 5rem;text-align:center; resize:none; top: 26rem; left: 33rem; height: 37rem; color: #333333;position: absolute;
						background: transparent; border: none; width: 67rem; line-height: 10vh; font-weight:700;" readonly disabled></textarea>    
			</div>
			<div class="col-md-12 mt-3" style="position: absolute;left: 0vw;top: 54rem;text-align:center;">
             	<img class="pr-2" src="/resources/assets/images/logo_cbtp.png" style="width:23.5rem;height: 100%;">
            </div>
		</div>
	</div>
<script>
	$('#headerMainName').text('환영문구');
	$('#headerSubName').text('문구');
	$.ajax({
		url: '<c:url value="mm/welcomeRead"/>',
	    type: 'POST',
		success : function(res) {
			let data = res.data;
			$('#welcomeText').val(data.welcomeText);
		}
	});
</script>
</body>
</html>