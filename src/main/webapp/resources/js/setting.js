/**
 * author : 1871132 JKS
 * 브라우저 기능 관련 페이지 설정.
 * 적용 1) process.jsp에서 새로고침 불가. (브라우저의 새로고침 이모콘은 가능.)
 */
 
function NotReload() {
	// 78=N, 82=R, 116=F5
	if((event.ctrlKey==true && (event.keyCode==78 || event.keyCode==82)) || (event.keyCode==116)){
		event.keyCode=0; // 0=48
		event.cancelBubble=true;
		event.returnValue=false;
	}
}

document.onkeydown=NotReload;