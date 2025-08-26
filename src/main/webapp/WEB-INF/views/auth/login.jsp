<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp" %>

<body>
<%-- 
    <!-- .auth -->
    <main class="auth">
        <header id="auth-header" class="auth-header" style="background-image: url(<c:url value='/resources/assets/images/illustration/img-1.png'/>);">
            <h1>MES</h1>
        </header>

        <form class="auth-form" id="loginForm">
            <div id="messageBox" class="alert alert-danger has-icon d-none" role="alert">
                <div class="alert-icon">
                    <span class="fa fa-info"></span>
                </div>
                <h5>오류</h5>
                <span id="message"></span>
            </div>
            <div class="form-group">
                <div class="form-label-group">
                    <input type="text" name="userId" id="userId" class="form-control" placeholder="아이디" autofocus required>
                    <label for="userId">아이디</label>
                </div>
            </div>
            <div class="form-group">
                <div class="form-label-group">
                    <input type="password" name="password" id="password" class="form-control" placeholder="비밀번호" required>
                    <label for="password">비밀번호</label>
                </div>
            </div>
            <div class="form-group">
                <button class="btn btn-lg btn-primary btn-block btn-login" type="submit">로그인</button>
                <button class="btn btn-lg btn-primary btn-block d-none btn-loading" type="button" disabled=""><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Loading...</button>
            </div>
        </form>
    </main> --%>
    
<!-- .app -->
<div class="app">
  <div id="messageBox" class="alert alert-danger has-icon d-none" role="alert">
      <div class="alert-icon">
          <span class="fa fa-info"></span>
      </div>
      <h5 id="messageTitle"></h5>
      <span id="message"></span>
  </div>   
    <div class="container-fluid" id="main">
     <div class="row login_card">
        <div class="col-md-6 login_left pl-0" style="background-image: url(../resources/assets/images/login_bg3.png);">
        </div>
        <div class="col-md-6 login_left" style="background-image: url(../resources/assets/images/login_bg4.png); padding:0px 0!important">
               <h4 class="login-header pb-4"></h4>
               <div class="btn-group btn-group-toggle" data-toggle="buttons">
                  <label class="btn btn-outline-primary active" style="font-size: 25px; padding: 35px 35px; margin-right: 1rem;">
                    <input type="radio" name="mainGubun" data-gubun="001" checked> 레이저
                  </label>
                 	<label class="btn btn-outline-primary" style="font-size: 25px; padding: 35px 35px;">
                 	  <input type="radio" name="mainGubun" data-gubun="002"> 후가공
                 	</label>
                </div> 
            <form class="login-form"  id="loginForm" style="padding-top: 1rem;">
              <!-- .form-group -->
              <div class="form-mb">
                  <input class="form-control-lg" style="border: 2px solid #0b1f51;max-width:100%;padding:1.15rem 0.4rem!important;border-radius: 0.45rem;" type="text" id="inputUser"  placeholder="아이디" autofocus=""> 
              </div><!-- /.form-group -->
              <!-- .form-group -->
              <div class="form-mb form-password">
                  <input class="form-control-lg" style="border: 2px solid #0b1f51;max-width:100%;padding:1.15rem 0.4rem!important;border-radius: 0.45rem;" type="password" id="inputPassword" placeholder="비밀번호">
                  <i class="fa fa-eye-slash fa-lg"></i>
              </div><!-- /.form-group -->
              <!-- .form-group -->
              <div class="form-mb">
                <button class="login_btn btn btn-lg btn-primary btn-block" type="submit">로그인</button>
              </div><!-- /.form-group -->
              <!-- .form-group -->
              <!-- <div class="form-mb text-center">
                <div class="custom-control custom-control-inline custom-checkbox">
                  <input type="checkbox" class="custom-control-input" id="remember-me"> <label class="custom-control-label" for="remember-me">자동 로그인</label>
                </div>
              </div> --><!-- /.form-group -->
              <!--recoverylinks-->
              <!--  <div class="text-center pt-3">
                <a href="#" class="link">아이디 찾기</a> <span class="mx-2">·</span> <a href="#" class="link">비밀번호 찾기</a>
               </div> --><!-- /recovery links -->
            </form><!-- /.auth-form -->
          </div>
    </div>
  </div>
</div><!-- /.app -->
<!-- 비밀번호 변경 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="expirePasswordModal" tabindex="-1" role="dialog" aria-labelledby="expirePasswordModal" aria-hidden="true">
   <div class="modal-dialog modal-lg" style="width: 400px;">
      <div class="modal-content">
         <div class="modal-header row">
            <h5 id="expirePasswordLabel">[비밀번호 변경 안내]</h5>
            <h6>개인정보보호와 안전한 사이트 이용을 위해 90일 마다 비밀번호 변경을 권장하고 있으니 비밀번호를 변경해 주시기 바랍니다.</h6>
         </div>
         <div class="modal-body">
            <!-- <table class="table" id="passChangeTable">
               <tr>
                  <td>
                     <input type="password" style="max-width: 100%;font-size: 15px;height: auto;" class="form-control" id="nowPassword" name="nowPassword" placeholder="현재 비밀번호">
                  </td>
               </tr>
            </table> -->
            
            <table class="table" id="passChangeTable">
               <tr>
                  <td>
                     <div class="form-password">
                        <input type="password" style="max-width: 100%;font-size: 15px;height: auto;" class="form-control" maxlength="10" id="changePassword" name="changePassword" placeholder="새 비밀번호">
                        <!--  <i class="fa fa-eye fa-lg"></i> -->
                        <span id="passwordCheckText"></span>
                     </div>
                  </td>
               </tr>
               <tr>
                  <td>
                     <div class="form-password">
                        <input type="password" style="max-width: 100%;font-size: 15px;height: auto;" class="form-control" maxlength="10" id="changePassword2" name="changePassword2" placeholder="새 비밀번호 확인">
                        <!--  <i class="fa fa-eye fa-lg"></i> -->
                        <span id="passwordCheckText2"></span>
                     </div>
                  </td>
               </tr>
            </table>
            <hr class="text-secondary">
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-outline-success" id="expirePasswordNowSave" style="width: 100%;font-size: 18px;">지금 변경하겠습니다.</button>
            <button type="button" class="btn btn-outline-primary" id="expirePasswordLaterSave" style="width: 100%;font-size: 18px;">나중에 변경하겠습니다.</button>
         </div>
      </div>
   </div>
</div>
<!-- 비밀번호 모달 종료-->
 <%@include file="../layout/script.jsp" %>
    <script>
    
      currentPage = "login";
      let userNumber = "";
      let pwChangeCheck1 = false;
      let pwChangeCheck2 = false;
      
        
        $('#loginForm').parsley();

        $("#loginForm").submit(function(e){
            e.preventDefault(e);
         //alert("login_ajax")
            $.ajax({
                type: 'POST',
                url: '<c:url value="/auth/login_ajax"/>',
                dataType: 'json',
                data: {
                    userId: $('#inputUser').val(),
                    userPw: $('#inputPassword').val(),
                    mainGubun: $('input[name=mainGubun]:checked').data('gubun'),
                },
                beforeSend: function() {
                    $('.btn-login').addClass('d-none');
                    $('.btn-loading').removeClass('d-none');
                },
                success: function (res) {
                    if (res.result === 'ok') {
                        $(location).attr('href', '<c:url value="/main"/>');
                    } else if(res.result === 'expirePassword'){
                  console.log('패스워드 변경해주세요.');
                  userNumber = res.userNumber;
                  $('#expirePasswordModal').modal('show');
                    } else {
                        $('#password').val('');
                        $('#messageTitle').text("오류");
                        $('#message').text(res.message);
                        $('#messageBox').removeClass('d-none').removeClass('alert-success').addClass('alert-danger');
                    }
                },
                complete:function(){
                    $('.btn-login').removeClass('d-none');
                    $('.btn-loading').addClass('d-none');
                }
            });
        });

       //패스워드 변경 로직
        //변경 버튼 클릭시
        $('#expirePasswordNowSave').on('click',function(){
           if(pwChangeCheck1&&pwChangeCheck2){
              $.ajax({
                url : '<c:url value="/expirePasswordUpdate"/>',
                type : 'POST',
                dataType: 'json',
                data : {
                   userNumber    : function(){return userNumber;},
                    userPw       : $('#changePassword2').val(),
                    expirePasswordStatus    : 'now'
                },
                success : function(res){
                   if(res.result=="ok"){
                      $('#expirePasswordModal').modal('hide');
                      $('#inputUser').val('');
                      $('#inputPassword').val('');
                      $('#messageTitle').text("확인");
                       $('#message').text(res.message);
                       $('#messageBox').removeClass('d-none').addClass('alert-success').removeClass('alert-danger');
                            
                   }else if(res.result=="error"){
                      toastr.error(res.message)
                   }
                }
               });
            }else{
             toastr.warning("비밀번호를 다시 확인해주세요.");
             if(!pwChangeCheck1){
                $('#changePassword').focus();
             }else{
                $('#changePassword2').focus();
             }
            }
        });

        //나중에 변경 버튼 클릭시
        $('#expirePasswordLaterSave').on('click',function(){
           $.ajax({
              url : '<c:url value="/expirePasswordUpdate"/>',
            type : 'POST',
            dataType: 'json',
            data : {
               userNumber : function(){return userNumber;},
                userPw    : '',
                expirePasswordStatus    : 'later'
            },
             success : function(res){
                if(res.result=="ok"){
                   $(location).attr('href', '<c:url value="/main"/>');
                }else if(res.result=="error"){
                   toastr.error(res.message)
                }
             }
           });
        });

       //비밀번호 확인
       $('#changePassword').keyup(function (event) {
          var reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,10}$/;
          var txt = $(this).val();
          console.log(txt);
          if( !reg.test(txt) ) {
             $('#passwordCheckText').css('color','red');
              $('#passwordCheckText').text("4자 이상 10자 이하로 문자와 숫자 사용하세요."); 
              pwChangeCheck1 = false;
          }else{
             $('#passwordCheckText').css('color','blue');
               $('#passwordCheckText').text("비밀번호 확인되었습니다.");
               pwChangeCheck1 = true;
           }
       });  

       //비밀번호 확인
       $('#changePassword2').keyup(function (event) {
          var pw1 = $('#changePassword').val();
          var pw2 = $(this).val();
          if(pw1!=pw2){
             $('#passwordCheckText2').css('color','red');
               $('#passwordCheckText2').text("비밀번호를 다시 확인해주세요.");
               pwChangeCheck2 = false;
           }else{
              $('#passwordCheckText2').css('color','blue');
               $('#passwordCheckText2').text("비밀번호가 동일합니다.");
               pwChangeCheck2 = true;
            }
       }); 

	   $(document).ready(function(){
		    $('.form-password i').on('click',function(){
		    	console.log('dd')
		        $('input').toggleClass('active');
		        if($('input').hasClass('active')){
		            $(this).attr('class',"fa fa-eye fa-lg").prev('input').attr('type',"text");
		        }else{
		            $(this).attr('class',"fa fa-eye-slash fa-lg").prev('input').attr('type','password');
		        }
		    });
		});
      	
    </script>
      
</body>
</html>