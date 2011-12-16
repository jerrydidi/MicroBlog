var token    /*String*/,
    uid      /*String*/,
    friends  /*Array*/,
    selectedUsers /*Array<JSON>*/,
    location = window.location,
    $loadingImg = $("<img/>").attr("src", "images/loading.jpg");

function /*Array<Number>*/ getRandomIndex(total/*Number*/, limits/*Number*/){
	var result = new Array();
	if(total <= 0){
//		throw "total number can not zero";
		return result;
	}
	while(result.length < limits){
	 	var rndNum = Math.floor(Math.random() * total);
		if(total < limits){
			result.push(rndNum);
			continue;
		}
		var containsRegx = new RegExp("[\\D]?" + rndNum + "[\\D]?");
		if(containsRegx.test(result.join(","))){
			continue;
		}
		result.push(rndNum);
	}
	return result;
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



