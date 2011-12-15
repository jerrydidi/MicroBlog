

function /*Array<Number>*/ getRandomIndex(total/*Number*/, limits/*Number*/){
	var result = new Array();
	while(result.length < limits){
	 	var rndNum = Math.floor(Math.random() * total);
		var containsRegx = new RegExp("[\\D]?" + rndNum + "[\\D]?");
		if(containsRegx.test(result.join(","))){
			continue;
		}
		result.push(rndNum);
	}
	return result;
}

function getRandomFriends(number/*Number*/){
	

}

function getParamByName(str, name){
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[^=]?" + name + "=([^&#]*)");
    var results = regex.exec(str);
    if(!results){
        return "";
    }else{
        return decodeURIComponent(results[1].replace(/\+/g, " "));
    }
}



