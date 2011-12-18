//for end-embed.html
(function($){
	 
	 function generateActions(){
		 var result = new Array(3);
		 var rndActionIndexs = getRandomIndex(actions.length, 3);
		 $.each(rndActionIndexs, function(i, n){
					var action = actions[n];
					result[i] = action;
				});
//		 wb_post = {text: "", html: ""};
		 return result;
	 }

 	 $(function(){
		   $.each(generateActions(), function(i, action){
					  var $bar  = $(".bar"+(i+1)); 
					  $bar.find("span:eq(0) > img").attr("src", selectedUsers[i]["avatar_large"]);
					  $bar.find("span:eq(1) strong").html("@" + selectedUsers[i]["screen_name"]);
					  $bar.find("span:eq(1) img:eq(0)").attr("src", typeImages[i].attr("src"));
					  $bar.find("span:eq(1) img:eq(1)").attr("src", action.image_text.attr("src"));
					  $bar.find("img:last").attr("src", action.image.attr("src"));
				  });

		   $("#shareButton").click(
			   function(){
				   $.get("publish-embed.html", function(data){$("body").html(data);});
			   });
	   });
})(jQuery);
