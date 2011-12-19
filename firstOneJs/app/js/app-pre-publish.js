//for end-embed.html
(function($){

/*
  	 if(!selselectedUsers || selectedUsers.length < 3){
		 //redirect index
		 window.location.reload("index.html");
		 return;
	 }
*/	 

	 var wb_post_tmpl = {
		 subject: "我放了100￥贷款",
		 tail: "……请叫我债主吧！",
		 $60: "用60￥", 
		 $60_user_action:{},
		 $38: "用38￥", 
		 $38_user_action:{},
		 $2: "用2￥",
		 $2_user_action:{},
		 text: function(){
			 return [this.subject, 
					 this.textUser(this.$60_user_action["user"]), this.$60, this.$60_user_action["action"]["label"],
					 this.textUser(this.$38_user_action["user"]), this.$38, this.$38_user_action["action"]["label"],
					 this.textUser(this.$2_user_action["user"]), this.$2, this.$2_user_action["action"]["label"],
					 this.tail].join("， ");
		 },
		 html: function(){
			 var ht = ["<p>", this.subject, "， ",
					   this.htmlUser(this.$60_user_action["user"]), this.$60, this.$60_user_action["action"]["label"], "， ",
					   this.htmlUser(this.$38_user_action["user"]), this.$38, this.$38_user_action["action"]["label"], "， ",
					   this.htmlUser(this.$2_user_action["user"]), this.$2, this.$2_user_action["action"]["label"], "， ",
					   this.tail, "</p>"].join("");
			 return ht;
		 },
		 htmlUser: function(user){
			 return $("<div/>").append($("<a/>").attr("href", user["url"]).html(this.textUser(user))).html();
		 },
		 textUser: function(user){
			 return "@" + user["screen_name"];
		 }
	 };

	 function generateActions(){
		 var result = new Array(3);
		 var rndActionIndexs = getRandomIndex(actions.length, 3);
		 $.each(rndActionIndexs, function(i, n){
					var action = actions[n];
					result[i] = action;
				});
		 wb_post_tmpl.$60_user_action = {user: selectedUsers[0], action: result[0]};
		 wb_post_tmpl.$38_user_action = {user: selectedUsers[1], action: result[1]};
		 wb_post_tmpl.$2_user_action = {user: selectedUsers[2], action: result[2]};
		 wb_post.html = wb_post_tmpl.html();
		 wb_post.text = wb_post_tmpl.text();
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
				   $.get("publish-embed.html?ts=" + new Date(), function(data){$("body").html(data);});
			   });
	   });
})(jQuery);
