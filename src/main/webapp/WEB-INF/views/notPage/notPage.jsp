<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<!-- .page-wrapper -->
      <div class="page-wrapper" id="page-wrapper">
        <!--header ============================================================== -->
        <header class="page-title-bar row">
          <nav aria-label="breadcrumb" class="breadcrumb-padding">
           <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="#">공정실적관리</a>
            </li>
            <li class="breadcrumb-item active">공정실적관리</li>
           </ol>
          </nav>
         </header>       
          <!-- #main============================================================== -->
          <div class="container-fluid" id="main">
              <div class="row table-wrap-hid">	
                  <!--======================== .left-list ========================-->
                  <div class="left-list" id="left-list">
                    <div class="card">

                     <h3>작업지시선택과 합쳐진 페이지입니다.</h3>
                     <!-- .table-responsive -->
                     <div class="table-responsive">
                     <br/>
                     <br/>
                    
					<h5><a href="<c:url value='posc0010'/>">작업지시선택 화면으로</a></h5>



                     </div>
                     <!-- /.table-responsive -->
                    </div>

                  </div><!-- /.left-list -->
              </div><!-- /.row -->
            </div><!-- / #main  -->
        </div><!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp" %>

<script>


</script>

</body>
</html>
