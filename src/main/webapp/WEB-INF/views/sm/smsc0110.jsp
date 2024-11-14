<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp"%>

<div class="page-wrapper" id="page-wrapper">

	<!-- Modal Start-->
	<div class="modal fade" id="layerPopUpModal" tabindex="-1"
		role="dialog" aria-labelledby="layerPopUpLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="layerPopUpLabel"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<hr class="text-secondary">
					<table class="table table-sm table-bordered" id="layerPopUpTable">
					</table>
					<hr class="text-secondary">
				</div>
				<div class="modal-footer">
					<input type="hidden" class="form-control" id="puFlag" name="puFlag">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="layerPopUpSave">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End-->

	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">공통코드관리(관리자)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-30" id="left-30" style="width: 28%;">
				<div class="card">
					<div class="table-responsive">
						<table class="table table-bordered" id="commonGroupCd">
							<thead class="thead-light">
								<tr>
									<th style="width: 20px" id="baseGroupType">구분</th>
									<th style="width: 20px" id="useYn">사용여부</th>
									<th style="width: 20px" id="baseGroupCd">코드</th>
									<th style="width: 100px" id="baseGroupNm">공통그룹명</th>
									<th style="width: 20px" id="baseGroupAbbr">약칭</th>
									<th style="width: 20px" id="baseGroupDesc">비고</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->


			<div class="right-list right-70" id="myrSidenav" style="width: 71%;">
				<div class="card" id="formBox">
					<form id="form">
						<div class="table-responsive">
							<table class="table table-bordered" id="systemCommonCd">
								<thead class="thead-light">
									<tr>
										<th style="width: 70px">사용여무</th>
										<th style="width: 50px">코드</th>
										<th style="width: 80px">코드명</th>
										<th style="width: 40px">약칭</th>
										<th style="width: 50px">체크1</th>
										<th style="width: 50px">체크2</th>
										<th style="width: 50px">체크3</th>
										<th style="width: 50px">비고</th>
									</tr>
								</thead>
							</table>
						</div>
					</form>
				</div>
				<!--// 등록, 수정 -->
			</div>
			<!-- .right-sidebar -->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp"%>

<script>

	let currentHref = "smsc0110";
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass( 'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","공통코드관리(관리자)");

	let baseGroupTypeVal = '';
	//코드 유형 처리 시작
	var groupType = new Array(); 
 	var Json1 = new Object();
	Json1.baseCd = "N";
	Json1.baseNm = "일반코드";
	groupType.push(Json1);

	var Json2 = new Object();
	Json2.baseCd = "S";
	Json2.baseNm = "시스템코드";
	groupType.push(Json2); 
	//코드 유형 처리 종료

	//공통코드 처리 시작   	
	var useYnCode = new Array(); // 상태여부
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>
	//공통코드 처리 종료    	

	//시스템공통그룹 목록조회
	let commonGroupCd = $('#commonGroupCd').DataTable( {
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		pageLength : 20,
		scrollY : '65vh',
		ajax : {
			url : '<c:url value="/bm/commonGroupList"/>',
			type : 'GET',
			data : {
				'baseGroupType'	:	function(){return baseGroupTypeVal;},
			},
		},
		columns : [
			{//구분
				data : 'baseGroupType' ,
				render : function(data,type,row,meta){
					if(data!=null){
						if(data=="N"){
							return '일반';
						}else{
							return '시스템';
						}
					}else{
						return '-';
					}
				}
			},
			{//사용여부
				data : 'useYnNm'
			},
			{//코드
				data : 'baseGroupCd'
			},
			{//공통그룹명
				data : 'baseGroupNm'
			},
			{//약칭
				data : 'baseGroupAbbr'
			},
			{//비고
				data : 'baseGroupDesc'
			}
		],
		order: [
			[ 1, 'asc' ],
		],
		buttons: [],
		drawCallback : function( settings ) {
	        $('input[type=search]').attr("style", "width:120px;");
		}
	});

	var htmlGroup = '<button class="btn btn-primary float-left mr-1" type="button" id="baseGroupAdd">그룹등록</button>&nbsp;';
	htmlGroup += '<button class="btn btn-warning float-left mr-1" type="button" id="baseGroupEdit">그룹수정</button>';
	htmlGroup += '<button class="btn btn-danger float-left" type="button" id="baseGroupDel">그룹삭제</button>';
	$('#commonGroupCd_length').html(htmlGroup);

	//시스템공통코드 목록조회
	var baseGroupCd = "0";
	let systemCommonCd = $('#systemCommonCd') .DataTable( {
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		pageLength : 20,
		scrollY : '65vh',
		ajax : {
			url : '<c:url value="/bm/commonCodeList"/>',
			type : 'GET',
			data : {
				'baseGroupCd' : function(){ return baseGroupCd; }
			},
		},
		columns : [
			{//사용여무
				data : 'useYnNm',
				'className' : 'text-center'
			},
			{//코드
				data : 'baseCd',
				'className' : 'text-center'
			},
			{//코드명
				data : 'baseNm',
				'className' : 'text-center'
			},
			{//약칭
				data : 'baseAbbr',
				'className' : 'text-center'
			},
			{//체크1
				data : 'etc1',
				'className' : 'text-center'
			},
			{//체크2
				data : 'etc2',
				'className' : 'text-center'
			},
			{//체크3
				data : 'etc3',
				'className' : 'text-center'
			},
			{//비고
				data : 'baseDesc',
				'className' : 'text-center'
			}
		],
		order: [
			[ 1, 'asc' ],
		],
		buttons: [],
	});
	
	var htmlCd = '<button class="btn btn-primary float-left mr-1" type="button" id="baseCdAdd">상세등록</button>&nbsp;';
	htmlCd += '<button class="btn btn-warning float-left mr-1" type="button" id="baseCdEdit">상세수정</button>';
	htmlCd += '<button class="btn btn-danger float-left mr-1" type="button" id="baseCdDel">상세삭제</button>';
	$('#systemCommonCd_length').html(htmlCd);

	//공통그룹코드 등록하기 
	$('#baseGroupAdd').click(function() {
		
		addHtml("groupCdAdd", "");
		selectBoxAppend(useYnCode, "puUseYn", "", "2");
		$('#puUseYn option[value="001"]').attr('selected', 'selected');
		selectBoxAppend(groupType, "puBaseGroupType", "", "2");
		$('#puBaseGroupType option[value="N"]').attr('selected', 'selected');
		$('#layerPopUpLabel').text('공통코드등록');
		$('#layerPopUpSave').text('저장');
		
		//기초그룹코드 조회
		$.ajax({
			url : '<c:url value="/bm/commonGroupSeq"/>',
			type : 'GET',
			success : function(res) {
				let data = res.data;
				let message = res.message;
				if (res.result == 'ok') {
					$('#puBaseGroupCd').val(data.baseGroupCd);
				} else if (res.result == 'fail') {
					toastr.error(message);
				}
			}
		});
		$('#layerPopUpModal').modal('show');

	});

	//공통그룹코드 수정하기 
	$('#baseGroupEdit').click(
		function() {
			var data = commonGroupCd.row('.selected').data();
			if (data == null || data == undefined) {
				toastr.warning("수정할 공통그룹코드들 선택해 주세요.");
			} else {
				addHtml("groupCdEdit", data);
				$('#puBaseGroupCd').val(data.baseGroupCd);
				$('#puBaseGroupNm').val(data.baseGroupNm);
				$('#puBaseGroupCd').attr("disabled", true);
				selectBoxAppend(useYnCode, "puUseYn", data.useYn, "");
				selectBoxAppend(groupType, "puBaseGroupType",data.baseGroupType, "");
				$('#layerPopUpLabel').text('공통코드수정');
				$('#layerPopUpSave').text('저장');
				$('#layerPopUpModal').modal('show');
			}
	});
	
	//공통그룹코드 삭제하기 
	$('#baseGroupDel').click(
		function() {
			var data = commonGroupCd.row('.selected').data();
			if (data == null || data == undefined) {
				toastr.warning("삭제할 공통그룹코드들 선택해 주세요.");
			} else {
				addHtml("groupCdDel", data);
				$('#puBaseGroupCd').val(data.baseGroupCd);
				$('#puBaseGroupNm').val(data.baseGroupNm);
				$('#puBaseGroupCd').attr("disabled", true);
				selectBoxAppend(useYnCode, "puUseYn", data.useYn, "");
				selectBoxAppend(groupType, "puBaseGroupType",data.baseGroupType, "");
				$('#layerPopUpLabel').text('공통코드삭제');
				$('#layerPopUpSave').text('삭제');
				$('#layerPopUpModal').modal('show');
			}
	});

	//그룹코드 등록하기 
	$('#baseCdAdd').click(function() {
		let data = commonGroupCd.row('.selected').data();
		
		if ( data == null || data == undefined ) {
			toastr.warning("등록할 그룹코드를 먼저 선택해 주세요.");
		} else {
			addHtml("cdAdd");
			$('#puBaseGroupCd').val(data.baseGroupCd);
			selectBoxAppend(useYnCode, "puUseYn", "", "2");
			$('#puUseYn option[value="001"]').attr('selected', 'selected'); //value값이 001에 선택되어져야 한다
			$('#layerPopUpLabel').text('코드등록');
			$('#layerPopUpSave').text('저장');

			if (data.baseGroupType == 'N') {
				$('#puBaseCd').attr('disabled', true);
				//기초코드상세 코드 조회
				$.ajax({
					url : '<c:url value="/bm/commonCodeSeq"/>',
					type : 'GET',
					async : false,
					data : {
						'baseGroupCd' : baseGroupCd
					},
					success : function(res) {
						let data = res.data;
						let message = res.message;
						if (res.result == 'ok') {
							$('#puBaseCd').val(data.baseCd);
							$('#puBaseCdBefore').val(data.baseCd);
						} else if (res.result == 'error') {
							toastr.error(message);
						}
					}
				});
			}
			$('#layerPopUpModal').modal('show');
		}
	});

	//그룹코드 수정하기 
	$('#baseCdEdit').click(function() {
		let dataGrp = commonGroupCd.row('.selected').data();
		if ( dataGrp == null || dataGrp == undefined ) {
			toastr.warning("수정할 기초코드들 먼저 선택해 주세요.");
			return false;
		}
		
		let data = systemCommonCd.row('.selected').data();
		if ( data == null || data == undefined ) {
			toastr.warning("수정할 코드들 선택해 주세요.");
		} else {
			addHtml("cdEdit");
			if (dataGrp.baseGroupType == 'N') {
				$('#puBaseCd').attr('disabled', true);
			}
			$('#puBaseGroupCd').val(dataGrp.baseGroupCd);
			$('#puBaseCd').val(data.baseCd);
			$('#puBaseCdBefore').val(data.baseCd);
			$('#puBaseNm').val(data.baseNm);
			$('#puBaseAbbr').val(data.baseAbbr);
			$('#puEtc1').val(data.etc1);
			$('#puEtc2').val(data.etc2);
			$('#puEtc3').val(data.etc3);
			$('#puBaseDesc').val(data.baseDesc);
			selectBoxAppend(useYnCode, "puUseYn", data.useYn, "");
			$('#layerPopUpLabel').text('코드수정');
			$('#layerPopUpSave').text('저장');
			$('#layerPopUpModal').modal('show');
		}
	});
	
	//그룹코드 삭제하기 
	$('#baseCdDel').click(function() {
		var dataGrp = commonGroupCd.row('.selected').data();
		//console.log('코드' + dataGrp.baseGroupType)
		if (dataGrp == null || dataGrp == undefined) {
			toastr.warning("삭제할 기초코드들 먼저 선택해 주세요.");
			return;
		}
		var data = systemCommonCd.row('.selected').data();

		if (data == null || data == undefined) {
			toastr.warning("삭제할 코드들 선택해 주세요.");
		} else {
			addHtml("cdDel");
			if (dataGrp.baseGroupType == 'N') {
				$('#puBaseCd').attr('disabled', true);
			}
			$('#puBaseGroupCd').val(dataGrp.baseGroupCd);
			$('#puBaseCd').val(data.baseCd);
			$('#puBaseNm').val(data.baseNm);
			$('#puBaseAbbr').val(data.baseAbbr);
			$('#puEtc1').val(data.etc1);
			$('#puEtc2').val(data.etc2);
			$('#puEtc3').val(data.etc3);
			$('#puBaseDesc').val(data.baseDesc);
			selectBoxAppend(useYnCode, "puUseYn", data.useYn, "");
			$('#layerPopUpLabel').text('코드삭제');
			$('#layerPopUpSave').text('삭제');
			$('#layerPopUpModal').modal('show');
		}
	});

	//공통그룹등록 저장하기
	$('#layerPopUpSave').click(function() {
		var puFlag = $('#puFlag').val();
		if (puFlag == "groupCdAdd" || puFlag == "groupCdEdit") {
			baseGroupCdProc(puFlag);
		} else if (puFlag == "cdAdd" || puFlag == "cdEdit"){
			baseCdProc(puFlag);
		} else {
			baseDelete(puFlag);
		}
		//$('#layerPopUpModal').modal('hide');
	});

	// 시스템공통그룹 상세 정보 보기
	$('#commonGroupCd tbody').on( 'click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#commonGroupCd').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		baseGroupCd = commonGroupCd.row(this).data().baseGroupCd;
		console.log("baseGroupCd = " + baseGroupCd);
		$('#systemCommonCd').DataTable().ajax.reload(function() {
		});
	});

	// 시스템코드선택
	$('#systemCommonCd tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#systemCommonCd').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});

	//시스템공통그룹 등록/수정
	function baseGroupCdProc(puFlag) {
		if (!$.trim($('#puBaseGroupCd').val())) {
			toastr.warning('공통코드를 입력해 주세요.');
			$('#puBaseGroupCd').focus();
			return false;
		}

		if (!$.trim($('#puBaseGroupNm').val())) {
			toastr.warning('공통코드명을 입력해 주세요.');
			$('#pubaseGroupNm').focus();
			return false;
		}
		
		if ($('#puBaseGroupType option:selected').val() == "") {
			toastr.warning('공통코드유형을 선택해 주세요.');
			$('#puBaseGroupType').focus();
			return false;
		}
		
		if ($('#puUseYn option:selected').val() == "") {
			toastr.warning('사용여부 선택해 주세요.');
			$('#puUseYn').focus();
			return false;
		}

		console.log('공통그룹등록 저장')

		var groupUrl;
		var groupMsg;
		if (puFlag == "groupCdAdd") {
			groupUrl = '<c:url value="/bm/commonGroupCreate"/>';
			groupMsg = '그룹코드가 등록 되었습니다.';
		} else {
			groupUrl = '<c:url value="/bm/commonGroupUpdate"/>';
			groupMsg = '그룹코드가 수정 되었습니다.';
		}

		$.ajax({
			url : groupUrl,
			type : 'POST',
			data : {
				'baseGroupCd' 	: $('#puBaseGroupCd').val(),
				'baseGroupNm' 	: $('#puBaseGroupNm').val(),
				'baseGroupType' : $('#puBaseGroupType').val(),
				'useYn' 		: $("#puUseYn option:selected").val()
			},
			beforeSend : function() {
			},
			success : function(res) {
				let data = res.data;
				console.log(res.result)
				if (res.result == 'ok') {
					toastr.success(groupMsg);
					$('#commonGroupCd').DataTable().ajax.reload(); //등록 후 테이블 리로드	            	
					$('#layerPopUpModal').modal('hide');
				} else if (res.result == 'exist') {
					toastr.error('동일한 공통코드명이 존재합니다.');
					$('#pubaseGroupCd').focus();
					$('#systemCommonCd').DataTable().ajax.reload(); //등록 후 테이블 리로드		            	
				} else {
					toastr.error(res.message);
				}
				$('#commonGroupCd').removeClass('selected');
				$('#systemCommonCd').DataTable().$('tr.selected').removeClass('selected');
			},
			complete : function() {

			}
		});
	}

	//시스템공통코드 등록/수정
	function baseCdProc(puFlag) {
		if (!$.trim($('#puBaseGroupCd').val())) {
			toastr.warning('기초코드를 확인해 주세요.');
			//$('#puBaseGroupCd').focus();
			return false;
		}
		if (!$.trim($('#puBaseCd').val())) {
			toastr.warning('코드를 입력해 주세요.');
			$('#puBaseCd').focus();
			return false;
		}
		if (!$.trim($('#puBaseNm').val())) {
			toastr.warning('코드명을 입력해 주세요.');
			$('#puBaseNm').focus();
			return false;
		}
		if ($("#puUseYn option:selected").val() == "") {
			toastr.warning('사용여부 선택해 주세요.');
			$('#puUseYn').focus();
			return false;
		}

		let cdUrl;
		let cdMsg;
		if ( puFlag == "cdAdd" ) {
			cdUrl = '<c:url value="/bm/commonCodeCreate"/>';
			cdMsg = '세부코드가 등록 되었습니다.';
			$('#puBaseCdBefore').val($('#puBaseCd').val());
		} else {
			cdUrl = '<c:url value="/bm/commonCodeUpdate"/>';
			cdMsg = '세부코드가 수정 되었습니다.';
		}
		
		$.ajax({
			url : cdUrl,
			type : 'POST',
			data : {
				'baseGroupCd'	: function(){ return $('#puBaseGroupCd').val(); },
				'baseCd'		: function(){ return $('#puBaseCdBefore').val(); },
				'baseCdAfter'	: function(){ return $('#puBaseCd').val(); },
				'baseNm'		: function(){ return $('#puBaseNm').val(); },
				'baseAbbr'		: function(){ return $('#puBaseAbbr').val(); },
				'etc1'			: function(){ return $('#puEtc1').val(); },
				'etc2'			: function(){ return $('#puEtc2').val(); },
				'etc3'			: function(){ return $('#puEtc3').val(); },
				'baseDesc'		: function(){ return $('#puBaseDesc').val(); },
				'useYn'			: function(){ return $("#puUseYn option:selected").val(); },
			},
			beforeSend : function() {
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success(cdMsg);
					$('#layerPopUpModal').modal('hide');
					$('#systemCommonCd').DataTable().ajax.reload(); //등록 후 테이블 리로드
				} else if (res.result == 'existCd') {
					toastr.warning("동일한 코드가 존재합니다.");
					$('#puBaseCd').focus();
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {

			}
		});
		
	}
	
	//시스템공통그룹/코드 삭제
	function baseDelete(puFlag) {
		console.log('시스템공통그룹/코드 삭제')

		var groupUrl = '<c:url value="/bm/commonGroupDelete"/>';
		var groupMsg;
		var groupCheck;
		
		if (puFlag == "groupCdDel") {
			groupCheck = 'group';
			groupMsg = '그룹코드가 삭제 되었습니다.';
		} else {
			groupCheck = 'code';
			groupMsg = '코드가 삭제 되었습니다.';
		}
		
		$.ajax({
			url : groupUrl,
			type : 'POST',
			data : {
				'baseGroupCd' 	: $('#puBaseGroupCd').val(),
				'baseCd' : $('#puBaseCd').val(),
				'groupCheck' : groupCheck,
			},
			beforeSend : function() {
			},
			success : function(res) {
				console.log(res.result);
				if (res.result == 'ok') {
					toastr.success(groupMsg);
					if(groupCheck == 'group'){
						$('#commonGroupCd').DataTable().ajax.reload(); //삭제 후 테이블 리로드
					}     	
					$('#systemCommonCd').DataTable().ajax.reload(); //삭제 후 테이블 리로드	            	
					$('#layerPopUpModal').modal('hide');
				} else {
					toastr.error(res.message);
				}
				$('#commonGroupCd').removeClass('selected');
				$('#systemCommonCd').DataTable().$('tr.selected').removeClass('selected');
			},
			complete : function() {

			}
		});
	}

	function addHtml(flag) {
		var html;
		if (flag == "groupCdAdd" || flag == "groupCdEdit" || flag == "groupCdDel") { //기초코드수정
			html = '<tr>';
			html += '<td class="text-center" style="width: 80px">공통코드</td>';
			html += '<td style="width: 100px"><input type="text" class="form-control" id="puBaseGroupCd"  name="puBaseGroupCd" disabled></td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td class="text-center"  style="width: 80px">*공통코드명</td>';
			if(flag == "groupCdDel"){
				html += '<td style="width: 100px"><input type="text" class="form-control" id="puBaseGroupNm"  name="pubaseGroupNm" disabled></td>';
			}else{
				html += '<td style="width: 100px"><input type="text" class="form-control" id="puBaseGroupNm"  name="pubaseGroupNm"></td>';
			}
			html += '</tr>';
			
			html += '<tr>';
			html += '<td class="text-center"  style="width: 80px">*공통코드상세</td>';
			if(flag == "groupCdDel"){
				html += '<td style="width: 100px"><select class="select-custom-sm" id="puBaseGroupType" disabled></select></td>';
			}else{
				html += '<td style="width: 100px"><select class="select-custom-sm" id="puBaseGroupType"></select></td>';
			}
			html += '</tr>';
			
			html += '<tr>';
			html += '<td class="text-center"  style="width: 80px">*사용여부</td>';
			if(flag == "groupCdDel"){
				html += '<td style="width: 100px"><select class="select-custom" id="puUseYn" disabled></select></td>';
			}else{
				html += '<td style="width: 100px"><select class="select-custom" id="puUseYn"></select></td>';
			}
			html += '</tr>';
			$('#layerPopUpTable').html(html);
			$('#puFlag').val(flag);
		} else { // 코드수정
			html = '<tr>';
			html += '<td class="text-center" style="width: 80px">*코드</td>';
			html += '<td style="width: 100px">';
			html += '<input type="hidden" class="form-control" id="puBaseCdBefore">';
			if(flag == "cdDel"){
				html += '<input type="text" class="form-control" id="puBaseCd" name="puBaseCd" disabled>';
			}else{
				html += '<input type="text" class="form-control" id="puBaseCd" name="puBaseCd">';
			}
			html += '</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td class="text-center" style="width: 80px">*코드명</td>';
			if(flag == "cdDel"){
				html += '<td style="width: 100px"><input type="text" class="form-control" id="puBaseNm"  name="puBaseNm" disabled></td>';
			}else{
				html += '<td style="width: 100px"><input type="text" class="form-control" id="puBaseNm"  name="puBaseNm"></td>';
			}
			html += '</tr>';
			html += '<tr>';
			html += '<td class="text-center" style="width: 80px">코드약칭</td>';
			if(flag == "cdDel"){
				html += '<td style="width: 100px"><input type="text" class="form-control" id="puBaseAbbr"  name="puBaseAbbr" disabled></td>';
			}else{
				html += '<td style="width: 100px"><input type="text" class="form-control" id="puBaseAbbr"  name="puBaseAbbr"></td>';
			}
			html += '</tr>';
			html += '<tr>';
			html += '<td class="text-center" style="width: 80px">체크1</td>';
			if(flag == "cdDel"){
				html += '<td style="width: 100px"><input type="text" class="form-control" id="puEtc1"  name="puEtc1" disabled></td>';
			}else{
				html += '<td style="width: 100px"><input type="text" class="form-control" id="puEtc1"  name="puEtc1"></td>';
			}
			html += '</tr>';
			html += '<tr>';
			html += '<td class="text-center" style="width: 80px">체크2</td>';
			if(flag == "cdDel"){
				html += '<td style="width: 100px"><input type="text" class="form-control" id="puEtc2"  name="puEtc2" disabled></td>';
			}else{
				html += '<td style="width: 100px"><input type="text" class="form-control" id="puEtc2"  name="puEtc2"></td>';
			}
			html += '</tr>';
			html += '<tr>';
			html += '<td class="text-center" style="width: 80px">체크3</td>';
			if(flag == "cdDel"){
				html += '<td style="width: 100px"><input type="text" class="form-control" id="puEtc3"  name="puEtc3" disabled></td>';
			}else{
				html += '<td style="width: 100px"><input type="text" class="form-control" id="puEtc3"  name="puEtc3"></td>';
			}
			html += '</tr>';
			html += '<tr>';
			html += '<td class="text-center" style="width: 80px">*사용여부</td>';
			if(flag == "cdDel"){
				html += '<td style="width: 100px"><select class="select-custom" id="puUseYn" disabled></select></td>';
			}else{
				html += '<td style="width: 100px"><select class="select-custom" id="puUseYn"></select></td>';
			}
			html += '<input type="hidden" id="puBaseGroupCd"  name="puBaseGroupCd">';
			html += '</tr>';
			$('#layerPopUpTable').html(html);
			$('#puFlag').val(flag);
		}
	}

	$(document).on('click','.form-control', function(event) {
   		$(this).select();
   	});
   	
</script>

</body>
</html>
