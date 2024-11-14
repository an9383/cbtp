<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">모니터링</a></li>
				<li class="breadcrumb-item active">모니터링 관련정보 등록</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid overflow-hidden" id="main">
		<div class="row p-2" style="background-color: #ffffff;">
			<div class="col-md-12">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
				<!-- 
				<li class="nav-item" role="presentation">
					<a class="nav-link active" id="tab1Nav" data-toggle="tab" href="#tab1" role="tab" aria-selected="true">사출 Part 운영현황</a>
				</li>
				 -->
				<li class="nav-item" role="presentation">
					<a class="nav-link active" id="tab2Nav" data-toggle="tab" href="#tab2" role="tab" aria-selected="false">무재해 현황판</a>
				</li>
				<!-- 
				<li class="nav-item" role="presentation">
					<a class="nav-link" id="tab3Nav" data-toggle="tab" href="#tab3" role="tab" aria-selected="false">생산현황</a>
				</li>
				 -->
				<li class="nav-item" role="presentation">
					<a class="nav-link" id="tab4Nav" data-toggle="tab" href="#tab4" role="tab" aria-selected="false">환영문구(문구)</a>
				</li>
				<li class="nav-item" role="presentation">
					<a class="nav-link" id="tab5Nav" data-toggle="tab" href="#tab5" role="tab" aria-selected="false">환영문구(이미지)</a>
				</li>
				<!-- 
				<li class="nav-item" role="presentation">
					<a class="nav-link" id="tab6Nav" data-toggle="tab" href="#tab6" role="tab" aria-selected="false">고객사 전달 문서</a>
				</li>
				 -->
				<li class="nav-item ml-1" role="presentation">
					<div class="row mainGubun">
						<label style="vertical-align: middle;" class="input-label-sm ml-1">구분 : </label>
						<div class="form-group input-sub m-0 row">
							<select onchange="getAccidentFreeData();" id="mainGubun" class="custom-select" style="vertical-align: middle;">
							<option value="001" selected>레이저</option>
							<option value="002">후가공</option>
							</select>
						</div>
					</div>
				</li>
				
				<li class="nav-item" role="presentation" style="position: absolute; right: 0;">
					<button type="button" class="btn btn-primary" id="btnAccidentFreeSave">저장</button> <!-- 무재해 현황판 -->
					<button type="button" class="btn btn-primary d-none" id="btnWorkStatusSave">저장</button> <!-- 사출 Part 생산현황 -->
					<button type="button" class="btn btn-primary d-none" id="btnWelcomeTextSave">저장</button> <!-- 환영문구(문구) -->
					<button type="button" class="btn btn-primary d-none" id="btnWelcomeImgSave">저장</button> <!-- 환영문구(이미지) -->
					<button type="button" class="btn btn-info d-none" id="btnCustSendDocStateY">활성화</button> <!-- 고객사 전달 문서 -->
					<button type="button" class="btn btn-outline-info d-none" id="btnCustSendDocStateN">비활성화</button> <!-- 고객사 전달 문서 -->
					<button type="button" class="btn btn-primary ml-2 d-none" id="btnCustSendDocSave">저장</button> <!-- 고객사 전달 문서 -->
				</li>
				
			</ul>
			<div class="tab-content" id="myTabContent">
				<%-- 
				<div class="tab-pane fade show active" id="tab1">
					<div class="container-fluid p-0 overflow-hidden" style="border-right: 1px solid #cccccc; border-left: 1px solid #cccccc;border-bottom: 1px solid #cccccc;">
						<div class="row">
							<div class="p-0" style="flex: 0 0 70%; max-width: 70%;">
								<div class="row p-0 mb-2" style="height:80vh;">
									<div class="col-md-12 ml-1 p-1" style="background-color:#ffffff;">
										<table id="operationNoticeTable" class="table table-bordered m-0">
											<thead class="thead-light">
												<tr>
													<th>분류</th>
													<th>구분</th>
													<th>발생처</th>
													<th>발생공정</th>
													<th>내용</th>
													<th>조치</th>
													<th>담당</th>
													<th>관리번호</th>
													<th>등록일자</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
							<div class="p-0" style="flex: 0 0 29%; max-width: 29%;">
								<div class="row p-0 mb-2" style="height:80vh;">
									<div class="col-md-12 ml-1 p-1" style="background-color:#ffffff;">
										<div class="row">
											<div class="card-body pt-0 pr-0 pb-2 pl-0">
												<button type="button" class="btn btn-danger float-right" id="btnNoticeRemove" disabled>삭제</button>
												<button type="button" class="btn btn-warning float-right mr-1" id="btnNoticeEdit" disabled>수정</button>
												<button type="button" class="btn btn-primary float-right mr-1" id="btnNoticeAdd">등록</button>
												<button type="button" class="btn btn-secondary float-right mr-1" id="btnNoticeCancle" disabled>취소</button>
											</div>
										</div>
										<table class="table table-bordered m-0">
											<colgroup>
					                            <col width="18%">
					                            <col width="32%">
					                            <col width="18%">
					                            <col width="32%">
					                        </colgroup>
											<thead class="thead-light">
												<tr>
													<th>분류*</th>
													<td>
														<select class="form-control p-0 mw-100 noticeInputGroup" id="type" disabled>
															<option value="">선택</option>
															<option value="001">생산</option>
															<option value="002">품질</option>
															<option value="003">이상발생</option>
														</select>
													</td>
													<th>구분</th>
													<td><input class="form-control mw-100 noticeInputGroup" type="text" id="gubun" disabled></td>
												</tr>
												<tr>
													<th>발생처</th>
													<td><input class="form-control mw-100 noticeInputGroup" type="text" id="origin" disabled></td>
													<th>발생공정</th>
													<td><input class="form-control mw-100 noticeInputGroup" type="text" id="originPrcss" disabled></td>
												</tr>
												<tr>
													<th>내용</th>
													<td colspan='3'><input class="form-control mw-100 noticeInputGroup" type="text" id="originContents" disabled></td>
												</tr>
												<tr>
													<th>조치</th>
													<td colspan='3'><input class="form-control mw-100 noticeInputGroup" type="text" id="originAction" disabled></td>
												</tr>
												<tr>
													<th>시작일자*</th>
													<td><input class="form-control mw-100 noticeInputGroup" type="date" id="noticeStartDate" disabled></td>
													<th>종료일자*</th>
													<td><input class="form-control mw-100 noticeInputGroup" type="date" id="noticeEndDate" disabled></td>
												</tr>
												<tr>
													<th>담당자</th>
													<td><input class="form-control mw-100 noticeInputGroup" type="text" id="manager" disabled></td>
													<th>관리번호</th>
													<td><input class="form-control mw-100 noticeInputGroup" type="text" id="manageNumber" disabled></td>
												</tr>
											</thead>
										</table>
										<button type="button" class="btn btn-primary float-right d-none" id="btnNoticeSave">저장</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				 --%>
				<div class="tab-pane fade show active" id="tab2" style="height:45rem;">
					<div class="row" style="background-color: #AAB4C6; margin: 0px;height:5rem;">
					<!-- <div class="row mb-2 mt-5" style="color: #ffffff; height: 11vh;border-radius: 20px;width:100%;"></div> -->
						<div class="text-center" style="background-color: #AAB4C6; flex: 0 0 auto; width: 100%;">
							<span style="font-size:5rem; vertical-align: middle; font-weight:600;color:#1E2636;letter-spacing:3rem;">무재해</span>
							<img class="pr-2" src="/resources/assets/images/accidentFree2.png" style="height: 100%;margin-right: 2rem;">
							<span style="font-size:5rem; vertical-align: middle; font-weight:600;color:#1E2636;letter-spacing:3rem;">현황</span>
						</div>
						<div class="row mb-2" style="background-color: #AAB4C6;color: #ffffff;">
							<div style="background-color:#DDE5F5;margin-right:10rem;margin-left:10rem;border: 0.2rem solid #6C85AB;">
								<div class="row p-0" style="height:29rem;">
									<div style="text-align: center; flex: 0 0 auto; width: 100%; margin-top: 2rem;">
										<span style="color: #C43F22; font-weight:700; font-size: 5rem;letter-spacing:3rem;">목표일수</span>
										<input class="text-center " type="text" id="accidentFreeTargetDate" 
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
										<input class="text-center" type="number" maxlength="4" id="accidentFreeStartYear"  
										style="background-color: #000000; color: #FFFFFF; font-size: 2.5rem; width: 12rem;margin-left: 3rem;">
										<span style="color: #000000; font-weight:700; font-size: 3rem; margin-left: 3rem;">년</span>
										<input class="text-center" type="number" maxlength="2" id="accidentFreeStartMonth"  
										style="background-color: #000000; color: #FFFFFF; font-size: 2.5rem; width: 8rem;margin-left: 3rem;">
										<span style="color: #000000; font-weight:700; font-size: 3rem; margin-left: 3rem;">월</span>
										<input class="text-center" type="number" maxlength="2" id="accidentFreeStartDay"  
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
				<div class="tab-pane fade" id="tab3">
					<div class="row mb-2" style="background-color: #cc0000;
			                                    color: #ffffff; height: 11vh;
			                                    margin-left: 3%; margin-right: 3%;
			                                    border-radius: 20px;">
                        <div class="col-md-12 text-center">
                        	<!-- <img class="pr-2 float-left" src="/resources/assets/images/daerimLogo.png" style="height: 100%;"> -->
                            <span style="font-size:60px; vertical-align: middle; font-weight:600;">사출Part 생산현황</span>
                        </div>
                    </div>
                    <div class="row mb-2" style="background-color: #ffffff;
				                                color: #ffffff; height: 66vh;
				                                margin-left: 3%; margin-right: 3%;
				                                border-radius: 20px;">
                        <div class="col-md-6 p-0" >
                        	<div class="row">
                        		<div class="col-md-12 ml-1 p-1">
									<select class="text-right" id="workStatusYear" style="background-color: #000000; color: #ff0000;
																							font-weight:700; font-size: 50px; width: 20%;"></select>
									<span style="color: #000000; font-weight:700; font-size: 50px; margin-right: 1%;">년</span>
									<select class="text-right" id="workStatusMonth" style="background-color: #000000; color: #ff0000;
																							font-weight:700; font-size: 50px; width: 10%;">
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select>
									<span style="color: #000000; font-weight:700; font-size: 50px;">월</span>
									<button type="button" id="btnWorkStatusSearch" style="font-size:50px; background-color: #ffffff;">조회</button>
								</div>
                        	</div>
                        	<div class="row" style="margin-top: 1%; margin-bottom: 1%;
                   									background:linear-gradient(225deg, transparent 50px, #fff2cc 0) right,
                   												linear-gradient(45deg, transparent 50px, #fff2cc 0) left;
                   									background-size:50% 100%;
													background-repeat:no-repeat;">
								<div class="col-md-6 p-0 text-center" style="height:25vh;">
									<canvas id="workStatusPie1" style="display:inline; height:100%;"></canvas>
								</div>
								<div class="col-md-6 p-0 text-center" style="height:25vh;">
									<canvas id="workStatusPie2" style="display:inline; height:100%;"></canvas>
								</div>
								<div class="col-md-6 p-0 text-center" style="height:25vh;">
									<canvas id="workStatusPie3" style="display:inline; height:100%;"></canvas>
								</div>
								<div class="col-md-6 p-0 text-center" style="height:25vh;">
									<canvas id="workStatusPie4" style="display:inline; height:100%;"></canvas>
								</div>
                        	</div>
                        </div>
                        <div class="col-md-6 p-0" style="">
                        	<div class="row">
								<div class="col-md-12 mb-1 ml-2">
									<span style="color: #000000; font-weight:700; font-size: 4vh;">시간가동율</span>
								</div>
								<div class="col-md-12 mb-1 ml-2">
									<span style="color: #000000; font-weight:700; font-size: 4vh; margin-right: 2%">보유</span>
									<input class="text-right" type="text" id="workTimeBtime" onkeyup="numberFormat(this, 'int')"
											style="background-color: #000000; color: #ff0000; font-weight:700; font-size: 4vh; width: 20%; margin-right: 2%; border: 5px solid orange;">
									<span style="color: #000000; font-weight:700; font-size: 4vh; margin-right: 6%">HR</span>
									<span style="color: #000000; font-weight:700; font-size: 4vh; margin-right: 2%">로스</span>
									<input class="text-right" type="text" id="workTimeLtime" onkeyup="numberFormat(this, 'int')"
											style="background-color: #000000; color: #ff0000; font-weight:700; font-size: 4vh; width: 20%; margin-right: 2%; border: 5px solid orange;">
									<span style="color: #000000; font-weight:700; font-size: 4vh; margin-right: 5%">HR</span>
								</div>
								<div class="col-md-12 mb-1 ml-2" style="border-bottom: 3px solid #000000;">
									<input class="text-left w-100" type="text" id="workTimeDesc"
											style="font-weight:700; font-size: 4vh; width: 20%; margin-right: 2%; border:none; border: 5px solid orange;">
								</div>
								<div class="col-md-12 mb-1 ml-2">
									<span style="color: #000000; font-weight:700; font-size: 4vh;">성능가동율</span>
								</div>
								<div class="col-md-12 mb-1 ml-2">
									<span style="color: #000000; font-weight:700; font-size: 4vh; margin-right: 2%">가동</span>
									<input class="text-right" type="text" id="workPerBtime" onkeyup="numberFormat(this, 'int')"
											style="background-color: #000000; color: #ff0000; font-weight:700; font-size: 4vh; width: 20%; margin-right: 2%; border: 5px solid orange;">
									<span style="color: #000000; font-weight:700; font-size: 4vh; margin-right: 6%">HR</span>
									<span style="color: #000000; font-weight:700; font-size: 4vh; margin-right: 2%">로스</span>
									<input class="text-right" type="text" id="workPerLtime" onkeyup="numberFormat(this, 'int')"
											style="background-color: #000000; color: #ff0000; font-weight:700; font-size: 4vh; width: 20%; margin-right: 2%; border: 5px solid orange;">
									<span style="color: #000000; font-weight:700; font-size: 4vh; margin-right: 5%">HR</span>
								</div>
								<div class="col-md-12 mb-1 ml-2" style="border-bottom: 3px solid #000000;">
									<input class="text-left w-100" type="text" id="workPerDesc"
											style="font-weight:700; font-size: 4vh; width: 20%; margin-right: 2%; border:none; border: 5px solid orange;">
								</div>
								<div class="col-md-12 mb-1 ml-2">
									<span style="color: #000000; font-weight:700; font-size: 4vh;">양품율</span>
								</div>
								<div class="col-md-12 mb-1 ml-2">
									<span style="color: #000000; font-weight:700; font-size: 4vh; margin-right: 2%">가치</span>
									<input class="text-right" type="text" id="workFairBtime" onkeyup="numberFormat(this, 'int')"
											style="background-color: #000000; color: #ff0000; font-weight:700; font-size: 4vh; width: 20%; margin-right: 2%; border: 5px solid orange;">
									<span style="color: #000000; font-weight:700; font-size: 4vh; margin-right: 6%">HR</span>
									<span style="color: #000000; font-weight:700; font-size: 4vh; margin-right: 2%">로스</span>
									<input class="text-right" type="text" id="workFairLtime" onkeyup="numberFormat(this, 'int')"
											style="background-color: #000000; color: #ff0000; font-weight:700; font-size: 4vh; width: 20%; margin-right: 2%; border: 5px solid orange;">
									<span style="color: #000000; font-weight:700; font-size: 4vh; margin-right: 5%">HR</span>
								</div>
								<div class="col-md-12 mb-1 ml-2" style="border-bottom: 3px solid #000000;">
									<input class="text-left w-100" type="text" id="workFairDesc"
											style="font-weight:700; font-size: 4vh; width: 20%; margin-right: 2%; border:none; border: 5px solid orange;">
								</div>
                        	</div>
                        </div>
                    </div>
				</div>
				<div class="tab-pane fade" id="tab4" >
					<div class="row" style="height: 77vh;">
						<div class="col-md-12"style="text-align:center;left:11%">
							<img src="/resources/assets/images/welcome_background.png" style="height: 77vh; position: absolute; top:0; left:0;">
							<textarea rows="4" id="welcomeText" style="text-align: center;font-size: 7vh; resize:none; position: absolute; top: 19vh; left: 9vw; color: #333333;
																		background: transparent; border: none; width: 49vw; line-height: 10vh; font-weight:700;"></textarea>
						</div>
						<div class="col-md-12 mt-3" style="position: absolute;left: 0vw;top: 33rem;text-align:center;">
			             	<img class="pr-2" src="/resources/assets/images/logo_cbtp.png" style="width:23.5rem;height: 100%;">
			            	<!-- <span style="font-size:5.5rem; vertical-align: middle; font-weight:700;color:#171823;">충북테크노파크</span> -->
			            </div>
					</div>
				</div>
				<div class="tab-pane fade" id="tab5" >
					<div class="row" style="height: 77vh;">
						<div class="col-md-12" style="left:11%">
							<input type="file" class="d-none" id="fileMain">
							<img src="data:image/jpg;base64," id="welcomeImg" style="height: 77vh; position: absolute; top:0; left:0; border: 5px solid orange;">
                        </div>
					</div>
				</div>
				<div class="tab-pane fade" id="tab6" >
					<div class="row" style="height: 77vh;">
						<div class="col-md-12">
							<input type="file" class="d-none" id="fileMain2">
							<img src="data:image/jpg;base64," id="custSendDocImg" style="height: 77vh; position: absolute; top:0; left:0; border: 5px solid orange;">
                        </div>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp"%>
<!-- Modal >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Modal -->
<script>
	let currentHref = "mmsc0180";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "모니터링 관련정보 등록");

	let startDateVal = moment().subtract('1','M').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');

	let saveState = 'add';

	let noticeIdxVal = '';

	$('#startDate').val(startDateVal);
	$('#endDate').val(endDateVal);

	// 사출 Part 운영현황 tab click
	$('#tab1Nav').on('click',function() {
		$('#btnAccidentFreeSave').addClass('d-none'); // 무재해 현황판
		$('#btnWorkStatusSave').addClass('d-none'); // 사출  Part 생산현황
		$('#btnWelcomeTextSave').addClass('d-none'); // 환영문구(문구)
		$('#btnWelcomeImgSave').addClass('d-none'); // 환영문구(이미지)
		$('#btnCustSendDocSave').addClass('d-none'); // 고객사 전달 문서
		$('#btnCustSendDocStateY').addClass('d-none'); // 고객사 전달 문서 활성화
		$('#btnCustSendDocStateN').addClass('d-none'); // 고객사 전달 문서 비활성화
	});
	// 무재해 현황판 tab click
	$('#tab2Nav').on('click',function() {
		$('#btnAccidentFreeSave').removeClass('d-none'); // 무재해 현황판
		$('.mainGubun').removeClass('d-none'); // 무재해 현황판
		$('#btnWorkStatusSave').addClass('d-none'); // 사출  Part 생산현황
		$('#btnWelcomeTextSave').addClass('d-none'); // 환영문구(문구)
		$('#btnWelcomeImgSave').addClass('d-none'); // 환영문구(이미지)
		$('#btnCustSendDocSave').addClass('d-none'); // 고객사 전달 문서
		$('#btnCustSendDocStateY').addClass('d-none'); // 고객사 전달 문서 활성화
		$('#btnCustSendDocStateN').addClass('d-none'); // 고객사 전달 문서 비활성화
	});
	// 사출  Part 생산현황 tab click
	$('#tab3Nav').on('click',function() {
		$('#btnAccidentFreeSave').addClass('d-none'); // 무재해 현황판
		$('.mainGubun').addClass('d-none'); // 무재해 현황판
		$('#btnWorkStatusSave').removeClass('d-none'); // 사출  Part 생산현황
		$('#btnWelcomeTextSave').addClass('d-none'); // 환영문구(문구)
		$('#btnWelcomeImgSave').addClass('d-none'); // 환영문구(이미지)
		$('#btnCustSendDocSave').addClass('d-none'); // 고객사 전달 문서
		$('#btnCustSendDocStateY').addClass('d-none'); // 고객사 전달 문서 활성화
		$('#btnCustSendDocStateN').addClass('d-none'); // 고객사 전달 문서 비활성화
	});
	// 환영문구(문구) tab click
	$('#tab4Nav').on('click',function() {
		getWelcomeData(); // 환영문구 조회
		$('#btnAccidentFreeSave').addClass('d-none'); // 무재해 현황판
		$('.mainGubun').addClass('d-none'); // 무재해 현황판
		$('#btnWorkStatusSave').addClass('d-none'); // 사출  Part 생산현황
		$('#btnWelcomeTextSave').removeClass('d-none'); // 환영문구(문구)
		$('#btnWelcomeImgSave').addClass('d-none'); // 환영문구(이미지)
		$('#btnCustSendDocSave').addClass('d-none'); // 고객사 전달 문서
		$('#btnCustSendDocStateY').addClass('d-none'); // 고객사 전달 문서 활성화
		$('#btnCustSendDocStateN').addClass('d-none'); // 고객사 전달 문서 비활성화
	});
	// 환영문구(이미지) tab click
	$('#tab5Nav').on('click',function() {
		getWelcomeData(); // 환영문구 조회
		$('#btnAccidentFreeSave').addClass('d-none'); // 무재해 현황판
		$('.mainGubun').addClass('d-none'); // 무재해 현황판
		$('#btnWorkStatusSave').addClass('d-none'); // 사출  Part 생산현황
		$('#btnWelcomeTextSave').addClass('d-none'); // 환영문구(문구)
		$('#btnWelcomeImgSave').removeClass('d-none'); // 환영문구(이미지)
		$('#btnCustSendDocSave').addClass('d-none'); // 고객사 전달 문서
		$('#btnCustSendDocStateY').addClass('d-none'); // 고객사 전달 문서 활성화
		$('#btnCustSendDocStateN').addClass('d-none'); // 고객사 전달 문서 비활성화
	});
	// 고객사 전달 문서 tab click
	$('#tab6Nav').on('click',function() {
		getCustSendDocData(); // 고객사 전달 문서 조회
		$('#btnAccidentFreeSave').addClass('d-none'); // 무재해 현황판
		$('#btnWorkStatusSave').addClass('d-none'); // 사출  Part 생산현황
		$('#btnWelcomeTextSave').addClass('d-none'); // 환영문구(문구)
		$('#btnWelcomeImgSave').addClass('d-none'); // 환영문구(이미지)
		$('#btnCustSendDocSave').removeClass('d-none'); // 고객사 전달 문서
		$('#btnCustSendDocStateY').addClass('d-none'); // 고객사 전달 문서 활성화
		$('#btnCustSendDocStateN').addClass('d-none'); // 고객사 전달 문서 비활성화
	});

	

	// 운영 공지사항 ===============================================================================
	// 운영 공지사항 목록조회
	let operationNoticeTable = $('#operationNoticeTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 200000,
		scrollY: '70vh',
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
		ajax : {
			url : '<c:url value="mm/operationNoticeList"/>',
			type : 'POST',
			data : {
				'startDate'		:	function(){ return startDateVal },
				'endDate'		:	function(){ return endDateVal },
			},
		},
		rowId : 'idx',
		columns : [
			{//분류
				data : 'type',
				className: 'text-center',
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						if(data == '001') {
							return '생산';
						} else if(data == '002') {
							return '품질';
						} else if(data == '003') {
							return '이상발생';
						} else {
							return '';
						}
					}
				}
			},
			{//구분
				data : 'gubun',
				className: 'text-center'
			},
			{//발생처
				data : 'origin',
				className: 'text-center'
			},
			{//발생공정
				data : 'originPrcss',
				className: 'text-center'
			},
			{//내용
				data : 'originContents',
				className: 'text-center'
			},
			{//조치
				data : 'originAction',
				className: 'text-center'
			},
			{//담당
				data : 'manager',
				className: 'text-center'
			},
			{//관리번호
				data : 'manageNumber',
				className: 'text-center'
			},
			{//등록일자
				data : 'regDate',
				className: 'text-center',
				render : function(data, type, row, meta){
					if (data != null && data != '') {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
					}
				}
			},
		],
		columnDefs : [],
	    order: [],
	    buttons: [],
	});

	let html1  = '<div class="row">';
	    html1 += '	<label class="input-label-sm">등록일자</label>';
	    html1 += '	<div class="form-group input-sub m-0 mr-2 row">';
	    html1 += '		<input class="form-control" style="width:97px;" type="text" id="startDate" name="preInWhsDateFrom" disabled/>';
	    html1 += '		<button onclick="fnPopUpCalendar(startDate,startDate,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateFromCalendar" type="button">';
	    html1 += '			<span class="oi oi-calendar"></span>';
	    html1 += '		</button>'; 
	    html1 += '	</div>';
	    html1 += '	<label class="input-label-sm">~</label>';
	    html1 += '	<div class="form-group input-sub m-0 mr-2 row">';
	    html1 += '		<input class="form-control" style="width:97px;" type="text" id="endDate" name="preInWhsDateTo" disabled/>';
	    html1 += '		<button onclick="fnPopUpCalendar(endDate,endDate,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateToCalendar" type="button">';
	    html1 += '			<span class="oi oi-calendar"></span>';
	    html1 += '		</button>';
	    html1 += '	</div>';
	    html1 += '	<button type="button"  class="btn btn-primary mr-2" id="btnSearch">조회</button>';
	    html1 += '</div>';
	    
	$('#operationNoticeTable_length').html(html1);
	$('#startDate').val(startDateVal);
	$('#endDate').val(endDateVal);
	
	// 조회 버튼 click
	$('#btnSearch').on('click',function() {
		startDateVal = $('#startDate').val();
		endDateVal = $('#endDate').val();
		operationNoticeTable.ajax.reload(function() {});
	})
	
	// 상세조회
	$('#operationNoticeTable tbody').on('click','tr',function() {
		noticeIdxVal = operationNoticeTable.row(this).data().idx;

		$.ajax({
			url: '<c:url value="mm/operationNoticeRead"/>',
            type: 'POST',
            data: {
                'idx'	:	noticeIdxVal
            },
			success : function(res) {
				let data = res.data;
				if(res.result == 'ok') {
					$('.noticeInputGroup').attr('disabled',true); // 입력항목
					
					$('#btnNoticeAdd').attr('disabled',false); // 등록버튼
					$('#btnNoticeEdit').attr('disabled',false); // 수정버튼
					$('#btnNoticeRemove').attr('disabled',false); // 삭제버튼
					$('#btnNoticeCancle').attr('disabled',true); // 취소버튼
					
					$('#btnNoticeSave').addClass('d-none'); // 저장버튼

					$('#type').val(data.type);
	            	$('#gubun').val(data.gubun);
	            	$('#origin').val(data.origin);
	            	$('#originPrcss').val(data.originPrcss);
	            	$('#originContents').val(data.originContents);
	            	$('#originAction').val(data.originAction);
	            	$('#noticeStartDate').val(data.noticeStartDate);
	            	$('#noticeEndDate').val(data.noticeEndDate);
	            	$('#manager').val(data.manager);
	            	$('#manageNumber').val(data.manageNumber);
				} else {
					toastr.error(res.message);
				}
			}
		});
	})
	
	
	// 등록 버튼 click
	$('#btnNoticeAdd').on('click',function() {
		saveState = 'add';
		
		$('.noticeInputGroup').attr('disabled',false); // 입력항목
		
		$('#btnNoticeAdd').attr('disabled',true); // 등록버튼
		$('#btnNoticeEdit').attr('disabled',true); // 수정버튼
		$('#btnNoticeRemove').attr('disabled',true); // 삭제버튼
		$('#btnNoticeCancle').attr('disabled', false); // 취소버튼
		
		$('#btnNoticeSave').removeClass('d-none'); // 저장버튼
	});

	// 수정 버튼 click
	$('#btnNoticeEdit').on('click',function() {
		saveState = 'edit';
		$('.noticeInputGroup').attr('disabled',false); // 입력항목
		
		$('#btnNoticeAdd').attr('disabled',true); // 등록버튼
		$('#btnNoticeEdit').attr('disabled',true); // 수정버튼
		$('#btnNoticeRemove').attr('disabled',true); // 삭제버튼
		$('#btnNoticeCancle').attr('disabled',false); // 취소버튼
		
		$('#btnNoticeSave').removeClass('d-none'); // 저장버튼
	});

	// 삭제 버튼 click
	$('#btnNoticeRemove').on('click',function() {
		$('#deleteModal').modal('show');
	});

	//삭제 모달 삭제버튼 click
	$('#btnDeleteConfirm').on('click',function() {
		$.ajax({
			url: '<c:url value="mm/operationNoticeRemove"/>',
            type: 'POST',
            data: {
                'idx'	:	noticeIdxVal,
            },
            beforeSend: function() {
                $('#my-spinner').show();
            },
            success: function (res) {
                if(res.result == 'ok') {
                	toastr.success('삭제되었습니다.');
                } else if (res.result == "warning") {
                    toastr.warning(res.message);
                } else {
                    toastr.error(res.message);
                }
                operationNoticeTable.ajax.reload(function(){});
                $('#deleteModal').modal('hide');
                $('#my-spinner').hide();
            }
		});
	});

	// 취소 버튼 click
	$('#btnNoticeCancle').on('click',function() {
		if(saveState == 'add') { // 등록중이었을 경우
			$('.noticeInputGroup').val('');
			
			$('.noticeInputGroup').attr('disabled',true); // 입력항목
			
			$('#btnNoticeAdd').attr('disabled',false); // 등록버튼
			$('#btnNoticeEdit').attr('disabled',true); // 수정버튼
			$('#btnNoticeRemove').attr('disabled',true); // 삭제버튼
			$('#btnNoticeCancle').attr('disabled',true); // 취소버튼
			
			$('#btnNoticeSave').addClass('d-none'); // 저장버튼
		} else { // 수정중이였을 경우
			$('#operationNoticeTable tbody').find('.selected').trigger('click');
		}
	});

	// 저장 버튼 click
	$('#btnNoticeSave').on('click',function() {
		if($('#type').val() == '') {
			toastr.warning('분류를 선택해주세요.');
			$('#type').focus();
			return false;
		}
		if($('#noticeStartDate').val() == '') {
			toastr.warning('시작일자를 입력해주세요.');
			$('#noticeStartDate').focus();
			return false;
		}
		if($('#noticeEndDate').val() == '') {
			toastr.warning('종료일자를 입력해주세요.');
			$('#noticeEndDate').focus();
			return false;
		}
		let saveUrl = '';
		if(saveState == 'add') {
			saveUrl = 'mm/operationNoticeAdd';
		} else {
			saveUrl = 'mm/operationNoticeEdit';
		}
		$.ajax({
			url: saveUrl,
            type: 'POST',
            data: {
                'idx'				:	noticeIdxVal,
            	'type'				:	$('#type').val(),
            	'gubun'				:	$('#gubun').val(),
            	'origin'			:	$('#origin').val(),
            	'originPrcss'		:	$('#originPrcss').val(),
            	'originContents'	:	$('#originContents').val(),
            	'originAction'		:	$('#originAction').val(),
            	'noticeStartDate'	:	$('#noticeStartDate').val(),
            	'noticeEndDate'		:	$('#noticeEndDate').val(),
            	'manager'			:	$('#manager').val(),
            	'manageNumber'		:	$('#manageNumber').val(),
            },
            beforeSend: function() {
                $('#my-spinner').show();
            },
			success : function(res) {
				let idx = res.idx;
				if(res.result == 'ok') {
					if(saveState == 'add') {
						toastr.success('등록되었습니다.');
					} else {
						toastr.success('수정되었습니다.');
					}

					$('.noticeInputGroup').attr('disabled',true); // 입력항목
					
					$('#btnNoticeAdd').attr('disabled',false); // 등록버튼
					$('#btnNoticeEdit').attr('disabled',false); // 수정버튼
					$('#btnNoticeRemove').attr('disabled',true); // 삭제버튼
					$('#btnNoticeCancle').attr('disabled',true); // 취소버튼
					
					$('#btnNoticeSave').addClass('d-none'); // 저장버튼
					
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
				operationNoticeTable.ajax.reload(function(){
					let node = $('#operationNoticeTable tbody').find('tr #'+idx);
					operationNoticeTable.row(node).select();
				});
			}
		});
	});
	

	

	// 무재해 현황판 ===============================================================================
	// 무재해 현황판 조회
	function getAccidentFreeData() {
		$.ajax({
			url: '<c:url value="mm/accidentFreeRead"/>',
            type: 'POST',
            data: {
            	'mainGubun'	:	function(){return $('#mainGubun').val();},
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
			}
		});
	}

	// 무재해 현황판 수정
	$('#btnAccidentFreeSave').on('click',function() {
		let accidentStartDate = $('#accidentFreeStartYear').val() + $('#accidentFreeStartMonth').val() + $('#accidentFreeStartDay').val();
		$.ajax({
			url: '<c:url value="mm/accidentFreeEdit"/>',
            type: 'POST',
            data: {
            	'number'			:	function(){return $('#accidentFreeNumber').val();},
            	'targetDate'		:	function(){return $('#accidentFreeTargetDate').val();},
            	'accidentStartDate'	:	function(){return accidentStartDate;},
            	'accidentEndDate'	:	function(){return $('#accidentFreeEndDate').val();},
            	'mainGubun'			:	function(){return $('#mainGubun').val();},
            },
            beforeSend: function() {
                $('#my-spinner').show();
            },
			success : function(res) {
				toastr.success('저장되었습니다.');
				getAccidentFreeData();
				$('#my-spinner').hide();
			}
		});
	})
	
	// 사출Part 생산현황 ===============================================================================
	
	let workStatusYear = moment().format('YYYY');
	let workStatusMonth = moment().format('MM');
	// 년도 표기 (2022 ~ 2121)
	for(var i=0;i<100;i++) {
		let year = moment('2022').add('y',i).format('YYYY');
		$('#workStatusYear').append('<option value="'+year+'">'+year+'</option>')
	}

	$('#workStatusYear').val(workStatusYear);
	$('#workStatusMonth').val(workStatusMonth);

	// 사출Part 생산현황 조회
	function getWorkStatusData() {
		workStatusYear = $('#workStatusYear').val();
		workStatusMonth = $('#workStatusMonth').val();
		$.ajax({
			url: '<c:url value="mm/workStatusRead"/>',
            type: 'POST',
            data: {
                'workDate'	:	workStatusYear+workStatusMonth
            },
			success : function(res) {
				let data = res.data;
				if(data != null) {
					$('#workTimeBtime').val(data.workTimeBtime);
					$('#workTimeLtime').val(data.workTimeLtime);
					$('#workTimeDesc').val(data.workTimeDesc);
					$('#workPerBtime').val(data.workPerBtime);
					$('#workPerLtime').val(data.workPerLtime);
					$('#workPerDesc').val(data.workPerDesc);
					$('#workFairBtime').val(data.workFairBtime);
					$('#workFairLtime').val(data.workFairLtime);
					$('#workFairDesc').val(data.workFairDesc);

                	// 설비효율
                    let pie1Bad = (parseInt(data.workTimeLtime)+parseInt(data.workPerLtime)+parseInt(data.workFairLtime))/(parseInt(data.workTimeBtime)+parseInt(data.workPerBtime)+parseInt(data.workFairBtime))*100;
                    let pie1Good = 100-pie1Bad;
                    workStatusPie1.data.datasets[0].data = [pie1Good.toFixed(2),pie1Bad.toFixed(2)];
                    workStatusPie1.update();
                    // 시간가동율
                    let pie2Bad = parseInt(data.workTimeLtime)/parseInt(data.workTimeBtime)*100;
                    let pie2Good = 100-pie2Bad;
                    workStatusPie2.data.datasets[0].data = [pie2Good.toFixed(2),pie2Bad.toFixed(2)];
                    workStatusPie2.update();
                    // 성능가동율
                    let pie3Bad = parseInt(data.workPerLtime)/parseInt(data.workPerBtime)*100;
                    let pie3Good = 100-pie3Bad;
                    workStatusPie3.data.datasets[0].data = [pie3Good.toFixed(2),pie3Bad.toFixed(2)];
                    workStatusPie3.update();
                    // 양품율
                    let pie4Bad = parseInt(data.workFairLtime)/parseInt(data.workFairBtime)*100;
                    let pie4Good = 100-pie4Bad;
                    workStatusPie4.data.datasets[0].data = [pie4Good.toFixed(2),pie4Bad.toFixed(2)];
                    workStatusPie4.update();
				} else {
					$('#workTimeBtime').val('');
					$('#workTimeLtime').val('');
					$('#workTimeDesc').val('');
					$('#workPerBtime').val('');
					$('#workPerLtime').val('');
					$('#workPerDesc').val('');
					$('#workFairBtime').val('');
					$('#workFairLtime').val('');
					$('#workFairDesc').val('');
				}
			}
		});
	}

	// 사출 Part 생산현황 조회 버튼 click
	$('#btnWorkStatusSearch').on('click',function() {
		getWorkStatusData();
	})
	
	// 사출Part 생산현황 저장 버튼 click
	$('#btnWorkStatusSave').on('click',function() {
		$.ajax({
			url: '<c:url value="mm/workStatusAdd"/>',
            type: 'POST',
            data: {
                'workDate'		:	$('#workStatusYear').val()+$('#workStatusMonth').val(),
            	'workTimeBtime'	:	$('#workTimeBtime').val(),
				'workTimeLtime'	:	$('#workTimeLtime').val(),
				'workTimeDesc'	:	$('#workTimeDesc').val(),
				'workPerBtime'	:	$('#workPerBtime').val(),
				'workPerLtime'	:	$('#workPerLtime').val(),
				'workPerDesc'	:	$('#workPerDesc').val(),
				'workFairBtime'	:	$('#workFairBtime').val(),
				'workFairLtime'	:	$('#workFairLtime').val(),
				'workFairDesc'	:	$('#workFairDesc').val()
            },
            beforeSend: function() {
                $('#my-spinner').show();
            },
			success : function(res) {
				let data = res.data;
				if(res.result == 'ok') {
					toastr.success('저장되었습니다.');
				} else {
					toastr.error(res.message);
				}
				getWorkStatusData();
				$('#my-spinner').hide();
			}
		});
	})
	
	/* workStatusPie1.data.datasets[0].data[0] = 30;
	workStatusPie1.data.datasets[0].data[1] = 70;
	workStatusPie1.update(); */
	// 설비효율
	const workStatusPie1 = new Chart(
		document.getElementById('workStatusPie1'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [85, 15],
					backgroundColor:[
						'#0000ff',
						'#ff0000'
					],
					hoverOffset: 4
				}]
			},
			options: {
				maintainAspectRatio: false,
				plugins: {
					title: {
						display: true,
						text: '설비효율',
						position: 'bottom',
						color: '#000000',
						font: {
							size: 20
						}
					},
					datalabels: {
						color: 'yellow',
						font: {
							size: 15,
							weight: 'bold'
						},
						formatter: function(value, context) {
							return value+'%';
						}
					},
				},
			}
		}
	)

	// 시간가동율
	const workStatusPie2 = new Chart(
		document.getElementById('workStatusPie2'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [85, 15],
					backgroundColor:[
						'#00b059',
						'#ff0000'
					],
					hoverOffset: 4
				}]
			},
			options: {
				maintainAspectRatio: false,
				plugins: {
					title: {
						display: true,
						text: '시간가동율',
						position: 'bottom',
						color: '#000000',
						font: {
							size: 20
						}
					},
					datalabels: {
						color: 'yellow',
						font: {
							size: 15,
							weight: 'bold'
						},
						formatter: function(value, context) {
							return value+'%';
						}
					},
				},
			}
		}
	)

	// 성능가동율
	const workStatusPie3 = new Chart(
		document.getElementById('workStatusPie3'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [85, 15],
					backgroundColor:[
						'#000000',
						'#ff0000'
					],
					hoverOffset: 4
				}]
			},
			options: {
				maintainAspectRatio: false,
				plugins: {
					title: {
						display: true,
						text: '성능가동율',
						position: 'bottom',
						color: '#000000',
						font: {
							size: 20
						}
					},
					datalabels: {
						color: 'yellow',
						font: {
							size: 15,
							weight: 'bold'
						},
						formatter: function(value, context) {
							return value+'%';
						}
					},
				},
			}
		}
	)

	// 양품율
	const workStatusPie4 = new Chart(
		document.getElementById('workStatusPie4'),
		{
			type: 'pie',
			data: {
				datasets: [{
					label: 'my',
					data: [85, 15],
					backgroundColor:[
						'#843c0c',
						'#ff0000'
					],
					hoverOffset: 4
				}]
			},
			options: {
				maintainAspectRatio: false,
				plugins: {
					title: {
						display: true,
						text: '양품율',
						position: 'bottom',
						color: '#000000',
						font: {
							size: 20
						}
					},
					datalabels: {
						color: 'yellow',
						font: {
							size: 15,
							weight: 'bold'
						},
						formatter: function(value, context) {
							return value+'%';
						}
					},
				},
			}
		}
	)

	// 환영문구 ===============================================================================
	let formData = new FormData();
	
	// 환영문구 조회
	function getWelcomeData() {
		$.ajax({
			url: '<c:url value="mm/welcomeRead"/>',
            type: 'POST',
			success : function(res) {
				let data = res.data;
				$('#welcomeText').val(data.welcomeText);
				if(data.welcomeImg != null) {
					
					var blob = new Blob([base64ToArrayBuffer(data.welcomeImg)], { type: 'image' });
            		var file = new File([blob], 'img', { lastModified: new Date().getTime(), type: 'image' });
					$('#welcomeImg').attr('src','data:image/jpg;base64,'+getImgBase64(file));
				}
			}
		});
	}

	// 환영문구(문구) 수정
	$('#btnWelcomeTextSave').on('click',function() {
		$.ajax({
			url: '<c:url value="mm/welcomeTextEdit"/>',
            type: 'POST',
            data: {
            	'welcomeText'		:	function(){return $('#welcomeText').val();}
            },
            beforeSend: function() {
                $('#my-spinner').show();
            },
			success : function(res) {
				toastr.success('저장되었습니다.');
				$('#my-spinner').hide();
			},
			error: function(xhr,textStatus,error){
               	console.log("textStatus: "+xhr.status+", error: "+error);
               	alert("예상치 못한 오류가 발생했습니다.");
            }
		});
	})
	
	// 환영문구(이미지) 수정
	$('#btnWelcomeImgSave').on('click',function() {
		$.ajax({
			url: '<c:url value="mm/welcomeImgEdit"/>',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function() {
                $('#my-spinner').show();
            },
			success : function(res) {
				toastr.success('저장되었습니다.');
				$('#my-spinner').hide();
			}
		});
	})
	
	//파일 추가 버튼 click
	$('#welcomeImg').on('click',function() {
		$('#fileMain').click();
	});


	$('#fileMain').on('change',function() {
		var fileInput = document.getElementById("fileMain"); //id로 파일 태그를 호출
        var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
        
        if(['jpg','JPG','png','PNG', 'gif', 'jpeg', 'bmp', 'ico', 'apng'].indexOf(files[0].name.split('.').at(-1)) == -1) { // 이미지파일일 경우
        	toastr.warning('이미지 파일을 선택해주세요.');
        	return false;
        }
        formData.delete('file-0');
        formData.append('file-0',files[0]);
		$('#welcomeImg').attr('src','data:image/jpg;base64,'+getImgBase64(files[0]));
	})
	
	// 고객사 전달 문서 ===============================================================================
	let formData2 = new FormData();
	
	// 고객사 전달 문서 조회
	function getCustSendDocData() {
		$.ajax({
			url: '<c:url value="mm/custSendDocRead"/>',
            type: 'POST',
			success : function(res) {
				let data = res.data;
				if(data.img != null) {
					var blob = new Blob([base64ToArrayBuffer(data.img)], { type: 'image' });
            		var file = new File([blob], 'img', { lastModified: new Date().getTime(), type: 'image' });
					$('#custSendDocImg').attr('src','data:image/jpg;base64,'+getImgBase64(file));
				}
				if(data.state == 'Y') {
					$('#btnCustSendDocStateY').addClass('d-none');
					$('#btnCustSendDocStateN').removeClass('d-none');
				} else {
					$('#btnCustSendDocStateY').removeClass('d-none');
					$('#btnCustSendDocStateN').addClass('d-none');
				}
			}
		});
	}
	
	// 고객사 전달 문서 수정
	$('#btnCustSendDocSave').on('click',function() {
		$.ajax({
			url: '<c:url value="mm/custSendDocEdit"/>',
            type: 'POST',
            data: formData2,
            processData: false,
            contentType: false,
            beforeSend: function() {
                $('#my-spinner').show();
            },
			success : function(res) {
				toastr.success('저장되었습니다.');
				$('#my-spinner').hide();
			}
		});
	})
	
	//파일 추가 버튼 click
	$('#custSendDocImg').on('click',function() {
		$('#fileMain2').click();
	});


	$('#fileMain2').on('change',function() {
		var fileInput = document.getElementById("fileMain2"); //id로 파일 태그를 호출
        var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
        
        if(['jpg','JPG','png','PNG', 'gif', 'jpeg', 'bmp', 'ico', 'apng'].indexOf(files[0].name.split('.').at(-1)) == -1) { // 이미지파일일 경우
        	toastr.warning('이미지 파일을 선택해주세요.');
        	return false;
        }
        formData2.delete('file-0');
        formData2.append('file-0',files[0]);
		$('#custSendDocImg').attr('src','data:image/jpg;base64,'+getImgBase64(files[0]));
	});

	// 모니터링 활성화버튼 click
	$('#btnCustSendDocStateY').on('click',function() {
		$.ajax({
			url: '<c:url value="mm/custSendDocStateEdit"/>',
            type: 'POST',
            data: {
                'state'	:	'Y'
            },
			success : function(res) {
				if(res.result == "ok"){ //응답결과
					toastr.success("활성화 되었습니다.");
					$('#btnCustSendDocStateY').addClass('d-none');
					$('#btnCustSendDocStateN').removeClass('d-none');
                } else {
                	toastr.error(res.message);
            	}
			}
		});
	});
	// 모니터링 비활성화버튼 click
	$('#btnCustSendDocStateN').on('click',function() {
		$.ajax({
			url: '<c:url value="mm/custSendDocStateEdit"/>',
            type: 'POST',
            data: {
                'state'	:	'N'
            },
			success : function(res) {
				if(res.result == "ok"){ //응답결과
					toastr.success("비활성화 되었습니다.");
					$('#btnCustSendDocStateY').removeClass('d-none');
					$('#btnCustSendDocStateN').addClass('d-none');
                } else {
                	toastr.error(res.message);
            	}
			}
		});
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 이미지 파일 base64변환
	function getImgBase64(files) {
		var imgForm = new FormData();
		imgForm.append('file-0',files);

		var base64 = '';
		$.ajax({
            url: '<c:url value="ut/getImgBase64"/>',
            data: imgForm,
            beforeSend: function() {
                // $('#my-spinner').show();
            },
            processData: false,
            contentType: false,
            async: false,
            type: 'POST',
            success: function(res){
                if(res.result == "ok"){ //응답결과
                	base64 = res.data;
                } else {
                	toastr.error(res.message);
            	}
          },
          error: function(xhr,textStatus,error){
                                  
              console.log("textStatus: "+xhr.status+", error: "+error);
              alert("예상치 못한 오류가 발생했습니다.");
              
          }
        });
        return base64;
	}
	
	function base64ToArrayBuffer(base64) {
        const binaryString = window.atob(base64); // Comment this if not using base64
        const bytes = new Uint8Array(binaryString.length);
        return bytes.map((byte, i) => binaryString.charCodeAt(i));
   	}
	
	
	
	
	
	$(document).ready(function() {
		console.log("123")
		getAccidentFreeData(); // 무재해 현황판 조회
		getWorkStatusData(); // 사출Part 생산현황 조회
		$('#btnAccidentFreeSave').removeClass('d-none'); // 무재해 현황판
		$('#btnWorkStatusSave').addClass('d-none'); // 사출  Part 생산현황
		$('#btnWelcomeTextSave').addClass('d-none'); // 환영문구(문구)
		$('#btnWelcomeImgSave').addClass('d-none'); // 환영문구(이미지)
		$('#btnCustSendDocSave').addClass('d-none'); // 고객사 전달 문서
		$('#btnCustSendDocStateY').addClass('d-none'); // 고객사 전달 문서 활성화
		$('#btnCustSendDocStateN').addClass('d-none'); // 고객사 전달 문서 비활성화
	});
</script>
</body>
</html>