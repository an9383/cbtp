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
				<li class="breadcrumb-item"><a href="#">품질관리</a></li>
				<li class="breadcrumb-item active">조도측정관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 59%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()" class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table class="table table-bordered" id="illumAdmTable">
							<colgroup>
								<col width="8%">
								<col width="10%">
								<col width="10%">
								<col width="30%">
								<col width="20%">
								<col width="5%">
								<col width="15%">
							</colgroup>
							<thead class="thead-light">
								<!--==========table thead 추가==========-->
								<tr>
									<th>No.</th>
									<th>측정년도</th>
									<th>공정명</th>
									<th>구역</th>
									<th>측정위치</th>
									<th>단위</th>
									<th>표준</th>
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
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 40%;">
				<div class="card" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 p-1">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()">
								<i class="mdi mdi-close"></i>
							</a>
						</div>
					</div>
					<!--오른쪽 등록 부분 하단 버튼 영역-->
					<div class="card-body pb-2">
						<button type="button" class="btn btn-primary float-right d-none" id="btnSave">저장</button>
			            <button type="button" class="btn btn-warning float-right mr-1" id="btnDel">삭제</button>
                        <button type="button" class="btn btn-primary float-right mr-1" id="btnEdit">수정</button>
                        <button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
					</div>
					
					<div class="table-responsive">
						<form id="form1">
							<table class="table table-bordered" id="illumAdmListTable">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tbody>
									<tr>
										<th>*공정명</th>
										<td>
											<div class="row">
												<div class="input-sub m-0" style="width: 100%;">
													<input type="text" class="form-control" id="illumNm" name="illumNm" disabled>
													<button type="button" class="btn btn-primary input-sub-search" id="btnMold" onClick="selectPrcssCd()" disabled>
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</div>
										</td>
										<th>*공정코드</th>
										<td>
											<input class="form-control" type="text" id="illumCd" disabled/>
										</td>
									</tr>
									<tr>
										<th>*구역</th>
										<td>
											<input class="form-control" type="text" id="illumArea" disabled/>
										</td>
										<th>측정위치</th>
										<td>
											<input class="form-control" type="text" id="msmLoc" disabled/>
										</td>
									</tr>
									<tr>
										<th>단위</th>
										<td>
											<input class="form-control" type="text" id="illumUnit" disabled/>
										</td>
										<th>표준</th>
										<td>
											<input class="form-control" type="text" id="illumStand" disabled/>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					<br><br>
<!-- 					<hr> -->
					<div class="table-responsive">
						<form id="form2">
							<table class="table table-bordered" id="illumDtlListTable">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<thead>
									<tr>
										<th>측정년도</th>
										<th>
											<div class="form-group input-sub m-0 row">
												<select class="custom-select" style="" id="msmYear" onchange="yearChange()" disabled></select>						
											</div>		
										</th>
										<th>측정일</th>
										<th>측정값</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- ===/.right-sidebar 등록,수정===  -->
	</div>
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

	let currentHref = "qmsc0060";
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","조도측정관리"); 
	
	let sideView = '';
	var serverDate = "${serverDate}";

	var illumCd = ''; //공정코드
	var illumArea = ''; //구역
	var msmYear = ''; //측정년도

	var chooseYear = serverDate.substring(0,4);
	
	$(document).ready(function(){
        setDateBox();
    }); 

	//년도 구하기
   function setDateBox(){
	   var dt = new Date();
       var year = "";
       var com_year = dt.getFullYear();
       // 발행 뿌려주기
       // $("#chooseYear").val(com_year);
       // 올해 기준으로 -1년부터 +5년을 보여준다.
       for(var y = (com_year-3); y <= (com_year+5); y++){
           $("#chooseYear").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
       }
       // 올해 기준으로 -1년부터 +5년을 보여준다.
       $("#msmYear").append("<option value=''>년도</option>");
       for(var y = (com_year-3); y <= (com_year+5); y++){
           $("#msmYear").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
       }
       // 오늘 년도 뿌려주기
       $("#chooseYear").val(com_year);
       $("#msmYear").val("");
       chooseYear = com_year
       
       $('#msmYear').val(com_year);
   }

	$('#saveBtnModalY').on('click', function() {
		$('#illumAdmListTable tbody').find('input').attr('disabled', true);
		$('#illumDtlListTable tbody').find('input').attr('disabled', true);
		$('#msmYear').attr('disabled', true);
		$('#btnSave').addClass('d-none');
		uiProc(false);
		$('#chooseYear').find('option').attr('style', '');
		$('#saveBtnModal').modal('hide');
		$('#btnMold').attr('disabled', true);
	});
	
	$('#saveBtnModalN').on('click', function() {
		$('#chooseYear').find('option').attr('style', '');
	});
	
	//조도측정 목록조회
	let illumAdmTable = $('#illumAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language: lang_kor,
        paging: true,
        info: true,
        ordering: false,
        processing: true,
		autoWidth : false,
        lengthChange: true,
        pageLength: 20,
		ajax : {
			url : '<c:url value="qm/illumAdmList"/>',
			type : 'GET',
			data : {
				'chooseYear'	: function(){return chooseYear;}	
			}
		},
		rowId : 'illumCd',
		columns : [
			{ name : 'num',
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				}
			},
			{ data : 'msmYear'		},
			{ data : 'illumNm'		},
			{ data : 'illumArea'	},
			{ data : 'msmLoc'		},
			{ data : 'illumUnit'	},
			{ data : 'illumStand'	},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [
			'copy', 'excel', 'print' 
		],
	});

	//조도측정 목록조회 클릭 시
	$('#illumAdmTable tbody').on('click', 'tr', function(){

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal({backdrop: 'static'});
			$('#saveBtnModal').modal('show');
			return false;
		}
		
		if ( $(this).hasClass('selected') ) {
            //$(this).removeClass('selected');
        }else {
        	$('#illumAdmTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }

        $('#btnSave').addClass('d-none');
        
	    illumCd = illumAdmTable.row(this).data().illumCd;
	    illumArea = illumAdmTable.row(this).data().illumArea;
	    msmYear = illumAdmTable.row(this).data().msmYear;

	    uiProc(false);
	    $('#illumAdmListTable tbody').find('input').attr('disabled', true);

	    //상세조회
	    $.ajax({
			url : '<c:url value="qm/illumDtlList"/>',
			type : 'GET',
			data : {
				 'illumCd'	: function(){ return illumCd; 	},
				 'illumArea'	: function(){ return encodeURI(illumArea); 	},
				 'msmYear'	: function(){ return msmYear;	}
			},
			success : function(res) {
				let data = res.data;
				console.log(data[0]);
				if (res.result == 'ok') {
					//adm
					$('#illumCd').val(data[0].illumCd); 		//공정코드
					$('#illumNm').val(data[0].illumNm); 		//공정명
					$('#illumArea').val(data[0].illumArea); 	//구역  
					$('#msmLoc').val(data[0].msmLoc); 			//측정위치
					$('#illumUnit').val(data[0].illumUnit); 	//단위  
					$('#illumStand').val(data[0].illumStand); 	//표준  
					$('#msmYear').val(data[0].msmYear);			//측정년도
					
					//dtl
					for(var i=0; i<12; i++){
						$('#msmDueDate'+i+'').val(data[i].msmDueDate);		//예정일 
						$('#msmDate'+i+'').val(data[i].msmDate);			//측정일 
						$('#msmMeasures'+i+'').val(data[i].msmMeasures);	//측정값
					}
					
				} else {
					toastr.error(res.message);
				}
			}
		});
		//상세조회
	    
	 	tableAppend();
	});
	
	$(document).ready(function(){
		tableAppend();
    });
    
	//tableAppend
	function tableAppend(){
		$('#illumDtlListTable tbody').empty();
		for(var i=0; i<12; i++){
			var rtn = '<tr><th id="msmMon'+i+'">'+(i+1)+'월 예정일</th>'
				rtn += '<td> <input class="form-control" type="date" id="msmDueDate'+i+'" name="msmDueDate" disabled/> </td>';
				rtn += '<td> <input class="form-control" type="date" id="msmDate'+i+'" name="msmDate" disabled/> </td>';
				rtn += '<td> <input class="form-control" type="text" id="msmMeasures'+i+'" name="msmMeasures" disabled/> </td></tr>';
				$('#illumDtlListTable tbody').append(rtn);
		}
	}

	//년도 값 변경 시
	function yearChange(){
		$('#illumDtlListTable tbody').find('input').attr('disabled', false);
		var year 		= $('#msmYear').val();
		var day 		= serverDate.substring(8,10);
		var daypluses 	= parseInt(serverDate.substring(8,10)) + 1;
		var day2 		= daypluses<=9?("0"+(daypluses)):daypluses;
		
		if(year != ""){
			for(var i=0; i<12; i++){
				var month = i<9?("0"+(i+1)):(i+1);
				var date = moment(year + month + day).format("YYYY-MM-DD");
				var date2 = moment(year + month + day2).format("YYYY-MM-DD");

				var X = new Date(year,month,0).getDate();
				
				$('#msmDueDate'+i+'').attr('min', year+'-'+month+'-01');
				$('#msmDueDate'+i+'').attr('max', year+'-'+month+'-'+X);
				
				$('#msmDueDate'+i+'').val(date);
				$('#msmDate'+i+'').val(date2);
			}
		}else{
			for(var i=0; i<12; i++){
				$('#msmDueDate'+i+'').val("");
				$('#msmDate'+i+'').val("");
				$('#msmDueDate'+i+'').attr('min', '');
				$('#msmDueDate'+i+'').attr('max', '');
				$('#illumDtlListTable tbody').find('input').attr('disabled', true);
			}
		}
	}
	
	// 등록 버튼 클릭 시
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#illumAdmListTable tbody').find('input').attr('disabled', false);
		$('#msmYear').attr('disabled', false);
		$('#btnMold').attr('disabled', false);
		$('#illumNm').attr('disabled', true);
		$('#illumCd').attr('disabled', true);
		uiProc(true);
		$('#btnSave').removeClass('d-none');

// 		$('#form1, #form2').each(function() {
// 			this.reset();
// 		});
		$('#form1').each(function() {
			this.reset();
		});
		
		yearChange();
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if($('#illumAdmTable tbody tr').hasClass('selected')=='') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		sideView = 'edit';
		
		$('#illumDtlListTable tbody').find('input').attr('disabled', false);
		$('#illumAdmListTable tbody').find('input').attr('disabled', false);

		$('#illumNm').attr('disabled', true);
		$('#illumCd').attr('disabled', true);
		$('#illumArea').attr('disabled', true);
		$('#btnMold').attr('disabled', true);
		$('#msmYear').attr('disabled', true);
		uiProc(true);
		$('#btnSave').removeClass('d-none');
	});

	// 저장 처리
	$('#btnSave').on('click',function() {
		
		if (!$.trim($('#illumNm').val())) {
			toastr.warning('공정명을 선택해주세요.');
			$('#btnMold').focus();
			return false;
		}
		
		if (!$.trim($('#illumArea').val())) {
			toastr.warning('구역을 입력해주세요.');
			$('#illumArea').focus();
			return false;
		}
		
		if (!$.trim($('#msmYear').val())) {
			toastr.warning('측정년도를 선택해주세요.');
			$('#msmYear').focus();
			return false;
		}

		for(var i=0; i<12; i++){
			if (!$.trim($('#msmDueDate'+i+'').val())) {
				toastr.warning((i+1)+'월 예정일 선택해주세요.');
				$('#msmDueDate'+i+'').focus();
				return false;
			}
			if (!$.trim($('#msmDate'+i+'').val())) {
				toastr.warning((i+1)+'월 측정일 선택해주세요.');
				$('#msmDate'+i+'').focus();
				return false;
			}
		}

		var admArray = new Array();
		var dtlArray = new Array();

		var admObj = new Object();

		//adm
		admObj.illumCd     = $('#illumCd').val(); 		//공정코드
		admObj.illumArea   = $('#illumArea').val(); 	//구역  
		admObj.msmLoc      = $('#msmLoc').val(); 		//측정위치
		admObj.illumUnit   = $('#illumUnit').val(); 	//단위  
		admObj.illumStand  = $('#illumStand').val(); 	//표준  
		admObj.msmYear     = $('#msmYear').val();		//측정년도
		admArray.push(admObj);
		
		//dtl                          
		for(var i=0; i<12; i++){
			var dtlObj = new Object();
			dtlObj.illumCd     	= $('#illumCd').val(); 			//공정코드
			dtlObj.illumArea    = $('#illumArea').val();	 	//구역  
			dtlObj.msmYear     	= $('#msmYear').val();	 		//측정년도
			dtlObj.msmMon      	= (i+1); 						//측정월 
			dtlObj.msmDueDate  	= $('#msmDueDate'+i+'').val();	//예정일 
			dtlObj.msmDate		= $('#msmDate'+i+'').val();		//측정일 
			dtlObj.msmMeasures	= $('#msmMeasures'+i+'').val();	//측정값
			dtlArray.push(dtlObj);
		}
		console.log(dtlArray);
		
		var admData = JSON.stringify(admArray);
		var dtlData = JSON.stringify(dtlArray);
		
		var url = 'qm/illumCreate';
		
		if (sideView == "edit") {
			url = 'qm/illumUpdate'
		}

		//저장
        $.ajax({
			url : url,
			type : 'POST',
			data : {
				'admArrayData' : function(){ return admData; },
        		'dtlArrayData' : function(){ return dtlData; }
			},
			success: function (res) {
				let data = res.data;
				if (res.result == 'ok') {
					if(sideView == 'add'){
						toastr.success('저장 되었습니다.');
					}else{
						toastr.success('수정 되었습니다.');
					}
					uiProc(false);
					$('#btnSave').addClass('d-none');
					$('#illumDtlListTable tbody').find('input').attr('disabled', true);
					$('#illumAdmListTable tbody').find('input').attr('disabled', true);
					$('#msmYear').attr('disabled', true);
	            	$('#btnMold').attr('disabled', true);
	            	$('#illumAdmTable').DataTable().ajax.reload();
				}else if(res.result == "overlapError"){
					toastr.warning('구역이 중복됩니다.');
// 					toastr.warning($('#msmYear').val()+'년도가 중복됩니다.');
				} else {
					toastr.error(res.message);
				}
            },
            complete : function() {
        		$('#my-spinner').hide();
			}
		});
      //저장
	});

	//삭제버튼 클릭 시
	$('#btnDel').on('click', function(){
		if($('#illumAdmTable tbody tr').hasClass('selected')=='') {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		
		$.ajax({
			url : '<c:url value="qm/illumDelete"/>',
			type : 'POST',
			data : {
				 'illumCd'	: function(){ return illumCd; 	},
				 'msmYear'	: function(){ return msmYear;	},
				 'illumArea'	: function(){ return illumArea;	},
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success('삭제 되었습니다.');
					$('#illumAdmTable').DataTable().ajax.reload();
					$('#form1, #form2').each(function() {
						this.reset();
					});
					$('#btnSave').addClass('d-none');
				} else {
					toastr.error(res.message);
				}
			}
		});
	});
	
	function uiProc(flag) {
		$('#btnAdd').attr('disabled', flag);
		$('#btnEdit').attr('disabled', flag);
		$('#btnDel').attr('disabled', flag);
	}


	//공정명 팝업
	var prcssPopUpTable;
	function selectPrcssCd() {
		if (prcssPopUpTable == null || prcssPopUpTable == undefined) {
			prcssPopUpTable = $('#prcssPopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
				language : lang_kor,
				destroy : true,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : false,
				pageLength : 20,
				ajax : {
					url : '<c:url value="bm/prcssCodeAdmList"/>',
					type : 'GET',
					data : {
						'prcssType' : '001'	//마스터공정 불러옴
					},
				},
				rowId : 'prcssCd',
				columns : [
					{ data : 'prcssCd'		},
					{ data : 'prcssGubunNm'	},
					{ data : 'prcssNm'		},
					{ data : 'prcssInitial'	},
					{ data : 'osrcYnNm'		},
					{ data : 'prcssDesc'	},
				],
				columnDefs : [
					{ "className" : "text-center", "targets" : "_all"},
				],
				order : [ [ 0, 'asc' ] ],
			});
			
			$('#prcssPopUpTable tbody').on('click', 'tr', function() {
				var data = prcssPopUpTable.row(this).data();
				 if ( $(this).hasClass('selected') ) {
		            //$(this).removeClass('selected');
		        }else {
		        	$('#prcssPopUpTable').DataTable().$('tr.selected').removeClass('selected');
		            $(this).addClass('selected');
		        }
				$('#illumCd').val(data.prcssCd);
				$('#illumNm').val(data.prcssNm);
				$('#prcssPopUpModal').modal('hide');
			});
		} else {
			$('#prcssPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#prcssPopUpModal').modal('show');
	}

	//날짜
    var html1 = '<div class="row">';
	    html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">측정년도</label>'; 
	    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<div class="form-group input-sub m-0 row">';
	    html1 += '<select class="custom-select" style="width: 150px;" id="chooseYear"> <span class="oi oi-calendar"></span> </select>';							
	    html1 += '</div>';
	    html1 += '</div>';
// 	    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	    html1 += '</div>';
	    
	$('#illumAdmTable_length').html(html1);

	// 조회버튼
// 	$('#btnRetv').on('click', function() {
	$('#chooseYear').on('click', function() {
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#chooseYear').find('option').attr('style', 'display: none;');
			$('#saveBtnModal').modal({backdrop: 'static'});
			$('#saveBtnModal').modal('show');
			return false;
		}
	  }).on('change', function() {
		chooseYear = $('#chooseYear').val();
		$('#form1, #form2').each(function() {
			this.reset();
		});
		$('#illumAdmTable').DataTable().ajax.reload(function(){
			$('#msmYear').val($('#chooseYear').val());
		});
	  });
  

	
</script>

</body>
</html>
