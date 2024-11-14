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
				<li class="breadcrumb-item active">설비가동/비가동현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row">
			<div class="col-md-12">
				<div class="card" style="min-height: 45rem;">
					<div class="card-header">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<label for="equipGubunList" class="col-form-label">설비구분</label>
									<select class="custom-select" style="width: 97px;"
										id="equipGubunList"></select>
								</div>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div class="row" id="equipList" style="font-size: 1.3rem;">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp" %>

<script>
	let currentHref = "mmsc0040";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');

	$(document).attr("title","설비가동/비가동현황");

	let equipCdVal = '';
	let equipGubunVal = '001';
	

	// 설비구분 목록
	var equipGubunCode=new Array();
    <c:forEach items="${equipGubun}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		equipGubunCode.push(json);
    </c:forEach>
    
   	selectBoxAppend(equipGubunCode, 'equipGubunList', '001', '2');


   	
 	// col 내부
	function colHtmlData(index, equipCd, equipNm) {
		var colHtmlData = '';
			colHtmlData += '<div class="col-sm-2 pr-0 pl-0">';
			colHtmlData += '	<table class="table table-bordered equipTable" id="'+ equipCd +'">';
			colHtmlData += '		<tr class="bg-primary">';
			colHtmlData += '			<th colspan="2" class="text-center-th" style="color:white;">'+ equipNm +'</th>';
			colHtmlData += '		</tr>';
			colHtmlData += '		<tr>';
			colHtmlData += '			<td rowspan="3" class="text-center-td" id="equipState-'+ index +'">조회중......</td>';
			colHtmlData += '			<td id="equipPD-'+ index +'" style="color:red">지시 : 0</td>';
			colHtmlData += '		</tr>';
			colHtmlData += '		<tr>';
			colHtmlData += '			<td id="equipWD-'+ index +'" style="color:green">완료 : 0</td>';
			colHtmlData += '		</tr>';
			colHtmlData += '		<tr>';
			colHtmlData += '			<td id="equipWI-'+ index +'" style="color:blue">진행 : 0</td>';
			colHtmlData += '		</tr>';
			colHtmlData += '	</table>';
			colHtmlData += '</div>';

		$('#equipList').append(colHtmlData);
	}

 	// 초기 설비 목록 조회
	$.ajax({
		url :  '<c:url value="/mm/equipCodeList"/>',
		type : 'POST',
		data: {
			'equipGubun'	:	function(){ return equipGubunVal = $('#equipGubunList option:selected').val(); },
        },				
		success : function(res) {
			var data = res.data;
			$('#equipList').empty();
			if (res.result == 'ok') {
				console.log(data.length);
				for(var i=0;i<data.length;i++){
					colHtmlData(i, data[i].equipCd, data[i].equipNm);
				}
			} else {
				toastr.error(res.message);
			}
		}
	});

   	//설비구분 및 작업구분 변경 change
   	$('#equipGubunList').on('change', function() {
   		$.ajax({
			url :  '<c:url value="/mm/equipCodeList"/>',
			type : 'POST',
			data: {
				'equipGubun'	:	function(){ return equipGubunVal = $('#equipGubunList option:selected').val(); },
            },				
			success : function(res) {
				var data = res.data;
				$('#equipList').empty();
				if (res.result == 'ok') {
					console.log(data.length);
					for(var i=0;i<data.length;i++){
						colHtmlData(i, data[i].equipCd, data[i].equipNm);
					}
				} else {
					toastr.error(res.message);
				}
			}
		});

   		
   	})


   	//실시간 작업현황  조회
   	setInterval(function(){
   		$.ajax({
			url :  '<c:url value="/mm/equipStateList"/>',
			type : 'POST',
			data: {
				'equipGubun'	:	function(){ return equipGubunVal = $('#equipGubunList option:selected').val(); },
            },				
			success : function(res) {
				var data = res.data;
				if (res.result == 'ok') {
					for(var val of data) {
						$('#'+val.equipCd).find('tr').eq(1).find('td').eq(0).text(val.equipStatus=='Y'?'설비가동':'설비비가동');
						$('#'+val.equipCd).find('tr').eq(1).find('td').eq(0).css('color',val.equipStatus=='Y'?'blue':'red');
						$('#'+val.equipCd).find('tr').eq(1).find('td').eq(1).text('지시 : '+val.pd);
						$('#'+val.equipCd).find('tr').eq(2).find('td').eq(0).text('완료 : '+val.wc);
						$('#'+val.equipCd).find('tr').eq(3).find('td').eq(0).text('진행 : '+val.wi);
					}
				} else {
					toastr.error(res.message);
				}
			}
		});
	},3000);



   	
   	
	
</script>

</body>
</html>
