/**
 * author : 1871132 JKS
 */
 
var oneId, twoId, threeId, regBtn, allBox;

function set_load() {
	oneId = document.getElementById("reg_check_one");
	twoId = document.getElementById("reg_check_two");
	threeId = document.getElementById("reg_check_three");
	regBtn = document.getElementById("reg_btn");	
	allBox = document.getElementById("reg_check_all")
	
	regBtn.disabled = true;
}

function checkBtn() {
	if(oneId.checked==true && twoId.checked==true){
		regBtn.disabled = false;
		if(threeId.checked==true){
			if(allBox.checked==false){
				allBox.checked=true;
			}
		}
		else{
			if(allBox.checked==true){
				allBox.checked=false;
			}
		}
	}
	else{
		regBtn.disabled = true;
		if(allBox.checked==true){
			allBox.checked=false;
		}
	}
}

function checkAll(cBox) {
	if(cBox.checked==true){
		if(oneId.checked==false){
			oneId.checked=true;
		}
		if(twoId.checked==false){
			twoId.checked=true;
		}
		if(threeId.checked==false){
			threeId.checked=true;
		}
	}
	else{
		if(oneId.checked==true){
			oneId.checked=false;
		}
		if(twoId.checked==true){
			twoId.checked=false;
		}
		if(threeId.checked==true){
			threeId.checked=false;
		}
	}
	checkBtn();
}

function checkBox(cBox) {
	checkBtn();
}