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
				<li class="breadcrumb-item"><a href="#">생산관리</a></li>
				<li class="breadcrumb-item active">작업일보</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid pt-0" id="main">
		<div class="row" style="height:88vh; max-height:90vh;">
			<div class="col-md-1 p-1" style="background-color:#fff; border: 1px solid #e3e3e3;">
				<div class="card">
					<div class="card-body p-0">
						<div class="btn-group-vertical btn-group-toggle btn-block" data-toggle="buttons" style="overflow:hidden;">
							<h6>메인 목차</h6>
							<label class="btn btn-success mb-1" for="btnGroup1">
								<input type="radio" id="btnGroup1" onclick="tableGroupDnone(1);">보유HR
							</label>
							<label class="btn btn-success mb-1" for="btnGroup2">
								<input type="radio" id="btnGroup2" onclick="tableGroupDnone(2);">P (생산사양서)
							</label>
							<label class="btn btn-success mb-1" for="btnGroup3">
								<input type="radio" id="btnGroup3" onclick="tableGroupDnone(3);">M (설비 현황)
							</label>
							<label class="btn btn-success mb-5" for="btnGroup4">
								<input type="radio" id="btnGroup4" onclick="tableGroupDnone(4);">사출일보
							</label>
							<h6>데이터 목차</h6>
							<label class="btn btn-info mb-1" for="btnGroup5">
								<input type="radio" id="btnGroup5" onclick="tableGroupDnone(5);">설비종합효율
							</label>
							<label class="btn btn-info mb-1" for="btnGroup6">
								<input type="radio" id="btnGroup6" onclick="tableGroupDnone(6);">양품율
							</label>
							<label class="btn btn-info mb-1" for="btnGroup7">
								<input type="radio" id="btnGroup7" onclick="tableGroupDnone(7);">성능가동율
							</label>
							<label class="btn btn-info mb-1" for="btnGroup8">
								<input type="radio" id="btnGroup8" onclick="tableGroupDnone(8);">시간가동율
							</label>
							<label class="btn btn-info mb-1" for="btnGroup9">
								<input type="radio" id="btnGroup9" onclick="tableGroupDnone(9);">비가동율
							</label>
							<label class="btn btn-info mb-1" for="btnGroup10">
								<input type="radio" id="btnGroup10" onclick="tableGroupDnone(10);">불량SCRAP율
							</label>
							<label class="btn btn-info mb-1" for="btnGroup11">
								<input type="radio" id="btnGroup11" onclick="tableGroupDnone(11);">총SCRAP율
							</label>
							<label class="btn btn-info mb-1" for="btnGroup12">
								<input type="radio" id="btnGroup12" onclick="tableGroupDnone(12);">가동시간
							</label>
							<label class="btn btn-info mb-1" for="btnGroup13">
								<input type="radio" id="btnGroup13" onclick="tableGroupDnone(13);">LOSS시간
							</label>
							<label class="btn btn-info mb-1" for="btnGroup14">
								<input type="radio" id="btnGroup14" onclick="tableGroupDnone(14);">설비수리건수
							</label>
							<label class="btn btn-info mb-1" for="btnGroup15">
								<input type="radio" id="btnGroup15" onclick="tableGroupDnone(15);">생산금액
							</label>
							<label class="btn btn-info mb-1" for="btnGroup16">
								<input type="radio" id="btnGroup16" onclick="tableGroupDnone(16);">불량금액
							</label>
							<label class="btn btn-info mb-1" for="btnGroup17">
								<input type="radio" id="btnGroup17" onclick="tableGroupDnone(17);">생산수량
							</label>
							<label class="btn btn-info mb-1" for="btnGroup18">
								<input type="radio" id="btnGroup18" onclick="tableGroupDnone(18);">불량수량
							</label>
							<label class="btn btn-info mb-1" for="btnGroup19">
								<input type="radio" id="btnGroup19" onclick="tableGroupDnone(19);">생산실적-설비별
							</label>
							<label class="btn btn-info mb-1" for="btnGroup20">
								<input type="radio" id="btnGroup20" onclick="tableGroupDnone(20);">생산실적-제품별
							</label>
							<label class="btn btn-info mb-1" for="btnGroup21">
								<input type="radio" id="btnGroup21" onclick="tableGroupDnone(21);">원재료 투입량
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-11 p-1" style="background-color:#fff; border: 1px solid #e3e3e3;">
			
				<div class="card-body d-none" id="tableGroup1" name="tableGroup">
					<div class="card-body col-sm-12 p-1 mb-2">
						<input type="month" class="form-control float-left mr-1" id="month" style="max-width:fit-content; display:inline" onchange="changeMonth()"/>
						<button type="button" class="btn btn-primary float-left mr-1" id="btnEdit1">수정</button>
						<button type="button" class="btn btn-warning float-left mr-1" id="btnDel1">삭제</button>
						<button type="button" class="btn btn-primary float-left d-none" id="btnSave1">저장</button>
						
						<label class="ml-2" style="font-size: 16px; display:inline">주간시간 합계</label>
						<input type="text" class="form-control ml-2" id="monthPlan" style="display:inline; text-align:right" disabled/>
						<label class="ml-2" style="font-size: 16px; display:inline">야간시간 합계</label>
						<input type="text" class="form-control ml-2" id="monthPlan" style="display:inline; text-align:right" disabled/>
						
						<div class="float-right" style="float: left;  width: 20%;">
							<h6>잔업시</h6>
							<table id="table1_show1" class="table table-bordered">
								<colgroup>
									<col width="1%">
									<col width="1%">
									<col width="1%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>시작</th>
										<th>종료</th>
										<th>시간</th>
									</tr>
									<tr>
										<td>8:00</td>
										<td>9:50</td>
										<td>1:50</td>
									</tr>
									<tr>
										<td>10:00</td>
										<td>11:30</td>
										<td>1:30</td>
									</tr>
									<tr>
										<td>12:30</td>
										<td>14:50</td>
										<td>2:20</td>
									</tr>
									<tr>
										<td>15:00</td>
										<td>17:20</td>
										<td>2:20</td>
									</tr>
									<tr>
										<td>17:40</td>
										<td>21:40</td>
										<td>4:00</td>
									</tr>
									<tr>
										<th colspan="2">합계</th>
										<td>12:00</td>
									</tr>
								</thead>
							</table>
						</div>
						<div class="float-right mr-3" style="float: left;  width: 20%; height: 30%;">
							<h6>평상시</h6>
							<table id="table1_show1" class="table table-bordered">
								<colgroup>
									<col width="1%">
									<col width="1%">
									<col width="1%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>시작</th>
										<th>종료</th>
										<th>시간</th>
									</tr>
									<tr>
										<td>8:00</td>
										<td>9:50</td>
										<td>1:50</td>
									</tr>
									<tr>
										<td>10:00</td>
										<td>11:30</td>
										<td>1:30</td>
									</tr>
									<tr>
										<td>12:30</td>
										<td>14:50</td>
										<td>2:20</td>
									</tr>
									<tr>
										<td>15:00</td>
										<td>17:20</td>
										<td>2:20</td>
									</tr>
									<tr>
										<td>17:30</td>
										<td>19:30</td>
										<td>2:00</td>
									</tr>
									<tr>
										<th colspan="2">합계</th>
										<td>10:00</td>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div class="ml-2 mr-3" style="float: left; width: 32%;">
						<table id="table1_1" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>일자</th>
									<th>요일</th>
									<th>주간시간</th>
									<th>야간시간</th>
									<th>비고</th>
								</tr>
								<tr>
									<th>01일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>02일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>03일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>04일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>05일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>06일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>07일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>08일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>09일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>10일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
							</thead>
						</table>
					</div>
					<div class="mr-3" style="float: left; width: 32%;">
						<table id="table1_2" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>일자</th>
									<th>요일</th>
									<th>주간시간</th>
									<th>야간시간</th>
									<th>비고</th>
								</tr>
								<tr>
									<th>11일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>12일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>13일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>14일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>15일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>16일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>17일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>18일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>19일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>20일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
							</thead>
						</table>
					</div>
					<div class="" style="float: left; width: 32%;">
						<table id="table1_3" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>일자</th>
									<th>요일</th>
									<th>주간시간</th>
									<th>야간시간</th>
									<th>비고</th>
								</tr>
								<tr>
									<th>21일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>22일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>23일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>24일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>25일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>26일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>27일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>28일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>29일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>30일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
								<tr>
									<th>31일</th>
									<td></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
									<td><input type="text" class="form-control" id="" name="" style="max-width: 100%"></td>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<div class="card-body d-none" id="tableGroup2" name="tableGroup">
					<div class="card-body col-sm-12 p-1 mb-2">
						<h5 class="float-left">생산사양서</h5>
						<button type="button" class="btn btn-primary float-right d-none" id="btnSave2">저장</button>
						<button type="button" class="btn btn-warning float-right mr-1" id="btnDel2">삭제</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnEdit2">수정</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd2">추가</button>
						</button>
					</div>
					<table id="table2" class="table table-bordered">
						<colgroup>
							<col width="1%">
							<col width="3%">
							<col width="3%">
							<col width="3%">
							<col width="3%">
							<col width="3%">
							<col width="3%">
							<col width="3%">
							<col width="3%">
							<col width="3%">
							<col width="3%">
							<col width="3%">
							<col width="3%">
							<col width="3%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>업체명</th>
								<th>차종</th>
								<th>품번</th>
								<th>품명</th>
								<th>Cavity</th>
								<th>재료명</th>
								<th>GRADE</th>
								<th>제품중량</th>
								<th>S&R중량</th>
								<th>SHOT중량</th>
								<th>C/TIME</th>
								<th>단가</th>
								<th>비고</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup3" name="tableGroup">
					<div class="card-body col-sm-12 p-1 mb-2">
						<h5 class="float-left">설비 현황</h5>
						<button type="button" class="btn btn-primary float-right d-none" id="btnSave3_1">저장</button>
						<button type="button" class="btn btn-warning float-right mr-1" id="btnDel3_1">삭제</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnEdit3_1">수정</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd3_1">추가</button>
						</button>
					</div>
					<table id="table3_1" class="table table-bordered">
						<colgroup>
							<col width="1%">
							<col width="4%">
							<col width="4%">
							<col width="4%">
							<col width="4%">
							<col width="4%">
							<col width="4%">
							<col width="4%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>설비번호</th>
								<th>MAKER</th>
								<th>TON</th>
								<th>규격</th>
								<th>제작일자</th>
								<th>설비등급</th>
								<th>비고</th>
							</tr>
						</thead>
					</table>
					<div class="card-body col-sm-12 p-1 mb-2">
						<h5 class="float-left">원재료 현황</h5>
						<button type="button" class="btn btn-primary float-right d-none" id="btnSave3_2">저장</button>
						<button type="button" class="btn btn-warning float-right mr-1" id="btnDel3_2">삭제</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnEdit3_2">수정</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd3_2">추가</button>
						</button>
					</div>
					<table id="table3_2" class="table table-bordered">
						<colgroup>
							<col width="1%">
							<col width="5%">
							<col width="5%">
							<col width="5%">
							<col width="5%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>재료명</th>
								<th>GRADE</th>
								<th>MAKER</th>
								<th>비고</th>
							</tr>
						</thead>
					</table>
					<div class="card-body col-sm-12 p-1 mb-2">
						<h5 class="float-left">업체 현황</h5>
						<button type="button" class="btn btn-primary float-right d-none" id="btnSave3_3">저장</button>
						<button type="button" class="btn btn-warning float-right mr-1" id="btnDel3_3">삭제</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnEdit3_3">수정</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd3_3">추가</button>
						</button>
					</div>
					<table id="table3_3" class="table table-bordered">
						<colgroup>
							<col width="1%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>업체명</th>
								<th>업체명</th>
								<th>비고</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup4" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>4</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup5" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>5</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup6" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>6</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup7" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>7</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup8" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>8</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup9" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>9</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup10" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>10</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup11" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>11</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup12" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>12</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup13" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>13</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup14" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>14</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup15" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>15</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup16" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>16</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup17" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>17</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup18" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>18</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup19" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>19</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup20" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>20</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="card-body d-none" id="tableGroup21" name="tableGroup">
					<table class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>21</th>
							</tr>
						</thead>
					</table>
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
	// let currentPage = 'dealCorp';

	let currentHref = "wmsc0190";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","작업일보"); 
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";

	var startDate = serverDateFrom;
	var endDate = serverDateTo;
	
	//메뉴 onClick
	function tableGroupDnone(x) {
		$('div[name=tableGroup]').addClass('d-none');
		$('#tableGroup' + x).removeClass('d-none');
	}
	
	//보유HR 테이블 조회
	$("#month").val(moment().format("YYYY-MM"));
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// P (생산사양서) 테이블 조회
	let table2 = $('#table2').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : true,
		searching : true,
// 		serverSide : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/dealCorpDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'dealGubun' : function(){return '222';},
			}
		},
		rowId : 'dealCorpCd',
		columns : [ 
		{
			data : 'dealCorpCd',
			'className' : 'text-center'
		}, 
		{
			data : 'dealCorpNm',
			'className' : 'text-center'
		}, 
		{
			data : 'presidentNm',
			'className' : 'text-center'
		}, 
		{
			data : 'repreItem',
			'className' : 'text-center'
		}, 
		{
			data : 'corpNo',
			'className' : 'text-center'
		}, 
		{
			data : 'corpNo',
			'className' : 'text-center'
		},
		{
			data : 'corpNo',
			'className' : 'text-center'
		},
		{
			data : 'corpNo',
			'className' : 'text-center'
		},
		{
			data : 'corpNo',
			'className' : 'text-center'
		},
		{
			data : 'corpNo',
			'className' : 'text-center'
		},
		{
			data : 'corpNo',
			'className' : 'text-center'
		},
		{
			data : 'corpNo',
			'className' : 'text-center'
		},
		{
			data : 'corpNo',
			'className' : 'text-center'
		},
		{
			data : 'corpNo',
			'className' : 'text-center'
		},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print'],
		
	}); 
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// M (설비 현황) 테이블 조회
	let table3_1 = $('#table3_1').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : true,
		searching : true,
// 		serverSide : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/dealCorpDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'dealGubun' : function(){return '222';},
			}
		},
		rowId : 'dealCorpCd',
		columns : [ 
		{
			data : 'dealCorpCd',
			'className' : 'text-center'
		}, 
		{
			data : 'dealCorpNm',
			'className' : 'text-center'
		}, 
		{
			data : 'presidentNm',
			'className' : 'text-center'
		}, 
		{
			data : 'repreItem',
			'className' : 'text-center'
		}, 
		{
			data : 'corpNo',
			'className' : 'text-center'
		}, 
		{
			data : 'corpNo',
			'className' : 'text-center'
		},
		{
			data : 'corpNo',
			'className' : 'text-center'
		},
		{
			data : 'corpNo',
			'className' : 'text-center'
		},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		
	});
	
	let table3_2 = $('#table3_2').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : true,
		searching : true,
// 		serverSide : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/dealCorpDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'dealGubun' : function(){return '222';},
			}
		},
		rowId : 'dealCorpCd',
		columns : [ 
		{
			data : 'dealCorpCd',
			'className' : 'text-center'
		}, 
		{
			data : 'dealCorpNm',
			'className' : 'text-center'
		}, 
		{
			data : 'presidentNm',
			'className' : 'text-center'
		}, 
		{
			data : 'repreItem',
			'className' : 'text-center'
		}, 
		{
			data : 'corpNo',
			'className' : 'text-center'
		},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		
	});
	
	let table3_3 = $('#table3_3').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : true,
		searching : true,
// 		serverSide : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/dealCorpDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'dealGubun' : function(){return '222';},
			}
		},
		rowId : 'dealCorpCd',
		columns : [ 
		{
			data : 'dealCorpCd',
			'className' : 'text-center'
		}, 
		{
			data : 'dealCorpNm',
			'className' : 'text-center'
		}, 
		{
			data : 'presidentNm',
			'className' : 'text-center'
		}, 
		{
			data : 'repreItem',
			'className' : 'text-center'
		},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		
	});
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
</script>

</body>
</html>
