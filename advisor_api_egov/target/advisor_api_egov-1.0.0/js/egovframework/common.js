 /* 페이징처리 공통함수 */
   function fnPaging(pageObj){
  		let html = ""; // 'var' 대신 'let'을 사용합니다.

		if(pageObj != null && pageObj.totalPageCount != 0) {

			html += "	<div id='pagingDiv' class='tui-pagination'>";
			if(pageObj.prevBlock != 1) {
				html += "	<a href='javascript:fnSearch(1);' class='tui-page-btn tui-first'>";
				html += "		<span class='tui-ico-first'>first</span>";
				html += "	</a>";
				html += "	<a href='javascript:fnSearch(" + pageObj.prevBlock + ");' class='tui-page-btn tui-prev'>";
				html += "		<span class='tui-ico-prev'>prev</span>";
				html += "	</a>";
			}
			for(let i = pageObj.firstPage; i <= pageObj.lastPage; i++) {
				html += "	<a href='javascript:fnSearch(" + i + ")' class='tui-page-btn ";
				if(pageObj.currentPage == i) {
					html += "tui-is-selected";
				}
				html += "'>" + i + "</a>";
			}
			if(pageObj.lastPage < pageObj.totalPageCount) {
				html += "	<a href='javascript:fnSearch(" + pageObj.nextBlock + ");' class='tui-page-btn tui-next'>";
				html += "		<span class='tui-ico-next'>next</span>";
				html += "	</a>";
				html += " 	<a href='javascript:fnSearch(" + pageObj.totalPageCount + ");' class='tui-page-btn tui-last'>";
				html += "		<span class='tui-ico-last'>last</span>";
				html += "	</a>";
			}
			html += "	</div>";
			html += "</div>";

			$("#pageArea").html(html);
		}
		
   }