<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String ctxpath = request.getContextPath();
%>
<link href="<%=ctxpath%>/css/repository/repositoryLeftBar.css" rel="stylesheet"> 
<script type="text/javascript" src="<%=ctxpath%>/js/repository/repositoryLeftBar.js"></script>

<div id="left_bar">

      <button id="writePostBtn">
          <span id="goWrite">파일 업로드</span>
      </button>

      <div id="repositoryListArea">
		  <!-- 자바스크립트로 자료실 목록을 삽입 -->
	  </div>
  </div>