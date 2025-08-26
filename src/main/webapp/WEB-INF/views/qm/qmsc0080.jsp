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
				<li class="breadcrumb-item active">조도측정 조회</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()" class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table class="table table-bordered" id="illumAdmTable" style="width: 150%; overflow-x: auto;">
							<%--<colgroup>
								<col width="8%">
								<col width="10%">
								<col width="10%">
								<col width="30%">
								<col width="20%">
								<col width="5%">
								<col width="15%">
							</colgroup>--%>
							<thead class="thead-light">
								<!--==========table thead 추가==========-->
								<tr>
									<th rowspan="2">No.</th>
									<th rowspan="2">공정명</th>
									<th rowspan="2">구역</th>
									<th rowspan="2">측정위치</th>
									<th rowspan="2">단위</th>
									<th rowspan="2">표준</th>
									<th colspan="2">1월</th>
									<th colspan="2">2월</th>
									<th colspan="2">3월</th>
									<th colspan="2">4월</th>
									<th colspan="2">5월</th>
									<th colspan="2">6월</th>
									<th colspan="2">7월</th>
									<th colspan="2">8월</th>
									<th colspan="2">9월</th>
									<th colspan="2">10월</th>
									<th colspan="2">11월</th>
									<th colspan="2">12월</th>
								</tr>
								<tr>
									<th>측정일</th>
									<th>수량</th>
									<th>측정일</th>
									<th>수량</th>
									<th>측정일</th>
									<th>수량</th>
									<th>측정일</th>
									<th>수량</th>
									<th>측정일</th>
									<th>수량</th>
									<th>측정일</th>
									<th>수량</th>
									<th>측정일</th>
									<th>수량</th>
									<th>측정일</th>
									<th>수량</th>
									<th>측정일</th>
									<th>수량</th>
									<th>측정일</th>
									<th>수량</th>
									<th>측정일</th>
									<th>수량</th>
									<th>측정일</th>
									<th>수량</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
		</div>
		<!-- ===/.right-sidebar 등록,수정===  -->
	</div>
</div>
<!-- / #main  -->

<%@include file="../layout/bottom.jsp" %>
<script>

	let currentHref = "qmsc0080";
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","조도측정 조회"); 
	
	let sideView = '';
	var serverDate = "${serverDate}";

	var illumCd = ''; //공정코드

	var chooseYear	= parseInt(serverDate.substring(0,4)) - 1;
	var chooseYear2 = serverDate.substring(0,4);
	
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
       for(var y = (com_year-3); y <= (com_year+5); y++){
           $("#chooseYear2").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
       }
       // 올해 기준으로 -1년부터 +5년을 보여준다.
       // 오늘 년도 뿌려주기
       $("#chooseYear").val(parseInt(com_year)-1);
       $("#chooseYear2").val(com_year);
       chooseYear = com_year
   }

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
			url : '<c:url value="qm/illumLookup"/>',
			type : 'GET',
			data : {
				'chooseYear'	: function(){return chooseYear;},
				'chooseYear2'	: function(){return chooseYear2;}
			}
		},
		rowId : 'illumCd',
		columns : [
			{ name : 'num',
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				}
			},
			{ data : 'illumNm'		},
			{ data : 'illumArea'	},
			{ data : 'msmLoc'		},
			{ data : 'illumUnit'	},
			{ data : 'illumStand'	},
			{ data : 'msmDate1'		},
			{ data : 'mon1'			},
			{ data : 'msmDate2'		},
			{ data : 'mon2'			},
			{ data : 'msmDate3'		},
			{ data : 'mon3'			},
			{ data : 'msmDate4'		},
			{ data : 'mon4'			},
			{ data : 'msmDate5'		},
			{ data : 'mon5'			},
			{ data : 'msmDate6'		},
			{ data : 'mon6'			},
			{ data : 'msmDate7'		},
			{ data : 'mon7'			},
			{ data : 'msmDate8'		},
			{ data : 'mon8'			},
			{ data : 'msmDate9'		},
			{ data : 'mon9'			},
			{ data : 'msmDate10'	},
			{ data : 'mon10'		},
			{ data : 'msmDate11'	},
			{ data : 'mon11'		},
			{ data : 'msmDate12'	},
			{ data : 'mon12'		}
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [
			'copy', 'excel', 'print' 
		],
	});

	//조도측정 목록조회 클릭 시
	$('#illumAdmTable tbody').on('click', 'tr', function(){

		if ( $(this).hasClass('selected') ) {
            //$(this).removeClass('selected');
        }else {
        	$('#illumAdmTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
	});
	
	//날짜
    var html1 = '<div class="row">';
	    html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">측정년도</label>'; 
	    html1 += '&nbsp;<div class="form-group m-0 row">';
	    html1 += '<select class="custom-select mr-2" style="width: 150px;" id="chooseYear"> <span class="oi oi-calendar"></span> </select>';
	    html1 += '~<select class="custom-select ml-2" style="width: 150px;" id="chooseYear2"> <span class="oi oi-calendar"></span> </select>';						
	    html1 += '</div>';
	    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	    html1 += '</div>';
	    
	$('#illumAdmTable_length').html(html1);

	// 조회버튼
	$('#btnRetv').on('click', function() {
		chooseYear = $('#chooseYear').val();
		chooseYear2 = $('#chooseYear2').val();
		$('#my-spinner').show();
		$('#illumAdmTable').DataTable().ajax.reload();
		$('#my-spinner').hide();
	 });
  
</script>

</body>
</html>