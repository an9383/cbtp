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
						<table id="msSpecTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead class="thead-light">
								<!--==========table thead 추가==========-->
								<tr>
									<th>No.</th>
									<th>첨부일자</th>
									<th>담당자</th>
									<th>파일명</th>
									<th>파일종류</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!--                       <button type="button" class="btn btn-success float-right">Excel</button> -->
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 40%;">
				<div class="card" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 p-1">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>
					</div>
					<div id="myTabContent" class="tab-content">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-warning float-right mr-1"
									id="btnAttachDel">삭제</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
								<button type="button" class="btn btn-primary float-right mr-1"
									id="btnAttachAdd">등록</button>
								<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
									type="button" disabled>
									<span class="spinner-border spinner-border-sm" role="status"
										aria-hidden="true"></span> 처리중
								</button>
							</div>
							<form id="form2" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="dealCorpVistTable">
										<thead class="thead-light">
											<tr>
												<th>*첨부파일</th>
											</tr>
										</thead>
										<tbody id="dataList"></tbody>
										<tbody id="dataInsert"></tbody>
									</table>
								</div>
							</form>
						<div>
							<button type="button"
								class="btn btn-primary d-none float-right d-none" id="btnSave">저장</button>
							<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
						</div>
					</div>
				</div>
			</div>
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

	let currentHref = "tasc0010";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","통합자료실"); 
	
	let viewIdx;
	let sideView = 'add';
	var serverDate = "${serverDate}";
	var userNm = "${userNm}";
	var count = 0;
	var dealCorpSeq;
	var visitSeq;
	var urlData=null;
	var dealGubunList = '001';
	var attachSeq;
	var attachCd;
	
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
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : false,
		searching : true,
// 		serverSide : true,
		pageLength : 20,
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
				return meta.row
						+ meta.settings._iDisplayStart
						+ 1;
			},
			'className' : 'text-center'
		},
		{
			data : 'regDate',
			'className' : 'text-center'
		}, 
		{
			data : 'regId',
			'className' : 'text-center'
		}, 
		{
			data : 'attachFn',
			'className' : 'text-center'
		}, 
		{
			data : 'etc5',
			'className' : 'text-center'
		}, ],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 
			{
	        "extend": 'excel',
	        "text": '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i>  Excel</button>',
	        "titleAttr": 'Excel',
	        "action": newexportaction
	   		 }, 'print' ],
	   	drawCallback : function(){
// 	   		if(drawCallback_check == false){
// 	   			selectBoxAppend(dealGubun_com, "dealGubun_com", dealGubunList, "");
// 	   			drawCallback_check = true;
// 	   		}
	   	}
		
	});

	//DataTable button click
	function newexportaction(e, dt, button, config) {
        var self = this;
        var oldStart = dt.settings()[0]._iDisplayStart;
        dt.one('preXhr', function (e, s, data) {
            // Just this once, load all data from the server...
            data.start = 0;
            data.length = 2147483647;
            dt.one('preDraw', function (e, settings) {
                // Call the original action function
                if (button[0].className.indexOf('buttons-copy') >= 0) {
                    $.fn.dataTable.ext.buttons.copyHtml5.action.call(self, e, dt, button, config);
                } else if (button[0].className.indexOf('buttons-excel') >= 0) {
                    $.fn.dataTable.ext.buttons.excelHtml5.available(dt, config) ?
                        $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config) :
                        $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
                } else if (button[0].className.indexOf('buttons-csv') >= 0) {
                    $.fn.dataTable.ext.buttons.csvHtml5.available(dt, config) ?
                        $.fn.dataTable.ext.buttons.csvHtml5.action.call(self, e, dt, button, config) :
                        $.fn.dataTable.ext.buttons.csvFlash.action.call(self, e, dt, button, config);
                } else if (button[0].className.indexOf('buttons-pdf') >= 0) {
                    $.fn.dataTable.ext.buttons.pdfHtml5.available(dt, config) ?
                        $.fn.dataTable.ext.buttons.pdfHtml5.action.call(self, e, dt, button, config) :
                        $.fn.dataTable.ext.buttons.pdfFlash.action.call(self, e, dt, button, config);
                } else if (button[0].className.indexOf('buttons-print') >= 0) {
                    $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
                }
                dt.one('preXhr', function (e, s, data) {
                    // DataTables thinks the first item displayed is index 0, but we're not drawing that.
                    // Set the property to what it was before exporting.
                    settings._iDisplayStart = oldStart;
                    data.start = oldStart;
                });
                // Reload the grid with the original page. Otherwise, API functions like table.cell(this) don't work properly.
                setTimeout(dt.ajax.reload, 0);
                // Prevent rendering of the full data to the DOM
                return false;
            });
        });
        // Requery the server with the new one-time export settings
        dt.ajax.reload();
    }
	
	//메인 테이블 보기
	$('#msSpecTable tbody').on('click','tr',function() {
		sideView = 'edit';

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		if ($(this).hasClass('selected')) {
		} else {
			$('#msSpecTable').DataTable().$('tr.selected')
					.removeClass('selected');
			$(this).addClass('selected');
		}

		attachCd = msSpecTable.row(this).data().attachCd;
		attachSeq = msSpecTable.row(this).data().attachSeq;
		$('#dealCorpVistTable').DataTable().ajax.reload();
		
// 		$('#btnAttachAdd').addClass('d-none');
// 		$('#btnAttachDel').addClass('d-none');
		$('#btnSave').addClass('d-none');

	});
	

	status = '';
	
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
					data : 'attachFn',
					render : function(data, type, row) {
						if (data != null) {
							var html = '<a href="/bm/taAttachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+attachCd+'">'+data+'</a>';
							return html;
						} else {
							var html = '<form id="formFile" method="post" enctype="multipart/form-data"> <div class="custom-file">';
							html += '<input type="file" class="custom-file-input" id="fileNm" name="fileNm">';
							html += '<label class="custom-file-label" for="fileNm"></label>';
							html += '</div></form>';
							return html;
						}
					}
				} ],
		buttons : []
	});

	//관련자료 데이터 클릭 시
	$('#dealCorpVistTable tbody').on('click', 'tr', function() {
		if (status == "updating") {
			return;
		}

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#dealCorpVistTable').DataTable().$('tr.selected')
					.removeClass('selected');
			$(this).addClass('selected');
		}

		status = "choice";
		dealCorpSeq = dealCorpVistTable.row(this).data().dealCorpSeq;
		visitSeq = dealCorpVistTable.row(this).data().visitSeq;
	});

	
	//등록버튼
	$('#btnAttachAdd').on('click', function() {
// 		$('#dealCorpVistTable tbody').empty();
		//이미 클릭한거 안보이게 하기
		$('#dealCorpVistTable').DataTable().row.add({}).draw(false);
		
		$('#btnCheck').attr("disabled", false);
		$('#viewBox').addClass('d-none');
		$('#btnSave').removeClass('d-none');
		$('#btnAttachAdd').attr('disabled', true); //추가버튼
		$('#btnAttachDel').attr('disabled', true); //삭제버튼	
		
		$.ajax({
			url : '<c:url value="/bm/attachDataSeq"/>',
			type : 'GET',
			async : false,
			data : {
				'attachGubun' : function() {return 'TA';},
				'attachCd' : function() {return attachCd;},
			},
			success : function(res) {
// 				let data = res.data;

				if (res.result == 'ok') {
					attachSeq = res.seq;
				} else {
					toastr.error(res.message);
				}
			}
		});
		
		$.ajax({
			url : '<c:url value="/bm/attachDataCd"/>',
			type : 'GET',
			async : false,
			data : {
				'attachGubun' : function() {return 'TA';},
			},
			success : function(res) {
// 				let data = res.data;

				if (res.result == 'ok') {
					attachCd = res.attachCd;
				} else {
					toastr.error(res.message);
				}
			}
		});
		
		
	});

	//저장 버튼 클릭
	$('#btnSave').on('click',function() {
		if (!$.trim($('#fileNm').val())) {
			toastr.warning('파일을 선택해주세요.');
			$('#fileNm').focus();
			return false;
		}

		var formData = new FormData(document.getElementById("formFile"));
		
		formData.append('path', fileDate);
		formData.append('attachCd', attachCd);
		formData.append('attachSeq', attachSeq);
		formData.append('contents', '');
		formData.append('attachGubun', 'TA');

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
// 					$('#dealCorpVistTable').DataTable().ajax.reload();
					$('#dealCorpVistTable tbody').empty();
					$('#formBox').removeClass('d-none');
					$('#btnSave').addClass('d-none');
					$('#btnAttachAdd').attr('disabled', false);
					$("#btnAttachDel").attr("disabled", false);
					$("#createValue").remove();
				} else {
					toastr.error(res.message);
				}
			}
		});

	});

	//삭제 버튼 클릭
	$('#btnAttachDel').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("삭제할 목록을 선택해 주세요!");
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

	//엑셀업로드 모달
	let inTable = $('#inTable').DataTable({
		language : lang_kor,
		paging : false,
		destroy : true,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		ajax : {
			url : '<c:url value="bm/dealCorpExcelDataList" />',
			type : 'GET',
			data : {
				'url' : function(){return urlData;}
			}
		},
		columns : [
			{  
				render : function(data, type, row, meta) {
					return meta.row
							+ meta.settings._iDisplayStart
							+ 1;
				}
			},
			{data : 'dealCorpSeq'},
			{data : 'dealCorpCd'},
			{data : 'dealCorpNm'},
			{data : 'initial'},
			{data : 'presidentNm'},
			{data : 'country'},
			{data : 'corpNo'},
			{data : 'registNo'},
			{data : 'bizCond'},
			{data : 'bizType'},
			{data : 'addrNo'},
			{data : 'addrBase'},
			{data : 'addrDtl'},
			{data : 'telNo'},
			{data : 'faxNo'},
			{data : 'emailAddr'}, 
			{data : 'tax'},
			{data : 'officeCharger'},
			{data : 'bizCharger'},
			{data : 'dealGubun'},
			{data : 'useYn',
				render : function(data, type, row, meta){
					if(data!=null){
						console.log(data);
						return data;
					}else{
						console.log("001")
						return "001";
					}
				}
			}, 
			{data : 'dealCorpDesc'}
		],
		columnDefs: [
        	{"targets": "_all" , "className": "text-center"},
        ],
	});

	//파일 선택
	$('#btnExcelUpload').change( function() {
		var formData = new FormData($('#fileUploadForm')[0]);
	
		var str = $('#btnExcelUpload').val();
		index = 0;
	
		if (str.substring(str.lastIndexOf(".") + 1) == "xls"
				|| str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="bm/dealCorpExcelUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {
					urlData = res.data;
					$('#inTable').DataTable().ajax.reload(function(){});
					$('#inModal').modal('show');

					$('#btnExcelUpload').val("");
					$('#my-spinner').hide();
				},
				complete : function() {
				}
			});

		} else {
			//toastr.warning("excel파일을 선택해 주세요.");
			return false;
		}

	});

	
	$('#btnApply').on('click',function(){
		console.log("적용버튼 클릭함");
		var dataArray = new Array();		
		var check=true;  	
		
		$('#inTable tbody tr').each(function(index, item){
			 
			var rowData = new Object();
			rowData.dealCorpSeq= inTable.row(index).data().dealCorpSeq==null?"": inTable.row(index).data().dealCorpSeq;
			rowData.dealCorpCd= inTable.row(index).data().dealCorpCd==null?"": inTable.row(index).data().dealCorpCd;
			rowData.dealCorpNm= inTable.row(index).data().dealCorpNm==null?"": inTable.row(index).data().dealCorpNm;
			rowData.initial= inTable.row(index).data().initial==null?"": inTable.row(index).data().initial;
			rowData.presidentNm= inTable.row(index).data().presidentNm==null?"": inTable.row(index).data().presidentNm;
			rowData.country= inTable.row(index).data().country==null?"": inTable.row(index).data().country;
			rowData.corpNo= inTable.row(index).data().corpNo==null?"": inTable.row(index).data().corpNo;
			rowData.registNo= inTable.row(index).data().registNo==null?"": inTable.row(index).data().registNo;
			rowData.bizCond= inTable.row(index).data().bizCond==null?"": inTable.row(index).data().bizCond;
			rowData.bizType= inTable.row(index).data().bizType==null?"": inTable.row(index).data().bizType;
			rowData.addrNo= inTable.row(index).data().addrNo==null?"": inTable.row(index).data().addrNo;
			rowData.addrBase= inTable.row(index).data().addrBase==null?"": inTable.row(index).data().addrBase;
			rowData.addrDtl= inTable.row(index).data().addrDtl==null?"": inTable.row(index).data().addrDtl;
			rowData.telNo= inTable.row(index).data().telNo==null?"": inTable.row(index).data().telNo;
			rowData.faxNo= inTable.row(index).data().faxNo==null?"": inTable.row(index).data().faxNo;
			rowData.emailAddr= inTable.row(index).data().emailAddr==null?"": inTable.row(index).data().emailAddr;
			rowData.tax= inTable.row(index).data().tax==null?"": inTable.row(index).data().tax;
			rowData.officeCharger= inTable.row(index).data().officeCharger==null?"": inTable.row(index).data().officeCharger;
			rowData.bizCharger= inTable.row(index).data().officeCharger==null?"": inTable.row(index).data().officeCharger;
			rowData.dealGubun= inTable.row(index).data().dealGubun==null?"": inTable.row(index).data().dealGubun;
			rowData.useYn= inTable.row(index).data().useYn==null?"": inTable.row(index).data().useYn;
			rowData.dealCorpDesc= inTable.row(index).data().dealCorpDesc==null?"": inTable.row(index).data().dealCorpDesc;
			
	        dataArray.push(rowData);
		});
			
		if(check == true){
			$.ajax({
				url : '<c:url value="bm/dealCorpExcelCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {				
					if (res.result == 'ok') {
						$('#msSpecTable').DataTable().ajax.reload(function(){});
						$('#inModal').modal('hide');
						
						toastr.success('저장되었습니다.');
					}else if(res.result == 'exist') {
						toastr.warning("동일한 부품코드가 존재합니다.");
					}else {
						toastr.error(res.message);
					}

					//처리완료..
					$('#my-spinner').hide();
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});

	
</script>

</body>
</html>
