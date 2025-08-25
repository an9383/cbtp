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
				<li class="breadcrumb-item"><a href="#">통합자료실</a></li>
				<li class="breadcrumb-item active">통합자료실</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 100%;">
				<div class="card">
					<div id="myTabContent" class="tab-content">
						<div class="card-body col-sm-12 p-1">
							<button type="button" class="btn btn-primary float-left mr-1" id="btnAttachAdd">추가</button>
							<button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
							</button>
							<button type="button" class="btn btn-warning float-left mr-1" id="btnAttachCc" disabled>취소</button>
							<button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
							</button>
							<button type="button" class="btn btn-primary d-none float-right d-none" id="btnSave">등록</button>
							<button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
							</button>
						</div>
						<form id="form2" enctype="multipart/form-data">
							<div class="table-responsive">
								<table class="table table-bordered" id="dealCorpVistTable">
									<colgroup>
										<col width="4%">
										<col width="4%">
										<col width="5%">
										<col width="10%">
										<col width="7%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>담당자</th>
											<th>부서명</th>
											<th>첨부일자</th>
											<th>첨부파일</th>
											<th>비고</th>
										</tr>
									</thead>
									<tbody id="dataList"></tbody>
									<tbody id="dataInsert"></tbody>
								</table>
							</div>
						</form>
					</div>
					<hr>
					<div class="card-body col-sm-12 p-1">
						<button type="button" class="btn btn-warning float-left mr-1" id="btnAttachDel">삭제</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
						</button>
					</div>
					<div class="table-responsive" style="height: 550px;">
						<table id="msSpecTable" class="table table-bordered">
							<colgroup>
								<col width="3%">
								<col width="5%">
								<col width="5%">
								<col width="8%">
								<col width="13%">
								<col width="5%">
								<col width="10%">
							</colgroup>
							<thead class="thead-light">
								<!--==========table thead 추가==========-->
								<tr>
									<th>No.</th>
									<th>담당자</th>
									<th>부서명</th>
									<th>첨부일자</th>
									<th>첨부파일</th>
									<th>파일종류</th>
									<th>비고</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<!--                       <button type="button" class="btn btn-success float-right">Excel</button> -->
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
<!-- 			<div class="right-list right-sidebar" id="myrSidenav" -->
<!-- 				style="width: 40%;"> -->
<!-- 				<div class="card" id="formBox"> -->
<!-- 					오른쪽 등록 부분 상단 버튼 영역 -->
<!-- 					<div class="card-body col-sm-12 p-1"> -->
<!-- 						<div class="rightsidebar-close"> -->
<!-- 							<a href="javascript:void(0)" id="left-expand" -->
<!-- 								class="closebtn float-right" onclick="closerNav()"><i -->
<!-- 								class="mdi mdi-close"></i></a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div id="myTabContent" class="tab-content"> -->
<!-- 							<div class="card-body col-sm-12 p-1 mb-2"> -->
<!-- 								<button type="button" class="btn btn-warning float-right mr-1" -->
<!-- 									id="btnAttachDel">삭제</button> -->
<!-- 								<button class="btn btn-primary d-none" id="btnAddConfirmLoading" -->
<!-- 									type="button" disabled> -->
<!-- 									<span class="spinner-border spinner-border-sm" role="status" -->
<!-- 										aria-hidden="true"></span> 처리중 -->
<!-- 								</button> -->
<!-- 								<button type="button" class="btn btn-primary float-right mr-1" -->
<!-- 									id="btnAttachAdd">등록</button> -->
<!-- 								<button class="btn btn-primary d-none" id="btnAddConfirmLoading" -->
<!-- 									type="button" disabled> -->
<!-- 									<span class="spinner-border spinner-border-sm" role="status" -->
<!-- 										aria-hidden="true"></span> 처리중 -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 							<form id="form2" enctype="multipart/form-data"> -->
<!-- 								<div class="table-responsive"> -->
<!-- 									<table class="table table-bordered" id="dealCorpVistTable"> -->
<%-- 										<colgroup> --%>
<%-- 											<col width="7%"> --%>
<%-- 											<col width="32%"> --%>
<%-- 										</colgroup> --%>
<!-- 										<thead class="thead-light"> -->
<!-- 											<tr> -->
<!-- 												<th>*스펙번호</th> -->
<!-- 												<th>*첨부파일</th> -->
<!-- 											</tr> -->
<!-- 										</thead> -->
<!-- 										<tbody id="dataList"></tbody> -->
<!-- 										<tbody id="dataInsert"></tbody> -->
<!-- 									</table> -->
<!-- 								</div> -->
<!-- 							</form> -->
<!-- 						<div> -->
<!-- 							<button type="button" -->
<!-- 								class="btn btn-primary d-none float-right d-none" id="btnSave">저장</button> -->
<!-- 							<button class="btn btn-primary d-none" id="btnAddConfirmLoading" -->
<!-- 								type="button" disabled> -->
<!-- 								<span class="spinner-border spinner-border-sm" role="status" -->
<!-- 									aria-hidden="true"></span> 처리중 -->
<!-- 							</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
		<!-- ===/.right-sidebar 등록,수정===  -->
	</div>
	<!-- /.row -->
	<div class="modal fade bd-example-modal-lg" id="inModal" tabindex="-1"
		role="dialog" aria-labelledby="inModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inLabel">거래처정보 엑셀조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" >
					<hr class="text-secondary">
					<div class="table-responsive" style="height: 700px;">
					<table id="inTable" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>거래처코드</th>
								<th>거래처명</th>
								<th>이니셜</th>
								<th>대표자명</th>
								<th>국가명</th>
								<th>사업자번호</th>
								<th>법인주민번호</th>
								<th>업태</th>
								<th>업종</th>
								<th>우편번호</th>
								<th>주소</th>
								<th>주소상세</th>
								<th>전화번호</th>
								<th>팩스번호</th>
								<th>메일</th>
								<th>과세</th>
								<th>업무담당</th>
								<th>영업담당</th>
								<th>거래구분</th>
								<th>사용여부</th>
								<th>비고</th>
							</tr>
						</thead>
					</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="btnApply">적용</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!--=======모달영역====================================================-->
</div>
<!-- / #main  -->

<%@include file="../layout/bottom.jsp" %>

<script>
	let currentHref = "tasc0010";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","통합자료실"); 
	
	let viewIdx;
	let sideView = 'add';
	var serverDate = "${serverDate}";
	var userNumber = "${userNumber}";
	var userNm = "${userNm}";
	var departmentNm = "${departmentNm}";
	var count = 0;
	var dealCorpSeq;
	var visitSeq;
	var urlData=null;
	var dealGubunList = '001';
	var attachSeq;
	var attachCd;
	var status = '';
	
	//파일 저장 시간 가져오기
	var now = new Date();
	var year = now.getFullYear();
	var mon = now.getMonth() + 1;
	if (mon < 10) { mon = "0" + mon; }
	var fileDate = year + "" + mon;

	$('#saveBtnModalY').on('click', function() {
		$('#btnSave').addClass('d-none'); //저장버튼
		$('#btnAttachAdd').attr('disabled', false);
		$('#btnAttachDel').attr('disabled', false);
		$("#createValue").remove();
		$("#visit").removeClass('disabled');
		$('#dealCorpVistTable').DataTable().ajax.reload();
	});

	var drawCallback_check = false;
	// 목록
	let msSpecTable = $('#msSpecTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : false,
		searching : true,
		pageLength : 15,
		ajax : {
			url : '<c:url value="/bm/attachDataAllList"/>',
			type : 'GET',
			data : {
				'attachGubun' : function(){return 'TA';},
			}
		},
		columns : [ 
		{
			render : function(data, type, row, meta) {
				return meta.row + meta.settings._iDisplayStart + 1;
			},
			'className' : 'text-center'
		},
		{
			data : 'userNm',
			'className' : 'text-center'
		}, 
		{
			data : 'departmentNm',
			'className' : 'text-center'
		}, 
		{
			data : 'attachRegDate',
			'className' : 'text-center'
		}, 
		{
			data : 'attachFn',
			render : function(data, type, row) {
				if (data != null) {
					var html = '<a href="/bm/taAttachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+row['attachCd']+'">'+data+'</a>';
					return html;
				}
			},
			'className' : 'text-center'
		}, 
		{
			data : 'etc5',
			'className' : 'text-center'
		}, 
		{
			data : 'etc4',
			'className' : 'text-center'
		}, ],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 
			'excel', 'print' ],
	   	drawCallback : function(){
// 	   		if(drawCallback_check == false){
// 	   			selectBoxAppend(dealGubun_com, "dealGubun_com", dealGubunList, "");
// 	   			drawCallback_check = true;
// 	   		}
	   	}
		
	});
	
	
	//메인 테이블 보기
	$('#msSpecTable tbody').on('click','tr',function() {
		sideView = 'edit';

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			sideView = 'add';
		} else {
			$('#msSpecTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		attachCd = msSpecTable.row(this).data().attachCd;
		attachSeq = msSpecTable.row(this).data().attachSeq;
		
// 		$('#btnAttachAdd').addClass('d-none');
// 		$('#btnAttachDel').addClass('d-none');
		$('#btnSave').addClass('d-none');

	});
	
	//관련자료 테이블
	let dealCorpVistTable = $('#dealCorpVistTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		destroy : true,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : false,
		searching : false,
		ajax : {
			url : '<c:url value="/bm/attachDataList"/>',
			type : 'GET',
			data : {
				'attachGubun' : function() {return 'TA';},
				'attachCd' : function() {return attachCd;},
			},
		},
		columns : [
				{
					render : function(data, type, row) {
						return '<input type="text" class="form-control" id="userNm" style="min-width:100%; text-align:center" value="'+userNm+'" disabled/>';
					}
				},
				{
					render : function(data, type, row) {
 						return '<input type="text" class="form-control" id="departmentNm" style="min-width:100%; text-align:center" value="'+departmentNm+'" disabled/>';
					}
				},
				{
					render : function(data, type, row, meta) {
						var html = '<div class="form-group input-sub m-0 row"  style="min-width:100%">'
							html += '<input class="form-control" type="text" value="'+serverDate+'" id="attachRegDate" style="min-width:100%"  disabled/>';
							html += '<button onclick="fnPopUpCalendar(attachRegDate,attachRegDate,\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search"';
							html += 'id="attachRegDateCalendar" type="button">';
							html += '<span class="oi oi-calendar"></span>';
							html += '</button>';
							html += '</div>';
						return html;
					}
				},
				{
					data : 'attachFn',
					render : function(data, type, row) {
						var html = '<form id="formFile" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="fileNm" name="fileNm">';
						html += '<label class="custom-file-label" for="fileNm"></label>';
						html += '</div></form>';
						return html;
					}
				},
				{
					render : function(data, type, row) {
						return '<input type="text" class="form-control" id="ext4" style="min-width:100%" value=""/>';
					}
				}
			],
		buttons : []
	});

	//관련자료 데이터 클릭 시
	$('#dealCorpVistTable tbody').on('click', 'tr', function() {
		if (status == "updating") {
			return;
		}

// 		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
// 		} else {
// 			$('#dealCorpVistTable').DataTable().$('tr.selected')
// 					.removeClass('selected');
// 			$(this).addClass('selected');
// 		}

		status = "choice";
		dealCorpSeq = dealCorpVistTable.row(this).data().dealCorpSeq;
		visitSeq = dealCorpVistTable.row(this).data().visitSeq;
	});

	
	//등록버튼
	$('#btnAttachAdd').on('click', function() {
		$('#msSpecTable').DataTable().$('tr.selected').removeClass('selected');
		
		$('#dealCorpVistTable').DataTable().row.add({}).draw(false);
		
		$('#btnCheck').attr("disabled", false);
		$('#viewBox').addClass('d-none');
		$('#btnSave').removeClass('d-none');
		$('#btnAttachAdd').attr('disabled', true); //추가버튼
		$('#btnAttachCc').attr('disabled', false); //추가버튼
// 		$('#btnAttachDel').attr('disabled', true); //삭제버튼	
		
		$.ajax({
			url : '<c:url value="/bm/attachDataCd"/>',
			type : 'GET',
			async : false,
			data : {
				'attachGubun' : function() {return 'TA';},
			},
			success : function(res) {

				if (res.result == 'ok') {
					attachCd = res.attachCd;
				} else {
					toastr.error(res.message);
				}
			}
		});
		
		$.ajax({
			url : '<c:url value="/bm/attachDataSeq"/>',
			type : 'GET',
			async : false,
			data : {
				'attachGubun' : function() {return 'TA';},
				'attachCd' : function() {return attachCd;},
			},
			success : function(res) {

				if (res.result == 'ok') {
					attachSeq = res.seq;
				} else {
					toastr.error(res.message);
				}
			}
		});
		
	});

	//취소 버튼 클릭
	$('#btnAttachCc').on('click', function() {
		$('#dealCorpVistTable').DataTable().ajax.reload();
		$('#btnSave').addClass('d-none');
		toastr.success('취소되었습니다.');
		status = '';
		$('#formBox').removeClass('d-none');
		$('#msSpecTable').DataTable().ajax.reload();
		$('#btnAttachAdd').attr('disabled', false);
		$('#btnAttachDel').attr('disabled', false);
		$('#btnAttachCc').attr('disabled', true);
	});
	
	//삭제 버튼 클릭
	$('#btnAttachDel').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		
		$.ajax({
			url : '<c:url value="/bm/attachDataDelete"/>',
			type : 'POST',
			data : {
				'attachGubun' : function(){return 'TA'},
				'attachCd' : function(){return attachCd},
				'attachSeq' : function(){return attachSeq},
			},
			success : function(res) {
				// 보기
				$('#dealCorpVistTable').DataTable().ajax.reload();
				$('#btnSave').addClass('d-none');
				toastr.success('삭제되었습니다.');
				status = '';
				$('#formBox').removeClass('d-none');

			},
			complete : function() {
				$('#msSpecTable').DataTable().ajax.reload();

			}
		});
	});
	
	//등록 버튼 클릭
	$('#btnSave').on('click',function() {
		if (!$.trim($('#fileNm').val())) {
			toastr.warning('파일을 선택해주세요.');
			$('#fileNm').focus();
			return false;
		}

		var formData = new FormData(document.getElementById("formFile"));
		
		formData.append('path', fileDate);
		formData.append('attachGubun', 'TA');
		formData.append('attachCd', attachCd);
		formData.append('attachSeq', attachSeq);
		formData.append('etc3', userNumber);
		formData.append('attachRegDate', $('#attachRegDate').val());
		formData.append('etc4', $('#ext4').val());

		formData.append('contents', '');
		
		$.ajax({
			url : '<c:url value="/bm/attachDataCreate"/>',
			type : 'POST',
			data : formData,
			processData : false,
			contentType : false,
			success : function(res) {
				if (res.result == 'ok') {
					// 보기
					toastr.success('등록되었습니다.');
					status = '';
					$('#msSpecTable').DataTable().ajax.reload();
					attachCd = '';
					$('#dealCorpVistTable').DataTable().ajax.reload();
					$('#formBox').removeClass('d-none');
					$('#btnSave').addClass('d-none');
					$('#btnAttachAdd').attr('disabled', false);
					$("#btnAttachDel").attr("disabled", false);
					$("#createValue").remove();
					$('#btnAttachCc').attr('disabled', true);
				} else {
					toastr.error(res.message);
				}
			}
		});

	});
	
</script>

</body>
</html>
