function cachedImage(src){
	return $("<img/>").attr("src", src);
}

var token    /*String*/,
    uid      /*String*/,
    friends  /*Array*/,
    selectedUsers = []/*Array<JSON>*/,
    index_url = window.location,
    $loadingImg = cachedImage("images/loading.jpg"),
    wb_post = {text:"", html:"", images:[]},
    typeImages = [cachedImage("images/endtxt1.png"), cachedImage("images/endtxt1.png"), cachedImage("images/endtxt1.png")],
    actions = [{label:"饲养了一匹草泥马", image:cachedImage("images/pic1.png"), 
				image_text:cachedImage("images/txt1.png"), image_large:cachedImage("images/ppic.png")},
			   {label:"买了一本《尔康写真集》", image:cachedImage("images/pic2.png"), 
				image_text:cachedImage("images/txt2.png"), image_large:cachedImage("images/ppic.png")},
			   {label:"送了一面镜子给芙蓉姐姐", image:cachedImage("images/pic3.png"),
				image_text:cachedImage("images/txt3.png"), image_large:cachedImage("images/ppic.png")},
			   {label:"送了一部照相机给陈老师", image:cachedImage("images/pic4.png"),
				image_text:cachedImage("images/txt4.png"), image_large:cachedImage("images/ppic.png")},
			   {label:"饲养了一只灰太狼", image:cachedImage("images/pic5.png"),
				image_text:cachedImage("images/txt5.png"), image_large:cachedImage("images/ppic.png")},
			   {label:"买机票去美国找凤姐相亲", image:cachedImage("images/pic6.png"),
				image_text:cachedImage("images/txt6.png"), image_large:cachedImage("images/ppic.png")},
			   {label:"去整容变成了容嬷嬷", image:cachedImage("images/pic7.png"),
				image_text:cachedImage("images/txt7.png"), image_large:cachedImage("images/ppic.png")},
			   {label:"买蜘蛛侠套装去拯救地球", image:cachedImage("images/pic8.png"),
				image_text:cachedImage("images/txt8.png"), image_large:cachedImage("images/ppic.png")},
			   {label:"养了一池塘的河蟹", image:cachedImage("images/pic9.png"),
				image_text:cachedImage("images/txt9.png"), image_large:cachedImage("images/ppic.png")},
			   {label:"种下一个妹子等来年收获", image:cachedImage("images/pic10.png"),
				image_text:cachedImage("images/txt10.png"), image_large:cachedImage("images/ppic.png")},
			   {label:"买了生发剂送给葛大爷", image:cachedImage("images/pic11.png"),
				image_text:cachedImage("images/txt11.png"), image_large:cachedImage("images/ppic.png")},
			   {label:"买了增高鞋送给郭小明", image:cachedImage("images/pic12.png"),
				image_text:cachedImage("images/txt12.png"), image_large:cachedImage("images/ppic.png")}];

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



