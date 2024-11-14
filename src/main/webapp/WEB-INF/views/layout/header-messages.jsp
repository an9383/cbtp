<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


    <li class="nav-item dropdown header-nav-dropdown has-notified">
    <a class="nav-link" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="oi oi-envelope-open"></span>
    </a>
    <!-- .dropdown-menu -->
    <div class="dropdown-menu dropdown-menu-rich dropdown-menu-right">
    <div class="dropdown-arrow"></div>
    <h6 class="dropdown-header stop-propagation">
    <span>Messages</span>
    <a href="#">Mark all as read</a>
    </h6>
    <!-- .dropdown-scroll -->
    <div class="dropdown-scroll perfect-scrollbar">
    {% for message in site.data.messages limit:6 offset:2 %}
    <!-- .dropdown-item -->
    {% if message.isRead %}
    <a href="#" class="dropdown-item">
    {% else %}
    <a href="#" class="dropdown-item unread">
    {% endif %}
    {% if message.hasAvatar %}
    <div class="user-avatar">
    <img src="assets/images/avatars/{{message.avatar}}" alt="">
    </div>
    {% else %}
    <div class="tile tile-circle bg-{{message.color}}">{{message.initial}}</div>
    {% endif %}
    <div class="dropdown-item-body">
    <p class="subject">{{message.team}}</p>
    <p class="text text-truncate">{{message.subject}}</p>
    <span class="date">{{message.time}}</span>
    </div>
    </a>
    <!-- /.dropdown-item -->
    {% endfor %}
    </div>
    <!-- /.dropdown-scroll -->
    <a href="page-messages.html" class="dropdown-footer">All messages <i class="fas fa-fw fa-long-arrow-alt-right"></i></a>
    </div>
    <!-- /.dropdown-menu -->
    </li>
    <!-- /.nav-item -->
