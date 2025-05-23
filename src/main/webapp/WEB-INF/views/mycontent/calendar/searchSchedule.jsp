<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	String ctxPath = request.getContextPath(); 
    //    /myspring
%>


<%-- === 사내 캘린더 추가 Modal === --%>
<div class="modal fade" id="modal_addComCal" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <!-- Modal header -->
      <div class="modal-header">
        <h4 class="modal-title">사내 캘린더 추가</h4>
        <button type="button" class="close modal_close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
       	<form name="modal_frm">
       	<table style="width: 100%;" class="table table-bordered">
     			<tr>
     				<td style="text-align: left; ">소분류명</td>
     				<td><input type="text" class="add_com_smcatgoname"/></td>
     			</tr>
     			<tr>
     				<td style="text-align: left;">만든이</td>
     				<td style="text-align: left; padding-left: 5px;">${sessionScope.loginuser.name}</td>
     			</tr>
     		</table>
       	</form>	
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" id="addCom" class="btn btn-success btn-sm" onclick="goAddComCal()">추가</button>
          <button type="button" class="btn btn-danger btn-sm modal_close" data-dismiss="modal">취소</button>
      </div>
      
    </div>
  </div>
</div>

<%-- === 사내 캘린더 수정 Modal === --%>
<div class="modal fade" id="modal_editComCal" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <!-- Modal header -->
      <div class="modal-header">
        <h4 class="modal-title">사내 캘린더 수정</h4>
        <button type="button" class="close modal_close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
       	<form name="modal_frm">
       	<table style="width: 100%;" class="table table-bordered">
     			<tr>
     				<td style="text-align: left; ">소분류명</td>
     				<td><input type="text" class="edit_com_smcatgoname"/><input type="hidden" value="" class="edit_com_smcatgono"></td>
     			</tr>
     			<tr>
     				<td style="text-align: left;">만든이</td>
     				<td style="text-align: left; padding-left: 5px;">${sessionScope.loginuser.name}</td>
     			</tr>
     		</table>
       	</form>	
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" id="addCom" class="btn btn-success btn-sm" onclick="goEditComCal()">수정</button>
          <button type="button" class="btn btn-danger btn-sm modal_close" data-dismiss="modal">취소</button>
      </div>
      
    </div>
  </div>
</div>

<%-- === 내 캘린더 추가 Modal === --%>
<div class="modal fade" id="modal_addMyCal" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      
      <!-- Modal header -->
      <div class="modal-header">
        <h4 class="modal-title">내 캘린더 추가</h4>
        <button type="button" class="close modal_close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
          <form name="modal_frm">
       	<table style="width: 100%;" class="table table-bordered">
     			<tr>
     				<td style="text-align: left; ">소분류명</td>
     				<td><input type="text" class="add_my_smcatgoname" /></td>
     			</tr>
     			<tr>
     				<td style="text-align: left;">만든이</td>
     				<td style="text-align: left; padding-left: 5px;">${sessionScope.loginuser.name}</td> 
     			</tr>
     		</table>
     		</form>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" id="addMy" class="btn btn-success btn-sm" onclick="goAddMyCal()">추가</button>
          <button type="button" class="btn btn-danger btn-sm modal_close" data-dismiss="modal">취소</button>
      </div>
      
    </div>
  </div>
</div>

<%-- === 내 캘린더 수정 Modal === --%>
<div class="modal fade" id="modal_editMyCal" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <!-- Modal header -->
      <div class="modal-header">
        <h4 class="modal-title">내 캘린더 수정</h4>
        <button type="button" class="close modal_close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
      	<form name="modal_frm">
       	<table style="width: 100%;" class="table table-bordered">
     			<tr>
     				<td style="text-align: left; ">소분류명</td>
     				<td><input type="text" class="edit_my_smcatgoname"/><input type="hidden" value="" class="edit_my_smcatgono"></td>
     			</tr>
     			<tr>
     				<td style="text-align: left;">만든이</td>
     				<td style="text-align: left; padding-left: 5px;">${sessionScope.loginuser.name}</td>
     			</tr>
     		</table>
       	</form>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" id="addCom" class="btn btn-success btn-sm" onclick="goEditMyCal()">수정</button>
          <button type="button" class="btn btn-danger btn-sm modal_close" data-dismiss="modal">취소</button>
      </div>
      
    </div>
  </div>
</div>


<jsp:include page="../../header/header.jsp" />

<style type="text/css">
	
	th, td{
	 	padding: 10px 5px;
	 	vertical-align: middle;
	}
	
	tr.infoSchedule{
		background-color: white;
		cursor: pointer;
	}
	
	a{
	    color: #395673;
	    text-decoration: none;
	    cursor: pointer;
	}
	
	a:hover {
	    color: #395673;
	    cursor: pointer;
	    text-decoration: none;
		font-weight: bold;
	}
	
	button.btn_normal{
		background-color: #0071bd;
		border: none;
		color: white;
		width: 50px;
		height: 30px;
		font-size: 12pt;
		padding: 3px 0px;
	}

</style>

<%-- 검색할 때 필요한 datepicker 의 색상을 기본값으로 사용하기 위한 것임 --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css"> 

<script type="text/javascript">

	$(document).ready(function(){
		
		// 검색할 때 필요한 datepicker
		// 모든 datepicker에 대한 공통 옵션 설정
	    $.datepicker.setDefaults({
	         dateFormat: 'yy-mm-dd'  // Input Display Format 변경
	        ,showOtherMonths: true   // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
	        ,showMonthAfterYear:true // 년도 먼저 나오고, 뒤에 월 표시
	        ,changeYear: true        // 콤보박스에서 년 선택 가능
	        ,changeMonth: true       // 콤보박스에서 월 선택 가능                
	        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
	        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트             
	    });
		
		// input 을 datepicker로 선언
	    $("input#fromDate").datepicker();                    
	    $("input#toDate").datepicker(); 
		    
	 // From의 초기값을 한달전 날짜로 설정
	    $('input#fromDate').datepicker('setDate', '-1M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
	    
	    // To의 초기값을 오늘 날짜로 설정
	//  $('input#toDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)	
		
	    // To의 초기값을 한달후 날짜로 설정
	    $('input#toDate').datepicker('setDate', '+1M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)	
		    
		    
		$("tr.infoSchedule").click(function(){
		//	console.log($(this).html());
			var scheduleno = $(this).children(".scheduleno").text();
			goDetail(scheduleno);
		});
		
		// 검색 할 때 엔터를 친 경우
	    $("input#searchWord").keyup(function(event){
		   if(event.keyCode == 13){ 
			  goSearch();
		   }
	    });
	      
	    if(${not empty requestScope.paraMap}){
	    	  $("input[name=startdate]").val("${requestScope.paraMap.startdate}");
	    	  $("input[name=enddate]").val("${requestScope.paraMap.enddate}");
			  $("select#searchType").val("${requestScope.paraMap.searchType}");
			  $("input#searchWord").val("${requestScope.paraMap.searchWord}");
			  $("select#sizePerPage").val("${requestScope.paraMap.str_sizePerPage}");
			  $("select#fk_lgcatgono").val("${requestScope.paraMap.fk_lgcatgono}");
		}
		 
	}); // end of $(document).ready(function(){}-------------
	
	
	// ~~~~~~~ Function Declartion ~~~~~~~
	
	function goDetail(scheduleno){
		var frm = document.goDetailFrm;
		frm.scheduleno.value = scheduleno;
		
		frm.method="get";
		frm.action="<%= ctxPath%>/calendar/detailSchedule";
		frm.submit();
	} // end of function goDetail(scheduleno){}-------------------------- 
			

	// 검색 기능
	function goSearch(){
		
		if( $("#fromDate").val() > $("#toDate").val() ) {
			alert("검색 시작날짜가 검색 종료날짜 보다 크므로 검색할 수 없습니다.");
			return;
		}
	    
		if( $("select#searchType").val()=="" && $("input#searchWord").val()!="" ) {
			alert("검색대상 선택을 해주세요!!");
			return;
		}
		
		if( $("select#searchType").val()!="" && $("input#searchWord").val()=="" ) {
			alert("검색어를 입력하세요!!");
			return;
		}
		
		var frm = document.searchScheduleFrm;
        frm.method="get";
        frm.action="<%= ctxPath%>/calendar/searchSchedule";
        frm.submit();
	}

</script>
<jsp:include page="./calendar_bar.jsp" /> 
<link href="<%=ctxPath%>/css/email/email_main.css" rel="stylesheet">
<link href="<%=ctxPath%>/css/reservation/assetDetailPage.css" rel="stylesheet">
<link href="<%=ctxPath%>/css/reservation/reservation_main.css" rel="stylesheet"> 

<div id="right_bar">
	<div id="right_title_box">
        <span id="right_title" style="margin-right:8px;">일정 검색결과</span>
		<a style="font-size: 14px; color:#999;" href="<%= ctxPath%>/calendar/scheduleManagement">
			<span><i class="fa-solid fa-angle-right" style="transform: rotate(180deg); margin-right:4px;"></i>캘린더로 돌아가기</span>
		</a>
    </div>
	
		
		<div id="searchPart" style="float: right; margin-top: 10px;">
			<form name="searchScheduleFrm">
				<div style="display:flex; align-items:center; gap: 2px;">
					<input type="text" id="fromDate" name="startdate" style="width: 90px;" readonly="readonly"> 
	            &nbsp;-&nbsp;<input type="text" id="toDate" name="enddate" style="width: 90px;" readonly="readonly">&nbsp;
	            	<select id="fk_lgcatgono" name="fk_lgcatgono" style="height: 30px;">
						<option value="">모든캘린더</option>
						<option value="1">내 캘린더</option>
						<option value="2">사내 캘린더</option>
					</select>&nbsp;	
					<select id="searchType" name="searchType" style="height: 30px;">
						<option value="">검색대상선택</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="joinuser">공유자</option>
					</select>&nbsp;
					<input type="text" id="searchWord" value="${requestScope.searchWord}" style="height: 30px; width:120px;" name="searchWord"/> 
					&nbsp;
					<select id="sizePerPage" name="sizePerPage" style="height: 30px;">
						<option value="">보여줄개수</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
					</select>&nbsp;
					<input type="hidden" name="fk_employeeNo" value="${sessionScope.loginuser.employeeNo}"/>
					<button type="button" class="okBtn" style="display: inline-block; height:30px; margin-bottom:0px;" onclick="goSearch()">검색</button>
				</div>
			</form>
		</div>

	
	<table id="schedule" border="1" class="my_table" style="margin: 50px 0px 12px 0px;">
		<thead>
			<tr class="weekTitle">
				<th style="text-align: center; width: 21%;">일자</th>
				<th style="text-align: center; width: 15%;">캘린더종류</th>
				<th style="text-align: center; width: 7%;">등록자</th>
				<th style="text-align: center; width: 22%">제목</th>
				<th style="text-align: center;">내용</th>
			</tr>
		</thead>
		
		<tbody class="my_tbody">
			<c:if test="${empty requestScope.scheduleList}">
				<tr>
					<td colspan="5" style="text-align: center; height: 120px; color:#999;">검색 결과가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty requestScope.scheduleList}">
				<c:forEach var="map" items="${requestScope.scheduleList}">
					<tr class="infoSchedule">
						<td style="display: none;" class="scheduleno">${map.SCHEDULENO}</td>
						<td>${map.STARTDATE} - ${map.ENDDATE}</td>
						<td>${map.LGCATGONAME} - ${map.SMCATGONAME}</td>
						<td>${map.NAME}</td>  <%-- 캘린더 작성자명 --%>
						<td>${map.SUBJECT}</td>
						<td>${map.CONTENT}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

	<div align="center" style="width: 70%; border: solid 0px gray; margin: 20px auto;">${requestScope.pageBar}</div> 
    <div style="margin-bottom: 20px;">&nbsp;</div>
</div>

<form name="goDetailFrm"> 
   <input type="hidden" name="scheduleno"/>
   <input type="hidden" name="listgobackURL_schedule" value="${requestScope.listgobackURL_schedule}"/>
</form> 

<jsp:include page="../../footer/footer.jsp" /> 
      