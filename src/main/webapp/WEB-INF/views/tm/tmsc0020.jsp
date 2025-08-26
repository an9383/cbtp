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
				<li class="breadcrumb-item"><a href="#">재고관리</a></li>
				<li class="breadcrumb-item active">재고위치관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
           <div class="card top_sortbox p-2">
             <div class="row">
             <!-- 일자 -->
             <!--  <label class="input-label-sm">기간 조회</label>
              <input class="form-control mtz-monthpicker-widgetcontainer mr-3" type="text" id="demo-2" style="max-width:5%;"> -->
         
              <!-- 품목 -->
             <label class="input-label-sm">품목</label>
              <div class="input-sub-md">
                <select id="saType" class="custom-select custom-select-sm" onchange="changeLocation();" style="width:90px;"></select>
              </div>
             <button type="button" class="btn btn-info float-right " id="btnSelectLocationNo" onclick="selectLocationNo()" >창고 불러오기</button>
            </div>
         </div>
		<div class="row table-wrap-hid">
	    <!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
              <!--====================TAB-UI=======================-->
                <div class="card-body p-0">
                  <div id="myTabContent" class="tab-content">
                    <!--========등록 탭=====-->
                    <div class="tab-pane fade active show" id="tab1">	
			           <!-- table -->
				       <div class="table-responsive">
					      	<table class="table table-bordered" id="stockLocAdmTable">
					      		<colgroup>
						      		<col width="3%;">
						      		<col width="5%;">
						      		<col width="6%;">
						      		<col width="6%;">
						      		<col width="12%;">
						      		<col width="6%;">
						      		<col width="22%;">	
						      		<col width="7%;">
						      		<col width="15%;">
						      		<col width="6%;">
						      		<col width="6%;">
						      		<col width="6%;">
						      	</colgroup>
						      	<thead class="thead-light" style="font-size: 11px;">
									<tr>
										<th>No.</th>
										<th class="text-center">품목구분</th>
										<th class="text-center">분류</th>
										<th class="text-center">품목코드</th>
										<th class="text-center">품목명</th>
										<th class="text-center">REV</th>
										<th class="text-center">SPEC</th>
										<th class="text-center">재고수량</th>
										<th class="text-center">BarcodeNo</th>
										<th class="text-center">창고</th>
										<th class="text-center">구역</th>
										<th class="text-center">위치</th>
									</tr>
								</thead>
			     			</table>
		          		 </div>
                    </div>
                </div>
           	</div><!-- /.card -->
              <!--====================/TAB-UI=======================-->
		</div>
		<!-- /.left-list -->
	</div>
	<!-- /.row -->
</div>
</div>
<!-- / #main  -->
<!-- /.page-wrapper -->
<!-- Modal Start-->
<div class="modal fade bd-example-modal-xl" id="locationPopupModal" tabindex="-1" role="dialog" aria-labelledby="locationPopupLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="locationPopupLabel">창고정보조회</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
		      	<div class="row ">
					<button type="button" class="btn btn-primary float-right mr-1" id="btnLocAdd">품목추가</button>
				</div>
				<hr class="mb-2 mt-2">  
		      	  <div class="table-responsive" style="height: 400px">     
	                <table id="locationPopupTable" class="table table-bordered">
	                    <thead class="thead-light">
	                    <tr>
	                      <th> <input type="checkbox" id="btnAllCheck"></th>
	                      <th> 창고 </th>
	                      <th> 구역 </th>
	                      <th> 위치 </th>
	                      <th> 비고 </th>
	                      <th> 바코드번호 </th>
	                    </tr>
	                    </thead>
					</table>
				</div>
	 			<hr class="mb-2 mt-2">
				<div class="row">
					<button type="button" class="btn btn-primary float-right mr-1" id="btnLocDel">행삭제</button>
				</div>
				<hr class="mb-2 mt-2">
				<div class="table-responsive" style="height: 220px">
					<table id="locationTempTable" class="table table-bordered">
						<thead class="thead-light">
		                  <tr>
	                      <th><input type="checkbox" id="btnAllCheck2"></th>
	                      <th> 창고 </th>
	                      <th> 구역 </th>
	                      <th> 위치 </th>
	                      <th> 비고 </th>
	                      <th> 바코드번호 </th>
	                      </tr>
	                    </thead>
					</table>
				</div>
		    </div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="getLocationNo">조회</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal End-->
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "tmsc0020";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","재고위치관리"); 
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDateTo}";
	var serverMonth = serverDate.substring(0, 7);
	
	var locationCd=null;
	var locArray = new Array();
	var spTypeVal = null;

	$('#demo-2').val(serverMonth);
	
 	//공통코드 처리 시작
	var saTypeCode = new Array(); 
	<c:forEach items="${saType}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	saTypeCode.push(json);
	</c:forEach> 
	//공통코드 처리 끝
	
	selectBoxAppend(saTypeCode, "saType", "", "");
	
	//재고위치 목록 테이블
	let stockLocAdmTable = $('#stockLocAdmTable').DataTable(
	{
		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : false,
		searching : true,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="tm/stockLocAdmList"/>',
			type : 'GET',
			data : {
				'array' : function(){return locArray;},
				'spType' : function(){return spTypeVal;},
				'tmMon' : function(){return serverMonth.replace(/-/g,'');},
			}
		},
		rowId : 'spCd',
		columns : [ {
			render : function(data,type,row,meta){
				return meta.row+1;
			}
		}, {
			data : 'spType'
		}, {
			data : 'spGubunNm'
		}, {
			data : 'spCd'
		}, {
			data : 'spNm'
		}, {
			data : 'spRev'
		}, {
			data : 'spSpec'
		}, {
			data : 'realQty',
			'className' : 'text-right'
		}, {
			data : 'barcodeNo'
		}, {
			data : 'locationNm'
		}, {
			data : 'areaNm'
		}, {
			data : 'floorCd'
		},],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
		columnDefs : [ {
			"targets" : '_all',
			"className" : "text-center"
		},

		],
	});


	//창고정보조회 팝업 시작
	var locationPopupTable;
	function selectLocationNo() {
		$('#btnAllCheck').prop('checked',false);
		$('#locationTempTable').DataTable().clear().draw();

		locationPopupTable = $('#locationPopupTable').DataTable({
			language : lang_kor,
			lengthChange : false,
			paging : false,
			searching:true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			destroy : true,
			ajax : {
				url : 'bm/locationAdmList',
				type : 'GET',
				data : {
					'useYn' : '001',
					'locCd' : $('#saType option:selected').val()
					}
			},
			columns : [ 
			{
				render : function(data, type, row,meta) {
					return '<input type="checkbox" name="check">';
				}
			}, {
				data : 'locNm'
			}, {
				data : 'areaNm'
			}, {
				data : 'floorNm'
			}, {
				data : 'locDesc'
			}, {
				data : 'locNo'
			},  ],
			columnDefs : [ {
				"targets" : '_all',"className" : "text-center"
			} ],
			order : [ [1, 'asc' ] ],
		});
		
		
		$('#locationPopupModal').modal('show');
	} 

	//창고조회 팝업 하단 목록
	let locationTempTable = $('#locationTempTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : false,
		info : true,
		ordering : true,
		searching: false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		ajax : {
			url : '<c:url value="tm/locationTempTableReset"/>',
			type : 'GET',
			data : {
				},
		},
		rowId : 'saCd',
		columns : [
			{
				render : function(data, type, row,meta) {
					return '<input type="checkbox" name="check2">';
				}
			}, {
				data : 'locNm'
			}, {
				data : 'areaNm'
			}, {
				data : 'floorNm'
			}, {
				data : 'locDesc'
			}, {
				data : 'locNo'
			}, ],
		columnDefs : [ {
			"defaultContent" : "-",
			"targets" : "_all",
			"className" : "text-center"
		} ],
		drawcallback : [{
			//itemAllPopupTable.columns.adjust().draw(); 
		}],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
	});
	


	
	//품목추가 버튼 클릭시
	$('#btnLocAdd').on('click',function(){
		if($('input:checkbox[name=check]').is(":checked")==false){
			toastr.warning("추가할 항목을 선택해주세요.");
			return false;
		}

		
		$('#locationPopupTable tbody tr').each(function(index, item) {		
			var data = locationPopupTable.row(this).data();
			
			if ($(this).find('td input[name=check]').is(":checked") == true) {


				if(locationTempTable.data().count()==0){
					
					$('#locationTempTable').DataTable().row.add(
					{
						"locNm" : data.locNm,
						"areaNm" : data.areaNm,
						"floorNm" : data.floorNm,
						"locDesc" : data.locDesc,
						"locNo" : data.locNo,
					}).draw(true);		
					
				}else{
					var count=0;
					var locNoVal=null;
					
					$('#locationTempTable tbody tr').each(function(index, item) {		
						locNoVal = locationTempTable.row(index).data().locNo;
						
						if(data.locNo == locNoVal ){
							count += 1;
						}
					});

					if(count==0){
						$('#locationTempTable').DataTable().row.add(
						{
							"locNm" : data.locNm,
							"areaNm" : data.areaNm,
							"floorNm" : data.floorNm,
							"locDesc" : data.locDesc,
							"locNo" : data.locNo,
						}).draw(true);		
					}else{
						
						toastr.warning("이미 품목추가된 항목("+locNoVal+")입니다.", {timeOut:5000});
						
					}
				}
				
			}
		});
		$('input[name=check]').prop("checked",false); 
		$('#btnAllCheck').prop("checked",false); 
	});

	//행삭제 버튼 클릭시
	$('#btnLocDel').on('click',function(){
		if($('input:checkbox[name=check2]').is(":checked")==false){
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		var arr = [];
		$('#locationTempTable tbody tr').each(function(index, item) {
			if ($(this).find('td input[name=check2]').is(":checked") == true) {
				arr.push(index);
			}
		});
		$('#locationTempTable').DataTable().rows(arr).remove().draw();	
		$('input[name=check2]').prop("checked",false); 
		$('#btnAllCheck2').prop("checked",false); 
	});

	
	//창고조회 상단 모두선택버튼 
	$('#btnAllCheck').on('click',function(){
		if($('#btnAllCheck').is(':checked')){
			$('input[name=check]').prop('checked',true);
		}else{
			$('input[name=check]').prop('checked',false);
		}
		
	});

	//창고조회 하단 모두선택버튼 
	$('#btnAllCheck2').on('click',function(){
		if($('#btnAllCheck2').is(':checked')){
			$('input[name=check2]').prop('checked',true);
		}else{
			$('input[name=check2]').prop('checked',false);
		}
		
	});

	//위치값 가져오기
	$('#getLocationNo').on('click',function(){
		
		$('#locationTempTable tbody tr').each(function(index, item){
			var locData = locationTempTable.row(index).data().locNo;
			locArray[index] = locData; 
		});


		if(locArray.length>10){
			toastr.warning("창고를 400개 미만으로 설정해주세요.")
			return false;
		}
		
		spTypeVal = $('#saType option:selected').val();
		$('#stockLocAdmTable').DataTable().ajax.reload(function(){});
		$('#locationPopupModal').modal('hide');

		locArray=[];

	});
	
</script>
</body>
</html>
