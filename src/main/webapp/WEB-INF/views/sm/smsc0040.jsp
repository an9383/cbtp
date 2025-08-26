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
                <li class="breadcrumb-item">
                  <a href="#">시스템관리</a>
                </li>
                <li class="breadcrumb-item active">사용자로그기록관리</li>
               </ol>
              </nav>
             </header>      
          <!-- #main============================================================== -->
          <div class="container-fluid" id="main">
              <div class="row table-wrap-hid">	
                  <!--======================== .left-list ========================-->
                  <div class="left-list" id="left-list">
              		  <div class="card">
                      	<%-- <ul class="nav nav-tabs card-header-tabs m-0">
							<c:forEach items="${gubunList}" var="info" varStatus="status">
								<c:if test="${status.index eq 0}">
									<li class="nav-item">
										<a class="nav-link active show" id="tab<c:out value="${status.index}" />Nav" data-toggle="tab" href="#tab1"><c:out value="${info.baseNm}" /></a>
									</li>
								</c:if>
								<c:if test="${status.index != 0}">
									<li class="nav-item">
										<a class="nav-link" id="tab<c:out value="${status.index}" />Nav" data-toggle="tab" href="#tab1"><c:out value="${info.baseNm}" /></a>
									</li>
								</c:if>
							</c:forEach>
						</ul><!-- /.nav-tabs --> --%>
												
								<div class="table-responsive">
		                            <table class="table table-bordered" id="inventoryTable">
			                            <colgroup>
				                            <col width="6%">
				                            <col width="6%">
				                            <col width="8%">
				                            <col width="6%">
				                            <col width="8%">
				                            <col width="8%">
				                            <col width="9%">
				                            <col width="8%">
				                            <col width="10%">
			                            </colgroup>
			                            <thead class="thead-light" style="font-size: 11px;">
				                        
				                         <tr>
				                        	<th class="text-center-th">사용자ID</th>
				                        	<th class="text-center-th">사용자명</th>
				                        	<th class="text-center-th">부서</th>
				                        	<th class="text-center-th">메뉴ID</th>
				                        	<th class="text-center-th">메뉴명</th>
				                        	<th class="text-center-th">메뉴경로</th>
				                        	<th class="text-center-th">IP주소</th>
				                        	<th class="text-center-th">등록자</th>
				                        	<th class="text-center-th">등록일</th>				   
				                        </tr>
				                        
				                        </thead>
		                            </table>
		                        </div>
                      </div>
<!--                       <button type="button" class="btn btn-success float-right">Excel</button> -->
                  </div><!-- /.left-list -->
              </div><!-- /.row -->
            </div><!-- / #main  -->
        </div><!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp" %>

<script>
	$(document).attr("title", "사용자로그기록관리");
	let currentHref = "smsc0040";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');


	var preInWhsDateFromCal =  "${serverDateFrom}";
	var preInWhsDateToCal =  "${serverDateTo}";
	var preInWhsDateCal =  "${serverDate}";	
	var matrlGubunCd = null;
	
	var startDate = moment(preInWhsDateCal).format('YYYY-MM-DD').replace(/-/g, "");
	var LastDate = moment(preInWhsDateCal).format('YYYY-MM-DD').replace(/-/g, "");
	var infinityCheck = false;
	
	//작업내역 테이블
	let inventoryTable = $('#inventoryTable').DataTable({
	    dom: "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>" +
				"<'row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
	    language: lang_kor,
	    paging: true,
	    info: false,
	    searching: true,
	    ordering: true,
	    processing: false,
	    autoWidth: false,
	    lengthChange: true,
	    pageLength: 20,
	    
	    ajax : {
			url : '<c:url value="/sm/systemAccessLogList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){return startDate;},
				'LastDate' : function(){return LastDate;},
			},
		},
		columns : [
			{ data: 'userId' 		},
  			{ data: 'userNm' 		},
  			{ data: 'departmentNm' 	},
  			{ data: 'menuId' 		}, 
  			{ data: 'menuNm' 		}, 
  			{ data: 'menuPath' 		},
  			{ data: 'ipAddr' 		},
  			{ data: 'regId'			},
  			{ data: 'regDate' 		},
  		],
	    order: [
	        [ 6, 'desc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	    drawCallback : function() {
	    	$("#inventoryTable_filter").find("label").addClass("m-0");
        }
	
	});

	var html1 = '<div class="row">&nbsp;<label class="input-label-sm">조회일자</label><div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="preStartWhsDate" name="preStartWhsDate"disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(preStartWhsDate,preStartWhsDate,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="preStartWhsDateCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '<label class="input-label-sm">&nbsp;&nbsp;&nbsp;~</label><div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="preLastWhsDate" name="preLastWhsDate"disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(preLastWhsDate,preLastWhsDate,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="preLastWhsDateCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';

	html1 += '&nbsp;&nbsp;&nbsp;';
	html1 += '<button type="button" class="btn btn-primary mr-1" id="btnRetv">조회</button>';
	html1 += '<button type="button" class="btn btn-secondary" id="btnLogApi">로그연동</button></div>';
	
	$('#inventoryTable_length').html(html1);
	
	$('#preStartWhsDate').val(moment(preInWhsDateCal).format('YYYY-MM-DD'));
	$('#preLastWhsDate').val(moment(preInWhsDateCal).format('YYYY-MM-DD'));
	
	startDate = $('#preStartWhsDate').val().replace(/-/g, "");
	LastDate = $('#preLastWhsDate').val().replace(/-/g, "");

	$('#btnRetv').on('click', function(){
		startDate = $('#preStartWhsDate').val().replace(/-/g, "");
		LastDate = $('#preLastWhsDate').val().replace(/-/g, "");
		
		$('#inventoryTable').DataTable().ajax.reload(function(){});
		
	});
	
	function btnRetvClick(){
		startDate = $('#preStartWhsDate').val().replace(/-/g, "");
		LastDate = $('#preLastWhsDate').val().replace(/-/g, "");
		
		$('#inventoryTable').DataTable().ajax.reload(function(){});
	}


	//사용자로그기록 연동
	$('#btnLogApi').on('click',function(){

		$.ajax({
			url : '<c:url value="sm/systemLogSend" />',
			type : 'POST',
			data : {
				'startDate' : function(){return startDate},
				'LastDate' : function(){return LastDate},
			},
			success : function(res){
				if(res.result=="ok"){
					toastr.success("로그 연동되었습니다.");
				}else{
					toastr.danger(res.message);
				}
			}
		});
	});
	
</script>
</body>
</html>
