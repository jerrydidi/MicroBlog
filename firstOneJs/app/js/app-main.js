(function($){
     $(function(){
           //$.WB2.api("/friendships/friends.json", null);

//            if(token == null){
                //@TODO

           var hash = document.location.hash.substring(1);
           token = getParamByName(hash, "access_token");
           uid = getParamByName(hash, "uid");
		   
           $.getJSON("https://api.weibo.com/2/friendships/friends.json?callback=?",
                     {access_token: token, uid: uid},
                     function(result){
                         //@TODO check error
                         friends = result.data.users;
                         if(friends == null){
                             //Error
                             return;
                         }
                         shuffle($("div.minipic"));
                         shuffle($("div.minipic2"));
                         shuffle($("div.minipic3"));
					 });
		   //            }
		   
           function shuffle($group/*jQuery*/){
               var rndFriendIndexs = getRandomIndex(friends.length, 3);
               $.each(rndFriendIndexs, function(i, n){
						  var friend = friends[n];
						  var $span = $group.find("span").eq(i);
						  loadImage($span.find("img"), friend["profile_image_url"], friend);
						  $span.find("p").html(friend["screen_name"]);
					  });
           }
		   
           function loadImage($image, url, data){
               $image.attr("src", $loadingImg.attr("src"));
               var $newImage = $("<img/>").attr("src", url);
               $image.attr("src", $newImage.attr("src"));
			   $image.data("user", data);
           }

		   $("div.minipic, div.minipic2, div.minipic3").each(
			   function(index){
				   var $g = $(this);
				   var $s = $g.find("span > input");
				   var $items = $g.find("span.mimg > img, span.mimg2 > img, span.mimg3 > img");
				   $items.click(
					   function(){
						   $g.data("selected", $(this).data("user"));
						   $(this).after($s);
					   }
				   );
			   }
		   );
		   
           $("#grpButton1").click(function(){shuffle($("div.minipic"));});
		   
           $("#grpButton2").click(function(){shuffle($("div.minipic2"));});
		   
           $("#grpButton3").click(function(){shuffle($("div.minipic3"));});

           $("#okButton").click(
			   function(){
				   selectedUsers = new Array(3);
				   $("div.minipic, div.minipic2, div.minipic3").each(
					   function(index){
						   if(!$(this).data("selected")){
							   selectedUsers[index] = $(this).find("span.mimg > img").data("user");
						   }else{
							   selectedUsers[index] = $(this).data("selected");												
						   }
					   }
				   );
				   $.get("preview-e.html?ts=" + new Date(), function(data){$("body").html(data);});
			   });
		   
       });
	 
 })(jQuery);
