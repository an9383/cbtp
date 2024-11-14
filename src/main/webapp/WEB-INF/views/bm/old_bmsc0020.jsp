<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>

<%@include file="../layout/body-top.jsp"%>

<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">공정정보(소공정)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 59%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="baseInfoBoTable" class="table table-bordered">
							<colgroup>
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>공정코드</th>
									<th>공정명</th>
									<th>약칭</th>
									<th>사용여부</th>
									<th>비고</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 40%;">
				<div class="card mb-2" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 p-1">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>
						<button type="button" class="btn btn-primary float-right"
							id="btnEdit">수정</button>
						<button class="btn btn-warning d-none" id="btnEditConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span>처리중
						</button>
						<button type="button" class="btn btn-primary float-right mr-1"
							id="btnAdd">등록</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<form id="form">
						<div class="table-responsive">
							<table class="table table-lg table-bordered mb-2">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>*공정코드</th>
									<td><input type="text" class="form-control"
										id="baseInfoCd" name="baseInfoCd" disabled></td>
									<th>약칭</th>
									<td colspan='3'><input type="text" class="form-control"
										style="max-width: 100%" id="etc1" name="etc1"></td>
								</tr>
								<tr>
									<th>공정명</th>
									<td><input type="text" class="form-control"
										id="baseInfoNm" name="baseInfoNm"></td>
									<th>*사용여부</th>
									<td><select class="custom-select" id="useYn" name="useYn"></select></td>									
								</tr>
								<tr>
									<th>비고</th>
									<td><input type="text" class="form-control"
										id="baseInfoDesc" name="baseInfoDesc"></td>
									<th></th>
									<td></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
				<div class="mt-2">
					<button type="button" class="btn btn-primary d-none float-right"
						id="btnSave">저장</button>
					<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
						type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status"
							aria-hidden="true"></span>처리중
					</button>
				</div>
			</div>
			<!-- ===/.right-sidebar 등록,수정===  -->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp"%>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "59%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let currentHref = "bmsc0020";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	let viewIdx;
	let sideView = 'add';
	uiProc(true);

	//공통코드 처리 시작      
	var useYnCode = new Array(); // 상태여부

	<c:forEach items="${useYn}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	useYnCode.push(json1);
	</c:forEach>
	//공통코드 처리 종료   

	//선택박스 처리
	selectBoxAppend(useYnCode, "useYn", useYn, "");

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#btnSave').addClass('d-none');
	});

	$("#dealCorpNm").attr("disabled", true);

	// 목록
	let baseInfoBoTable = $('#baseInfoBoTable')
			.DataTable(
					{
						dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
								+ "<'row'<'col-sm-12'tr>>"
								+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
						language : lang_kor,
						paging : true,
						info : true,
						ordering : true,
						processing : true,
						autoWidth : false,
						lengthChange : false,
						pageLength : 20,
						ajax : {
							url : '<c:url value="/baseInfoBoList"/>',
							type : 'GET',
							data : {},
						},
						rowId : 'baseInfoSeq',
						columns : [ {
							data : 'baseInfoCd'
						}, {
							data : 'baseInfoNm'
						}, {
							data : 'etc1'
						}, {
							data : 'useYnNm'
						}, {
							data : 'baseInfoDesc'
						}, ],
						order : [ [ 0, 'asc' ] ],
						buttons : [ 'copy', {
							extend : 'excel',
							title : '검사항목'
						}, 'print' ],
					});
	// 보기
	$('#baseInfoBoTable tbody')
			.on(
					'click',
					'tr',
					function() {

						if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
							$('#saveBtnModal').modal('show');
							console.log("등록중입니다.");
							return false;
						}

						if ($(this).hasClass('selected')) {
							//$(this).removeClass('selected');
						} else {
							$('#baseInfoBoTable').DataTable().$('tr.selected')
									.removeClass('selected');
							$(this).addClass('selected');
						}

						baseInfoType = baseInfoBoTable.row(this).data().baseInfoType;
						baseInfoSeq = baseInfoBoTable.row(this).data().baseInfoSeq;
						$('#formBox').removeClass('d-none');
						$('#btnSave').addClass('d-none'); // 저장버튼
						$('#btnEdit').attr('disabled', false); //수정버튼
						//선택 행 데이터 불러오기
						$.ajax({
							url : '<c:url value="/bm/baseInfoBoRead"/>',
							type : 'GET',
							data : {
								'baseInfoType' : baseInfoType,
								'baseInfoSeq' : baseInfoSeq
							},
							success : function(res) {
								let data = res.data;
								sideView = 'edit';

								$('#form input[name="baseInfoDesc"]').val(
										data.baseInfoDesc);
								$('#form input[name="baseInfoCd"]').val(
										data.baseInfoCd);
								$('#form input[name="baseInfoNm"]').val(
										data.baseInfoNm);
								$('#form input[name="useYn"]').val(data.useYn);
								$('#form input[name="etc1"]').val(data.etc1);

								//선택박스 처리
								selectBoxAppend(useYnCode, "useYn", data.useYn,	"");
							}
						});
					});

	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#form').each(function() {
			this.reset();
		});

		$.ajax({
			url : '<c:url value="/bm/baseInfoBoSeq"/>',
			type : 'POST',
			data : {},
			success : function(res) {

				$('#form input[name="baseInfoCd"]').val(res.boSeq);
			}
		});
		//설비코드 중복체크
		/* $('#equipCdCheck').val("false"); */
		$('#btnCheck').attr("disabled", false);
		//화면처리        
		uiProc(false);

		//선택박스처리\
		
		$('#useYn option[value="001"]').attr('selected', 'selected');

		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
		$('#btnEdit').attr('disabled', true); //수정버튼
		$('#btnSave').removeClass('d-none'); // 등록버튼
	});

	// 저장 처리
	$('#btnSave').on('click', function() {

		//입력값 검사
		if (!$.trim($('#etc1').val())) {
			toastr.error('약칭을 입력해주세요.');
			$('#etc1').focus();
			return false;
		}

		if (!$.trim($('#baseInfoNm').val())) {
			toastr.error('공정명을 입력해주세요.');
			$('#baseInfoNm').focus();
			return false;
		}

		var url = '<c:url value="/bm/baseInfoBoCreate"/>';

		if (sideView == "edit") {
			url = '<c:url value="/bm/baseInfoBoUpdate"/>';
		}

		else {
			baseInfoSeq = "";
		}

		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'baseInfoSeq' : baseInfoSeq,
				'baseInfoType' : 'BO',
				'baseInfoCd' : $('#baseInfoCd').val(),
				'baseInfoNm' : $('#baseInfoNm').val(),
				'useYn' : $('#useYn option:selected').val(),
				'etc1' : $('#etc1').val(),
				'baseInfoDesc' : $('#baseInfoDesc').val(),
			},
			/* 			beforeSend : function() {
			 // $('#btnAddConfirm').addClass('d-none');
			 }, */
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					$('#baseInfoBoTable').DataTable().ajax.reload(function() {
					});
					uiProc(true);
					$('#btnSave').addClass('d-none');
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
					}
					sideView = 'edit';
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#baseInfoBoTable').DataTable().ajax.reload();
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
				$('#btnSelDealCorp').attr('disabled', true);
			}
		});
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.error("수정할 목록을 선택해 주세요!");
			return false;
		}
		uiProc(false);
		//수정관련 기능(검사코드는 수정 불가)

		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
		$('#btnSave').removeClass('d-none');
	});

	function uiProc(flag) {
		$("#baseInfoDesc").attr("disabled", flag);
		$("#baseInfoNm").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);
		$("#etc1").attr("disabled", flag);
	}
</script>

</body>
</html>
