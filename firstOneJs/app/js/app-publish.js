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
				   
				   /*
				   $.ajax({type: "POST",
	  					   url:"https://api.weibo.com/2/statuses/update.json",
						   data: $.param({access_token: token, status:wb_post.text}),
						   dataType: "jsonp",
						   crossDomain: "true",
						   jsonpCallback: "jQueryJSONResultFun",
						   success: function(result){
							   alert(result);
						   }
						  });
					*/

				   WB2.anyWhere(
					   function(W){
						   W.parseCMD("/statuses/update.json?access_token=" + token, 
									  function(sResult, bStatus){
										  if(bStatus){
											  alert("发布成功");
										  }else{
											  alert(sResult.error);
										  }
									  }, {status: encodeURIComponent(wb_post.text)}, {method: "POST"});
					   });

				   if($("#follow:checked").val() && uid != YND_ID){
					   WB2.anyWhere(
						   function(W){
							   W.parseCMD("/friendships/create.json?access_token=" + token, 
										  function(sResult, bStatus){
											  if(bStatus){
												  alert("关注成功");
											  }else{
												  alert(sResult.error);
											  }
										  }, {user_id: YND_ID}, {method: "POST"});
						   });
				   }

//				   alert("ok");
//				   window.location.reload();

			   });
	   });

})(jQuery);
