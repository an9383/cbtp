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
				<li class="breadcrumb-item active">공수관리항목등록</li>
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
						<table id="manHourAdmTable" class="table table-bordered">
							<colgroup>
								<col width="15%">
								<col width="15%">
								<col width="10%">
								<col width="20%">
								<col width="10%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>구분</th>
									<th>코드</th>
									<th>공수구분</th>
									<th>항목명</th>
									<th>시간</th>
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
							<table class="table table-lg table-bordered mb-2">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>*구분</th>
									<td><select class="custom-select" id="mhGubun" name="mhGubun" onchange="a()"></select></td>
									<th>*코드</th>
									<td><input type="text" class="form-control" id="mhCd" name="mhCd" disabled></td>
								</tr>
								<tr>
									<th>*공수관리 구분</th>
									<td><select class="custom-select" id="airliftGubun" name="airliftGubun" ></select></td>
									<th>*항목명</th>
									<td><input type="text" class="form-control" id="mhNm" name="mhNm"></td>
								</tr>
								<tr>
									<th>시간</th>
									<td><input type="text" class="form-control" id="mhMin" name="mhMin"></td>
									<th>*사용여부</th>
									<td><select class="custom-select" id="useYn" name="useYn"></select></td>
								</tr>
								<tr>
									<th>비고</th>
									<td><input type="text" class="form-control" id="mhDesc" name="mhDesc"></td>
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

<%@include file="../layout/bottom.jsp" %>

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

	let currentHref = "bmsc0160";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","공수관리항목등록"); 
	
	//공통코드 처리 시작      
	var useYnCode = new Array();	//사용여부
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>

	var airliftCode = new Array();	//공수관리
	<c:forEach items="${airliftCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	airliftCode.push(json);
	</c:forEach>

	var airliftCode2 = new Array();	//공수관리2
	<c:forEach items="${airliftCd2}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	airliftCode2.push(json);
	</c:forEach>
	
	//공통코드 처리 종료   

	//선택박스 처리
	selectBoxAppend(useYnCode, "useYn", "", "2");
	selectBoxAppend(airliftCode, "mhGubun", "", "2");
	selectBoxAppend(airliftCode2, "airliftGubun", "", "2");

	uiProc(true);
	
	var mhGubun='';
	var mhCd='';
	var baseCd='';
	var mhGubun ='';
	var sideView='';
	var current='mhGubun';
	
	
	//공수관리 테이블 목록 조회
	let manHourAdmTable = $('#manHourAdmTable') .DataTable( {
		dom : "<'row'<'col-sm-3'><'col-md-12'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/manHourAdmList"/>',
			type : 'GET',
			data : {},
		},
		rowId: 'mhGubun',
		columns : [
			{ data : 'mhGubunNm'	 },	//구분
			{ data : 'mhCd'			 },	//코드
			{ data : 'airliftGubunNm'},	//공수구분
			{ data : 'mhNm'			 },	//항목명
			{ data : 'mhMin'		 },	//시간
			{ data : 'mhDesc'		 },	//비고
		],
		order: [
			[ 1, 'asc' ],
		],
		buttons : ['copy', 'excel', 'print'],
	});

	
	//공수관리 테이블 클릭 시
	$('#manHourAdmTable tbody').on('click','tr',function() {

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');

			$('#saveBtnModalY').on('click', function() {
				uiProc(true);
				$('#btnSave').addClass('d-none');
				$('#btnEdit').attr('disabled', false);
				$('#btnAdd').attr('disabled', false);
				
				$('#manHourAdmTable').DataTable().ajax.reload();
				$('#form').each(function() {
					this.reset();
				});
			});
			return false;
		}
		
		sideView ='';
		uiProc(true);
		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#manHourAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		mhGubun = manHourAdmTable.row(this).data().mhGubun;
		mhCd = manHourAdmTable.row(this).data().mhCd;

		//공수관리 상세조회
		$.ajax({
			url : '<c:url value="bm/manHourAdmRead"/>',
			type : 'GET',
			data : {
				'mhGubun' : function(){return mhGubun;},
				'mhCd' : function(){return mhCd;}
			},
			success : function(res) {
				let data = res.data;
	
				if (res.result == 'ok') {
					$('#mhGubun').val(data.mhGubun);
					$('#mhCd').val(data.mhCd);
					$('#airliftGubun').val(data.airliftGubun),
					$('#mhNm').val(data.mhNm);
					$('#mhMin').val(data.mhMin);
					$('#useYn').val(data.useYn);
					$('#mhDesc').val(data.mhDesc);
					
				} else {
					toastr.error(res.message);
				}
			}
		});
	});

	//등록 버튼 클릭 시
	$('#btnAdd').on('click', function(){
		sideView ='add';
		$('#form').each(function() {
			this.reset();
		});
		selectBoxAppend(useYnCode, "useYn", "", "");
		$('#btnSave').removeClass('d-none');
		$('#manHourAdmTable').DataTable().$('tr.selected').removeClass('selected');
		$('#btnEdit').attr('disabled', true);
		uiProc(false);
		
	});

	
	//수정 버튼 클릭 시
	$('#btnEdit').on('click', function(){
		sideView ='edit';
		if ($('#manHourAdmTable tbody tr').hasClass('selected')=='') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		$('#btnSave').removeClass('d-none');
		$('#btnAdd').attr('disabled', true);
		uiProc(false);
		$('#mhGubun').attr('disabled', true);
	});


	//저장 버튼 클릭 시
	$('#btnSave').on('click', function(){

		var isCheck = false;
		
		if(['mhGubun'].includes(current)){
			$.ajax({
				url : '<c:url value="/bm/manHourAdmList"/>',
				type: 'GET',
				dataType: 'json',
				async: false,
				data: {
					'mhGubun' : function() { return mhGubun;},
// 					'mhGubun' : $.trim($('#mhGubun')),
				},
				success: function(res) {
					console.log(res.data.length);
					if (res.data.length == 30) {
							toastr.warning('항목은 30개까지로 제한되어 있습니다. 추가 등록이 필요시 개발사와 협의해 주세요.');
							isCheck = true;
							return false;
					}
				},
			});
		}
			
		if (isCheck == true)
			return false;
		

		if (!$.trim($('#mhGubun').val())) {
			toastr.warning('구분을 선택해주세요');
			$('#mhGubun').focus();
			return false;
		}
		if (!$.trim($('#mhNm').val())) {
			toastr.warning('항목명을 입력해주세요.');
			$('#mhNm').focus();
			return false;
		}
		if (!$.trim($('#useYn').val())) {
			toastr.warning('사용여부를 선택해주세요');
			$('#useYn').focus();
			return false;
		}

		var url = '<c:url value="bm/manHourAdmCreate"/>';
		if (sideView == "edit") {
			url = '<c:url value="bm/manHourAdmUpdate"/>';
		}

		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'mhGubun' 		:	 function(){return mhGubun;},	//식별값
				'mhCd' 			:	 function(){return mhCd;},		//식별값
				'mhGubun'		:	$('#mhGubun').val(),  			//공수관리구분
				'mhCd'			:	$('#mhCd').val(),  				//공수관리코드
				'airliftGubun'	:	$('#airliftGubun').val(),  		//공수구분
				'mhNm'			:	$('#mhNm').val(),  				//공수명
				'mhMin'			:	$('#mhMin').val(),  			//공수시간
				'useYn'			:	$('#useYn').val(),  			//사용여부
				'mhDesc'		:	$('#mhDesc').val(),  			//비고
				
			},
			success : function(res) {
				let data = res.data;

				if (res.result == 'ok') {
				 	if(sideView == 'add'){
				 		toastr.success('등록 되었습니다.');
				 		$('#form').each(function() {
							this.reset();
						});
				 		$('#manHourAdmTable').DataTable().ajax.reload(function() {});
					}else if(sideView == 'edit'){
						toastr.success('수정 되었습니다.');
						$('#manHourAdmTable').DataTable().ajax.reload(function() {});
					}
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#btnSave').addClass('d-none')
				uiProc(true);
				$('#btnAdd').attr('disabled', false);
				$('#btnEdit').attr('disabled', false);
				selectBoxAppend(useYnCode, "useYn", "", "2");
				sideView ='';
			}
		});
	}); 

	//코드 값 가지고 오기
	function a(){
		baseCd = $('#mhGubun').val();
		mhGubun = $('#mhGubun').val();
		console.log(baseCd);
		
		//품목코드 가져오기
		$.ajax({
			url : '<c:url value="/bm/manHourAdmSeq"/>',
			type : 'POST',
			data : {
				'baseCd' : function(){return baseCd;},
				'mhGubun' : function(){return mhGubun;}
				},
			success : function(res) {
				console.log(res.baseInfoCd);
				if (res.result == 'ok') {
					$('#mhCd').val(res.baseInfoCd);
				} else {
					toastr.error(res.message);
				}
			}
		});
	}

	//화면처리
	function uiProc(flag){
		$('#mhGubun').attr('disabled', flag);		//구분
		$('#airliftGubun').attr('disabled', flag);	//공수관리 구분
		$('#mhNm').attr('disabled', flag);			//항목명
		$('#mhMin').attr('disabled', flag);			//시간
		$('#useYn').attr('disabled', flag);			//사용여부
		$('#mhDesc').attr('disabled', flag);		//비고
	}


</script>

</body>
</html>
