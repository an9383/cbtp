<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row ml-2">
		<nav aria-label="breadcrumb" class="breadcrumb-padding" style="width:100%">
			<div class="row">
				<div class="col-md-2">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
						<li class="breadcrumb-item active">설비수집항목설정</li>
					</ol>
				</div>
				<div class="col-md-10">
				</div>
			</div>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list overflow-hidden" id="left-list" style="width: 20%;">
				<div class="card">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-bordered" id="equipCollectItemTable" style="margin-top : 6px;">
									<thead class="thead-light">
										<tr>
											<th class="text-center align-middle">구분</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar overflow-hidden" id="rfSidenav" style="width: 79%;">
				<div class="card">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="table table-bordered" id="equipCollectItemDtlTable">
									<thead class="thead-light">
										<tr>
											<th class="text-center align-middle">사용여무</th>
											<th class="text-center align-middle">항목</th>
											<th class="text-center align-middle">항목코드</th>
											<th class="text-center align-middle">약칭</th>
											<th class="text-center align-middle">체크1</th>
											<th class="text-center align-middle">체크2</th>
											<th class="text-center align-middle">체크3</th>
											<th class="text-center align-middle">비고</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Modal -->
<%@include file="../layout/bottom.jsp" %>
<script>
	$("#left-width-btn2").click(function() {
		{
			$("#left-list").animate({
				width : "70%"
			}, 0);
				$("#arrow-left").animate({
				display : "none"
			}, 0);
		}
		state = !state;
	});

	let currentHref = "bmsc0230";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","설비수집항목설정");

	let baseGroupCdVal = '';


	//설비수집항목 조회
	let equipCollectItemTable = $('#equipCollectItemTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,		
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20000,
		select: {
				style: 'single',
				toggleable: false,
				items: 'row',
				info: false
		},
		data: [
			{ type: '공장별', baseGroupCd: '149' },
			{ type: '설비별', baseGroupCd: '150' },
		],
		rowId : '',
		columns : [
			{ data: 'type', className: 'text-center align-middle'},
		],
		columnDefs : [
			{
				targets: '_all', className: ''
			}
		],
		order: [],
		buttons: [],
	});

	// 설비별수집항목 구분 선택
	$('#equipCollectItemTable tbody').on('click','tr',function() {
		let data = equipCollectItemTable.row(this).data();
		baseGroupCdVal = data.baseGroupCd;
		equipCollectItemDtlTable.ajax.reload();
	});

	//설비수집항목 조회
	let equipCollectItemDtlTable = $('#equipCollectItemDtlTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,		
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20000,
		select: {
				style: 'single',
				toggleable: false,
				items: 'row',
				info: false
		},
		ajax : {
			url : '<c:url value="/bm/commonCodeList"/>',
			type : 'GET',
			data : {
				baseGroupCd : function() { return baseGroupCdVal; }
			},
		},
		rowId : '',
		columns : [
			{ data: 'useYnNm', className: 'text-center align-middle'},
			{ data: 'baseNm', className: 'text-center align-middle'},
			{ data: 'baseCd', className: 'text-center align-middle'},
			{ data: 'baseAbbr', className: 'text-center align-middle'},
			{ data: 'etc1', className: 'text-center align-middle'},
			{ data: 'etc2', className: 'text-center align-middle'},
			{ data: 'etc3', className: 'text-center align-middle'},
			{ data: 'baseDesc', className: 'text-center align-middle'},
		],
		columnDefs : [
			{
				targets: '_all', className: ''
			}
		],
		order: [],
		buttons: [],
	});
</script>
</body>
</html>
