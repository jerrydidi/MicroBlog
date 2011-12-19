//for publish-embed.html
(function($){

 	 $(function(){
		   $("#post_text").html(wb_post.html);
		   $("#publishButton").click(
			   function(){
				   //window.location.reload();
				   $.ajax({url:"https://api.weibo.com/2/statuses/update.json",
						   data: {access_token: token, status:encodeURIComponent(wb_post.text)},
						   method: "POST",
						   dataType: "jsonp",
						   crossDomain: "true",
						   jsonpCallback: "jQueryJSONResultFun",
						   success: function(result){
							   alert(result);
						   }});
			   });
	   });

})(jQuery);
