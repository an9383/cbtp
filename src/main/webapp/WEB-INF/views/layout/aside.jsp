
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<aside class="app-aside app-aside-expand-md app-aside-light" id="mySidenav">
    <!-- .aside-content -->
    <div class="aside-content">
        <!-- .aside-header -->
        <header class="aside-header d-block d-md-none">
            <!-- .btn-account -->
            <button class="btn-account" type="button" data-toggle="collapse" data-target="#dropdown-aside">
                <span class="user-avatar user-avatar-lg">
                    <img src="<c:url value='/resources/assets/images/avatars/profile.jpg'/>" alt="">
                </span>
                <span class="account-icon">
                    <span class="fa fa-caret-down fa-lg"></span>
                </span>
                <span class="account-summary">
                    <span class="account-name">홍길동</span>
                <span class="account-description">대표이사</span>
                </span>
            </button>
            <!-- /.btn-account -->
            <!-- .dropdown-aside -->
            <div id="dropdown-aside" class="dropdown-aside collapse">
                <!-- dropdown-items -->
                <div class="pb-3">
                    <a class="dropdown-item" href="/auth/profile">
                        <span class="dropdown-icon oi oi-person"></span> 사용자정보
                    </a>
                    <a class="dropdown-item" href="/auth/logout">
                        <span class="dropdown-icon oi oi-account-logout"></span> 로그아웃
                    </a>
                </div>
                <!-- /dropdown-items -->
<!--             </div> -->
            <!-- /.dropdown-aside -->
        </header>
        <!-- /.aside-header -->
        <!-- .aside-menu -->
        <div class="aside-menu overflow-hidden">
         
     <!--     <nav class="stacked-menu mb-0">
             <ul class="menu">
               		 <li class="menu-item has-child">
						<a href="/resources/assets/file/hygino-release.apk" class="menu-link"> 
						<span class="menu-icon far fa-file-alt"></span> 
						<span class="menu-text">PDA 다운로드</span>
						<img src="/resources/assets/images/save.png" width="12" height="10">
						
						</a>   
                    </li>         
                </ul>
            </nav>
             -->
            <!-- .stacked-menu -->
            <nav id="stacked-menu" class="stacked-menu pt-0">
                <!-- .menu -->
                <ul class="menu" id="aside">

                   <c:forEach var="topMenuList" items="${userAuth}">
						<c:if test="${topMenuList.upperMenuId == null}">
							<li class="menu-item has-child" id="${topMenuList.menuId}"><a href="#" class="menu-link"> <span class="menu-icon far fa-file-alt"></span> <span class="menu-text">${topMenuList.menuNm}</span>
							</a>
								<ul class="menu">
									<c:forEach var="subMenuList" items="${userAuth}">
										<c:if test="${subMenuList.upperMenuId ne null && subMenuList.upperMenuId eq topMenuList.menuId}">
											<c:if test="${subMenuList.mainGubun eq '000'}">
												<li class="menu-item">
					                                <a href="<c:url value="${subMenuList.menuPath}"/>" id="${subMenuList.menuId}" class="menu-link <c:url value="${subMenuList.menuPath}"/> text-black" tabindex="-1">${subMenuList.menuNm}</a>
					                            </li>
				                            </c:if>
				                            <c:if test="${subMenuList.mainGubun eq '001'}">
												<li class="menu-item">
					                                <a href="<c:url value="${subMenuList.menuPath}"/>" id="${subMenuList.menuId}" class="menu-link <c:url value="${subMenuList.menuPath}"/> text-red" tabindex="-1">${subMenuList.menuNm}</a>
					                            </li>
				                            </c:if>
				                            <c:if test="${subMenuList.mainGubun eq '002'}">
												<li class="menu-item">
													<a href="<c:url value="${subMenuList.menuPath}"/>" id="${subMenuList.menuId}" class="menu-link <c:url value="${subMenuList.menuPath}"/> text-blue" tabindex="-1">${subMenuList.menuNm}</a>
												</li>
											</c:if>
				                            <c:if test="${subMenuList.mainGubun eq '003'}">
												<li class="menu-item">
					                                <a href="<c:url value="${subMenuList.menuPath}"/>" id="${subMenuList.menuId}" class="menu-link <c:url value="${subMenuList.menuPath}"/> text-black" tabindex="-1">${subMenuList.menuNm}</a>
												</li>
											</c:if>
				                       </c:if>
									</c:forEach>
									
								</ul>
							</li>
						</c:if>
					</c:forEach>       
                </ul><!-- /.menu -->
                
            </nav>
            <!-- /.stacked-menu -->
        </div>
        <!-- /.aside-menu -->
    </div>
    <!-- /.aside-content -->
</aside>
