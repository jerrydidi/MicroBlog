//for publish-embed.html

(function($){
	 var actionUsers/*Array*/;

 	 $(function(){
		   actionUsers = selectedUsers;
		   $("#publishButton").click(function(){
									   window.location.reload();
								   });
	   });
})(jQuery);
