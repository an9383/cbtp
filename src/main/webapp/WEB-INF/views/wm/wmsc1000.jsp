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
				<li class="breadcrumb-item"><a href="#">생산관리</a></li>
				<li class="breadcrumb-item active">APS 제조실행계획(레이저)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid overflow-hidden" id="main">
		<div class="row">
			<div id="section" style="height: calc(100vh - 1rem - 115px); background-color:#ffffff; margin: 5px; padding: 5px;
										display: grid;
										grid-template-areas:	'top top'
																'left right';
										grid-template-rows: 67px 1fr;
										grid-template-columns: 208px 1fr;
										width: 100%;">
				<div id="top" style="grid-area: top;">
					<div class="row">
						<div class="m-1 d-flex align-items-center" style="font-size: 0.725rem;">조회일자 :</div>
						<div class="my-1 mr-1 d-flex align-items-center">
							<input class="form-control" type="date" id="startDate">
						</div>
						<div class="my-1 mr-4 d-flex align-items-center">
							<button type="button" class="btn btn-primary" id="btnSearch">조회</button>
						</div>
						<div class="my-1 mr-4 d-flex align-items-center">
							<button type="button" class="btn btn-primary mr-1" id="btnConfirm">계획확정</button>
							<button type="button" class="btn btn-primary mr-1" id="btnCancle">확정취소</button>
							<button type="button" class="btn btn-primary" id="btnSearchApsToDate">기간별 목록조회</button>
						</div>
						<div class="m-1 d-flex align-items-center" style="font-size: 0.725rem;">계산기준일시 :</div>
						<div class="my-1 mr-1 d-flex align-items-center">
							<input class="form-control" type="datetime-local" id="apsCalDate">
						</div>
						<div class="my-1 mr-4 d-flex align-items-center">
							<button type="button" class="btn btn-primary" id="btnApsCal">자동계산</button>
						</div>
					</div>
					<div class="row">
						<div class="m-1 d-flex align-items-center" style="font-size: 0.725rem;">
							<div class="mr-1">범례 :</div>
							<div class="progress my-1 mr-4" style="width: 30vw; background-color: #ffffff; font-size: 15px; height: 100%;">
								<div class="progress-bar" style="width: 100%; font-size: 0.725rem; color: #000000; background-color: #ccccdc;">미배정</div>
								<div class="progress-bar" style="width: 100%; font-size: 0.725rem; color: #000000; background-color: #c0d8ff;">배정</div>
								<div class="progress-bar" style="width: 100%; font-size: 0.725rem; color: #ffffff; background-color: #5794f2;">계획확정</div>
								<div class="progress-bar" style="width: 100%; font-size: 0.725rem; color: #ffffff; background-color: #73bf69;">작지생성</div>
								<div class="progress-bar" style="width: 100%; font-size: 0.725rem; color: #ffffff; background-color: #f2495c;">중지</div>
								<div class="progress-bar" style="width: 100%; font-size: 0.725rem; color: #000000; background-color: #ffffff;
																animation: 1s step-end 0s infinite normal none running blink-warning;">이상발생</div>
							</div>
						</div>
						<div class="mx-lg-auto"></div>
						<div class="m-1 d-flex align-items-center">
							<div class="btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-outline-primary active">
									<input type="checkbox" id="btnZoom">확대/축소
								</label>
							</div>
						</div>
					</div>
				</div>
				<div id="left" style="grid-area: left; margin: 0px 5px 0px 0px; overflow: hidden;">
					<table class="table table-bordered m-0">
						<thead class="thead-light" id="apsPlanTempTable">
							<tr>
								<th class="text-center align-middle">미배정</th>
							</tr>
							<tr>
								<td class="text-left align-middle" style="padding: 5px 0px 0px 10px; height: calc(100vh - 1rem - 222px); overflow-y: auto;">
									<div id="apsPlanTemp" style="height: calc(100vh - 1rem - 228px);">
									</div>
								</td>
							</tr>
						</thead>
					</table>
				</div>
				<div id="right" style="grid-area: right; margin: 0px; overflow: auto;">
					<table class="table table-bordered m-0">
						<thead class="thead-light" id="apsPlanTable">
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-------------------------------------------- APS 기간별 목록조회 모달 ----------------------------------------------->
<div class="modal fade" id="apsListByDateModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">APS 기간별 목록조회</h5>
				
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="m-1 d-flex align-items-center" style="font-size: 0.725rem;">계획시작일자 :</div>
					<div class="my-1 d-flex align-items-center">
						<input class="form-control" type="date" id="startDateTime">
					</div>
					<div class="m-1 d-flex align-items-center">~</div>
					<div class="my-1 mr-1 d-flex align-items-center">
						<input class="form-control" type="date" id="endDateTime">
					</div>
					<div class="my-1 mr-4 d-flex align-items-center">
						<select class="custom-select" id="searchPlanState">
							<option value="" selected>전체</option>
							<option value="PD">미배정</option>
						</select>
					</div>
					<div class="my-1 mr-4 d-flex align-items-center">
						<button type="button" class="btn btn-primary" id="btnSearchApsTable">조회</button>
					</div>
				</div>
				<div class="row">
					<div class="m-1 d-flex align-items-center" style="font-size: 0.725rem;">
						<div class="mr-1">범례 :</div>
						<div class="progress my-1 mr-4" style="width: 30vw; background-color: #ffffff; font-size: 15px; height: 100%;">
							<div class="progress-bar" style="width: 100%; font-size: 0.725rem; color: #000000; background-color: #ccccdc;">미배정</div>
							<div class="progress-bar" style="width: 100%; font-size: 0.725rem; color: #000000; background-color: #c0d8ff;">배정</div>
							<div class="progress-bar" style="width: 100%; font-size: 0.725rem; color: #ffffff; background-color: #5794f2;">계획확정</div>
							<div class="progress-bar" style="width: 100%; font-size: 0.725rem; color: #ffffff; background-color: #73bf69;">작지생성</div>
							<div class="progress-bar" style="width: 100%; font-size: 0.725rem; color: #ffffff; background-color: #f2495c;">중지</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 p-0">
						<table class="table table-bordered m-0" id="apsListByDateTable">
							<thead class="thead-light">
								<tr>
									<th class="text-center">상태</th>
									<th class="text-center">배정설비</th>
									<th class="text-center">주문번호</th>
									<th class="text-center">고객사</th>
									<th class="text-center">제품명</th>
									<th class="text-center">수량</th>
									<th class="text-center">준비시간</th>
									<th class="text-center">PNL가공시간</th>
									<th class="text-center">총 가공시간</th>
									<th class="text-center">계획시작일시</th>
									<th class="text-center">계획종료일시</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-------------------------------------------- APS 기간별 목록조회 모달 ----------------------------------------------->
<!-------------------------------------------- 삭제 모달 ----------------------------------------------->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fas fa-exclamation-triangle" style="color: #ff0000;"></i> 경고
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" style="font-size: 15px;">
				삭제된 내용은 복구할 수 없습니다.<br>
				삭제하시겠습니까?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btnDeleteModalY" data-bs-dismiss="modal" data-dismiss="modal" style="width: 70px;">
					예
				</button>
				<button type="button" class="btn btn-secondary" id="btnDeleteModalN" data-bs-dismiss="modal" data-dismiss="modal" style="width: 70px;">
					아니요
				</button>
			</div>
		</div>
	</div>
</div>
<!-------------------------------------------- 삭제 모달 ----------------------------------------------->
<!-------------------------------------------- 정보 모달 ----------------------------------------------->
<div class="modal fade" id="infoModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					계획 정보
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" style="font-size: 15px;">
				<table class="table table-bordered m-0">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
					</colgroup>
					<thead class="thead-light">
						<tr>
							<th class="text-center align-middle">구분</th>
							<td class="text-center align-middle" id="contGubunNm"></td>
							<th class="text-center align-middle">수주번호</th>
							<td class="text-center align-middle" id="contNo"></td>
						</tr>
						<tr>
							<th class="text-center align-middle">발주번호</th>
							<td class="text-center align-middle" id="poNo"></td>
							<th class="text-center align-middle">발주처</th>
							<td class="text-center align-middle" id="dealCorpNm"></td>
						</tr>
						<tr>
							<th class="text-center align-middle">접수일</th>
							<td class="text-center align-middle" id="rcvDate"></td>
							<th class="text-center align-middle">출하요청일</th>
							<td class="text-center align-middle" id="shipReqDate"></td>
						</tr>
						<tr>
							<th class="text-center align-middle">접수자</th>
							<td class="text-center align-middle" id="rcvChargrNm"></td>
							<th class="text-center align-middle">국내/국외</th>
							<td class="text-center align-middle" id="inexGubunNm"></td>
						</tr>
						<tr>
							<td colspan="4" style="height: 5px;"></td>
						</tr>
						<tr>
							<th class="text-center align-middle">수주상세번호</th>
							<td class="text-center align-middle" id="contDtlNo"></td>
							<th class="text-center align-middle">주문수량</th>
							<td class="text-right align-middle" id="dtlOrdCnt"></td>
						</tr>
						<tr>
							<th class="text-center align-middle">품번</th>
							<td class="text-center align-middle" id="itemCd"></td>
							<th class="text-center align-middle">품명</th>
							<td class="text-center align-middle" id="itemNm"></td>
						</tr>
						<tr>
							<th class="text-center align-middle">단가</th>
							<td class="text-right align-middle" id="unitCost"></td>
							<th class="text-center align-middle">금액</th>
							<td class="text-right align-middle" id="priceCost"></td>
						</tr>
						<tr>
							<td colspan="4" style="height: 5px;"></td>
						</tr>
						<tr>
							<th class="text-center align-middle">계획시작일시</th>
							<td class="text-center align-middle" id="planStartDate"></td>
							<th class="text-center align-middle">계획종료일시</th>
							<td class="text-center align-middle" id="planEndDate"></td>
						</tr>
						<tr>
							<th class="text-center align-middle">준비시간</th>
							<td class="text-right align-middle" id="readyTime"></td>
							<th class="text-center align-middle">PNL당 가공시간</th>
							<td class="text-right align-middle" id="processTime"></td>
						</tr>
						<tr>
							<th class="text-center align-middle">총 가공시간</th>
							<td class="text-right align-middle" id="workTime"></td>
							<th class="text-center align-middle">배정설비</th>
							<td class="text-center align-middle" id="planEquipNm"></td>
						</tr>
						<tr>
							<td colspan="4" style="height: 5px;"></td>
						</tr>
						<tr>
							<th>이상발생 사유</th>
							<td id="warningType" colspan='3'></td>
						</tr>
					</thead>
				</table>
			</div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>
<!-------------------------------------------- 정보 모달 ----------------------------------------------->
<style>
	/* 스크롤바 css */
	*::-webkit-scrollbar {
		width: 7px;
		height: 7px;
	}
	*::-webkit-scrollbar-thumb {
		background-color: #bbb;
		border-radius: 5px;
	}
	*::-webkit-scrollbar-track {
		background-color: rgba(0, 0, 0, 0.1);
	}

	@keyframes blink-warning { 50% { background-color: #ff9830; color: #000000; } }

	#apsPlanTempTable .dragableModule {
		width: 181px !important;
		margin: 0px 10px 5px 0px !important;
	}
	
	.diagonal {
		position: relative;
		background:
		linear-gradient(to top left,
             rgba(222,226,230,0) 0%,
             rgba(222,226,230,0) calc(50% - 0.8px),
             rgba(222,226,230,1) 50%,
             rgba(222,226,230,0) calc(50% + 0.8px),
             rgba(222,226,230,0) 100%),
         linear-gradient(to top right,
             rgba(222,226,230,0) 0%,
             rgba(222,226,230,0) calc(50% - 0.8px),
             rgba(222,226,230,1) 50%,
             rgba(222,226,230,0) calc(50% + 0.8px),
             rgba(222,226,230,0) 100%);
    }
</style>
<%@include file="../layout/bottom.jsp"%>
<!-- Modal >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Modal -->
<script>
	let currentHref = "wmsc1000";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "APS 제조실행계획(레이저)");
	$('#calendar').hide();
	$('#selectYear').hide();
	$('#selectMonth').hide();

	let startDate = moment().format('YYYY-MM-DD');
	$('#startDate').val(startDate);
	$('#apsCalDate').attr('min',moment().format('YYYY-MM-DDTHH:mm'));
	$('#apsCalDate').val(moment().format('YYYY-MM-DDTHH:mm'));
	$('#startDateTime').val(moment().format('YYYY-MM-DD'));
	$('#endDateTime').val(moment().add('d',6).format('YYYY-MM-DD'));

	// promise 선언
	function _promise_() {
		return new Promise(function(resolve, reject) {
			resolve();
		});
	}
	
	let equipList = []; // 설비 목록

	let orderList = [];

	let lineList = [];

	// 계획일자 change event
	$('#startDate').on('change', function() {
		startDate = $(this).val();
		showPlan(); // 계획 그리기
	});

	// 조회버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		setTimeout(function() {
			showPlan(); // 계획 그리기
			setTimeout(function() {
				$('#my-spinner').hide();
			}, 10);
		}, 10);
	});

	$(document).ready(function() {
		$('.bootstrapToggle').bootstrapToggle();
		showPlan(); // 계획 그리기

		$(function() {
			$.contextMenu({ // 우클릭 메뉴 생성
				selector: '#apsPlanTable .dragableModule',
				callback: function(key, options) {
					let targetId = options.$trigger[0].id; // 우클릭 대상 id
					let data = $('#'+targetId).data('data'); // 우클릭 대상의 data
					let warningType = $('#'+targetId).data('warningtype').split(','); // 우클릭 대상의 warningtype
					data = getApsData(data.idx);
					console.log(data);
					if(key == 'delete') { // 삭제버튼을 눌렀을 경우
						$('#deleteModal').modal('show').data('deleteType','aps').data('idx', data.idx); // 삭제 모달 show
					} else if(key == 'none') { // 미배정 버튼을 눌렀을 경우
						data.planEquipCd = '';
						data.planStartDate = '';
						data.planEndDate = '';
						data.planState = 'PD';
						updateAps(data);
						toastr.success('미배정되었습니다.');
						showPlan();
					} else if(key == 'confirm') { // 확정버튼을 눌렀을 경우
						data.planState = 'CF';
						updateAps(data);
						toastr.success('계획확정되었습니다.');
						showPlan();
					} else if(key == 'cancle') { // 확정취소버튼을 눌렀을 경우
						if(data.planState == 'WO') {
							toastr.warning('작업지시된 계획입니다.<br>작업지시 삭제후 다시 진행해주세요.');
						} else {
							data.planState = 'AS';
							updateAps(data);
							toastr.success('확청취소되었습니다.');
						}
						showPlan();
					} else if(key == 'workOrder') { // 작업지시버튼을 눌렀을 경우
						if(data.planState == 'WO') {
							toastr.warning('이미 작업지시된 계획입니다.');
						} else {
							data.planState = 'WO';
							workOrderAdmIns(data);
							updateAps(data);
							toastr.success('작업지시되었습니다.');
						}
						showPlan();
					} else if(key == 'workOrderDel') { // 작업지시 삭제버튼을 눌렀을 경우
						if(data.planState != 'WO') {
							toastr.warning('작업지시되지않은 계획입니다.');
						} else {
							$('#deleteModal').modal('show').data('deleteType','workOrderAdm').data('idx', data.idx); // 삭제 모달 show
						}
						showPlan();
					} else if(key == 'info') { // 정보버튼을 눌렀을 경우
						$('#infoModal').modal('show');

						$('#contGubunNm').text(data.contGubunNm); // 구분
						$('#contNo').text(data.contNo); // 수주번호
						$('#poNo').text(data.poNo); // 발주번호
						$('#dealCorpNm').text(data.dealCorpNm); // 발주처
						$('#rcvDate').text(moment(data.rcvDate).format('YYYY.MM.DD')); // 접수일
						$('#shipReqDate').text(moment(data.shipReqDate).format('YYYY.MM.DD')); // 출하요청일
						$('#rcvChargrNm').text(data.rcvChargrNm); // 접수자
						$('#inexGubunNm').text(data.inexGubunNm); // 국내/국외
						$('#contDtlNo').text(data.contDtlNo); // 수주상세번호
						$('#dtlOrdCnt').text(addCommas(parseInt(data.dtlOrdCnt)) + ' PNL'); // 주문수량
						$('#itemCd').text(data.itemCd); // 품번
						$('#itemNm').text(data.itemNm); // 품명
						$('#unitCost').text(addCommas(parseFloat(data.unitCost))+' 원'); // 단가
						let priceCost = parseFloat(data.unitCost) * parseInt(data.dtlOrdCnt);
						$('#priceCost').text(addCommas(priceCost)+' 원'); // 금액
						$('#planStartDate').text(moment(data.planStartDate,'YYYYMMDDHHmm').format('YYYY.MM.DD HH:mm')); // 계획시작일시
						$('#planEndDate').text(moment(data.planEndDate,'YYYYMMDDHHmm').format('YYYY.MM.DD HH:mm')); // 계획종료일시
						$('#readyTime').text(addCommas(parseInt(data.readyTime))+' 분'); // 준비시간
						$('#processTime').text(addCommas(parseInt(data.processTime))+' 분'); // PNL당 가공시간
						let workTime = parseInt(data.readyTime) + (parseInt(data.processTime) * parseInt(data.dtlOrdCnt));
						$('#workTime').text(addCommas(parseInt(workTime))+' 분'); // 총 가공시간
						$('#planEquipNm').text(data.planEquipNm); // 배정설비
						let html = '';
						if(warningType.length != 0) {
							for(var i=0;i<warningType.length;i++) {
								html += '- '+warningType[i]+'<br>';
							}
						}
						$('#warningType').html(html);
					}
				},
				items: {
					'delete': {
						name: '삭제',
						icon: 'fas fa-trash-alt',
					},
					'none': {
						name: '배정취소',
						icon: 'fas fa-ban',
					},
					'confirm': {
						name: '확정',
						icon: 'fas fa-handshake',
					},
					'cancle': {
						name: '확정취소',
						icon: 'fas fa-ban',
					},
					'workOrder': {
						name: '작업지시',
						icon: 'fas fa-file-word',
					},
					'workOrderDel': {
						name: '작업지시 삭제',
						icon: 'fas fa-trash-alt',
					},
					'info': {
						name: '정보',
						icon: 'fas fa-info-circle',
					},
				}
			});    
	    });
	});

	// 날짜 dblclick
	$(document).on('dblclick', '.apsDate', function() {
		let date = $(this).find('span').eq(0).text();
		$('.apsDate_'+date).find('input').prop('checked',true);
	});

	// 레이저 설비목록 조회
	function getEquipList() {
		let result = '';
		$.ajax({
			url: '<c:url value="bm/equipCodeAdmList"/>',
            type: 'GET',
            async: false,
            data: {
				'mainGubun' : function(){return '001';},
				'prcNm' : function(){return '001';},
				'equipGubun' : function(){return '001';},
				'listGubun' : function(){return '002';},
			},
			success : function(res) {
				let data = res.data;
				result = data;
			}
		});
		return result;
	}

	// APS 미배정된 수주목록 조회
	function getAdvPlanScheduleNonAssignLst() {
		let result = '';
		$.ajax({
			url: '<c:url value="wm/advPlanScheduleNonAssignLst"/>',
            type: 'POST',
            async: false,
            data: {
                contGubun	: '001'
            },
			success : function(res) {
				let data = res.data;
				result = data;
			}
		});
		return result;
	}

	// APS 기간별 계획목록조회
	function getAdvPlanScheduleLstByDate(startDate, endDate) {
		let result = '';
		$.ajax({
			url: '<c:url value="wm/advPlanScheduleLstByDate"/>',
            type: 'POST',
            async: false,
            data: {
            	'prcNm'		: '001',
            	'startDate' : startDate,
            	'endDate'	: endDate
            },
			success : function(res) {
				let data = res.data;
				result = data;
			}
		});
		return result;
	}

	// APS 기간별 계획목록조회
	function getAdvPlanScheduleLstByStartEndDate(data) {
		let result = '';
		$.ajax({
			url: '<c:url value="wm/advPlanScheduleLstByStartEndDate"/>',
            type: 'POST',
            async: false,
            data: {
                'idx'			: data.idx,
            	'planStartDate'	: data.planStartDate,
            	'planEndDate'	: data.planEndDate,
            	'planEquipCd'	: data.planEquipCd,
            },
			success : function(res) {
				let data = res.data;
				result = data;
			}
		});
		return result;
	}

	// 계획정지 기간별 목록조회
	function getPlanStopLstByDateGroup(equipCd, startDate, endDate) {
		let result = '';
		$.ajax({
			url: '<c:url value="bm/planStopLstByDateGroup"/>',
            type: 'POST',
            async: false,
            data: {
                'equipCd'	: equipCd,
            	'startDate' : startDate,
            	'endDate'	: endDate
            },
			success : function(res) {
				let data = res.data;
				result = data;
			}
		});
		return result;
	}

	// 공장력 기간별 목록조회
	function getFactoryCalendarLstByDate(startDate, endDate) {
		let result = '';
		$.ajax({
			url: '<c:url value="bm/factoryCalendarListByDate"/>',
            type: 'POST',
            async: false,
            data: {
                'factoryType'	: '001',
            	'startDate'		: startDate,
            	'endDate'		: endDate
            },
			success : function(res) {
				let data = res.data;
				result = data;
			}
		});
		return result;
	}

	


	// APS 테이블 header html
	function makeScheduleThead() {
		let html = '';
			html += '<tr>';
			html += '	<th class="text-center align-middle" style="width: 178.91px;">설비명</th>';
		for(var i=0;i<7;i++) { // 7일치 까지만 보여줌
			let date = moment(startDate).add('d',i).format('YYYY-MM-DD');
			let weekDay = moment(startDate).add('d',i).format('e');
			let color = '#000000';
			switch(weekDay) {
				case '0'	:	weekDay = '(일)';	color = '#ff0000'; break;
				case '1'	:	weekDay = '(월)';	color = '#000000'; break;
				case '2'	:	weekDay = '(화)';	color = '#000000'; break;
				case '3'	:	weekDay = '(수)';	color = '#000000'; break;
				case '4'	:	weekDay = '(목)';	color = '#000000'; break;
				case '5'	:	weekDay = '(금)';	color = '#000000'; break;
				case '6'	:	weekDay = '(토)';	color = '#0000ff'; break;
				default		:	weekDay = '?';		color = '#000000'; break;
			}
			html += '	<th class="text-center align-middle apsDate"';
			html += '		style="width: 200px; min-width: 200px; color: '+color+'; cursor: pointer; user-select: none;">';
			html += '		<span>'+date+'</span><span>'+weekDay+'</span>';
			html += '	</th>';
		}
			html += '</tr>';
		return html;
	}

	// APS 테이블 body html
	function makeScheduleTbody() {
		let html = '';
		for(var i=0;i<equipList.length;i++) { // 설비목록별로 계획표 생성
			let data = equipList[i];
			let color = '#000000';
			let diagonal = '';
			if(data.useYn == '001') {
				color = '#0000ff';
			} else if(data.useYn == '002') {
				color = '#ff0000';
				diagonal = 'diagonal';
			} else {
				color = '#000000';
			}
			html += '<tr id="CAPA_'+data.equipCd+'" style="height: 20px;">';
			html += '	<td class="text-center align-middle" rowspan="2" style="width: 178.91px; height: 87px; min-height: 87px;"><div>'+data.equipNm+'</div><div style="color: '+color+';">'+data.useYnNm+'</div></td>';
			html += '	<td class="text-center align-top '+diagonal+' CAPA_'+moment(startDate).add('d',0).format('YYYY-MM-DD')+'" id="CAPA_'+data.equipCd+'_'+moment(startDate).add('d',0).format('YYYY-MM-DD')+'" style="padding: 0px;";></td>';
			html += '	<td class="text-center align-top '+diagonal+' CAPA_'+moment(startDate).add('d',1).format('YYYY-MM-DD')+'" id="CAPA_'+data.equipCd+'_'+moment(startDate).add('d',1).format('YYYY-MM-DD')+'" style="padding: 0px;";></td>';
			html += '	<td class="text-center align-top '+diagonal+' CAPA_'+moment(startDate).add('d',2).format('YYYY-MM-DD')+'" id="CAPA_'+data.equipCd+'_'+moment(startDate).add('d',2).format('YYYY-MM-DD')+'" style="padding: 0px;";></td>';
			html += '	<td class="text-center align-top '+diagonal+' CAPA_'+moment(startDate).add('d',3).format('YYYY-MM-DD')+'" id="CAPA_'+data.equipCd+'_'+moment(startDate).add('d',3).format('YYYY-MM-DD')+'" style="padding: 0px;";></td>';
			html += '	<td class="text-center align-top '+diagonal+' CAPA_'+moment(startDate).add('d',4).format('YYYY-MM-DD')+'" id="CAPA_'+data.equipCd+'_'+moment(startDate).add('d',4).format('YYYY-MM-DD')+'" style="padding: 0px;";></td>';
			html += '	<td class="text-center align-top '+diagonal+' CAPA_'+moment(startDate).add('d',5).format('YYYY-MM-DD')+'" id="CAPA_'+data.equipCd+'_'+moment(startDate).add('d',5).format('YYYY-MM-DD')+'" style="padding: 0px;";></td>';
			html += '	<td class="text-center align-top '+diagonal+' CAPA_'+moment(startDate).add('d',6).format('YYYY-MM-DD')+'" id="CAPA_'+data.equipCd+'_'+moment(startDate).add('d',6).format('YYYY-MM-DD')+'" style="padding: 0px;";></td>';
			html += '</tr>';
			html += '<tr id="'+data.equipCd+'">';
			html += '	<td class="text-center align-top '+diagonal+'" id="'+data.equipCd+'_'+moment(startDate).add('d',0).format('YYYY-MM-DD')+'" style="padding: 5px 10px 0px 10px;";></td>';
			html += '	<td class="text-center align-top '+diagonal+'" id="'+data.equipCd+'_'+moment(startDate).add('d',1).format('YYYY-MM-DD')+'" style="padding: 5px 10px 0px 10px;";></td>';
			html += '	<td class="text-center align-top '+diagonal+'" id="'+data.equipCd+'_'+moment(startDate).add('d',2).format('YYYY-MM-DD')+'" style="padding: 5px 10px 0px 10px;";></td>';
			html += '	<td class="text-center align-top '+diagonal+'" id="'+data.equipCd+'_'+moment(startDate).add('d',3).format('YYYY-MM-DD')+'" style="padding: 5px 10px 0px 10px;";></td>';
			html += '	<td class="text-center align-top '+diagonal+'" id="'+data.equipCd+'_'+moment(startDate).add('d',4).format('YYYY-MM-DD')+'" style="padding: 5px 10px 0px 10px;";></td>';
			html += '	<td class="text-center align-top '+diagonal+'" id="'+data.equipCd+'_'+moment(startDate).add('d',5).format('YYYY-MM-DD')+'" style="padding: 5px 10px 0px 10px;";></td>';
			html += '	<td class="text-center align-top '+diagonal+'" id="'+data.equipCd+'_'+moment(startDate).add('d',6).format('YYYY-MM-DD')+'" style="padding: 5px 10px 0px 10px;";></td>';
			html += '</tr>';
		}
		return html;
	}


	// schedule module maker
	function makeScheduleModule(data, planDate, planStopLst) {
		let margin = '0px 0px 5px 0px';
		let width = '100%';
		let classes = 'text-left align-middle dragableModule apsDate_'+moment(planDate).format('YYYY-MM-DD')+' '+data.contDtlNo;
		
		/* 상태에 따른 색적용
		 * PO : 미배정
		 * AS : 배정
		 * CF : 계획확정
		 * WO : 작업지시
		 * ST : 중지
		 * PS : 계획정지
		 */
		let color = '';
		let background_color = '';
		if(data.ordState == 'PD') { // 미배정일 경우
			color = '#000000';
			background_color = '#ccccdc';
			classes = 'text-left align-middle dragableModule';
		} else if(data.ordState == 'AS') { // 배정일 경우
			color = '#000000';
			background_color = '#c0d8ff';
		} else if(data.ordState == 'CF') { // 계획확정일 경우
			color = '#ffffff';
			background_color = '#5794f2';
			classes = 'text-left align-middle dragableModule apsDate_'+moment(planDate).format('YYYY-MM-DD')+' '+data.contDtlNo+' filtered';
		} else if(data.ordState == 'WO') { // 작업지시일 경우
			color = '#ffffff';
			background_color = '#73bf69';
			classes = 'text-left align-middle dragableModule apsDate_'+moment(planDate).format('YYYY-MM-DD')+' '+data.contDtlNo+' filtered';
		} else if(data.ordState == 'ST') { // 중지일 경우
			color = '#ffffff';
			background_color = '#f2495c';
			classes = 'text-left align-middle dragableModule apsDate_'+moment(planDate).format('YYYY-MM-DD')+' '+data.contDtlNo+' filtered';
		} else { // 그 밖의 예외
			color = '#ffffff';
			background_color = '#ccccdc';
		}

		

		// 이상발생
		let blink = '';
		let warningTypes = [];

		// 납기일이 계획일 이전일 경우
		if(moment(data.planEndDate, 'YYYYMMDDHHmm').diff(data.shipReqDate, 'd') >= 0) {
			warningTypes.push('납기일이 계획종료일 이전입니다.');
			blink = 'animation: 1s step-end 0s infinite normal none running blink-warning;';
			classes += ' warning-blink';
		}

		// 계획한 일자에 계획정지가 걸려있을 경우
		planStopLst = _.filter(planStopLst, function(v) { return v.equipCd == data.equipCd; });
		let planStopData = _.filter(planStopLst, function(v) { return (parseInt(v.startDatetime) < parseInt(data.planStartDate) && parseInt(v.endDatetime) < parseInt(data.planStartDate)) ||
																		(parseInt(v.startDatetime) > parseInt(data.planEndDate) && parseInt(v.endDatetime) > parseInt(data.planEndDate)) });
		if(planStopData.length != planStopLst.length) {
			let wt = parseInt(data.readyTime) + (parseInt(data.processTime) * parseInt(data.dtlOrdCnt)); // 작업시간
			let pt = moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(data.planStartDate,'YYYYMMDDHHmm'), 'm'); // 계획시작 ~ 종료 시간
			planStopData = _.differenceBy(planStopLst, planStopData, 'stopSequence');
			let st = _.sumBy(planStopData, function(v) { return moment(v.endDatetime,'YYYYMMDDHHmm').diff(moment(v.startDatetime,'YYYYMMDDHHmm'), 'm'); }); // 계획정지 시간
			if(wt != pt - st) {
				warningTypes.push('계획한 기간 내에 계획정지가 추가되었습니다.');
				blink = 'animation: 1s step-end 0s infinite normal none running blink-warning;';
				classes += ' warning-blink';
			}
		}
		

		// 계획기간에 따른 연결선 생성
		let days = moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(planDate).format('YYYYMMDD'), 'day')+1;
		if(days >= 2) { // 다음날에 계획이 이어진다면
			let nextDate = moment(planDate).add('d',1).format('YYYY-MM-DD');
			lineList.push({ // 연결선 목록에 추가
				from: data.contDtlNo+'_'+moment(planDate).format('YYYY-MM-DD'),
				to: data.contDtlNo+'_'+moment(nextDate).format('YYYY-MM-DD'),
				color: background_color,
 				blink: blink
			});
		}

		let workTime = parseInt(data.readyTime) + (parseInt(data.processTime) * parseInt(data.dtlOrdCnt)); // 총 작업시간(분)
		if(isNaN(workTime)) {
			workTime = '';
		} else {
			workTime = addCommas(parseInt(workTime));
		}
		

		


		if(data.ordState == 'PS' || data.ordState == 'PD') {
			blink = '';
		}
		
		let html = '';
			html += '<div class="'+classes+'" data-warningtype="'+warningTypes+'"';
			html += '		id="'+data.contDtlNo+'_'+(planDate==''?'':moment(planDate).format('YYYY-MM-DD'))+'"';
			html += '		style="display: inline-block; background-color: '+background_color+'; color: '+color+';'+blink;
			html += '			  width: '+width+'; padding: 5px; margin: '+margin+';';
			html += '			  border-radius: 5px;';
			html += '			  position: relative; user-select: none; cursor: pointer;';
			html += '			  white-space: nowrap; text-overflow: ellipsis; overflow: hidden; ">';
			
			
		if(data.ordState != 'PD') { // 미배정이 아닐 경우
			html += '	<table>';
			html += '		<tr>';
			html += '			<td style="padding: 0px 5px; border: none; text-align: left;">'+data.itemNm+'</td>';
			html += '			<td style="padding: 0px 5px; border: none; text-align: right;">'+data.dtlOrdCnt+' PNL</td>';
			html += '		</tr>';
			html += '		<tr>';
			html += '			<td style="padding: 0px 5px; border: none; text-align: left;">'+data.dealCorpNm+'</td>';
			html += '			<td style="padding: 0px 5px; border: none; text-align: right;">'+moment(data.shipReqDate).format('YYYY.MM.DD')+'</td>';
			html += '		</tr>';
			html += '		<tr>';
			html += '			<td style="padding: 0px 5px; border: none; text-align: left;">'+(data.planStartDate==''?'':moment(data.planStartDate,'YYYYMMDDHHmm').format('YYYY.MM.DD HH:mm'))+'</td>';
			html += '			<td style="padding: 0px 5px; border: none; text-align: right; font-size: 15px;" rowspan="2">'+workTime+'분</td>';
			html += '		</tr>';
			html += '		<tr>';
			html += '			<td style="padding: 0px 5px; border: none; text-align: left;">'+(data.planEndDate==''?'':moment(data.planEndDate,'YYYYMMDDHHmm').format('YYYY.MM.DD HH:mm'))+'</td>';
			html += '		</tr>';
			html += '	</table>';
			html += '	<input type="checkbox" name="scheduleCheck" style="position: absolute; right: 2px; top: 2px; height: 15px; width: 15px;">';
		} else {
			html += '	<table>';
			html += '		<tr>';
			html += '			<td style="padding: 0px 5px; border: none; text-align: left;">'+data.itemNm+'</td>';
			html += '			<td style="padding: 0px 5px; border: none; text-align: right;">'+data.dealCorpNm+'</td>';
			html += '		</tr>';
			html += '		<tr>';
			html += '			<td colspan="2" style="padding: 0px 5px; border: none; text-align: left; width: 181px !important;">';
			html += '				<span style="float: left">'+data.dtlOrdCnt+' PNL</span>';
			html += '				<span style="float: right">'+moment(data.shipReqDate).format('YYYY.MM.DD')+'</span>';
			html += '				<span style="float: right; margin-right: 10px;">'+workTime+'분</span>';
			html += '			</td>';
			html += '		</tr>';
			html += '	</table>';
		}
			html += '</div>';
			
		return html;
	}

	// 계획과 연결선 다시 그리기
	function reloadAll() {
		$('.dragableModule').hide();
		$('.jqSimpleConnect').hide();
		
		setTimeout(function() {
			$('.dragableModule').show();
			$('.jqSimpleConnect').show();

			jqSimpleConnect.repaintAll(); // 전체 연결선 재구성
		}, 1);
	}


	// 계획 그리기
	function showPlan() {
		// 레이저 주생산설비 목록조회
		equipList = getEquipList();
		
		
		// 미배정 목록 조회
		let nonAssignLst = getAdvPlanScheduleNonAssignLst();
		
		// 기간별 계획목록 조회
		let assignLst = getAdvPlanScheduleLstByDate(moment($('#startDate').val()).format('YYYYMMDD0000'), moment($('#startDate').val()).add('d',6).format('YYYYMMDD2359'));
		
		// 기간별 계획정지 목록조회
		let planStopLst = getPlanStopLstByDateGroup('', moment($('#startDate').val()).format('YYYYMMDD0000'), moment($('#startDate').val()).add('d',6).format('YYYYMMDD2359'));
		
		// 기간별 공장력 목록조회
		let factCalLst = getFactoryCalendarLstByDate(moment($('#startDate').val()).format('YYYYMMDD'), moment($('#startDate').val()).add('d',6).format('YYYYMMDD'));
		

		orderList = []; // schedule 목록 초기화
		jqSimpleConnect.removeAll();// 연결선 초기화
		lineList = []; // 연결선 목록
		$('#apsPlanTemp').empty();
		$('#apsPlanTable').empty();
		$('#apsPlanTable').append(makeScheduleThead());
		$('#apsPlanTable').append(makeScheduleTbody());

		equipList = _.filter(equipList, function(v) { return v.useYn == '001'; }); // 사용중인 설비만 배정할 수 있도록 처리

		// CAPA 계산
		let capaList = [];
		
		// 공장력 시간 기록
		for(var i=0;i<factCalLst.length;i++) {
			let data = factCalLst[i];
			for(var j=0;j<equipList.length;j++) {
				let equipData = equipList[j];
				let obj = {};
				obj.equipCd = equipData.equipCd;
				obj.planDate = data.factoryDate;
				obj.startDatetime = data.startTime;
				obj.endDatetime = data.endTime;
				obj.totalCapa = parseInt(data.runningTime) * 60; // 분단위로 입력
				obj.workingCapa = 0;
				capaList.push(obj);
			}
		}

		// 계획정지 시간 기록
		for(var i=0;i<planStopLst.length;i++) {
			let data = planStopLst[i];
			let equipCd = data.equipCd;
			let planDate = moment(data.startDatetime,'YYYYMMDDHHmmss').format('YYYYMMDD');
			let stopTime = moment(data.endDatetime,'YYYYMMDDHHmmss').diff(moment(data.startDatetime,'YYYYMMDDHHmmss'), 'm');
			let index = _.findIndex(capaList, function(v) { return v.equipCd == equipCd && v.planDate == planDate; });
			if(index != -1) {
				capaList[index].totalCapa = capaList[index].totalCapa - stopTime;
			}
		}

		
	

		
		
		for(var i=0;i<nonAssignLst.length;i++) {
			let data = nonAssignLst[i];
			let obj = {};
			obj.idx = '';
			obj.contDtlNo = data.contDtlNo;
			obj.shipReqDate = data.shipReqDate;
			obj.dtlOrdCnt = data.dtlOrdCnt;
			obj.equipCd = '';
			obj.planStartDate = '';
			obj.planEndDate = '';
			obj.ordState = 'PD';
			obj.readyTime = data.readyTime;
			obj.processTime = data.processTime;
			obj.itemSeq = data.itemCd;
			obj.itemNm = data.itemNm;
			obj.dealCorpNm = data.dealCorpNm;
			orderList.push(obj);
		}

		for(var i=0;i<assignLst.length;i++) {
			let data = assignLst[i];
			let obj = {};
			obj.idx = data.idx;
			obj.contDtlNo = data.contDtlNo;
			obj.shipReqDate = data.shipReqDate;
			obj.dtlOrdCnt = data.planQty;
			obj.equipCd = data.planEquipCd;
			obj.planStartDate = data.planStartDate;
			obj.planEndDate = data.planEndDate;
			obj.ordState = data.planState;
			obj.readyTime = data.readyTime;
			obj.processTime = data.processTime;
			obj.itemSeq = data.itemCd;
			obj.itemNm = data.itemNm;
			obj.dealCorpNm = data.dealCorpNm;
			orderList.push(obj);
		}

		
		// 계획시작일이 빠른 순으로 정렬
		orderList =_.sortBy(orderList, function(v) { return v.planStartDate; }); 

		// 계획 show
		for(var i=0;i<orderList.length;i++) {
			let data = orderList[i];
			let planDate = ''; // 현재 기간에서 계획의 첫째날

			// 현재 기간에 계획이 존재할 경우
			if(moment(startDate).diff(moment(data.planStartDate,'YYYYMMDDHHmm').format('YYYY-MM-DD'), 'day') >= 0 &&
			   moment(startDate).diff(moment(data.planEndDate, 'YYYYMMDDHHmm').format('YYYY-MM-DD'), 'day') <= 0) {
				planDate = moment(startDate).format('YYYY-MM-DD');
			} else { // 현재 기간에 계획이 존재하지 않을 경우
				planDate = moment(data.planStartDate,'YYYYMMDDHHmm').format('YYYY-MM-DD');
			}


			// 미배정된 계획일 경우
			if(data.ordState == 'PD') {
				planDate = '';
				$('#apsPlanTemp').append(makeScheduleModule(data, planDate, [])); // schedule 생성
				$('#'+data.contDtlNo+'_'+(planDate==''?'':moment(planDate).format('YYYY-MM-DD'))).data('data',data); // schedule에 data 저장
			} else { // 배정된 계획일 경우
				let days = moment(data.planEndDate, 'YYYYMMDDHHmm').diff(moment(planDate), 'day')+1;
				for(var j=0;j<days;j++) {					
					let date = moment(planDate).add('d',j).format('YYYY-MM-DD');
					$('#'+data.equipCd+'_'+date).append(makeScheduleModule(data, date, planStopLst)); // schedule 생성
					$('#'+data.contDtlNo+'_'+moment(date).format('YYYY-MM-DD')).data('data',data); // schedule에 data 저장

					
					let index = _.findIndex(capaList, function(v) { return v.equipCd == data.equipCd && v.planDate == moment(date).format('YYYYMMDD'); });
					if(index != -1) {
						// 현재일 공장력 정보
						let factoryData = _.filter(factCalLst, function(v) { return v.factoryDate == moment(date).format('YYYYMMDD'); })[0];
						let workingCapa = 0;
						console.log(date);
						console.log(data.equipCd);
						// 계획 시작일과 종료일이 현재일자에 포함되지 않을 경우
						if(moment(moment(date).format('YYYYMMDD0000'),'YYYYMMDD0000').diff(moment(data.planStartDate,'YYYYMMDDHHmm')) >= 0 &&
							moment(moment(date).format('YYYYMMDD2359'),'YYYYMMDDHHmm').diff(moment(data.planEndDate,'YYYYMMDDHHmm')) <= 0) {
							console.log("계획 시작일과 종료일이 현재일자에 포함되지 않을 경우");
							workingCapa = moment(factoryData.endTime,'YYYYMMDDHHmm').diff(moment(factoryData.startTime,'YYYYMMDDHHmm'),'m');
						}
						// 계획 시작일이 현재일자에 포함되지 않을 경우 -> 계획 마지막날
						else if(moment(moment(date).format('YYYYMMDD0000'),'YYYYMMDDHHmm').diff(moment(data.planStartDate,'YYYYMMDDHHmm')) >= 0) {
							console.log("계획 시작일이 현재일자에 포함되지 않을 경우 -> 계획 마지막날");

							// 계획 시작일이 공장력 시작일시 이후일 경우
							if(moment(data.planStartDate,'YYYYMMDDHHmm').diff(moment(factoryData.startTime,'YYYYMMDDHHmm')) >= 0) {
								workingCapa = moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(data.planStartDate,'YYYYMMDDHHmm'),'m');
							} else {
								workingCapa = moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(factoryData.startTime,'YYYYMMDDHHmm'),'m');
							}
							workingCapa = moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(factoryData.startTime,'YYYYMMDDHHmm'),'m');
						}
						// 계획 종료일이 현재일자에 포함되지 않을 경우 -> 계획 첫날
						else if(moment(moment(date).format('YYYYMMDD2359'),'YYYYMMDDHHmm').diff(moment(data.planEndDate,'YYYYMMDDHHmm')) <= 0) {
							console.log("계획 종료일이 현재일자에 포함되지 않을 경우 -> 계획 첫날");

							// 계획 종료일이 공장력 종료일시 이전일 경우
							if(moment(factoryData.endTime,'YYYYMMDDHHmm').diff(moment(data.planEndDate,'YYYYMMDDHHmm')) >= 0) {
								workingCapa = moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(data.planStartDate,'YYYYMMDDHHmm'),'m');
							} else {
								workingCapa = moment(factoryData.endTime,'YYYYMMDDHHmm').diff(moment(data.planStartDate,'YYYYMMDDHHmm'),'m');
							}
						}
						// 계획이 하루짜리일 경우
						else {
							console.log("계획이 하루짜리일 경우");
							workingCapa = moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(data.planStartDate,'YYYYMMDDHHmm'),'m');
						}
						let stopData = _.filter(planStopLst, function(v) { return v.equipCd == '' && moment(data.startDatetime,'YYYYMMDDHHmmss').format('YYYYMMDD') == moment(date).format('YYYYMMDD')});
						let stopTime = 0;
						if(moment(stopData.startDatetime,'YYYYMMDDHHmmss').diff(moment(data.planStartDate,'YYYYMMDDHHmm')) >= 0 && moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(stopData.endDatetime,'YYYYMMDDHHmmss')) >= 0) {
							stopTime = moment(stopData.endDatetime,'YYYYMMDDHHmmss').diff(moment(stopData.startDatetime,'YYYYMMDDHHmmss'), 'm');
						}
						console.log('workingCapa: '+workingCapa);
						console.log('stopTime: '+stopTime);
						capaList[index].workingCapa = capaList[index].workingCapa + workingCapa - stopTime;
					}
				}
			}

			// 확대/축소 버튼 초기화
			$('#btnZoom').prop('checked',false);
			$('#btnZoom').parent().removeClass('active');
			
		}

		// CAPA 표시
		for(var i=0;i<capaList.length;i++) {
			let data = capaList[i];
			let id = 'CAPA_'+data.equipCd+'_'+moment(data.planDate).format('YYYY-MM-DD');
			let workingCapa = data.workingCapa/60;
			let totalCapa = data.totalCapa/60;
			$('#'+id).text(workingCapa.toFixed(1) + '/' + totalCapa.toFixed(1));
		}
		

		// 설비별 sortable js init
		equipList = _.filter(equipList, function(v) { return v.useYn == '001'; }); // 사용중인 설비만 배정할 수 있도록 처리
		for(var i=0;i<equipList.length;i++) {
			let data = equipList[i];
			for(var j=0;j<7;j++) {
				let date = moment(startDate).add('d',j).format('YYYY-MM-DD');
				let id = document.getElementById(data.equipCd+'_'+date);
				Sortable.create(id, {
					group: {
						name: "plan",
						put: ["plan","tempPlan"],
					},
					handle: ".dragableModule",
					filter: '.filtered',
					sort: true,
					onStart: function (e) { // 드래그 시작했을 때
						let data = $('#'+e.item.id).data('data');
						let lineId = $('#'+e.item.id).data('lineid');
						jqSimpleConnect.removeConnection(lineId); // 연결선 삭제
						
						$('.'+data.contDtlNo).not('#'+e.item.id).addClass('d-none'); // 연결된 계획들 hide
						
						jqSimpleConnect.repaintAll(); // 전체 연결선 재구성
					},
					onChange: function (e) { // 다른 위치로 이동했을 때
						jqSimpleConnect.repaintAll(); // 전체 연결선 재구성
					},
					onEnd: function (e) { // 드롭 했을때
						console.log(e);
						
						let state = true;
						let from = e.from.id; // 이전에 있었던 영역
						let fromEquipCd = from.split('_')[0]; // 이전에 있었던 영역의 설비코드
						let fromDate = from.split('_')[1]; // 이전에 있었던 영역의 날짜
						let to = e.to.id; // 현재 있는 영역
						let toEquipCd = to.split('_')[0]; // 현재 있는 영역의 설비코드
						let toDate = to.split('_')[1]; // 현재 있는 영역의 날짜
						let newIndex = e.newIndex; // 현재 순서
						let oldIndex = e.oldIndex; // 원래 순서
						let targetId = e.item.id; // 대상 id
						let data = $('#'+targetId).data('data');
						let schedule_length = $('#'+to).find('.dragableModule').length; // 현재 영역의 계획수

						// 현재 영역의 계획목록(옮긴 항목 제외)
						let toDataList = [];
						for(var i=0;i<schedule_length;i++) {
							let data = $('#'+to).find('.dragableModule').eq(i).data('data');
							if(data.ordState != 'PS') { // 계획정지일 경우는 제외
								toDataList.push($('#'+to).find('.dragableModule').eq(i).data('data'));
							}
						}

						// 현재 영역에서 현재계획은 제외
						toDataList = _.filter(toDataList, function(v) { return v.idx != data.idx; });
						console.log(toDataList);

						// DB의 계획목록
						let dbDataList = getApsLstOneByDate({
											'startDate'		: moment(toDate).format('YYYYMMDD'),
											'planEquipCd'	: toEquipCd
										});
						// DB에서 현재계획은 제외
						dbDataList = _.filter(dbDataList, function(v) { return v.idx != data.idx; });
						console.log(dbDataList);

						// 현재 영역의 목록과 DB의 목록을 비교했을때 같지 않은 목록
						let diffList = _.differenceBy(dbDataList, toDataList, 'idx');
						console.log(diffList);

						// 현재 영역의 목록과 DB의 목록을 비교했을때 현재 계획을 제외하고 다른점이 있을 경우
						// 현재 목록과 DB목록의 수가 같지 않거나 
						if((dbDataList.length != toDataList.length || diffList.length != 0) && to != 'apsPlanTemp') {
							console.log('APS에 변경사항이 존재합니다.');
							toastr.warning('APS에 변경사항이 존재합니다.');
							state = false;
							setTimeout(function() {
								toastr.warning('APS를 재조회합니다...');
								$('#my-spinner').show();
								setTimeout(function() {
									showPlan();
									setTimeout(function() {
										$('#my-spinner').hide();
									}, 10);
								}, 10);
							}, 1000);
						}

						if(state) {
							// 배정된 항목만 처리한다. -> 미배정항목은 아래의 onAdd에서 처리
							if(data != undefined) {
								let workTime = parseInt(data.readyTime) + (parseInt(data.processTime) * parseInt(data.dtlOrdCnt)); // 총 작업시간(분)

								// 설비 및 날짜를 옮기거나 순서를 변경했을 경우
								if((to != from || newIndex != oldIndex) && to != 'apsPlanTemp') {
									console.log('설비 및 날짜를 옮기거나 순서를 변경했을 경우');
									data.planEquipCd = toEquipCd;
									
									// 계획이 1개일 경우
									if(schedule_length == 1) {
										console.log('계획이 1개일 경우');

										// 기간별 공장력 목록조회
										let factCalLst = getFactoryCalendarLstByDate(moment(toDate).format('YYYYMMDD'), moment(toDate).format('YYYYMMDD'));
										if(factCalLst.length == 0) { // 공장력이 등록되지 않았을 경우
											toastr.warning('공장력을 등록해주세요.');
											showPlan();
											return false;
										} else {
											data.planStartDate = factCalLst[0].startTime;
											data.planEndDate = moment(factCalLst[0].startTime,'YYYYMMDDHHmm').add('m', workTime).format('YYYYMMDDHHmm');
										}
									} else { // 계획이 2개 이상일 경우
										console.log('계획이 2개 이상일 경우');

										// 0번 순서일 경우
										if(newIndex == 0) {
											console.log('0번 순서일 경우');
											data.planStartDate = moment(toDate).format('YYYYMMDD0000');
											data.planEndDate = moment(toDate).add('m', workTime).format('YYYYMMDDHHmm');
										} else { // 0번 순서가 아닐 경우 -> 무조건 앞에 한개 이상의 계획이 존재함
											console.log('0번 순서가 아닐 경우 -> 무조건 앞에 한개 이상의 계획이 존재함');
											// 앞 순서 계획 정보
											let topData = $('#'+to).find('.dragableModule').eq(newIndex-1).data('data');

											data.planStartDate = moment(topData.planEndDate, 'YYYYMMDDHHmm').add('m', 1).format('YYYYMMDDHHmm');
											data.planEndDate = moment(data.planStartDate, 'YYYYMMDDHHmm').add('m', workTime).format('YYYYMMDDHHmm');
										}
									}


									let time = 1
									let prevNonTime = 0;
									while(true && time != 100) {
										console.log('planStartDate: ' + data.planStartDate);
										console.log('planEndDate: ' + data.planEndDate);
										// 기간별 계획정지 목록조회
										let planStopLst = getPlanStopLstByDateGroup(data.planEquipCd, moment(data.planStartDate,'YYYYMMDDHHmm').format('YYYYMMDDHHmm'),
																						moment(data.planEndDate,'YYYYMMDDHHmm').format('YYYYMMDDHHmm'));
										console.log(planStopLst);
										let stopTimeSum = _.sumBy(planStopLst, function(v) { return moment(v.endDatetime,'YYYYMMDDHHmm').diff(moment(v.startDatetime,'YYYYMMDDHHmm'), 'm'); });
										
										
										// 기간별 공장력 목록조회
										let factCalLst = getFactoryCalendarLstByDate(moment(data.planStartDate,'YYYYMMDDHHmm').format('YYYYMMDD'),
																					moment(data.planEndDate,'YYYYMMDDHHmm').format('YYYYMMDD'));
										console.log(factCalLst);
										
										// 기간별 공장력 비가동기간 목록
										let nonTimeList = [];
										for(var i=0;i<factCalLst.length;i++) {
											let factCalData = factCalLst[i];
											let obj1 = {};
											obj1.factoryDate = factCalData.factoryDate;
											obj1.startTime = moment(factCalData.factoryDate).format('YYYYMMDDHHmm');
											obj1.endTime = factCalData.startTime;
											obj1.breakTime = moment(obj1.endTime, 'YYYYMMDDHHmm').diff(moment(obj1.startTime, 'YYYYMMDDHHmm'), 'H');
											nonTimeList.push(obj1);

											let obj2 = {};
											obj2.factoryDate = factCalData.factoryDate;
											obj2.startTime = factCalData.endTime;
											obj2.endTime = moment(factCalData.factoryDate).add('d', 1).format('YYYYMMDDHHmm');
											obj2.breakTime = moment(obj2.endTime, 'YYYYMMDDHHmm').diff(moment(obj2.startTime, 'YYYYMMDDHHmm'), 'H');
											nonTimeList.push(obj2);
										}

										console.log(nonTimeList);

										// 계획기간에 포함된 비가동 목록
										nonTimeList = _.filter(nonTimeList, function(v) { return (data.planStartDate <= v.startTime && data.planEndDate >= v.startTime) ||
																								(data.planStartDate > v.startTime && data.planStartDate < v.endTime); });
										console.log(nonTimeList);
										
										let breakTimeSum = _.sumBy(nonTimeList, function(v) { return parseInt(v.breakTime); });
										breakTimeSum = breakTimeSum*60;

										
										let totalTime = workTime + stopTimeSum + breakTimeSum;
										console.log('총 가공시간 : ' + workTime);
										console.log('계획정지 : ' + stopTimeSum);
										console.log('공장력 비가동시간 : ' + breakTimeSum);
										console.log('합계 : ' + totalTime);
										console.log('계획시작 ~ 종료 : '+moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(data.planStartDate,'YYYYMMDDHHmm'), 'm'));

										// 계획 시작부터 종료시간의 총 시간이 가공시간, 공장력 비가동시간, 계획정지시간 다 더한 시간과 동일할 경우 -> 공장력과 계획정지가 반영이 되었다는 의미
										if(totalTime == moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(data.planStartDate,'YYYYMMDDHHmm'), 'm')) {
											break;
										} else {
											// 계획종료시간에만 공장력 비가동시간과 계획정지시간을 더해준다.
											data.planEndDate = moment(data.planEndDate,'YYYYMMDDHHmm').add('m', stopTimeSum + breakTimeSum - prevNonTime).format('YYYYMMDDHHmm');
											prevNonTime = stopTimeSum + breakTimeSum;
											console.log('prevNonTime: '+prevNonTime);
											console.log(data.planEndDate);
										}
										time++;
									}
									

									// 현재 설정한 계획과 겹치는 계획 목록
									let checkList = getAdvPlanScheduleLstByStartEndDate(data);
									console.log(checkList);

									// 현재 설정한 계획과 겹치는 계획이 없을 경우
									if(checkList.length == 0) {
										console.log('현재 설정한 계획과 겹치는 계획이 없을 경우');
										updateAps(data);
										toastr.success('수정되었습니다.');
									} else {
										toastr.warning('등록할 수 없습니다.');
									}
									showPlan();
								} else if(to == 'apsPlanTemp') { // 미배정 위치로 이동할 경우
									console.log('미배정 위치로 이동할 경우');
									showPlan();
								} else { // 제자리에 다시 두었을 경우
									console.log('제자리에 다시 두었을 경우');
									let data = $('#'+e.item.id).data('linedata'); // 연결선 정보 조회
									if(data != undefined) { // 연결선이 없지 않다면
										let contDtlNo = $('#'+e.item.id).data('data').contDtlNo;
										$('.'+contDtlNo).removeClass('d-none'); // 연결되었던 항목 show
										let id = jqSimpleConnect.connect("#"+data.from, "#"+data.to, {radius: 2, color: data.color, container: 'section'}); // 재연결
										if(data.blink != '') {
											$('.'+id).css('animation','blink-warning 1s step-end infinite');
										}
										$("#"+data.from).data('lineid',id).data('linedata',data);
										$("#"+data.to).data('lineid',id).data('linedata',data);
									}
									reloadAll(); // 계획과 연결선 다시 그리기
								}
							}
						}
						jqSimpleConnect.repaintAll(); // 전체 연결선 재구성
					},
					onAdd: function (e) { // 다른 그룹에 드롭 했을때
						console.log(e);
						let state = true;
						let from = e.from.id; // 이전에 있었던 영역
						let fromEquipCd = from.split('_')[0]; // 이전에 있었던 영역의 설비코드
						let fromDate = from.split('_')[1]; // 이전에 있었던 영역의 날짜
						let to = e.to.id; // 현재 있는 영역
						let toEquipCd = to.split('_')[0]; // 현재 있는 영역의 설비코드
						let toDate = to.split('_')[1]; // 현재 있는 영역의 날짜
						let newIndex = e.newIndex; // 현재 순서
						let oldIndex = e.oldIndex; // 원래 순서
						let targetId = e.item.id; // 대상 id
						let data = $('#'+targetId).data('data');
						let schedule_length = $('#'+to).find('.dragableModule').length; // 현재 영역의 계획수
						
						let workTime = parseInt(data.readyTime) + (parseInt(data.processTime) * parseInt(data.dtlOrdCnt)); // 총 작업시간(분)

						// 현재 영역의 계획목록(옮긴 항목 제외)
						let toDataList = [];
						for(var i=0;i<schedule_length;i++) {
							let data = $('#'+to).find('.dragableModule').eq(i).data('data');
							if(data.ordState != 'PS') { // 계획정지일 경우는 제외
								toDataList.push($('#'+to).find('.dragableModule').eq(i).data('data'));
							}
						}

						// 현재 영역에서 현재계획은 제외
						toDataList = _.filter(toDataList, function(v) { return v.idx != data.idx; });
						console.log(toDataList);

						// DB의 계획목록
						let dbDataList = getApsLstOneByDate({
											'startDate'		: moment(toDate).format('YYYYMMDD'),
											'planEquipCd'	: toEquipCd
										});
						// DB에서 현재계획은 제외
						dbDataList = _.filter(dbDataList, function(v) { return v.idx != data.idx; });
						console.log(dbDataList);

						// 현재 영역의 목록과 DB의 목록을 비교했을때 같지 않은 목록
						let diffList = _.differenceBy(dbDataList, toDataList, 'idx');
						console.log(diffList);

						// 현재 영역의 목록과 DB의 목록을 비교했을때 현재 계획을 제외하고 다른점이 있을 경우
						// 현재 목록과 DB목록의 수가 같지 않거나 
						if((dbDataList.length != toDataList.length || diffList.length != 0) && to != 'apsPlanTemp') {
							console.log('APS에 변경사항이 존재합니다.');
							toastr.warning('APS에 변경사항이 존재합니다.');
							state = false;
							setTimeout(function() {
								toastr.warning('APS를 재조회합니다...');
								$('#my-spinner').show();
								setTimeout(function() {
									showPlan();
									setTimeout(function() {
										$('#my-spinner').hide();
									}, 10);
								}, 10);
							}, 1000);
						}

						if(state) {
							// 미배정 항목을 배정했을 경우만 고려한다. -> 배정항목은 위의 onEnd에서 처리
							if(from == 'apsPlanTemp') { // 미배정 항목을 배정했을 경우 
								data.planEquipCd = toEquipCd;
								if(newIndex == 0) { // 비어있는 날짜에 배정했을 경우 or 맨 처음위치에 배정했을 경우
									data.planStartDate = moment(toDate).format('YYYYMMDD0000');
									data.planEndDate = moment(toDate).add('m', workTime).format('YYYYMMDDHHmm');

									// 기간별 공장력 목록조회
									let factCalLst = getFactoryCalendarLstByDate(moment(toDate).format('YYYYMMDD'), moment(toDate).format('YYYYMMDD'));
									if(factCalLst.length == 0) { // 공장력이 등록되지 않았을 경우
										toastr.warning('공장력을 등록해주세요.');
										showPlan();
										return false;
									} else {
										data.planStartDate = factCalLst[0].startTime;
										data.planEndDate = moment(factCalLst[0].startTime,'YYYYMMDDHHmm').add('m', workTime).format('YYYYMMDDHHmm');
									}
								} else if(newIndex != 0) { // 비어있지 않은 날짜에 등록헀을 경우
									// 이전 순서 계획의 종료시간 +1분이 계획 시작시간
									data.planStartDate = moment($('#'+to).find('div').eq(newIndex-1).data('data').planEndDate, 'YYYYMMDDHHmm').add('m',1).format('YYYYMMDDHHmm');
									data.planEndDate = moment(data.planStartDate, 'YYYYMMDDHHmm').add('m', workTime).format('YYYYMMDDHHmm');
								}
								data.planState = 'AS';


								let time = 1
								let prevNonTime = 0;
								while(true && time != 100) {
									console.log('planStartDate: ' + data.planStartDate);
									console.log('planEndDate: ' + data.planEndDate);
									// 기간별 계획정지 목록조회
									let planStopLst = getPlanStopLstByDateGroup(data.planEquipCd, moment(data.planStartDate,'YYYYMMDDHHmm').format('YYYYMMDDHHmm'),
																					moment(data.planEndDate,'YYYYMMDDHHmm').format('YYYYMMDDHHmm'));
									console.log(planStopLst);
									let stopTimeSum = _.sumBy(planStopLst, function(v) { return moment(v.endDatetime,'YYYYMMDDHHmm').diff(moment(v.startDatetime,'YYYYMMDDHHmm'), 'm'); });
									
									
									// 기간별 공장력 목록조회
									let factCalLst = getFactoryCalendarLstByDate(moment(data.planStartDate,'YYYYMMDDHHmm').format('YYYYMMDD'),
																				moment(data.planEndDate,'YYYYMMDDHHmm').format('YYYYMMDD'));
									console.log(factCalLst);
									
									// 기간별 공장력 비가동기간 목록
									let nonTimeList = [];
									for(var i=0;i<factCalLst.length;i++) {
										let factCalData = factCalLst[i];
										let obj1 = {};
										obj1.factoryDate = factCalData.factoryDate;
										obj1.startTime = moment(factCalData.factoryDate).format('YYYYMMDDHHmm');
										obj1.endTime = factCalData.startTime;
										obj1.breakTime = moment(obj1.endTime, 'YYYYMMDDHHmm').diff(moment(obj1.startTime, 'YYYYMMDDHHmm'), 'H');
										nonTimeList.push(obj1);

										let obj2 = {};
										obj2.factoryDate = factCalData.factoryDate;
										obj2.startTime = factCalData.endTime;
										obj2.endTime = moment(factCalData.factoryDate).add('d', 1).format('YYYYMMDDHHmm');
										obj2.breakTime = moment(obj2.endTime, 'YYYYMMDDHHmm').diff(moment(obj2.startTime, 'YYYYMMDDHHmm'), 'H');
										nonTimeList.push(obj2);
									}

									console.log(nonTimeList);

									// 계획기간에 포함된 비가동 목록
									nonTimeList = _.filter(nonTimeList, function(v) { return (data.planStartDate <= v.startTime && data.planEndDate >= v.startTime) ||
																							(data.planStartDate > v.startTime && data.planStartDate < v.endTime); });
									console.log(nonTimeList);
									
									let breakTimeSum = _.sumBy(nonTimeList, function(v) { return parseInt(v.breakTime); });
									breakTimeSum = breakTimeSum*60;

									
									let totalTime = workTime + stopTimeSum + breakTimeSum;
									console.log('총 가공시간 : ' + workTime);
									console.log('계획정지 : ' + stopTimeSum);
									console.log('공장력 비가동시간 : ' + breakTimeSum);
									console.log('합계 : ' + totalTime);
									console.log('계획시작 ~ 종료 : '+moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(data.planStartDate,'YYYYMMDDHHmm'), 'm'));

									// 계획 시작부터 종료시간의 총 시간이 가공시간, 공장력 비가동시간, 계획정지시간 다 더한 시간과 동일할 경우 -> 공장력과 계획정지가 반영이 되었다는 의미
									if(totalTime == moment(data.planEndDate,'YYYYMMDDHHmm').diff(moment(data.planStartDate,'YYYYMMDDHHmm'), 'm')) {
										break;
									} else {
										// 계획종료시간에만 공장력 비가동시간과 계획정지시간을 더해준다.
										data.planEndDate = moment(data.planEndDate,'YYYYMMDDHHmm').add('m', stopTimeSum + breakTimeSum - prevNonTime).format('YYYYMMDDHHmm');
										prevNonTime = stopTimeSum + breakTimeSum;
										console.log('prevNonTime: '+prevNonTime);
										console.log(data.planEndDate);
									}
									time++;
								}
								
								
								// 현재 설정한 계획과 겹치는 계획 목록
								let checkList = getAdvPlanScheduleLstByStartEndDate(data);
								console.log(checkList);

								// 현재 설정한 계획과 겹치는 계획이 없을 경우
								if(checkList.length == 0) {
									console.log('현재 설정한 계획과 겹치는 계획이 없을 경우');
									setAPS(data); // APS 생성
									toastr.success('수정되었습니다.');
								} else {
									toastr.warning('등록할 수 없습니다.');
								}
								showPlan();
							}
						}
					}
				});
			}
		}
		// 미배정 sortable js init
		Sortable.create(apsPlanTemp, {
			group: {
				name: "tempPlan",
				put: ["plan","tempPlan"],
			},
			handle: ".dragableModule",
			sort: true,
			onChange: function (e) { // 다른 위치로 이동했을 때
				jqSimpleConnect.repaintAll(); // 전체 연결선 재구성
			},
			onAdd: function (e) { // 다른 그룹에 드롭했을 때
				console.log(e);
				let targetData = $('#'+e.item.id).data('data');
				targetData.planEquipCd = '';
				targetData.planStartDate = '';
				targetData.planEndDate = '';
				targetData.planState = 'PD';
				setAPS(targetData); // APS 생성
				deleteAps(targetData.idx); // 미배정으로 돌린 APS 삭제
			}
		});


		
		
		// 연결선 생성
		for(var i=0;i<lineList.length;i++) {
			let data = lineList[i];
			let id = jqSimpleConnect.connect("#"+data.from, "#"+data.to, {radius: 3, color: data.color, container: 'section'});
			if(data.blink != '') {
				$('.'+id).css('animation','blink-warning 1s step-end infinite');
			}
			$("#"+data.from).data('lineid',id).data('linedata',data);
			$("#"+data.to).data('lineid',id).data('linedata',data);
		}
	}

	// APS 계산
	function setAPS(targetData) {
		// 미배정되지 않은 계획목록
		let apsPlanList = _.filter(orderList, function(v) { return v.ordState != 'PD'; });

		let array = [];

		if(targetData.planState != 'PD') { // 
			let obj = new Object();
			obj.idx = targetData.idx;
			obj.contDtlNo = targetData.contDtlNo;
			obj.workOrdNo = '';
			obj.planEquipCd = targetData.planEquipCd;
			obj.planQty = targetData.dtlOrdCnt;
			obj.planStartDate = targetData.planStartDate;
			obj.planEndDate = targetData.planEndDate;
			obj.planState = targetData.planState;
			
		    array.push(obj);
		}
	
		

		$.ajax({
			url: '<c:url value="/wm/advPlanScheduleIU"/>',
            type: 'POST',
            data: {
                'jsonArray'	:	JSON.stringify(array)
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
			}
		});
	}

	// APS 특정일자 목록조회
	function getApsLstOneByDate(data) {
		let result = '';
		$.ajax({
			url: '<c:url value="/wm/advPlanScheduleLstOneByDate"/>',
            type: 'POST',
            async: false,
            data: {
                'startDate'		:	data.startDate,
                'planEquipCd'	:	data.planEquipCd,
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					result = res.data;
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
			}
		});
		return result;
	}

	// APS 상세조회
	function getApsData(idx) {
		let result = '';
		$.ajax({
			url: '<c:url value="/wm/advPlanScheduleSel"/>',
            type: 'POST',
            async: false,
            data: {
                'idx'			:	idx
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					result = res.data;
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
			}
		});
		return result;
	}

	// APS 상태변경
	function updateAps(data) {
		$.ajax({
			url: '<c:url value="/wm/advPlanScheduleUpd"/>',
            type: 'POST',
            async: false,
            data: {
                'idx'			:	data.idx,
                'planEquipCd'	:	data.planEquipCd,
                'planQty'		:	data.planQty,
                'planStartDate'	:	data.planStartDate,
                'planEndDate'	:	data.planEndDate,
                'planState'		:	data.planState,
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
			}
		});
	}

	// APS 삭제
	function deleteAps(idx) {
		$.ajax({
			url: '<c:url value="/wm/advPlanScheduleDel"/>',
            type: 'POST',
            async: false,
            data: {
                'idx'	:	idx
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
			}
		});
	}

	// 작업지시 등록
	function workOrderAdmIns(data) {
		$.ajax({
			url: '<c:url value="/po/workOrderAdmLaserIns"/>',
            type: 'POST',
            async: false,
            data: {
                'contDtlNo'	:	data.contDtlNo,
                'dtlOrdCnt'	:	data.dtlOrdCnt,
                'equipCd'	:	data.equipCd,
                'itemSeq'	:	data.itemSeq,
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				
			}
		});
	}

	// 작업지시 삭제
	function workOrderAdmDel(data) {
		$.ajax({
			url: '<c:url value="/po/workOrderAdmDel"/>',
            type: 'POST',
            async: false,
            data: {
                'contDtlNo'	:	data.contDtlNo
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				
			}
		});
	}

	// 삭제 모달 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		let idx = $('#deleteModal').data('idx');
		let deleteType = $('#deleteModal').data('deleteType');

		if(deleteType == 'aps') {
			let data = getApsData(idx);
			deleteAps(idx);
			workOrderAdmDel(data); // 작업지시 삭제
		} else if(deleteType == 'workOrderAdm') {
			let data = getApsData(idx);
			data.planState = 'CF';
			workOrderAdmDel(data); // 작업지시 삭제
			updateAps(data);
			toastr.success('작업지시 삭제되었습니다.');
		}
		
		showPlan();
	});


	// 계획확정 버튼 click
	$('#btnConfirm').on('click', function() {
		if($('input[name=scheduleCheck]:checked').length == 0) {
			toastr.warning('계획활정할 항목을 체크해주세요.');
			return false;
		}
		
		$('#my-spinner').show();
		setTimeout(function() {
			$('input[name=scheduleCheck]:checked').each(function(index, item) {
				let data = $(item).parent().data('data');
				data = getApsData(data.idx);
				if(data.planState != 'WO') {
					data.planState = 'CF';
					updateAps(data);
				}
			});
			toastr.success('계획확정되었습니다.');
			showPlan();
			setTimeout(function() {
				$('#my-spinner').hide();
			}, 10);
		}, 10);
		
		
	});

	// 확정취소 버튼 click
	$('#btnCancle').on('click', function() {
		if($('input[name=scheduleCheck]:checked').length == 0) {
			toastr.warning('계획활정할 항목을 체크해주세요.');
			return false;
		}

		$('input[name=scheduleCheck]:checked').each(function(index, item) {
			let data = $(item).parent().data('data');
			data = getApsData(data.idx);
			if(data.planState != 'WO') {
				data.planState = 'AS';
				updateAps(data);
			}
		});
		toastr.success('확정취소되었습니다.');
		showPlan();
	});

	// 기간별 목록조회 버튼 click
	$('#btnSearchApsToDate').on('click', function() {
		$('#apsListByDateModal').modal('show');
	});
	$('#apsListByDateModal').on('shown.bs.modal', function() {
		apsListByDateTable.ajax.reload(function() {});
	});

	// 자동계산 버튼 click
	$('#btnApsCal').on('click', function() {
		$('#my-spinner').show();
		setTimeout(function() {
			let initDate = moment($('#apsCalDate').val(),'YYYY-MM-DDTHH:mm').format('YYYYMMDDHHmm');

			// 기간별 공장력 목록조회
			let factCalLst = getFactoryCalendarLstByDate(moment(initDate,'YYYYMMDDHHmm').format('YYYYMMDD'),
														moment(initDate,'YYYYMMDDHHmm').format('YYYYMMDD'));
			// 공장력이 등록되지 않았을 경우
			if(factCalLst.length == 0) {
				toastr.warning('공장력을 등록해주세요.');
				showPlan();
				return false;
			} else { // 공장력이 등록되었을 경우
				// 공장력 시작일시 변경 -> 비가동 기간에 시작일시가 있을 경우에만 반영 -> 공장력 안에 있을 경우에는 뒤에서 걸러짐
				if(initDate <= factCalLst[0].startTime) {
					initDate = factCalLst[0].startTime;
				} else if(initDate >= factCalLst[0].endTime) {
					// 다음날 공장력 목록조회
					let nextFactCalLst = getFactoryCalendarLstByDate(moment(initDate,'YYYYMMDDHHmm').add('d',1).format('YYYYMMDD'),
																moment(initDate,'YYYYMMDDHHmm').add('d',1).format('YYYYMMDD'));
					initDate = nextFactCalLst[0].startTime;
				}
			}
			
			let apsList = []; // 현재 APS 목록
			let appendList = []; // 등록/수정할 APS 목록
			equipList = getEquipList(); // 레이저 주생산설비 목록조회
			equipList = _.filter(equipList, function(v) { return v.useYn == '001'; }); // 사용중인 설비만 배정할 수 있도록 처리

			// 설비별로 계획 기준시간 설정
			_.forEach(equipList, function(v) {
				v.initDate = initDate;
			});
			
			let nonAssignLst = getAdvPlanScheduleNonAssignLst(); // 미배정 목록 조회
			let assignLst = getAdvPlanScheduleLstByDate(initDate, ''); // 기간별 계획목록 조회
			

			_.forEach(nonAssignLst, function(v) {
				let obj = {};
				obj.idx 			= '';
				obj.contDtlNo		= v.contDtlNo;
				obj.workOrdNo		= '';
				obj.shipReqDate		= v.shipReqDate;
				obj.planEquipCd		= '';
				obj.planStartDate	= initDate;
				obj.planEndDate		= '';
				obj.planQty			= v.dtlOrdCnt;
				obj.planState		= 'PD';
				obj.workTime		= parseInt(v.readyTime) + (parseInt(v.processTime) * parseInt(v.dtlOrdCnt));
				apsList.push(obj);
			});
			_.forEach(assignLst, function(v) {
				let obj = {};
				obj.idx 			= v.idx;
				obj.contDtlNo		= v.contDtlNo;
				obj.workOrdNo		= (v.workOrdNo==null?'':v.workOrdNo);
				obj.shipReqDate		= v.shipReqDate;
				obj.planEquipCd		= v.planEquipCd;
				obj.planStartDate	= v.planStartDate;
				obj.planEndDate		= v.planEndDate;
				obj.planQty			= v.planQty;
				obj.planState		= v.planState;
				obj.workTime		= parseInt(v.readyTime) + (parseInt(v.processTime) * parseInt(v.dtlOrdCnt));
				apsList.push(obj);
			});

			let nonConfirmList = _.filter(apsList, function(v) { return v.planState == 'AS' || v.planState == 'PD'; }); // 미배정건과 배정되었지만 확정되지 않은 항목들
			nonConfirmList = _.sortBy(nonConfirmList, [function(v) { return v.shipReqDate; }]); // 확정되지 않은 항목들 납기일이 빠른순으로 정렬
			let confirmList = _.filter(apsList, function(v) { return v.planState != 'AS' && v.planState != 'PD'; }); // 확정된 항목들
			confirmList = _.sortBy(confirmList, [function(v) { return v.planStartDate; }]); // 확정된 항목들 계획시작일이 빠른순으로 정렬

			
			// 확정건이 있을 경우
			if(confirmList.length != 0) {
				for(var i=0;i<confirmList.length;i++) { // 확정건 순환
					let confirmData = confirmList[i];
					for(var j=0;j<nonConfirmList.length;j++) { // 미확정건 순환
						let nc_endDate = '';
						
						for(var k=0;k<equipList.length;k++) { // 설비목록 순환
							let equipData = equipList[k];
							let nonConfirmData = nonConfirmList[j];

							// 등록/수정 목록에 존재하지 않을 경우
							if(_.findIndex(appendList, function(v) { return v.contDtlNo == nonConfirmData.contDtlNo; }) == -1) {
								// 미확정건의 작업종료시간 = 기준시간 + 작업시간
								nc_endDate = moment(equipData.initDate, 'YYYYMMDDHHmm').add('m', nonConfirmData.workTime).format('YYYYMMDDHHmm');
								
								// 현재 미확정건의 완료일이 비교하는 확정건의 시작일 이전일 경우
								if(moment(confirmData.planStartDate, 'YYYYMMDDHHmm').diff(moment(nc_endDate, 'YYYYMMDDHHmm'), 'm') > 0) {
									if(nonConfirmData.planState == 'PD') { // 미배정건은 배정상태로 적용
										nonConfirmData.planState = 'AS';
									}
									nonConfirmData.planEquipCd = equipData.equipCd;
									nonConfirmData.planStartDate = equipData.initDate;
									nonConfirmData.planEndDate = nc_endDate;

									let time = 1
									let prevNonTime = 0;
									while(true && time != 100) {
										console.log('planStartDate: ' + nonConfirmData.planStartDate);
										console.log('planEndDate: ' + nonConfirmData.planEndDate);
										// 기간별 계획정지 목록조회
										let planStopLst = getPlanStopLstByDateGroup(nonConfirmData.planEquipCd, moment(nonConfirmData.planStartDate,'YYYYMMDDHHmm').format('YYYYMMDDHHmm'),
																												moment(nonConfirmData.planEndDate,'YYYYMMDDHHmm').format('YYYYMMDDHHmm'));
										console.log(planStopLst);
										let stopTimeSum = _.sumBy(planStopLst, function(v) { return moment(v.endDatetime,'YYYYMMDDHHmm').diff(moment(v.startDatetime,'YYYYMMDDHHmm'), 'm'); });
										
										
										// 기간별 공장력 목록조회
										let factCalLst = getFactoryCalendarLstByDate(moment(nonConfirmData.planStartDate,'YYYYMMDDHHmm').format('YYYYMMDD'),
																					moment(nonConfirmData.planEndDate,'YYYYMMDDHHmm').format('YYYYMMDD'));
										console.log(factCalLst);
										
										// 기간별 공장력 비가동기간 목록
										let nonTimeList = [];
										for(var i=0;i<factCalLst.length;i++) {
											let factCalData = factCalLst[i];
											let obj1 = {};
											obj1.factoryDate = factCalData.factoryDate;
											obj1.startTime = moment(factCalData.factoryDate).format('YYYYMMDDHHmm');
											obj1.endTime = factCalData.startTime;
											obj1.breakTime = moment(obj1.endTime, 'YYYYMMDDHHmm').diff(moment(obj1.startTime, 'YYYYMMDDHHmm'), 'H');
											nonTimeList.push(obj1);

											let obj2 = {};
											obj2.factoryDate = factCalData.factoryDate;
											obj2.startTime = factCalData.endTime;
											obj2.endTime = moment(factCalData.factoryDate).add('d', 1).format('YYYYMMDDHHmm');
											obj2.breakTime = moment(obj2.endTime, 'YYYYMMDDHHmm').diff(moment(obj2.startTime, 'YYYYMMDDHHmm'), 'H');
											nonTimeList.push(obj2);
										}

										console.log(nonTimeList);

										// 계획기간에 포함된 비가동 목록
										nonTimeList = _.filter(nonTimeList, function(v) { return (nonConfirmData.planStartDate <= v.startTime && nonConfirmData.planEndDate >= v.startTime) ||
																								(nonConfirmData.planStartDate > v.startTime && nonConfirmData.planStartDate < v.endTime); });
										console.log(nonTimeList);
										
										let breakTimeSum = _.sumBy(nonTimeList, function(v) { return parseInt(v.breakTime); });
										breakTimeSum = breakTimeSum*60;

										
										let totalTime = nonConfirmData.workTime + stopTimeSum + breakTimeSum;
										console.log('총 가공시간 : ' + nonConfirmData.workTime);
										console.log('계획정지 : ' + stopTimeSum);
										console.log('공장력 비가동시간 : ' + breakTimeSum);
										console.log('합계 : ' + totalTime);
										console.log('계획시작 ~ 종료 : '+moment(nonConfirmData.planEndDate,'YYYYMMDDHHmm').diff(moment(nonConfirmData.planStartDate,'YYYYMMDDHHmm'), 'm'));

										// 계획 시작부터 종료시간의 총 시간이 가공시간, 공장력 비가동시간, 계획정지시간 다 더한 시간과 동일할 경우 -> 공장력과 계획정지가 반영이 되었다는 의미
										if(totalTime == moment(nonConfirmData.planEndDate,'YYYYMMDDHHmm').diff(moment(nonConfirmData.planStartDate,'YYYYMMDDHHmm'), 'm')) {
											break;
										} else {
											// 계획종료시간에만 공장력 비가동시간과 계획정지시간을 더해준다.
											nonConfirmData.planEndDate = moment(nonConfirmData.planEndDate,'YYYYMMDDHHmm').add('m', stopTimeSum + breakTimeSum - prevNonTime).format('YYYYMMDDHHmm');
											prevNonTime = stopTimeSum + breakTimeSum;
											console.log('prevNonTime: '+prevNonTime);
											console.log(nonConfirmData.planEndDate);
										}
										time++;
									}
									
									
									// 등록/수정 목록에 추가
									appendList.push(nonConfirmData);
									
									// 기준일시 변경
									equipData.initDate = moment(nonConfirmData.planEndDate, 'YYYYMMDDHHmm').add('m', 1).format('YYYYMMDDHHmm');

									if(j+1 != nonConfirmList.length) {
										if(k+1 != equipList.length) {
											j++;
										} else {
											break;
										}
									} else {
										break;
									}
								}
							} else { // 이미 등록/수정 목록에 존재할 경우
								break;
							}
						}
					}

					// 설비별로 계획 기준시간 설정
					_.forEach(equipList, function(v) {
						// 확정건의 설비만 기준시간 변경
						if(v.equipCd == confirmData.planEquipCd) {
							v.initDate = moment(confirmData.planEndDate, 'YYYYMMDDHHmm').add('m', 1).format('YYYYMMDDHHmm'); // 다음 확정건의 완료일 +1분 셋팅
						}
					});
					
					// 마지막일 경우 -> 마지막 확정건의 뒤로 정렬
					if(i+1 == confirmList.length) {
						let noAppendList = _.differenceBy(nonConfirmList, appendList, 'contDtlNo'); // 미배정건중에서 등록/수정목록에 안들어간 목록
						for(var j=0;j<noAppendList.length;j++) {
							for(var k=0;k<equipList.length;k++) { // 설비목록 순환
								let equipData = equipList[k];

								// 등록/수정 목록에 존재하지 않을 경우
								if(_.findIndex(appendList, function(v) { return v.contDtlNo == noAppendList[j].contDtlNo; }) == -1) {
									let nc_endDate = moment(equipData.initDate, 'YYYYMMDDHHmm').add('m', noAppendList[j].workTime).format('YYYYMMDDHHmm'); // 미확정건의 작업종료시간
									if(noAppendList[j].planState == 'PD') {
										noAppendList[j].planState = 'AS';
									}
									noAppendList[j].planEquipCd = equipData.equipCd;
									noAppendList[j].planStartDate = equipData.initDate;
									noAppendList[j].planEndDate = nc_endDate;

									let time = 1
									let prevNonTime = 0;
									while(true && time != 100) {
										console.log('planStartDate: ' + noAppendList[j].planStartDate);
										console.log('planEndDate: ' + noAppendList[j].planEndDate);
										// 기간별 계획정지 목록조회
										let planStopLst = getPlanStopLstByDateGroup(noAppendList[j].planEquipCd, moment(noAppendList[j].planStartDate,'YYYYMMDDHHmm').format('YYYYMMDDHHmm'),
																						moment(noAppendList[j].planEndDate,'YYYYMMDDHHmm').format('YYYYMMDDHHmm'));
										console.log(planStopLst);
										let stopTimeSum = _.sumBy(planStopLst, function(v) { return moment(v.endDatetime,'YYYYMMDDHHmm').diff(moment(v.startDatetime,'YYYYMMDDHHmm'), 'm'); });
										
										
										// 기간별 공장력 목록조회
										let factCalLst = getFactoryCalendarLstByDate(moment(noAppendList[j].planStartDate,'YYYYMMDDHHmm').format('YYYYMMDD'),
																					moment(noAppendList[j].planEndDate,'YYYYMMDDHHmm').format('YYYYMMDD'));
										console.log(factCalLst);
										
										// 기간별 공장력 비가동기간 목록
										let nonTimeList = [];
										for(var i=0;i<factCalLst.length;i++) {
											let factCalData = factCalLst[i];
											let obj1 = {};
											obj1.factoryDate = factCalData.factoryDate;
											obj1.startTime = moment(factCalData.factoryDate).format('YYYYMMDDHHmm');
											obj1.endTime = factCalData.startTime;
											obj1.breakTime = moment(obj1.endTime, 'YYYYMMDDHHmm').diff(moment(obj1.startTime, 'YYYYMMDDHHmm'), 'H');
											nonTimeList.push(obj1);

											let obj2 = {};
											obj2.factoryDate = factCalData.factoryDate;
											obj2.startTime = factCalData.endTime;
											obj2.endTime = moment(factCalData.factoryDate).add('d', 1).format('YYYYMMDDHHmm');
											obj2.breakTime = moment(obj2.endTime, 'YYYYMMDDHHmm').diff(moment(obj2.startTime, 'YYYYMMDDHHmm'), 'H');
											nonTimeList.push(obj2);
										}

										console.log(nonTimeList);

										// 계획기간에 포함된 비가동 목록
										nonTimeList = _.filter(nonTimeList, function(v) { return (noAppendList[j].planStartDate <= v.startTime && noAppendList[j].planEndDate >= v.startTime) ||
																								(noAppendList[j].planStartDate > v.startTime && noAppendList[j].planStartDate < v.endTime); });
										console.log(nonTimeList);
										
										let breakTimeSum = _.sumBy(nonTimeList, function(v) { return parseInt(v.breakTime); });
										breakTimeSum = breakTimeSum*60;

										
										let totalTime = noAppendList[j].workTime + stopTimeSum + breakTimeSum;
										console.log('총 가공시간 : ' + noAppendList[j].workTime);
										console.log('계획정지 : ' + stopTimeSum);
										console.log('공장력 비가동시간 : ' + breakTimeSum);
										console.log('합계 : ' + totalTime);
										console.log('계획시작 ~ 종료 : '+moment(noAppendList[j].planEndDate,'YYYYMMDDHHmm').diff(moment(noAppendList[j].planStartDate,'YYYYMMDDHHmm'), 'm'));

										// 계획 시작부터 종료시간의 총 시간이 가공시간, 공장력 비가동시간, 계획정지시간 다 더한 시간과 동일할 경우 -> 공장력과 계획정지가 반영이 되었다는 의미
										if(totalTime == moment(noAppendList[j].planEndDate,'YYYYMMDDHHmm').diff(moment(noAppendList[j].planStartDate,'YYYYMMDDHHmm'), 'm')) {
											break;
										} else {
											// 계획종료시간에만 공장력 비가동시간과 계획정지시간을 더해준다.
											noAppendList[j].planEndDate = moment(noAppendList[j].planEndDate,'YYYYMMDDHHmm').add('m', stopTimeSum + breakTimeSum - prevNonTime).format('YYYYMMDDHHmm');
											prevNonTime = stopTimeSum + breakTimeSum;
											console.log('prevNonTime: '+prevNonTime);
											console.log(noAppendList[j].planEndDate);
										}
										time++;
									}
									
									appendList.push(noAppendList[j]); // 등록/수정 목록에 추가
									equipData.initDate = moment(noAppendList[j].planEndDate, 'YYYYMMDDHHmm').add('m', 1).format('YYYYMMDDHHmm'); // 기준일시 변경

									// 마지막 설비가 아닐 경우
									if(k+1 != equipList.length) {
										if(j+1 != noAppendList.length) {
											j++;
										} else {
											break;
										}
									}
								} else {
									break;
								}
							}
						}
					}
				}
			} else { // 확정건이 없을 경우
				let noAppendList = _.differenceBy(nonConfirmList, appendList, 'contDtlNo'); // 미배정건중에서 등록/수정목록에 안들어간 목록
				for(var j=0;j<noAppendList.length;j++) {
					for(var k=0;k<equipList.length;k++) { // 설비목록 순환
						let equipData = equipList[k];

						// 등록/수정 목록에 존재하지 않을 경우
						if(_.findIndex(appendList, function(v) { return v.contDtlNo == noAppendList[j].contDtlNo; }) == -1) {
							let nc_endDate = moment(equipData.initDate, 'YYYYMMDDHHmm').add('m', noAppendList[j].workTime).format('YYYYMMDDHHmm'); // 미확정건의 작업종료시간
							if(noAppendList[j].planState == 'PD') {
								noAppendList[j].planState = 'AS';
							}
							noAppendList[j].planEquipCd = equipData.equipCd;
							noAppendList[j].planStartDate = equipData.initDate;
							noAppendList[j].planEndDate = nc_endDate;

							let time = 1
							let prevNonTime = 0;
							while(true && time != 100) {
								console.log('planStartDate: ' + noAppendList[j].planStartDate);
								console.log('planEndDate: ' + noAppendList[j].planEndDate);
								// 기간별 계획정지 목록조회
								let planStopLst = getPlanStopLstByDateGroup(noAppendList[j].planEquipCd, moment(noAppendList[j].planStartDate,'YYYYMMDDHHmm').format('YYYYMMDDHHmm'),
																				moment(noAppendList[j].planEndDate,'YYYYMMDDHHmm').format('YYYYMMDDHHmm'));
								console.log(planStopLst);
								let stopTimeSum = _.sumBy(planStopLst, function(v) { return moment(v.endDatetime,'YYYYMMDDHHmm').diff(moment(v.startDatetime,'YYYYMMDDHHmm'), 'm'); });
								
								
								// 기간별 공장력 목록조회
								let factCalLst = getFactoryCalendarLstByDate(moment(noAppendList[j].planStartDate,'YYYYMMDDHHmm').format('YYYYMMDD'),
																			moment(noAppendList[j].planEndDate,'YYYYMMDDHHmm').format('YYYYMMDD'));
								console.log(factCalLst);
								
								// 기간별 공장력 비가동기간 목록
								let nonTimeList = [];
								for(var i=0;i<factCalLst.length;i++) {
									let factCalData = factCalLst[i];
									let obj1 = {};
									obj1.factoryDate = factCalData.factoryDate;
									obj1.startTime = moment(factCalData.factoryDate).format('YYYYMMDDHHmm');
									obj1.endTime = factCalData.startTime;
									obj1.breakTime = moment(obj1.endTime, 'YYYYMMDDHHmm').diff(moment(obj1.startTime, 'YYYYMMDDHHmm'), 'H');
									nonTimeList.push(obj1);

									let obj2 = {};
									obj2.factoryDate = factCalData.factoryDate;
									obj2.startTime = factCalData.endTime;
									obj2.endTime = moment(factCalData.factoryDate).add('d', 1).format('YYYYMMDDHHmm');
									obj2.breakTime = moment(obj2.endTime, 'YYYYMMDDHHmm').diff(moment(obj2.startTime, 'YYYYMMDDHHmm'), 'H');
									nonTimeList.push(obj2);
								}

								console.log(nonTimeList);

								// 계획기간에 포함된 비가동 목록
								nonTimeList = _.filter(nonTimeList, function(v) { return (noAppendList[j].planStartDate <= v.startTime && noAppendList[j].planEndDate >= v.startTime) ||
																						(noAppendList[j].planStartDate > v.startTime && noAppendList[j].planStartDate < v.endTime); });
								console.log(nonTimeList);
								
								let breakTimeSum = _.sumBy(nonTimeList, function(v) { return parseInt(v.breakTime); });
								breakTimeSum = breakTimeSum*60;

								
								let totalTime = noAppendList[j].workTime + stopTimeSum + breakTimeSum;
								console.log('총 가공시간 : ' + noAppendList[j].workTime);
								console.log('계획정지 : ' + stopTimeSum);
								console.log('공장력 비가동시간 : ' + breakTimeSum);
								console.log('합계 : ' + totalTime);
								console.log('계획시작 ~ 종료 : '+moment(noAppendList[j].planEndDate,'YYYYMMDDHHmm').diff(moment(noAppendList[j].planStartDate,'YYYYMMDDHHmm'), 'm'));

								// 계획 시작부터 종료시간의 총 시간이 가공시간, 공장력 비가동시간, 계획정지시간 다 더한 시간과 동일할 경우 -> 공장력과 계획정지가 반영이 되었다는 의미
								if(totalTime == moment(noAppendList[j].planEndDate,'YYYYMMDDHHmm').diff(moment(noAppendList[j].planStartDate,'YYYYMMDDHHmm'), 'm')) {
									break;
								} else {
									// 계획종료시간에만 공장력 비가동시간과 계획정지시간을 더해준다.
									noAppendList[j].planEndDate = moment(noAppendList[j].planEndDate,'YYYYMMDDHHmm').add('m', stopTimeSum + breakTimeSum - prevNonTime).format('YYYYMMDDHHmm');
									prevNonTime = stopTimeSum + breakTimeSum;
									console.log('prevNonTime: '+prevNonTime);
									console.log(noAppendList[j].planEndDate);
								}
								time++;
							}
							
							appendList.push(noAppendList[j]); // 등록/수정 목록에 추가
							equipData.initDate = moment(noAppendList[j].planEndDate, 'YYYYMMDDHHmm').add('m', 1).format('YYYYMMDDHHmm'); // 기준일시 변경

							// 마지막 설비가 아닐 경우
							if(k+1 != equipList.length) {
								if(j+1 != noAppendList.length) {
									j++;
								} else {
									break;
								}
							}
						} else {
							break;
						}
					}
				}
			}
			console.log(appendList);

			$.ajax({
				url: '<c:url value="/wm/advPlanScheduleIU"/>',
	            type: 'POST',
	            async: false,
	            data: {
	                'jsonArray'	:	JSON.stringify(appendList)
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('저장되었습니다.');
						showPlan();
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					
				}
			});

			setTimeout(function() {
				$('#my-spinner').hide();
			},10);
		},10);
	});

	// APS 기간별 목록조회
	let apsListByDateTable = $('#apsListByDateTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12 p-0'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : false,
		searching: false,
		pageLength : 100000000, 
		scrollY: "70vh",
		ajax : {
			url : '<c:url value="wm/advPlanScheduleStatusLstByDate"/>',
			type : 'POST',
			data : {
				'contGubun'	: '001',
				'prcNm'		: '001',
				'startDate'	: function() { return moment($('#startDateTime').val(), 'YYYY-MM-DD').format('YYYYMMDD0000'); },
				'endDate'	: function() { return moment($('#endDateTime').val(), 'YYYY-MM-DD').format('YYYYMMDD2359'); },
				'planState'	: function() { return $('#searchPlanState').val(); },
			},
		},
		columns : [
			{ data : 'planState', className : 'text-center',
				render : function(data, type, row, meta) {
					let background_color = '';
					let color = '';
					let text = '';
					if(data == 'PD') {
						color = '#000000';
						background_color = '#ccccdc';
						text = '미배정';
					} else if(data == 'AS') {
						color = '#000000';
						background_color = '#c0d8ff';
						text = '배정';
					} else if(data == 'CF') {
						color = '#ffffff';
						background_color = '#5794f2';
						text = '계획확정';
					} else if(data == 'WO') {
						color = '#ffffff';
						background_color = '#73bf69';
						text = '작지생성';
					} else if(data == 'ST') {
						color = '#ffffff';
						background_color = '#f2495c';
						text = '중지';
					} else {
						color = '#000000';
						background_color = '#ccccdc';
						text = '';
					}
					return '<div style="background-color: '+background_color+'; color: '+color+'; width: 100%; border-radius: 3px;">'+text+'</div>';
				}
			},
			{ data : 'planEquipNm', className : 'text-center' },
			{ data : 'contDtlNo', className : 'text-center' },
			{ data : 'dealCorpNm', className : 'text-center' },
			{ data : 'itemNm', className : 'text-center' },
			{ data : 'dtlOrdCnt', className : 'text-right',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			},
			{ data : 'readyTime', className : 'text-right',
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return addCommas(parseFloat(data))+'분';
					} else {
						return '-';
					}
				}
			},
			{ data : 'processTime', className : 'text-right',
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return addCommas(parseFloat(data))+'분';
					} else {
						return '-';
					}
				}
			},
			{ className : 'text-right',
				render : function(data, type, row, meta) {
					let dtlOrdCnt = parseInt(row['dtlOrdCnt']);
					let readyTime = parseInt(row['readyTime']);
					let processTime = parseInt(row['processTime']);
					let workTime = readyTime + (dtlOrdCnt * processTime);

					if(row['readyTime'] != '' && row['readyTime'] != null && row['processTime'] != '' && row['processTime'] != null) {
						return addCommas(parseFloat(workTime))+'분';
					} else {
						return '-';
					}
				}
			},
			{ data : 'planStartDate', className : 'text-center',
				render : function(data, type, row, meta) {
					if(data != null && data != '') {
						return moment(data, 'YYYYMMDDHHmm').format('YYYY.MM.DD HH:mm');
					} else {
						return '-';
					}
				}
			},
			{ data : 'planEndDate', className : 'text-center',
				render : function(data, type, row, meta) {
					if(data != null && data != '') {
						return moment(data, 'YYYYMMDDHHmm').format('YYYY.MM.DD HH:mm');
					} else {
						return '-';
					}
				}
			},
		],
		columnDefs : [],
		buttons : [],
		order : []
	});

	// 조회 버튼 click
	$('#btnSearchApsTable').on('click', function() {
		apsListByDateTable.ajax.reload();
	});

	// 확대/축소 버튼 click
	$('#btnZoom').on('change', function() {
		// 확대
		if($(this).prop('checked')) {
			$('#apsPlanTable').find('.dragableModule').css('height','15px');
			$('#apsPlanTable').find('.dragableModule').children().hide();
		} else { // 축소
			$('#apsPlanTable').find('.dragableModule').css('height','');
			$('#apsPlanTable').find('.dragableModule').children().show();
		}
		jqSimpleConnect.repaintAll(); // 전체 연결선 재구성
	});
	
	// 휠 스크롤 확대축소할 때 datatable draw해서 깨지는 현상 복구 처리
    $(window).on('resize', function(event){
    	jqSimpleConnect.repaintAll(); // 전체 연결선 재구성
    });

    $('#right').on('scroll', function() {
    	jqSimpleConnect.repaintAll(); // 전체 연결선 재구성
    });
    
</script>
</body>
</html>