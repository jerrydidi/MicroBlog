function cachedImage(src){
	return $("<img/>").attr("src", src);
}

var token    /*String*/,
    uid      /*String*/,
    friends  /*Array*/,
    selectedUsers /*Array<JSON>*/,
    index_url = window.location,
    $loadingImg = cachedImage("images/loading.jpg"),
//		<p>�ҷ���100�����@XX��60�������˲�����@XX��38Ԫ���ˡ�����д�漯����@XX��2���͸�ܽ�ؽ��һ�澵�ӡ��������ծ���ɣ�http://</p>
    wb_post = {text:"", html:""},
    typeImages = [cachedImage("images/endtxt1.png"), cachedImage("images/endtxt1.png"), cachedImage("images/endtxt1.png")],
    actions = [{label:"������һƥ������", image:cachedImage("images/pic1.png"), image_text:cachedImage("images/txt1.png")},
			   {label:"����һ��������д�漯��", image:cachedImage("images/pic2.png"), image_text:cachedImage("images/txt2.png")},
			   {label:"����һ�澵�Ӹ�ܽ�ؽ��", image:cachedImage("images/pic3.png"), image_text:cachedImage("images/txt3.png")},
			   {label:"����һ�������������ʦ", image:cachedImage("images/pic4.png"), image_text:cachedImage("images/txt4.png")},
			   {label:"������һֻ��̫��", image:cachedImage("images/pic5.png"), image_text:cachedImage("images/txt5.png")},
			   {label:"���Ʊȥ�����ҷ������", image:cachedImage("images/pic6.png"), image_text:cachedImage("images/txt6.png")},
			   {label:"ȥ���ݱ����������", image:cachedImage("images/pic7.png"), image_text:cachedImage("images/txt7.png")},
			   {label:"��֩������װȥ���ȵ���", image:cachedImage("images/pic8.png"), image_text:cachedImage("images/txt8.png")},
			   {label:"����һ�����ĺ�з", image:cachedImage("images/pic9.png"), image_text:cachedImage("images/txt9.png")},
			   {label:"����һ�����ӵ������ջ�", image:cachedImage("images/pic10.png"), image_text:cachedImage("images/txt10.png")},
			   {label:"�����������͸����ү", image:cachedImage("images/pic11.png"), image_text:cachedImage("images/txt11.png")},
			   {label:"��������Ь�͸���С��", image:cachedImage("images/pic12.png"), image_text:cachedImage("images/txt12.png")}];

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



