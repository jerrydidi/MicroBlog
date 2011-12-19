//for publish-embed.html
(function($){

 	 $(function(){
		   $("#post_text").html(wb_post.html);
		   $("div.nipic2 span.niimg, div.nipic2 span.niimg2, div.nipic2 span.niimg3").each(
			   function(i){
//				   alert($(this).html());
//				   alert(wb_post.images[i].attr("src"));
				   $(this).html(wb_post.images[i]);
			   });
		   $("#publishButton").click(
			   function(){
				   //window.location.reload();
				   $.ajax({url:"https://api.weibo.com/2/statuses/update.json",
						   data: {access_token: token, status:encodeURIComponent(wb_post.text)},
						   method: "GET",
						   dataType: "jsonp",
						   crossDomain: "true",
						   jsonpCallback: "jQueryJSONResultFun",
						   success: function(result){
							   alert(result);
						   }});
			   });
	   });

})(jQuery);
