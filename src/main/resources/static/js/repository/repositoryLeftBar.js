$(document).ready(()=>{
	
	
	// 자료실 정보 조회 + 렌더링하기
	$.ajax({
	        url: ctxPath + "/repository/selectRepositoryList",
	        type: "GET",
	        dataType: "json",
	        success: function(json) {
				let html = "";

				    json.forEach(repo => {
				        let repoName = repo.repositoryType === "CORPORATE" ? "전사자료실" : "개인자료실";
				        html += `
				            <span class="reposfolder" data-id="${repo.repositoryNo}">
				                <i class="fa-solid fa-arrow-right"></i>
								</span>
								${repoName}<br>
				        `;
				    });

				    $("#repositoryListArea").html(html); // div에 내용 넣기
	        },
	        error: function() {
				alert("실패!");
	        }
	    });
	
}) // end of $(document).ready(()=>{})-------------


// 자료실의 화살표 버튼 클릭 시
$(document).on("click", ".reposfolder", function () {
    let repoNo = $(this).data("id");
	
    console.log("클릭한 repositoryNo:", repoNo);
	
	
    
});