/*
 * jquery weibo plugin
 * @Version 1.0
 */
(function($){
    $.extend({WB2:{
        baseURLV2: "https://api.weibo.com/2",
        api : function(cmd, handler){
            alert(this.baseURLV2 + cmd);

			
        },
        getToken: function(){throw "Not implemented yet";}
    }});
})(jQuery);

/*
        $.ajax({
                url: "https://api.weibo.com/2/friendships/friends.json?callback=?",
	            data: {access_token: token, uid: uid},
	            method: "GET",
	            dataType: "jsonp",
	            crossDomain: "true",
                jsonpCallback: "jQueryJSONPResultFun",
	            success: function(result){
                    alert(result.data);
                    
                }
        });

*/
