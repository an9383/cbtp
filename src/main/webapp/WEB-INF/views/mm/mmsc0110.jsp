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
				<li class="breadcrumb-item"><a href="#">모니터링</a></li>
				<li class="breadcrumb-item active">생산현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">

			<!------------ left top ----------->
			<div class="list-half col-6" id="">
					<h5 class="list-half-tit text-center">전체수주현황</h5>
					<div class="card-body row p-0">
						<div class="col-6">
							<div class="mnt_card card" style=" border:1px solid #ddd;border-radius:10px;">
								<h5 class="mnt_card_tit text-blue">수주접수</h5>
								<div class="mnt_card_box row">
									<div class="mnt_card_item col-6">
										<h1 class="text-blue" style="text-align:center;"><span id="countBizAll"></span></h1>
										<p style="text-align:center; font-size: 20px;" ><b>수주접수(전체)</b></p>
									</div>
									<div class="mnt_card_item col-6">
										<h1 class="text-blue" style="text-align:center;"><span id="countBizToday"></span></h1>
										<p style="text-align:center; font-size: 20px;" ><b>수주접수(금일)</b></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6">
							<div class="mnt_card card" style=" border:1px solid #ddd;border-radius:10px;">
								<h5 class="mnt_card_tit text-purple">발주현황</h5>
								<div class="mnt_card_box">
									<div class="mnt_card_item">
										<h1 class="text-purple" style="text-align:center;"><span id="countPurchase"></span></h1>
										<p style="text-align:center; font-size: 20px;" ><b>발주대기</b></p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card-body row p-0">
						<div class="col-4">
							<div class="mnt_card card" style=" border:1px solid #ddd;border-radius:10px;">
								<h5 class="mnt_card_tit text-lightgreen">자재현황</h5>
								<div class="mnt_card_box">
									<div class="mnt_card_item">
										<h1 class="text-lightgreen" style="text-align:center;"><span id="countInOut"></span></h1>
										<p style="text-align:center; font-size: 20px;" ><b>자재미입고</b></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-4">
							<div class="mnt_card card" style=" border:1px solid #ddd;border-radius:10px;">
								<h5 class="mnt_card_tit text-pink">공정현황</h5>
								<div class="mnt_card_box">
									<div class="mnt_card_item">
										<h1 class="text-pink" style="text-align:center;"><span id="countWorkOrder"></span></h1>
										<p style="text-align:center; font-size: 20px;" ><b>공정진행</b></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-4">
							<div class="mnt_card card" style=" border:1px solid #ddd;border-radius:10px;">
								<h5 class="mnt_card_tit text-yellow">제품현황</h5>
								<div class="mnt_card_box">
									<div class="mnt_card_item">
										<h1 class="text-yellow" style="text-align:center;"><span id="countUnOut"></span></h1>
										<p style="text-align:center; font-size: 20px;" ><b>제품미출고</b></p>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
			<!------------ left top ----------->
			<div class="list-half col-6" id="">
				<div class="">
					<h5 class="list-half-tit text-center">금일생산현황</h5>
					<div class="card-body row p-0">
						<div class="col-6">
							<div class="mnt_card card" style=" border:1px solid #ddd;border-radius:10px;">
								<h5 class="mnt_card_tit text-green">생상지시수량</h5>
								<div class="mnt_card_box row">
									<div class="mnt_card_item col-6">
										<h1 class="text-green" style="text-align:center;"><span id="workOrdQty1"></span></h1>
										<p style="text-align:center; font-size: 20px;" ><b>소형모터</b></p>
									</div>
									<div class="mnt_card_item col-6">
										<h1 class="text-green" style="text-align:center;"><span id="workOrdQty2"></span></h1>
										<p style="text-align:center; font-size: 20px;" ><b>중형모터</b></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6">
							<div class="mnt_card card" style=" border:1px solid #ddd;border-radius:10px;">
								<h5 class="mnt_card_tit text-orange">생산량</h5>
								<div class="mnt_card_box row">
									<div class="mnt_card_item col-6">
										<h1 class="text-orange" style="text-align:center;"><span id="workOrdOutPutQty1"></span></h1>
										<p style="text-align:center; font-size: 20px;" ><b>소형모터</b></p>
									</div>
									<div class="mnt_card_item col-6">
										<h1 class="text-orange" style="text-align:center;"><span id="workOrdOutPutQty2"></span></h1>
										<p style="text-align:center; font-size: 20px;" ><b>중형모터</b></p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card-body row p-0">
						<div class="col-6">
							<div class="mnt_card card" style=" border:1px solid #ddd;border-radius:10px;">
								<h5 class="mnt_card_tit text-cobaltblue">불량률</h5>
								<div class="mnt_card_box row">
									<div class="mnt_card_item col-6">
										<h1 class="text-cobaltblue" style="text-align:center;"><span id="faultyRate1"></span></h1>
										<p style="text-align:center; font-size: 20px;" ><b>소형모터</b></p>
									</div>
									<div class="mnt_card_item col-6">
										<h1 class="text-cobaltblue" style="text-align:center;"><span id="faultyRate2"></span></h1>
										<p style="text-align:center; font-size: 20px;" ><b>중형모터</b></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-6">
							<div class="mnt_card card" style=" border:1px solid #ddd;border-radius:10px;">
								<h5 class="mnt_card_tit text-cyan">달성률</h5>
								<div class="mnt_card_box row">
									<div class="mnt_card_item col-6">
										<h1 class="text-cyan" style="text-align:center;"><span id="achieveRate1"></span></h1>
										<p style="text-align:center; font-size: 20px;" ><b>소형모터</b></p>
									</div>
									<div class="mnt_card_item col-6">
										<h1 class="text-cyan" style="text-align:center;"><span id="achieveRate2"></span></h1>
										<p style="text-align:center; font-size: 20px;" ><b>중형모터</b></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<!------------ left bottom ----------->
			<div class="list-half col-12" id="">
				<div class="card"  style="border:1px solid #ddd;border-radius:10px;">
					<!--<h6 class="list-half-tit"><a href="/cmsc0010">공지사항</a></h6>  -->
						<!-- 컨텐츠 영역 -->
						<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="bbsListTable" class="table table-bordered" style="border: 1px solid #ddd;border-radius: 5px;">
							<colgroup>
								<col width="5%">
								<col width="20%">
								<col width="60%">
								<col width="7%">
								<col width="7%">
							</colgroup>
							<thead class="thead-light" style="height: 35px;font-size: 13px;">
								<tr>
									<th style="vertical-align:middle; background: white; border-right:none;">번호</th>
									<th style="vertical-align:middle; background: white; border-right:none;" class="text-center">제목</th>
									<th style="vertical-align:middle; background: white; border-right:none;" class="text-center">내용</th>
									<th style="vertical-align:middle; background: white; border-right:none;">등록자</th>
									<th style="vertical-align:middle; background: white;">등록일</th>
								</tr>
							</thead>
							<tbody style="height: 30px;font-size: 12px;font-weight: 500;"></tbody>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!------------ ----------->
		</div>
	</div>
</div>

<%@include file="../layout/bottom.jsp" %>

<script>
	let currentHref = "mmsc0110";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","생산현황"); 
	let viewIdx;
	let sideView = 'add';

	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";


	
	//상단 왼쪽 항목
	$.ajax({
		url : '<c:url value="mm/counList" />',
		type : 'GET',
		data : {
		},
		success : function(res){
			
			$('#countBizAll').text(addCommas(res.countBizAll));
			$('#countBizToday').text(addCommas(res.countBizToday));
			$('#countPurchase').text(addCommas(res.countPurchase));
			$('#countInOut').text(addCommas(res.countInOut));
			$('#countWorkOrder').text(addCommas(res.countWorkOrder));
			$('#countUnOut').text(addCommas(res.countUnOut));

			$('#workOrdQty1').text(addCommas(res.workOrdQty1));
			$('#workOrdQty2').text(addCommas(res.workOrdQty2));
			$('#workOrdOutPutQty1').text(addCommas(res.workOrdOutPutQty1));
			$('#workOrdOutPutQty2').text(addCommas(res.workOrdOutPutQty2));

			if(res.workOrdOutPutQty1==0){
				$('#faultyRate1').text("0%");
				$('#achieveRate1').text("0%");
			}else{
				$('#faultyRate1').text(addCommas(res.faultyRate1));
				$('#achieveRate1').text(addCommas(res.achieveRate1));
			}

			if(res.workOrdOutPutQty2==0){
				$('#faultyRate2').text("0%");
				$('#achieveRate2').text("0%");
			}else{
				$('#faultyRate2').text(addCommas(res.faultyRate2));
				$('#achieveRate2').text(addCommas(res.achieveRate2));
			}
			
		}
	})

	
	//공지사항 목록조회
	let bbsListTable = $('#bbsListTable').DataTable({
		language : lang_kor,
		paging : false,
		searching : false,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 10,
		ajax : {
			url : '<c:url value="mm/bbsList"/>',
			type : 'GET',
			data : {},
		},
		columns : [
			//{data : 'bbsNo'},
	    	{	
	    		render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
    			}, 
    			'className' : 'text-center border-right-0 pl-4',
	    	},
			{
				data : 'bbsTitle',
				'className' : 'text-left border-right-0 pl-4'
			},
			{
				data : 'bbsContent',
				'className' : 'text-left border-right-0 pl-4' 
			},
			{	
				data : 'userNm',
				'className' : 'text-center border-right-0 pl-4'
			},
			{
				  render : function(data, type, row) {
					return moment(row['regDate']).format(
							'YYYY-MM-DD HH:mm');
				},
				'className' : 'text-center'

			} 
		],
		
	});
</script>
</body>
</html>
