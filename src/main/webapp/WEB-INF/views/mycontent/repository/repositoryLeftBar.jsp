<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String ctxpath = request.getContextPath();
%>
<link href="<%=ctxpath%>/css/repository/repositoryLeftBar.css" rel="stylesheet"> 

<script>
//객체 생성
var tree = new SeedTree();

// 트리 설정값
var treeConfig = {
    stArea: "tree1",
    stType: "st_type1",
    stName: "조직도 (573개)",
    stWidth: "400",
    stHeight: "450",
    stBackColor: "#fafafa",
    stBorderColor: "#d5d5d5"
}

// 트리 데이터 조회 Ajax
function listTreeData(pViewNode) {
    $.ajax({
        type: "POST",
        url: "/AjaxData/ListTreeData",
        dataType: "json",
        async: false,
        data: { "pViewNode": pViewNode },
        success: function (datas) {
            // 트리뷰 생성
            tree.makeTree(tree, treeConfig, datas, pViewNode, tree_click, [1, 2]);
        },
        error: function (e) {
            alert("오류발생");
        }
    });
}

// 페이지 로드
$(document).ready(function (e) {
    // 트리 데이터 조회
    listTreeData("CO01");
});

// 트리 버튼 클릭 이벤트
function tree_click(pNodeCd, pNodeNm, pParentNodeCd, pNodeChild, pNodeData, pParam) {
    // 선택 노드의 코드, 명칭 확인
    alert(pNodeCd);
    alert(pNodeNm);
    alert(pParentNodeCd);
    alert(pNodeChild);
    alert(pNodeData);
    alert(pParam);
    alert(pParam[0]);
    alert(pParam[1]);
}
</script>

<div id="left_bar">

      <!-- === 글작성 버튼 === -->
      <button id="writePostBtn">
          <span id="goWrite">파일 업로드</span>
      </button>
      <!-- === 글작성 버튼 === -->

      <div class="board_menu_container">
          <div id="tree"></div>
      </div>
  </div>