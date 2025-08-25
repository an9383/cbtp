<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<main>
<!-- 삭제 모달 -->
<div class="modal modal-alert fade" id="deleteModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
	<div class="modal-dialog" role="document" style="max-width: 40vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 id="exampleModalAlertWarningLabel" class="modal-title" style="font-size: 2vw;">
					<i class="fa fa-bullhorn text-warning mr-1"></i> 데이터 삭제
				</h5>
			</div>
			<div class="modal-body">
				<p style="font-size: 2vw;">삭제된 데이터는 복구가 불가능합니다.<br>정말 삭제하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btnDeleteConfirm" style="font-size: 1vw;">삭제</button>
				<button class="btn btn-danger d-none" id="btnDeleteConfirmLoading" type="button" disabled=""><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Loading...</button>
				&nbsp;<button type="button" class="btn btn-secondary" data-dismiss="modal" style="font-size: 1vw;">취소</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="deleteSmallModal" tabindex="-1" role="dialog" aria-labelledby="deleteSmallLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteSmallLabel">삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<h6>삭제된 데이터는 복구가 불가능합니다.<br>정말 삭제하시겠습니까?</h6> 
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-danger" id="btnDeleteY">삭제</button>
		<button type="button" class="btn btn-secondary" data-dismiss="modal" style="font-size: 1vw;">취소</button>
      </div>
    </div>
  </div>
</div>
<!-- 저장 여부 모달 -->
<div class="modal fade" id="saveBtnModal" tabindex="-1" role="dialog" aria-labelledby="saveBtnModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="saveBtnModalLabel">주의</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<h6>입력하던 정보가 있습니다. 입력을 그만두시겠습니까?</h6> 
      </div>
      <div class="modal-footer">
     	<button type="button" class="btn btn-primary" id="saveBtnModalY" data-dismiss="modal">예</button>
		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<!--선입선출 여부 모달 -->
<div class="modal fade" id="fifoBtnModal" tabindex="-1" role="dialog" aria-labelledby="fifoBtnModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <!-- <h5 class="modal-title" id="fifoBtnModalLabel">선입선출</h5> -->
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<h5>이전 LOT가 있습니다.</h5> 
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" id="fifoBtnModalY" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<!--창고이동 여부 모달 -->
<div class="modal fade" id="locChangeBtnModal" tabindex="-1" role="dialog" aria-labelledby="locChangeBtnModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <!-- <h5 class="modal-title" id="fifoBtnModalLabel">선입선출</h5> -->
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<h6 id="message"></h6> 
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" id="locChangeY" data-dismiss="modal">예</button>
      	<button type="button" class="btn btn-danger" id="locChangeN" data-dismiss="modal">아니요</button>
      </div>
    </div>
  </div>
</div>
<!-- 삭제여부 모달2 -->
<div class="modal fade" id="deleteModal2" tabindex="-1" role="dialog" aria-labelledby="deleteModal2" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">주의</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<h6>입력하던 정보가 있습니다. 계속 진행하시겠습니까?</h6> 
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" id="btnDeleteConfirmY" data-dismiss="modal">예</button>
      	<button type="button" class="btn btn-danger" id="btnDeleteConfirmN" data-dismiss="modal">아니요</button>
      </div>
    </div>
  </div>
</div>

<!-- 정보 변환 여부 -->
<div class="modal fade" id="changeModal" tabindex="-1" role="dialog" aria-labelledby="changeModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="changeModalLabel">주의</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<h6>입력하던 정보가 있습니다. 창고 변경하시겠습니까?</h6> 
      	
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" id="changeModalY" data-dismiss="modal">예</button>
      	<button type="button" class="btn btn-danger" id="changeModalN" data-dismiss="modal">아니요</button>
      </div>
    </div>
  </div>
</div>

<!-- 승인 변환 여부 -->
<div class="modal fade" id="approveSaveModal" tabindex="-1" role="dialog" aria-labelledby="approveSaveModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="approveSaveModalLabel">주의</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<h6>승인을 하게 되면 더이상 수정은 불가합니다. 승인 하시겠습니까?</h6> 
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" id="approveSaveModalY" data-dismiss="modal">예</button>
      	<button type="button" class="btn btn-danger" id="approveSaveModalN" data-dismiss="modal">아니요</button>
      </div>
    </div>
  </div>
</div>


<!--확정 여부 -->
<div class="modal fade" id="confirmSaveModal" tabindex="-1" role="dialog" aria-labelledby="confirmSaveModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmSaveModalLabel">알림</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<h6>확정을 하게 되면 더이상 수정은 불가합니다. 확정 하시겠습니까?</h6> 
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" id="confirmSaveModalY" data-dismiss="modal">예</button>
      	<button type="button" class="btn btn-danger" id="confirmSaveModalN" data-dismiss="modal">아니요</button>
      </div>
    </div>
  </div>
</div>

<!-- 공통코드 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="commonCdPopUpModal" tabindex="-1" role="dialog" aria-labelledby="commonCdPopUpModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="commonCdPopUpLabel">시스템공통코드 조회</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div> 
	      <div class="modal-body">
	      	<hr class="text-secondary">	         
                <table id="commonCdPopUpTable" class="table table-bordered">
                    <thead class="thead-light">
                    <tr>
                      <th> 사용유무 </th>
                      <th> 항목코드 </th>
                      <th> 항목명 </th>
                      <th> 약칭 </th>
                      <th> 체크1 </th>
                      <th> 체크2 </th>
                      <th> 체크3 </th>
                      <th> 체크4 </th>
                      <th> 체크5 </th>
                      <th> 비고 </th>
                    </tr>
                    </thead>
				</table>
 			<hr class="text-secondary"> 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 공통코드 모달 종료-->
<!-- 공통코드 모달 종료-->
<!-- 개인정보 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="infoPopUpModal" tabindex="-1" role="dialog" aria-labelledby="infoPopUpModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="infoPopUpLabel">사용자정보</h5>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </button>
         </div> 
         <div class="modal-body">
            <hr class="text-secondary">            
                <table class="table table-bordered" id="infoTable">
                     <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                     </colgroup>
                     <tr>
                        <th>성명</th>
                        <td>
                        	<input type="text" class="form-control" id="userNmModal" name="userNm" maxlength="10" style="min-width : 100%" disabled>
                        </td>
                        <th>사번코드</th>
                        <td>
                        	<input type="text" class="form-control" id="userNumberModal" name="userNumber" style="min-width : 100%" disabled>
                        </td>

                     </tr>
                     <tr>
                        <th>아이디</th>
                        <td>   
                           <input type="text" class="form-control" id="userIdModal" name="userId" maxlength="20" onpaste="return false;" oncopy="return false;" style="min-width : 100%" disabled> 
                        </td>
                        <th>직위</th>
                        <td>
                        	<input type="text" class="form-control" id="postCdModal" name="postCdModal" style="min-width : 100%" disabled>
                        </td>                        
                     </tr>
                     <tr>
                     	<th>부서</th>
                        <td>
                        	<input type="text" class="form-control" id="departmentCdModal" name="departmentCdModal" style="min-width : 100%" disabled>
                        </td>
                        <th>담당</th>
                        <td>
                        	<input type="text" class="form-control" id="chargrDutyModal" name="chargrDutyModal" style="min-width : 100%" disabled>
                        </td>
                     </tr>                                             
                  </table>
          <hr class="text-secondary"> 
         </div>
         <div class="modal-footer">
           <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
         </div>
       </div>
     </div>
   </div>
<!-- 개인정보 모달 종료-->
<!-- 비밀번호 변경 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="passChangePopUpModal" tabindex="-1" role="dialog" aria-labelledby="passChangePopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="passChangePopUpLabel">사용자정보</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<table class="table table-bordered" id="passChangeTable">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
					</colgroup>
					<tr>
						<th>현재 비밀번호</th>
						<td>
							<input type="password" style="max-width: 100%;" class="form-control" id="nowPassword" name="nowPassword" disabled>
						</td>
					</tr>
					<tr>
						<th>비밀번호 변경</th>
						<td>
							<input type="password" style="max-width: 100%;" class="form-control" id="changePassword" name="changePassword" disabled>
						</td>
					</tr>
					<tr>
						<th>비밀번호 변경 확인</th>
						<td>
							<input type="password" style="max-width: 100%;" class="form-control" id="changePassword2" name="changePassword2" disabled>
						</td>
					</tr>
				</table>
				<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="passChangePopUpSave">저장</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 비밀번호 모달 종료-->
<!-- 부서 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="departPopUpModal" tabindex="-1" role="dialog" aria-labelledby="commonCdPopUpModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="departPopUpLabel">부서 조회</h5>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </button>
         </div> 
         <div class="modal-body">
            <hr class="text-secondary">            
                <table id="departPopUpTable" class="table table-bordered">
                    <thead class="thead-light">
                    <tr>                     
                      <th> 부서코드 </th>
                      <th> 부서명 </th>                      
                      <th> 비고 </th>
                    </tr>
                    </thead>
            </table>
          <hr class="text-secondary"> 
         </div>
         <div class="modal-footer">
           <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
         </div>
       </div>
     </div>
   </div>
<!-- 공통코드 모달 종료-->

<!-- 귀책부서 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="attributablePopUpModal" tabindex="-1" role="dialog" aria-labelledby="commonCdPopUpModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="attributablePopUpLabel">귀책부서 조회</h5>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </button>
         </div> 
         <div class="modal-body">
            <hr class="text-secondary">            
                <table id="attributablePopUpTable" class="table table-bordered">
                    <thead class="thead-light">
                    <tr>                     
                      <th> 부서코드 </th>
                      <th> 부서명 </th>                      
                      <th> 비고 </th>
                    </tr>
                    </thead>
            </table>
          <hr class="text-secondary"> 
         </div>
         <div class="modal-footer">
           <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
         </div>
       </div>
     </div>
   </div>
<!-- 귀책부서 모달 종료-->

<!-- 자재 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="matrlPopUpModal" tabindex="-1" role="dialog" aria-labelledby="matrlPopUpModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="matrlPopUpLabel">자재코드조회</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div> 
	      <div class="modal-body">
	      	<hr class="text-secondary">	         
                <table id="matrlCdPopUpTable" class="table table-bordered">
                    <thead class="thead-light">
                    <tr>
                      <th> 자재시퀀스 </th>	                        
                      <th> 자재코드 </th>
                      <th> 자재명 </th>
                      <th> 자재분류 </th>
                      <th> 자재구분 </th>
                      <th> 규격 </th>
                    </tr>
                    </thead>
				</table>
 			<hr class="text-secondary"> 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 자재 모달 종료-->

<!-- 자재 모달2 시작-->
<div class="modal fade bd-example-modal-lg" id="matrlPopUpModal2" tabindex="-1" role="dialog" aria-labelledby="matrlPopUpModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="matrlPopUpLabel2">자재코드조회</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div> 
	      <div class="modal-body">
	      	<hr class="text-secondary">	         
                <table id="matrlCdPopUpTable2" class="table table-bordered">
                    <thead class="thead-light">
                    <tr>
                      <th> 자재시퀀스 </th>	                        
                      <th> 자재코드 </th>
                      <th> 자재명 </th>
                      <th> 자재분류 </th>
                      <th> 자재구분 </th>
                      <th> 규격 </th>
                    </tr>
                    </thead>
				</table>
 			<hr class="text-secondary"> 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 자재 모달2 종료-->

<!-- 자재 모달2 시작-->
<div class="modal fade bd-example-modal-lg" id="matrlPopUpModal3" tabindex="-1" role="dialog" aria-labelledby="matrlPopUpModalLabel3" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="matrlPopUpLabel3">자재코드조회</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div> 
	      <div class="modal-body">
	      	<hr class="text-secondary">	         
                <table id="matrlCdPopUpTable3" class="table table-bordered">
                    <thead class="thead-light">
                    <tr>
                      <th> 자재시퀀스 </th>	                        
                      <th> 자재코드 </th>
                      <th> 자재명 </th>
                      <th> 자재분류 </th>
                      <th> 자재구분 </th>
                      <th> 규격 </th>
                    </tr>
                    </thead>
				</table>
 			<hr class="text-secondary"> 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 자재 모달2 종료-->

<!-- 작업지시 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="workOrdPopUpModal" tabindex="-1" role="dialog" aria-labelledby="workOrdPopUpModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="workOrdPopUpLabel">작업지시 조회</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div> 
	      <div class="modal-body">
	      	<hr class="text-secondary">	 
	      		<div class="table-responsive">
	      	         <table id="workOrdPopUpTable" class="table table-bordered">
	                    <thead class="thead-light">
	                    <tr>
	                      <th> 작지번호 </th>
	                      <th> 구분      </th>
	                      <th> 품명 </th>
	                      <th> LOT NO </th>   
	                      <th> 지시수량 </th>                                   
	                    </tr>
	                    </thead>
					</table>
	      		</div>
 			<hr class="text-secondary"> 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 작업지시 모달 종료-->

<!-- 공정 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="prcssPopUpModal" tabindex="-1" role="dialog" aria-labelledby="prcssPopUpModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="prcssPopUpLabel">공정정보조회</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
      	<hr class="text-secondary">	         
               <table id="prcssPopUpTable" class="table table-bordered">
                   <thead class="thead-light">
                   <tr>
                     <th> 공정코드 </th>	                        
                     <th> 공정구분 </th>
                     <th> 공정명</th>
                     <th> 이니셜 </th>
                     <th> 외주공정여부 </th>
                     <th> 비고 </th>
                   </tr>
                   </thead>
			</table>
			<hr class="text-secondary"> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 공정 모달 종료-->

<!-- 공정2 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="prcssPopUpModal2" tabindex="-1" role="dialog" aria-labelledby="prcssPopUpModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="prcssPopUpLabel2">중공정정보조회</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
      	<hr class="text-secondary">	         
               <table id="prcssPopUpTable2" class="table table-bordered">
                   <thead class="thead-light">
                   <tr>
                     <th> 중공정코드 </th>	                        
                     <th> 공정구분 </th>
                     <th> 중공정명</th>
                     <th> 이니셜 </th>
                     <th> 비고 </th>
                   </tr>
                   </thead>
			</table>
			<hr class="text-secondary"> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 공정2 모달 종료-->

<!-- 거래처 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="dealCorpPopUpModal" tabindex="-1" role="dialog" aria-labelledby="dealCorpPopUpModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="dealCorpPopUpLabel">거래처정보조회</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
      	<hr class="text-secondary">	         
               <table id="dealCorpPopUpTable" class="table table-bordered">
                   <thead class="thead-light">
                   <tr>
					<th>거래구분</th>
					<th>거래처코드</th>
					<th>업체명</th>
					<th>대표자</th>
					<th>대표품목</th>
					<th>사업자번호</th>
                   </tr>
                   </thead>
			</table>
			<hr class="text-secondary"> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 거래처 모달 종료-->


<!-- 거래처 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="dealCorpPopUpModal2" tabindex="-1" role="dialog" aria-labelledby="dealCorpPopUpModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="dealCorpPopUpLabel2">발주처 조회</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div> 
	      <div class="modal-body">
	      	<hr class="text-secondary">	         
                <table id="dealCorpPopUpTable2" class="table table-bordered">
                    <thead class="thead-light">
                    <tr>
						<th>거래처코드</th>
						<th>업체명</th>
						<th>약칭</th>
						<th>대표자</th>
						<th>국가명</th>
						<th>사업자번호</th>
                    </tr>
                    </thead>
				</table>
 			<hr class="text-secondary"> 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 거래처 모달 종료-->


<!-- 거래처 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="dealCorpPopUpModal3" tabindex="-1" role="dialog" aria-labelledby="dealCorpPopUpModalLabel3" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="dealCorpPopUpLabel3">출고처 조회</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div> 
	      <div class="modal-body">
	      	<hr class="text-secondary">	         
                <table id="dealCorpPopUpTable3" class="table table-bordered">
                    <thead class="thead-light">
                    <tr>
						<th>거래처코드</th>
						<th>업체명</th>
						<th>약칭</th>
						<th>대표자</th>
						<th>국가명</th>
						<th>사업자번호</th>
                    </tr>
                    </thead>
				</table>
 			<hr class="text-secondary"> 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 거래처 모달 종료-->

<!-- 거래처 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="dealCorpPopUpModal4" tabindex="-1" role="dialog" aria-labelledby="dealCorpPopUpModalLabel4" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
      		<div class="modal-header">
        		<h5 class="modal-title" id="dealCorpPopUpLabel">거래처조회</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary">	         
        			<table id="dealCorpPopUpTable4" class="table table-bordered">
                   		<thead class="thead-light">
	                   		<tr>
								<th style="width : 20%">거래처</th>
								<th style="width : 15%">거래처코드</th>
								<th style="width : 25%">대표자</th>
								<th style="width : 15%">대표품목</th>
								<th style="width : 25%">사업자번호</th>
	                   		</tr>
                   		</thead>
					</table>
				<hr class="text-secondary"> 
      		</div>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      		</div>
    	</div>
  	</div>
</div>
<!-- 거래처 모달 종료-->

<!-- 거래처 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="dealCorpPopUpModal5" tabindex="-1" role="dialog" aria-labelledby="dealCorpPopUpModalLabel5" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style=" width:30vw; height: 70vh; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); ">
      		<div class="modal-header">
        		<h5 class="modal-title" id="dealCorpPopUpLabel5">거래처조회</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary">	         
        			<table id="dealCorpPopUpTable5" class="table table-bordered">
                   		<thead class="thead-light">
	                   		<tr>
								<th style="width : 60%">거래처</th>
							</tr>
                   		</thead>
					</table>
				<hr class="text-secondary"> 
      		</div>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      		</div>
    	</div>
  	</div>
</div>
<!-- 거래처 모달 종료-->

<!-- 공정정보관리 - 기본정보 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="prcssItemPopUpModal" tabindex="-1" role="dialog" aria-labelledby="prcssItemPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
      		<div class="modal-header">
        		<h5 class="modal-title" id="prcssItemPopUpLabel">품목코드조회</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary">	         
        			<table id="prcssItemPopUpTable" class="table table-bordered">
                   		<thead class="thead-light">
	                   		<tr>
								<th style="width : 10%">품번</th>
								<th style="width : 10%">차종</th>
								<th style="width : 10%">품명</th>
								<th style="width : 10%">구분</th>
								<th style="width : 10%">단위</th>
	                   		</tr>
                   		</thead>
					</table>
				<hr class="text-secondary"> 
      		</div>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      		</div>
    	</div>
  	</div>
</div>
<!-- 공정정보관리 - 기본정보 모달 종료-->

<!-- 검사항목관리 코드 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="inspCodePopUpModal" tabindex="-1" role="dialog" aria-labelledby="inspCodePopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
      		<div class="modal-header">
        		<h5 class="modal-title" id="inspCodePopUpLabel">제품검사조회</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary">	         
        			<table id="inspCodePopUpTable" class="table table-bordered">
                   		<thead class="thead-light">
	                   		<tr>
								<th style="width : 25%">품번</th>
								<th style="width : 45%">품명</th>
								<th style="width : 15%">고객사</th>
								<th style="width : 15%">상태</th>
	                   		</tr>
                   		</thead>
					</table>
				<hr class="text-secondary"> 
      		</div>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      		</div>
    	</div>
  	</div>
</div>
<!-- 검사항목관리 코드 모달 종료-->

<!-- 공정정보관리(Master) - 기본정보 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="prcssCodePopUpModal" tabindex="-1" role="dialog" aria-labelledby="prcssCodePopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
      		<div class="modal-header">
        		<h5 class="modal-title" id="prcssCodePopUpLabel">Sub공정코드조회</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary">	         
        			<table id="prcssCodePopUpTable" class="table table-bordered">
                   		<thead class="thead-light">
	                   		<tr>
								<th style="width : 10%">Sub공정코드</th>
								<th style="width : 10%">Sub공정명</th>
								<th style="width : 10%">외주여부</th>
	                   		</tr>
                   		</thead>
					</table>
				<hr class="text-secondary"> 
      		</div>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      		</div>
    	</div>
  	</div>
</div>
<!-- 공정정보관리(Master) - 기본정보 모달 종료-->

<!-- 공정정보관리 - 설비정보 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="prcssEquipPopUpModal" tabindex="-1" role="dialog" aria-labelledby="prcssEquipPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
      		<div class="modal-header">
        		<h5 class="modal-title" id="prcssEquipPopUpLabel">설비코드조회</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary">	         
        			<table id="prcssEquipPopUpTable" class="table table-bordered">
                   		<thead class="thead-light">
	                   		<tr>
								<th style="width : 10%">설비코드</th>
								<th style="width : 10%">설비명</th>
	                   		</tr>
                   		</thead>
					</table>
				<hr class="text-secondary"> 
      		</div>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      		</div>
    	</div>
  	</div>
</div>
<!-- 공정정보관리 - 설비정보 모달 종료-->

<!-- 품목정보관리 - 작업장 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="itemWorkplacePopUpModal" tabindex="-1" role="dialog" aria-labelledby="itemWorkplacePopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
      		<div class="modal-header">
        		<h5 class="modal-title" id="itemWorkplacePopUpLabel">작업장 조회</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary">	         
        			<table id="itemWorkplacePopUpTable" class="table table-bordered">
                   		<thead class="thead-light">
	                   		<tr>
								<th style="width : 10%">공정코드</th>
								<th style="width : 10%">공정명</th>
	                   		</tr>
                   		</thead>
					</table>
				<hr class="text-secondary"> 
      		</div>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      		</div>
    	</div>
  	</div>
</div>
<!-- 품목정보관리 - 작업장 모달 종료-->

<!-- 품목정보관리 - 금형코드 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="equipCdPopUpModal" tabindex="-1" role="dialog" aria-labelledby="equipCdPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
      		<div class="modal-header">
        		<h5 class="modal-title" id="equipCdPopUpLabel">금형코드 조회</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary">	         
        			<table id="equipCdPopUpTable" class="table table-bordered">
                   		<thead class="thead-light">
	                   		<tr>
								<th style="width : 10%">금형코드</th>
								<th style="width : 10%">금형명</th>
								<th style="width : 10%">제조사</th>
								<th style="width : 10%">제작일자</th>
	                   		</tr>
                   		</thead>
					</table>
				<hr class="text-secondary"> 
      		</div>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      		</div>
    	</div>
  	</div>
</div>
<!-- 품목정보관리 - 금형코드 모달 종료-->

<!-- 제품 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="itemCdPopUpModal"
	tabindex="-1" role="dialog" aria-labelledby="itemCdPopUpModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="itemCdPopUpLabel">품목코드조회</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<table id="itemCdPopUpTable" class="table table-bordered">
					<colgroup>
						<col width="5%">
						<col width="25%">
						<col width="35%">
						<col width="10%">
						<col width="15%">
						<col width="10%">
					</colgroup>
					<thead class="thead-light">
						<tr>
							<th>No.</th>
							<th>품번</th>
							<th class="text-center">품명</th>
							<th class="text-center">MAKER</th>
							<th>고객사</th>
							<th>차종</th>
						</tr>
					</thead>
				</table>
				<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 제품 모달 종료-->

<!-- 설비 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="equipPopUpModal" tabindex="-1" role="dialog" aria-labelledby="equipPopUpModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="equipPopUpLabel">설비코드조회</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div> 
	      <div class="modal-body">
	      	<hr class="text-secondary">	         
                <table id="equipPopUpTable" class="table table-bordered">
                    <thead class="thead-light">
                    <tr>
	                    <th>설비코드</th>
	                    <th>설비명</th>	  
	                    <th>구분</th>	                          
	                    <th>설비그룹</th>
	                    <th>관리번호</th>
	                    <th>담당자</th>
                    </tr>
                    </thead>
				</table>
 			<hr class="text-secondary"> 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 설비 모달 종료-->

<!-- 설비 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="equipPopUpModal2" tabindex="-1" role="dialog" aria-labelledby="equipPopUpModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="equipPopUpLabel2">설비조회</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div> 
	      <div class="modal-body">
	      	<hr class="text-secondary">	 
		      	<div class="table-responsive" style="height:600px">    
	                <table id="equipPopUpTable2" class="table table-bordered">
	                    <thead class="thead-light">
	                    <tr>
		                    <th>설비코드</th>
		                    <th>설비명</th>	                            
		                    <th>모델명</th>
		                    <th>제조사</th>
		                    <th>사용유무</th>
	                    </tr>
	                    </thead>
					</table>
	 			<hr class="text-secondary"> 
	 			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 설비 모달 종료-->

<!-- 설비 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="equipPopUpModal3" tabindex="-1" role="dialog" aria-labelledby="equipPopUpModalLabel3" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="equipPopUpLabel3">설비코드조회</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div> 
	      <div class="modal-body">
	      	<hr class="text-secondary">	 
		      	<div class="table-responsive" style="height:600px">    
	                <table id="equipPopUpTable3" class="table table-bordered">
	                    <thead class="thead-light">
	                    <tr>
		                    <th>설비코드</th>
		                    <th>설비명</th>	                            
		                    <th>자산코드</th>
		                    <th>제조사</th>
	                    </tr>
	                    </thead>
					</table>
	 			<hr class="text-secondary"> 
	 			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 설비 모달 종료-->

<!-- BOM 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="bomPopUpModal" tabindex="-1" role="dialog" aria-labelledby="bomPopUpModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="bomPopUpLabel">BOM조회</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div> 
	      <div class="modal-body">
	      	<hr class="text-secondary">	         
                <table id="bomPopUpTable" class="table table-bordered">
                    <thead class="thead-light">
                    <tr>
						<th>BOM코드</th>
						<th>구분</th>
						<th>생산공정명</th>
						<th>공정명</th>
						<th>사용유무</th>
                    </tr>
                    </thead>
				</table>
 			<hr class="text-secondary"> 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- BOM 모달 종료-->

<!-- 담당자 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="userPopUpModal" tabindex="-1" role="dialog" aria-labelledby="userPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="userPopUpLabel">담당자조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<hr class="text-secondary">
			<div class="table-responsive">
				<table id="userPopUpTable" class="table table-bordered">
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead class="thead-light">
	                    <tr>
							<th style="min-width: 50px">성명</th>
							<th style="min-width: 60px">부서</th>
							<th style="min-width: 40px">직위</th>
							<th style="min-width: 60px">담당</th>
							<th style="min-width: 40px">비고</th>
	                    </tr>
                    </thead>
                    
				</table>
			</div>
			<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 담당자 모달 종료-->

<!-- 담당자 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="userPopUpModal2" tabindex="-1" role="dialog" aria-labelledby="userPopUpModalLabel2" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="userPopUpLabel2">담당자조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<hr class="text-secondary">
			<div class="table-responsive">
				<table id="userPopUpTable2" class="table table-bordered">
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead class="thead-light">
	                    <tr>
							<th style="min-width: 50px">성명</th>
							<th style="min-width: 60px">부서</th>
							<th style="min-width: 40px">직위</th>
							<th style="min-width: 60px">담당</th>
							<th style="min-width: 40px">비고</th>
	                    </tr>
                    </thead>
                    
				</table>
			</div>
			<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 담당자 모달 종료-->


<!-- 접수자 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="custPopUpModal" tabindex="-1" role="dialog" aria-labelledby="userPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="custPopUpLabel">접수자</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<hr class="text-secondary">
				<table id="custPopUpTable" class="table table-bordered">
					<colgroup>
						<col width="15%">
						<col width="20%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="20%">
					</colgroup>
					<thead class="thead-light">
	                    <tr>
							<th style="min-width: 50px">성명</th>
							<th style="min-width: 60px">부서</th>
							<th style="min-width: 40px">직위</th>
							<th style="min-width: 60px">담당</th>
							<th style="min-width: 60px">사업장</th>
							<th style="min-width: 40px">비고</th>
	                    </tr>
                    </thead>
                    
				</table>
			<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 접수자 모달 종료-->


<!-- 불량확인자 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="badCheckPopUpModal" tabindex="-1" role="dialog" aria-labelledby="userPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="badCheckPopUpLabel">불량확인자</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<hr class="text-secondary">
				<table id="badCheckPopUpTable" class="table table-bordered">
					<colgroup>
						<col width="15%">
						<col width="20%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="20%">
					</colgroup>
					<thead class="thead-light">
	                    <tr>
							<th style="min-width: 50px">성명</th>
							<th style="min-width: 60px">부서</th>
							<th style="min-width: 40px">직위</th>
							<th style="min-width: 60px">담당</th>
							<th style="min-width: 60px">사업장</th>
							<th style="min-width: 40px">비고</th>
	                    </tr>
                    </thead>
                    
				</table>
			<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 불량확인자 모달 종료-->

<!-- 검토확인자 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="reviewPopUpModal" tabindex="-1" role="dialog" aria-labelledby="userPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="reviewPopUpLabel">검토 확인자</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<hr class="text-secondary">
				<table id="reviewPopUpTable" class="table table-bordered">
					<colgroup>
						<col width="15%">
						<col width="20%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
						<col width="20%">
					</colgroup>
					<thead class="thead-light">
	                    <tr>
							<th style="min-width: 50px">성명</th>
							<th style="min-width: 60px">부서</th>
							<th style="min-width: 40px">직위</th>
							<th style="min-width: 60px">담당</th>
							<th style="min-width: 60px">사업장</th>
							<th style="min-width: 40px">비고</th>
	                    </tr>
                    </thead>
                    
				</table>
			<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 검토확인자 모달 종료-->


<!-- 업무담당자 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="userOfficePopUpModal" tabindex="-1" role="dialog" aria-labelledby="userOfficePopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="userOfficePopUpModal">업무담당자조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<table id="userOfficePopUpTable" class="table table-bordered">
					<colgroup>
                        <col width="15%">
                        <col width="20%">
                        <col width="20%">
                        <col width="20%">
                        <col width="10%">
                        <col width="15%">		                            
		            </colgroup>
					<thead class="thead-light">
                    <tr>
						<th>성명</th>
						<th>부서</th>
						<th>직위</th>
						<th>담당</th>
						<th>조편성</th>
						<th>사업장</th>
                    </tr>
                    </thead>
				</table>
				<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 업무담당자 모달 종료-->
<!-- 영업담당자 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="userBizPopUpModal" tabindex="-1" role="dialog" aria-labelledby="userBizPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="userBizPopUpLabel">영업담당자조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<table id="userBizPopUpTable" class="table table-bordered">
					<colgroup>
                        <col width="15%">
                        <col width="20%">
                        <col width="20%">
                        <col width="20%">
                        <col width="10%">
                        <col width="15%">		                            
		            </colgroup>
					<thead class="thead-light">
	                    <tr>
							<th>성명</th>
							<th>부서</th>
							<th>직위</th>
							<th>담당</th>
							<th>조편성</th>
							<th>사업장</th>
	                    </tr>
                    </thead>
				</table>
				<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>		
<!-- 영업담당자 모달 종료-->
<!-- 제품조회 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="itemPartPopUpModal" tabindex="-1" role="dialog" aria-labelledby="itemPartPopUpLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="itemPartPopUpLabel">품명조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<table id="itemPartPopUpTable" class="table table-bordered">
					<colgroup>
							<col width="5%">
							<col width="14%">
							<col width="20%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="40%">
					</colgroup>
					<thead class="thead-light">
	                    <tr>
                            <th>No.</th>
                            <th>CODE</th>
                            <th>ITEM</th>
                            <th>구분</th>
                            <th>Type</th>
                            <th>Revision</th>
                            <th>SERIES</th>
                        </tr>
                    </thead>
				</table>
				<hr class="text-secondary">
			</div>
			<div class="modal-footer">
			
				<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>		
<!-- 제품조회 모달 종료-->
<!-- 제품조회2 Start-->
<div class="modal fade bd-example-modal-lg" id="itemPartPopUpModal2" tabindex="-1" role="dialog" aria-labelledby="itemPartPopUpLabel2" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="itemPartPopUpLabel2">품번조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<div class="table-responsive" style="height:650px">
					<table id="itemPartPopUpTable2" class="table table-bordered">
						<colgroup>
							<col width="5%">
							<col width="10%">
							<col width="15%">
							<col width="15%">
							<col width="25%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead class="thead-light">
		                    <tr>
	                            <th>No.</th>
	                            <th>구분</th>
	                            <th>CODE</th>
	                            <th>ITEM</th>
	                            <th>SPEC</th>
	                            <th>단위</th>
	                            <th>재고현황</th>
	                            <th>발주수량</th>
	                        </tr>
	                    </thead>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnGetPartCnt">가져오기</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>	
</div>
<!-- 제품조회2 End-->
<!-- 제품조회3 Start-->
<div class="modal fade bd-example-modal-lg" id="itemPartPopUpModal3" tabindex="-1" role="dialog" aria-labelledby="itemPartPopUpLabel3" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="itemPartPopUpLabel3">품번조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<div class="table-responsive">
					<table id="itemPartPopUpTable3" class="table table-bordered">
						<colgroup>
							<col width="5%">
							<col width="20%">
							<col width="30%">
							<col width="15%">
							<col width="30%">
						</colgroup>
						<thead class="thead-light">
		                    <tr>
	                            <th>No.</th>
	                            <th>CODE</th>
	                            <th>ITEM</th>
	                            <th>구분</th>
	                            <th>차종</th>
	                        </tr>
	                    </thead>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>	
</div>
<!-- 제품조회3 End-->

<!-- 제품조회4 Start-->
<div class="modal fade bd-example-modal-lg" id="itemPartPopUpModal4" tabindex="-1" role="dialog" aria-labelledby="itemPartPopUpLabel4" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="itemPartPopUpLabel4">품번조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<div class="table-responsive">
					<table id="itemPartPopUpTable4" class="table table-bordered">
						<colgroup>
							<col width="5%">
							<col width="20%">
							<col width="30%">
							<col width="15%">
							<col width="30%">
						</colgroup>
						<thead class="thead-light">
		                    <tr>
	                            <th>No.</th>
	                            <th>품번</th>
	                            <th>품명</th>
	                            <th>구분</th>
	                            <th>제품타입</th>
	                        </tr>
	                    </thead>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>	
</div>
<!-- 제품조회4 End-->

<!-- 제품명/모델명 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="productPopUpModal" tabindex="-1" role="dialog" aria-labelledby="itemPartPopUpLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="productPopUpLabel">제품명/모델명</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<table id="productPopUpTable" class="table table-bordered">
					<colgroup>
							<col width="5%">
							<col width="14%">
							<col width="20%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="40%">
					</colgroup>
					<thead class="thead-light">
	                    <tr>
                            <th>No.</th>
                            <th>CODE</th>
                            <th>ITEM</th>
                            <th>구분</th>
                            <th>Type</th>
                            <th>Revision</th>
                            <th>SERIES</th>
                        </tr>
                    </thead>
				</table>
				<hr class="text-secondary">
			</div>
			<div class="modal-footer">
			
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>		
<!-- 제품명/모델명 모달 종료-->
<!-- 소공정 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="prcssCodeAdmPopUpModal" tabindex="-1" role="dialog" aria-labelledby="prcssCodeAdmPopUpModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="dealCorpPopUpLabel3">소공정 조회</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div> 
	      <div class="modal-body">
	      	<hr class="text-secondary">	         
                <table id="prcssCodeAdmPopUpTable" class="table table-bordered">
                	<colgroup>
                        <col width="10%">
                        <col width="10%">
                        <col width="20%">
                        <col width="10%">
                        <col width="10%">
                        <col width="15%">       
                        <col width="15%">
                        <col width="10%">                      
                    </colgroup>
                    <thead class="thead-light">
                    <tr>
						<th>공정코드</th>
						<th>구분</th>
						<th>공정명</th>
						<th>외주공정여부</th>
						<th>이니셜</th>
						<th>비고</th>
                    </tr>
                    </thead>
				</table>
 			<hr class="text-secondary"> 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 소공정 모달 종료-->

<!-- Modal Start-->
<div class="modal fade" id="bizOrderConsumptPopupModal" tabindex="-1"
	role="dialog" aria-labelledby="bizOrderConsumptPopupLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="bizOrderConsumptPopupLabel">소요량조회</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="table-responsive" style="height: 650px">
					<table id="bizOrderConsumptPopupTable"
						class="table table-sm table-bordered">
						<colgroup>
							<col width="4%">
							<col width="12%">
							<col width="7%">
							<col width="5%">
							<col width="12%">
							<col width="20%">
							<col width="5%">
							<col width="6%">
							<col width="6%">
							<col width="6%">
							<col width="8%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" class="checkbox_lg"
									name="checkboxAll" id="checkboxAll" value=""></th>
								<th>수주상세번호</th>
								<th>CODE</th>
								<th>REV</th>
								<th>ITEM</th>
								<th>SPEC</th>
								<th>단위</th>
								<th>소요량</th>
								<th>총소요량</th>
								<th>발주수량</th>
								<th>출하요청일</th>
								<th>발주처</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="modal-footer">
					<input type="hidden" class="form-control" id="puFlag" name="puFlag" >
					<button type="button" class="btn btn-primary" id="btnGetPartCntAll">가져오기</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal End-->
<!-- Modal Start-->
<div class="modal fade" id="bizOrderPopupModal" tabindex="-1" role="dialog" aria-labelledby="bizOrderPopupLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="bizOrderPopupLabel">생산지시현황</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="table-responsive" style="height: 650px">
					<table id="bizOrderPopupTable"
						class="table table-sm table-bordered">
						<thead>
							<tr>
								<th><input type="checkbox" name="checkboxAll2" id="checkboxAll2" value=""></th>
								<th>수주상세번호</th>
								<th>품명</th>
								<th>REV</th>
								<th>구분</th>
								<th class="text-center">주문수량</th>
								<th>납품일</th>
								<th>발주처</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="modal-footer">
					<input type="hidden" class="form-control" id="puFlag" name="puFlag" >
					<button type="button" class="btn btn-primary" id="btnGetAll">가져오기</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal End-->
<!-- Modal Start-->
	<div class="modal fade" id="locationPopupModal" tabindex="-1"
		role="dialog" aria-labelledby="locationPopupLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="locationPopupLabel">창고정보조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
			      	<hr class="text-secondary">	         
		                <table id="locationPopupTable" class="table table-bordered">
		                    <thead class="thead-light">
		                    <tr>
		                      <th> No. </th>
		                      <th> 창고구분 </th>
		                      <th> 창고명 </th>
		                      <th> 저장위치 </th>
		                      <th> 비고 </th>
		                      <th> 창고코드 </th>
		                      <th> 비고 </th>
		                    </tr>
		                    </thead>
						</table>
		 			<hr class="text-secondary"> 
			    </div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
<!-- Modal Start-->
	<div class="modal fade" id="locationPopupModal4" tabindex="-1"
		role="dialog" aria-labelledby="locationPopupLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="locationPopupLabel">창고정보조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
			      	<hr class="text-secondary">	         
		                <table id="locationPopupTable4" class="table table-bordered">
		                    <thead class="thead-light">
		                    <tr>
		                      <th> No. </th>
		                      <th> 창고구분 </th>
		                      <th> 창고명 </th>
		                      <th> 저장위치 </th>
		                      <th> 비고 </th>
		                      <th> 창고코드 </th>
		                    </tr>
		                    </thead>
						</table>
		 			<hr class="text-secondary"> 
			    </div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
<!-- Modal End-->
	<!-- 불량유형 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="faultyTypePopUpModal" tabindex="-1" role="dialog" aria-labelledby="faultyTypePopUpModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="faultyTypePopUpLabel">불량유형 등록</h5>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </button>
         </div> 
         <div class="modal-body">
               <table id="faultyTypePopUpTable" class="table table-bordered">
				<colgroup>
					<col width="10%">
					<col width="25%">
					<col width="20%">
					<col width="20%">
					<col width="25%">
				</colgroup>										
				<thead class="thead-light">
					<tr>
						<th>No.</th>
						<th>불량 유형</th>
						<th>불량 수량</th>
						<th>불량 등록일</th>
						<th>비고</th>
					</tr>
				</thead>
			</table>
         </div>
         <div class="modal-footer">
       		<button type="button" class="btn btn-primary float-right"
				id="btnFaultyTypeSave">저장</button>
			<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
				type="button" disabled>
				<span class="spinner-border spinner-border-sm" role="status"
					aria-hidden="true"></span> 처리중
			</button>
           <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
         </div>
       </div>
     </div>
   </div>
<!-- 불량유형 모달 모달 종료-->

<!-- 공정추가 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="prcssCodeModal" tabindex="-1" role="dialog" aria-labelledby="prcssCodeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="width: 1500px; height: 800px; position: absolute; left: 50%; transform: translateX(-50%);">
      <div class="modal-header">
        <h5 class="modal-title" id="prcssCodePopUpLabel">공정정보조회</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
       	<div style="float: left; width: 40%;">
      		<table id="prcssCodePuTable" class="table table-bordered">
      			<colgroup>
					<col width="2%">
					<col width="10%">
					<col width="10%">
				</colgroup>	
            	<thead class="thead-light">
                	<tr>
                    	<th>선택</th>
                    	<th>Master 공정코드</th>	                        
                    	<th>Master 공정명</th>
                	</tr>
            	</thead>
			</table>
			<div class="mt-2">
				<button type="button" class="btn btn-primary float-right" id="btnCodePuWatch">조회</button>
			</div>
      	</div>  
      	<div style="float: right; width: 59%;">
      		<table id="prcssCodePuTable2" class="table table-bordered">
      			<colgroup>
					<col width="2%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>	
            	<thead class="thead-light">
                	<tr>
                		<th>선택</th>
                    	<th>Master 공정코드</th>	                        
                    	<th>Master 공정명</th>
                    	<th>Sub 공정코드</th>	                        
                    	<th>Sub 공정명</th>
                	</tr>
            	</thead>
			</table>
			<div class="mt-2">
				<button type="button" class="btn btn-primary float-right d-none" id="btnPuSave">저장</button>
			</div>
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 공정추가 모달 종료-->

<!-- 공정추가 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="prcssEbomModal" tabindex="-1" role="dialog" aria-labelledby="prcssEbomModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="width: 1500px; height: 800px; position: absolute; left: 50%; transform: translateX(-50%);">
      <div class="modal-header">
        <h5 class="modal-title" id="prcssEbomPopUpLabel">BOM 매칭</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
       	<div style="float: left; width: 40%;">
      		<table id="prcssEbomPuTable" class="table table-bordered">
      			<colgroup>
					<col width="2%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>	
            	<thead class="thead-light">
                	<tr>
                    	<th>선택</th>	                        
                    	<th>Master 공정코드</th>	                        
                    	<th>Master 공정명</th>
                    	<th>Sub 공정코드</th>	                        
                    	<th>Sub 공정명</th>
                	</tr>
            	</thead>
			</table>
			<div class="mt-2">
				<button type="button" class="btn btn-primary float-right" id="btnEbomPuWatch">조회</button>
			</div>
      	</div>  
      	<div style="float: right; width: 59%;">
      		<table id="prcssEbomPuTable2" class="table table-bordered">
      			<colgroup>
					<col width="2%">
					<col width="5%">
					<col width="10%">
					<col width="7%">
					<col width="10%">
					<col width="4%">
					<col width="4%">
					<col width="4%">
				</colgroup>
				<thead class="thead-light">
					<tr>
						<th>선택</th>
						<th>서브공정코드</th>
						<th>품번</th>
						<th>차종</th>
						<th>품명</th>
						<th>구분</th>
						<th>단위</th>
						<th>소모량</th>
					</tr>
				</thead>
			</table>
			<div class="mt-2">
				<button type="button" class="btn btn-primary float-right d-none" id="btnEbomPuSave">저장</button>
			</div>
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 공정추가 모달 종료-->
<!-- 작업지시 주/부작업자 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="workChargrPopupModal" tabindex="-1" role="dialog" aria-labelledby="workChargrPopupModal" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="workChargrPopupLabel">작업자 조회</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body">
      	<hr class="text-secondary">	         
               <table id="workChargrPopupTable" class="table table-bordered">
                   <thead class="thead-light">
                   <tr>
                     <th> No. </th>
                     <th> 성명 </th>
                     <th> 부서 </th>
                     <th> 직위 </th>
                     <th> 담당 </th>
                   </tr>
                   </thead>
			</table>
			<hr class="text-secondary"> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 작업지시 주/부작업자 모달 종료-->

<!-- 담당자 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="userPopUpModal3" tabindex="-1" role="dialog" aria-labelledby="userPopUpModalLabel2" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="userPopUpLabel3">담당자조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<hr class="text-secondary">
			<div class="table-responsive">
				<table id="userPopUpTable3" class="table table-bordered">
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead class="thead-light">
	                    <tr>
							<th style="min-width: 50px">성명</th>
							<th style="min-width: 60px">부서</th>
							<th style="min-width: 40px">직위</th>
							<th style="min-width: 60px">담당</th>
							<th style="min-width: 40px">비고</th>
	                    </tr>
                    </thead>
                    
				</table>
			</div>
			<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 담당자 모달 종료-->
<!--
<footer class="app-footer">
<ul class="list-inline">
<li class="list-inline-item"><a class="text-muted" href="#">Support</a></li>
<li class="list-inline-item"><a class="text-muted" href="#">Help Center</a></li>
<li class="list-inline-item"><a class="text-muted" href="#">Privacy</a></li>
<li class="list-inline-item"><a class="text-muted" href="#">Terms of Service</a></li>
</ul>
<div class="copyright">Copyright &copy; 2018. All right reserved.</div>
</footer>
-->
<!-- /.wrapper -->
<div id="my-spinner">
	<div>
		<span> <img src="<c:url value='/resources/assets/images/loader.gif'/>">
		</span>
	</div>
</div>

<div id="prcss-spinner">
	<div>
		<span class="prcss-spinner-span"> 
			<img src="<c:url value='/resources/assets/images/loader.gif'/>">
			<span>생산 실적 발행중입니다. 잠시만 기다려주세요..</span>
		</span>
	</div>
</div>
</main>
<!-- /.app-main -->
<!-- /.app -->

<%@include file="../layout/script.jsp" %>

