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
			padding: 50px 0px 0px 0px;">
		
		<!-- 닫기 버튼 -->
		<i class="fa-regular fa-circle-xmark" id="btn_dtlClose" style="position: absolute; top: 10px; right: 10px;
			color: #ffff00; cursor: pointer; font-size: 2rem;"></i>
		<div class="row" style="background-color: #AAB4C6; height: calc(100vh - 55px) !important; margin: 0px;height:5rem;">
			<!-- <div class="row mb-2 mt-5" style="color: #ffffff; height: 11vh;border-radius: 20px;width:100%;"></div> -->
				<div class="text-center" style="background-color: #AAB4C6; flex: 0 0 auto; width: 100%;">
					<span style="font-size:5rem; vertical-align: middle; font-weight:600;color:#1E2636;letter-spacing:3rem;">무재해</span>
					<img class="pr-2" src="/resources/assets/images/accidentFree2.png" style="height: 100%;margin-right: 2rem;">
					<span style="font-size:5rem; vertical-align: middle; font-weight:600;color:#1E2636;letter-spacing:3rem;">현황</span>
				</div>
			<div class="row mb-2" style="background-color: #AAB4C6;color: #ffffff; height: 50rem;">
				<div style="background-color:#DDE5F5;margin-right:10rem;margin-left:10rem;border: 0.2rem solid #6C85AB;">
				
					<div class="row p-0" style="height:41rem;">
						<div style="text-align: center; flex: 0 0 auto; width: 100%; margin-top: 2rem;">
							<span style="color: #C43F22; font-weight:700; font-size: 5rem;letter-spacing:3rem;">목표일수</span>
							<input class="text-center " type="text" id="accidentFreeTargetDate" readonly
								style="background-color: #000000;  color: #FFFFFF; font-size: 3rem; width: 35rem; letter-spacing:2rem;margin-left: 1rem;margin-right: 2rem;">
							<span style="color: #C43F22; font-weight:700; font-size: 5rem;">일</span>
						</div>
						<div style="text-align: center; flex: 0 0 auto; width: 100%; margin-bottom: 1rem; margin-top: -2rem;">
							<span style="color: #C43F22; font-weight:700; font-size: 5rem;letter-spacing:3rem;">달성일수</span>
							<input class="text-center " type="text" id="accidentFreeCompleteDate" readonly
								style="background-color: #000000;  color: #FFFFFF; font-size: 3rem; width: 35rem; letter-spacing:2rem;margin-left: 1rem;margin-right: 2rem;">
							<span style="color: #C43F22; font-weight:700; font-size: 5rem;">일</span>
						</div>
						<div style="text-align: center; flex: 0 0 auto; width: 100%; margin-top: -1rem;">
							<span style="color: #000000; font-weight:700; font-size: 3rem;">시작</span>
							<input class="text-center" type="text" id="accidentFreeStartYear" readonly 
							style="background-color: #000000; color: #FFFFFF; font-size: 2.5rem; width: 12rem;margin-left: 3rem;">
							<span style="color: #000000; font-weight:700; font-size: 3rem; margin-left: 3rem;">년</span>
							<input class="text-center" type="text" id="accidentFreeStartMonth" readonly 
							style="background-color: #000000; color: #FFFFFF; font-size: 2.5rem; width: 8rem;margin-left: 3rem;">
							<span style="color: #000000; font-weight:700; font-size: 3rem; margin-left: 3rem;">월</span>
							<input class="text-center" type="text" id="accidentFreeStartDay" readonly 
							style="background-color: #000000; color: #FFFFFF; font-size: 2.5rem; width: 8rem;margin-left: 3rem;">
							<span style="color: #000000; font-weight:700; font-size: 3rem; margin-left: 3rem;">일</span>
						</div>
						<div style="text-align: center; flex: 0 0 auto; width: 100%; margin-top: -2rem;">
							<span style="color: #000000; font-weight:700; font-size: 3rem;">현재</span>
							<input class="text-center" type="text" id="presentYear" readonly 
							style="background-color: #000000; color: #FFFFFF; font-size: 2.5rem; width: 12rem;margin-left: 3rem;">
							<span style="color: #000000; font-weight:700; font-size: 3rem; margin-left: 3rem;">년</span>
							<input class="text-center" type="text" id="presentMonth" readonly 
							style="background-color: #000000; color: #FFFFFF; font-size: 2.5rem; width: 8rem;margin-left: 3rem;">
							<span style="color: #000000; font-weight:700; font-size: 3rem; margin-left: 3rem;">월</span>
							<input class="text-center" type="text" id="presentDay" readonly 
							style="background-color: #000000; color: #FFFFFF; font-size: 2.5rem; width: 8rem;margin-left: 3rem;">
							<span style="color: #000000; font-weight:700; font-size: 3rem; margin-left: 3rem;">일</span>
						</div>
					</div>
				</div>
				<div class="text-center" style="background-color: #AAB4C6; flex: 0 0 auto; width: 100%;">
					<span style="font-size:5rem; vertical-align: middle; font-weight:600;color:#1E2636;">" </span>
					<span style="font-size:5rem; vertical-align: middle; font-weight:600;color:#B95442;">3</span>
					<span style="font-size:5rem; vertical-align: middle; font-weight:600;color:#7E2874;">6</span>
					<span style="font-size:5rem; vertical-align: middle; font-weight:600;color:#185FAD;">5</span>
					
					<span style="font-size:5rem; vertical-align: middle; font-weight:600;color:#1E2636;">일 </span>
					
					<span style="font-size:5rem; vertical-align: middle; font-weight:600;color:#5B6A55;">무재해 </span>
					<span style="font-size:5rem; vertical-align: middle; font-weight:600;color:#51303F;">현장 ! </span>
					
					<span style="font-size:5rem; vertical-align: middle; font-weight:600;color:#185FAD;">안전</span>
					
					<span style="font-size:5rem; vertical-align: middle; font-weight:600;color:#1E2636;">의 생활화 "</span>
				</div>
            </div>
		</div>
	</div>
<script>
	$('#headerMainName').text('무재해현황판');
	$('#headerSubName').text('후가공');
	// 무재해 현황판 ===============================================================================
	// 무재해 현황판 조회
	function getAccidentFreeData() {
		$.ajax({
			url: '<c:url value="mm/accidentFreeRead"/>',
	        type: 'POST',
	        data: {
	            'mainGubun'	:	'002',
			},
			success : function(res) {
				let data = res.data;
				$('#accidentFreeNumber').val(data.number);
				$('#accidentFreeTargetDate').val(data.targetDate);
				$('#accidentFreeCompleteDate').val(moment().diff(moment(data.accidentStartDate), 'days'));
				$('#accidentFreeStartYear').val(moment(data.accidentStartDate).format('YYYY'));
				$('#accidentFreeStartMonth').val(moment(data.accidentStartDate).format('MM'));
				$('#accidentFreeStartDay').val(moment(data.accidentStartDate).format('DD'));

				$('#presentYear').val(moment().format('YYYY'));
				$('#presentMonth').val(moment().format('MM'));
				$('#presentDay').val(moment().format('DD'));
				
				if(data.accidentEndDate=='') {
					$('#accidentFreeEndDate').val('');
				} else {
					$('#accidentFreeEndDate').val(moment(data.accidentEndDate).format('YYYY-MM-DD'));
				}
			}
		});
	}
	
	$(document).ready(function() {
		getAccidentFreeData(); // 무재해 현황판 조회
	});
	
	
	setInterval(function() {
		getAccidentFreeData(); // 무재해 현황판 조회
	}, 5000);
</script>
</body>
</html>