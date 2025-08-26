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
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">공정정보관리(봉제조립)</li>
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
					<div class="table-responsive">
						<table id="prcssCodeAdmTable" class="table table-bordered">
							<thead class="thead-light">
								<!--==========table thead 추가==========-->
								<tr>
									<th>공정코드</th>
									<th>공정명</th>
									<th>관리기준1(공실)</th>
									<th>관리기준2(설비)</th>
									<th>관리기준3(품질)</th>
									<th>주석(공정설명)</th>
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
				<div class="card" id="formBox">

					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>
						<button type="button" class="btn btn-primary float-right"
							id="btnEdit">수정</button>
						<button class="btn btn-warning d-none" id="btnEditConfirmLoading"
							type="button" disabled="">
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
						<button type="button" class="btn btn-primary float-right mr-1"
							id="btnAdd">등록</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled="">
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
					</div>

					<form id="form">
						<div class="table-responsive">
							<table class="table table-lg table-bordered mb-2" id="">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>*공정코드</th>
									<td><input type="text" class="form-control" id="prcssCd"
										name="prcssCd" disabled></td>
									<th>*구분</th>
									<td><select class="custom-select" id="prcssGubun"></select></td>
								</tr>
								<tr>
									<th>*공정명</th>
									<td><input type="text" class="form-control" id="prcssNm"
										name="prccNm" maxlength="25"></td>
									<th>이니셜</th>
									<td><input type="text" class="form-control"
										id="prcssInitial" name="prcssInitial" maxlength="3"></td>

								</tr>
								<tr>
									<th>*외주공정여부</th>
									<td><select class="custom-select" id="osrcYn"></select></td>
									<th>설비1</th>
									<td>
										<div class="row">
											<div class="input-sub m-0" style="width: 80%">
												<input type="hidden" class="form-control" id="equipCd1"
													name="equipCd1" disabled> <input type="text"
													class="form-control" id="equipNm1" name="equipNm1" disabled>

												<button type="button"
													class="btn btn-primary input-sub-search" id="btnEquipCd1"
													name="btnEquipCd" onClick="selectEquipCd(1)" disabled>
													<span class="oi oi-magnifying-glass"></span>
												</button>

											</div>
											<div class="rightsidebar-close" style="width: 10%;">
												<button type="button" class="btn" id="closePrcssGubunBtn1"
													onClick="equipDelete(1)" disabled>
													<i class="mdi mdi-close"></i>
												</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>설비2</th>
									<td>
										<div class="row">
											<div class="input-sub m-0" style="width: 80%">
												<input type="hidden" class="form-control" id="equipCd2"
													name="equipCd2" disabled> <input type="text"
													class="form-control" id="equipNm2" name="equipNm2" disabled>

												<button type="button"
													class="btn btn-primary input-sub-search" id="btnEquipCd2"
													name="btnEquipCd" onClick="selectEquipCd(2)" disabled>
													<span class="oi oi-magnifying-glass"></span>
												</button>

											</div>
											<div class="rightsidebar-close" style="width: 10%;">
												<button type="button" class="btn" id="closePrcssGubunBtn2"
													onClick="equipDelete(2)">
													<i class="mdi mdi-close"></i>
												</button>
											</div>
										</div>
									</td>
									<th>설비3</th>
									<td>
										<div class="row">
											<div class="input-sub m-0" style="width: 80%">
												<input type="hidden" class="form-control" id="equipCd3"
													name="equipCd3" disabled> <input type="text"
													class="form-control" id="equipNm3" name="equipNm3" disabled>

												<button type="button"
													class="btn btn-primary input-sub-search" id="btnEquipCd3"
													name="btnEquipCd" onClick="selectEquipCd(3)" disabled>
													<span class="oi oi-magnifying-glass"></span>
												</button>

											</div>
											<div class="rightsidebar-close" style="width: 10%;">
												<button type="button" class="btn" id="closePrcssGubunBtn3"
													onClick="equipDelete(3);">
													<i class="mdi mdi-close"></i>
												</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>설비4</th>
									<td>
										<div class="row">
											<div class="input-sub m-0" style="width: 80%">
												<input type="hidden" class="form-control" id="equipCd4"
													name="equipCd4" disabled> <input type="text"
													class="form-control" id="equipNm4" name="equipNm4" disabled>

												<button type="button"
													class="btn btn-primary input-sub-search" id="btnEquipCd4"
													name="btnEquipCd" onClick="selectEquipCd(4)" disabled>
													<span class="oi oi-magnifying-glass"></span>
												</button>

											</div>
											<div class="rightsidebar-close" style="width: 10%;">
												<button type="button" class="btn" id="closePrcssGubunBtn4"
													onClick="equipDelete(4)">
													<i class="mdi mdi-close"></i>
												</button>
											</div>
										</div>
									</td>
									<th>설비5</th>
									<td>
										<div class="row">
											<div class="input-sub m-0" style="width: 80%">
												<input type="hidden" class="form-control" id="equipCd5"
													name="equipCd5" disabled> <input type="text"
													class="form-control" id="equipNm5" name="equipNm5" disabled>

												<button type="button"
													class="btn btn-primary input-sub-search" id="btnEquipCd5"
													name="btnEquipCd" onClick="selectEquipCd(5)" disabled>
													<span class="oi oi-magnifying-glass"></span>
												</button>

											</div>
											<div class="rightsidebar-close" style="width: 10%;">
												<button type="button" class="btn" id="closePrcssGubunBtn5"
													onClick="equipDelete(5)">
													<i class="mdi mdi-close"></i>
												</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>*사용여부</th>
									<td><select class="custom-select" id="useYn"></select></td>
									<th>비고</th>
									<td><input type="text" class="form-control" id="prcssDesc"
										name="prcssDesc" maxlength="56"></td>
								</tr>
							</table>
							
							<div class="card-body col-sm-12">
							<button type="button" class="btn btn-warning float-right mr-1 disabled"
									id="btnDtlDel">삭제</button>
								<button class="btn btn-warning d-none" id="btnDelConfirmLoading"
									type="button" disabled="">
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1 disabled"
									id="btnDtlEdit">수정</button>
								<button class="btn btn-warning d-none" id="btnEditConfirmLoading"
									type="button" disabled="">
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1 disabled"
									id="btnDtlAdd">추가</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled="">
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
							</div>
					
							<table id="baseInfoFtTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="30%">
								<col width="30%">
								<col width="30%">
							</colgroup>
							<thead class="thead-light">
								<!--==========table thead 추가==========-->
								<tr>
									<th>순번</th>
									<th>불량코드</th>
									<th>불량내용</th>
									<th>비고</th>
								</tr>
							</thead>
						</table>
						</div>
					</form>
				</div>

				<div class="mt-2">
					<button type="button" class="btn btn-primary d-none float-right"
						id="btnSave">저장</button>
					<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
						type="button" disabled="">
						<span class="spinner-border spinner-border-sm" role="status"
							aria-hidden="true"></span> 처리중
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

<%@include file="../layout/bottom.jsp" %>

<script>
	// let currentPage = 'dealCorp';

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

	let currentHref = "bmsc0040";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","공정정보관리(봉제조립)"); 
	
	let sideView = 'add';

	//구분공통코드
	var prcssGubunCode = new Array();
	<c:forEach items="${prcssGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	prcssGubunCode.push(json);
	</c:forEach>

	//외주공정여부코공통코드
	var osrcYnCode = new Array();
	<c:forEach items="${osrcYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	osrcYnCode.push(json);
	</c:forEach>

	//사용여부공통코드
	var useYnCode = new Array();
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnEdit').attr('disabled', false); // 수정버튼
		$('#btnDtlAdd').addClass('disabled'); 
		$('#btnDtlEdit').addClass('disabled'); 
		$('#btnDtlDel').addClass('disabled'); 
		$('#baseInfoFtTable').DataTable().ajax.reload(function() {});
	});

	//선택박스 처리
	selectBoxAppend(prcssGubunCode, "prcssGubun", "", "");
	selectBoxAppend(osrcYnCode, "osrcYn", 002, "");
	selectBoxAppend(useYnCode, "useYn", "", "");

	uiProc(true);

	// 목록
	let prcssCodeAdmTable = $('#prcssCodeAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/prcssCodeAdmList"/>',
			type : 'GET',
			data : {},
		},
		rowId : 'prcssCd',
		columns : [ {
			data : 'prcssCd'
		}, {
			data : 'prcssNm',
			'className' : 'text-center'
		}, {
			data : 'prcssStand1'
		}, {
			data : 'prcssStand2',
			'className' : 'text-center'
		}, {
			data : 'prcssStand3',
			'className' : 'text-center'
		}, {
			data : 'prcssDesc'
		} ],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '공정정보관리(봉제조립)'
		}, 'print' ],
	});

	
	// 보기
	$('#prcssCodeAdmTable tbody').on('click','tr',function() {

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#prcssCodeAdmTable').DataTable()
					.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		$('#info').tab('show');

		prcssCd = prcssCodeAdmTable.row(this).data().prcssCd;

		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#btnEdit').attr('disabled', false); // 저장버튼

		$.ajax({
			url : '<c:url value="/bm/prcssCodeAdmRead"/>',
			type : 'GET',
			data : {
				'prcssCd' : prcssCd,
			},
			success : function(res) {
				let data = res.data;

				if (res.result == 'ok') {
					sideView = 'edit';

					$('#prcssCd').val(data.prcssCd);
					$('#prcssNm').val(data.prcssNm);
					$('#prcssInitial').val(data.prcssInitial);
					$('#equipCd1').val(data.equipCd1);
					$('#equipCd2').val(data.equipCd2);
					$('#equipCd3').val(data.equipCd3);
					$('#equipCd4').val(data.equipCd4);
					$('#equipCd5').val(data.equipCd5);

					$('#equipNm1').val(data.equipNm1);
					$('#equipNm2').val(data.equipNm2);
					$('#equipNm3').val(data.equipNm3);
					$('#equipNm4').val(data.equipNm4);
					$('#equipNm5').val(data.equipNm5);

					$('#prcssDesc').val(data.prcssDesc);

					uiProc(true);

					//선택박스 처리
					selectBoxAppend(prcssGubunCode,
							"prcssGubun", data.prcssGubun, "");
					selectBoxAppend(osrcYnCode, "osrcYn",
							data.osrcYn, "");
					selectBoxAppend(useYnCode, "useYn",
							data.useYn, "");
				} else {
					toastr.error(res.message);
				}
			}
		});

		$('#baseInfoFtTable').DataTable().ajax.reload(function(){});
	});

	let baseInfoFtTable = $('#baseInfoFtTable').DataTable({
		dom : "",
		language : lang_kor,
		paging : true,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="bm/baseInfoFtList"/>',
			type : 'GET',
			data : {
				'baseInfoGubun' : '003',
				'etc3' : function(){return prcssCd;},
				},
		},
		rowId : 'prcssCd',
		columns : [ {
			render : function(data, type, row, meta){
					return meta.row+1;
			},
			"className" : "text-center" 
		}, {
			data : 'baseInfoCd',
			render : function(data, type, row, meta){
				if(data!=null){
					return '<input type="text" class="form-control" style="border:none; max-width:100%;" name="baseInfoCd" value="'+data+'" disabled>';		
				} else{
					return '<input type="text" class="form-control" style="max-width:100%;" name="baseInfoCd" value="">';
				}	
			}
		}, {
			data : 'baseInfoNm',
			render : function(data, type, row, meta){
				if(data!=null){
					return '<input type="text" class="form-control" style="border:none; max-width:100%;" name="baseInfoNm" value="'+data+'" disabled>';		
				} else{
					return '<input type="text" class="form-control" style="max-width:100%;" name="baseInfoNm" value="">';
				}	
			}
		}, {
			data : 'baseInfoDesc',
			render : function(data, type, row, meta){
				if(data!=null){
					return '<input type="text" class="form-control" style="border:none; max-width:100%;" name="baseInfoDesc" value="'+data+'" disabled>';		
				} else{
					return '<input type="text" class="form-control" style="max-width:100%;" name="baseInfoDesc" value="">';
				}	
			}
		}],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '공정정보관리(봉제조립)'
		}, 'print' ],
	});

	$('#baseInfoFtTable tbody').on('click','tr',function(e){
		btnView = "edit";
    	
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#baseInfoFtTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#baseInfoFtTable').DataTable().row(this).index();
	});

	

	$('#btnDtlAdd').on('click',function(){
		$('#baseInfoFtTable').DataTable().row.add({}).draw(false);
	})
	
	$('#btnDtlEdit').on('click',function(){

		if(btnView!="edit"){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		$('input[name=monPriCont]').eq(tableIdx).attr('disabled',false);
	});

	$('#btnDtlDel').on('click',function(){
		if(btnView!="edit"){
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		$('#baseInfoFtTable').DataTable().rows(tableIdx).remove().draw();
	});
	
	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#form').each(function() {
			this.reset();
		});

		$('#baseInfoFtTable').DataTable().clear().draw();

		uiProc(false);

		//코드값 가져오기
		$.ajax({
			url : '<c:url value="bm/getPrcssCodeSeqCd"/>',
			type : 'GET',
			data : {},
			success : function(res) {
				prcssCd = res.seq;
				$('#prcssCd').val(prcssCd);
			}
		});

		//선택박스 처리
		selectBoxAppend(prcssGubunCode, "prcssGubun", "", "");
		selectBoxAppend(osrcYnCode, "osrcYn", 002, "");
		selectBoxAppend(useYnCode, "useYn", "", "");

		$('#btnEdit').attr('disabled', true); // 수정버튼
		$('#btnSave').removeClass('d-none'); // 등록버튼
		$('#btnDtlAdd').removeClass('disabled'); 
		$('#btnDtlEdit').removeClass('disabled'); 
		$('#btnDtlDel').removeClass('disabled'); 
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		uiProc(false);
		$('#btnSave').removeClass('d-none');
		$("#inspect").removeClass('disabled');
		$('#btnDtlAdd').removeClass('disabled'); 
		$('#btnDtlEdit').removeClass('disabled'); 
		$('#btnDtlDel').removeClass('disabled'); 
	});

	// 저장 처리
	$('#btnSave').on('click', function() {

		var check=true;
		var dataArray = new Array();

		if ($("#prcssGubun option:selected").val() == "") {
			toastr.warning('구분을 선택해주세요.');
			$('#prcssGubun').focus();
			return false;
		}
		
		if ($("#prcssNm").val() == "") {
			toastr.warning('공정명을 입력해주세요.');
			$('#prcssNm').focus();
			return false;
		}
		if ($("#osrcYn option:selected").val() == "") {
			toastr.warning('외주공정여부를 선택해주세요.');
			$('#osrcYn').focus();
			return false;
		}
		if ($("#useYn option:selected").val() == "") {
			toastr.warning('사용여부를 선택해주세요.');
			$('#useYn').focus();
			return false;
		}

		$('#baseInfoFtTable tbody tr').each(function(index,item){
			
			var rowData = new Object();
			
			rowData.prcssCd = $('#prcssCd').val();
			rowData.prcssGubun = $("#prcssGubun option:selected").val();
			rowData.prcssNm = $("#prcssNm").val();
			rowData.prcssInitial = $('#prcssInitial').val();
			rowData.osrcYn = $("#osrcYn option:selected").val();
			rowData.equipCd1 = $("#equipCd1").val();
			rowData.equipCd2 = $("#equipCd2").val();
			rowData.equipCd3 = $("#equipCd3").val();
			rowData.equipCd4 = $("#equipCd4").val();
			rowData.equipCd5 = $("#equipCd5").val();
			rowData.prcssDesc =  $('#prcssDesc').val();
			rowData.useYn =  $("#useYn option:selected").val();

			var baseInfoCdValue =  $(this).find('td input[name=baseInfoCd]').val();
			rowData.baseInfoCd = baseInfoCdValue==null?"":baseInfoCdValue;
			rowData.baseInfoNm = $(this).find('td input[name=baseInfoNm]').val();
			rowData.baseInfoDesc = $(this).find('td input[name=baseInfoDesc]').val();
			
			dataArray.push(rowData);
	        console.log(rowData);
			
		});
		
		var url = '/bm/prcssCodeAdmCreate';
		if (sideView == "edit") {
			url = '/bm/prcssCodeAdmUpdate'
		}
		$.ajax({
			url : url,
			type : 'POST',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function() {

			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					$('#prcssCodeAdmTable').DataTable().ajax.reload(function() {});
					$('#baseInfoFtTable').DataTable().ajax.reload(function() {});
					
					uiProc(true);
					$('#btnSave').addClass('d-none');
					$('#btnEdit').attr('disabled', false);
					$('#btnDtlAdd').addClass('disabled'); 
					$('#btnDtlEdit').addClass('disabled'); 
					$('#btnDtlDel').addClass('disabled'); 
					
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else if (sideView == "add") {
						toastr.success('등록되었습니다.');
					}

					sideView = 'edit';
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
			}
		});
	});

	//설비코드 팝업창
	var equipPopUpTable2;
	var value = "";
	function selectEquipCd(value) {
		console.log('value=' + value);
		equipPopUpTable2 = $('#equipPopUpTable2').DataTable({
			dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>",
			language : lang_kor,
			destroy : true,
			paging : false,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			lengthChange : false,
// 			scrollY: '20vh',
// 			pageLength : 20,
			ajax : {
				url : '<c:url value="bm/equipCodeAdmList"/>',
				type : 'GET',
				data : {
					'value' : 'Y'
				},
			},
			rowId : '',
			columns : [ {
				data : 'equipCd'
			}, {
				data : 'equipNm'
			}, {
				data : 'equipModelNm'
			}, {
				data : 'mfcCorpNm'
			}, {
				data : 'useYn'
			}, ],
			columnDefs : [ {
				"className" : "text-center",
				"targets" : "_all"
			}, ],
			order : [ [ 0, 'asc' ] ],
		});

		$('#equipPopUpTable2 tbody').on('click', 'tr', function() {
			var data = equipPopUpTable2.row(this).data();

			if (value == '1') {
				$('#equipCd1').val(data.equipCd);
				$('#equipNm1').val(data.equipNm);
			}
			if (value == '2') {
				$('#equipCd2').val(data.equipCd);
				$('#equipNm2').val(data.equipNm);
			}
			if (value == '3') {
				$('#equipCd3').val(data.equipCd);
				$('#equipNm3').val(data.equipNm);
			}
			if (value == '4') {
				$('#equipCd4').val(data.equipCd);
				$('#equipNm4').val(data.equipNm);
			}
			if (value == '5') {
				$('#equipCd5').val(data.equipCd);
				$('#equipNm5').val(data.equipNm);
			}

			$('#equipPopUpModal2').modal('hide');
			value = "";

		});

		$('#equipPopUpModal2').modal('show');

	}

	function equipDelete(value) {
		$('#equipCd' + value).val(null);
		$('#equipNm' + value).val("");
	}

	function uiProc(flag) {
		$("#prcssNm").attr("disabled", flag);
		$("#prcssGubun").attr("disabled", flag);
		$("#prcssInitial").attr("disabled", flag);
		$("#osrcYn").attr("disabled", flag);
		$("#prcssDesc").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);

		$('button[name=btnEquipCd]').attr("disabled", flag);
		$('#closePrcssGubunBtn1').attr('disabled', flag);
		$('#closePrcssGubunBtn2').attr('disabled', flag);
		$('#closePrcssGubunBtn3').attr('disabled', flag);
		$('#closePrcssGubunBtn4').attr('disabled', flag);
		$('#closePrcssGubunBtn5').attr('disabled', flag);

	}
</script>

</body>
</html>
