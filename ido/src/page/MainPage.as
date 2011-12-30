package page {
	
	import flash.display.MovieClip;
	import com.sina.microblog.MicroBlog;
	import com.sina.microblog.events.*;
	import flash.events.MouseEvent;
	import widget.FriendItem;
	import widget.PopupFriendItem;
		import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class MainPage extends MovieClip {
		//micro blog reference
		private var _mb:MicroBlog = new MicroBlog();
		//friends array
		private var _friends:Array = new Array();
		//selected friends array
		private var _selectedFriends:Array = new Array();
		//profile
		private var _profile:Object;
		//
		private var _uid:String;
		//
		private var _childPage:MovieClip;	
		
		private var _selectedImage:PopupFriendItem;
		
		public var resultNumber:int = Math.round(Math.random()*3)+1;
		
		//public var resultNumber:int =6;
		
		//
		private var _currentPage:BaseSelectedPage;
		
		
		public function MainPage() {
			// constructor code
			page0.btnLogin.addEventListener(MouseEvent.CLICK,loginClickHandler);
			
			
			var _txtFriend:TextField = new TextField()
			
			
			

			
			
			var _bg:MovieClip = new MovieClip();		
		
			
		}
		
		public function set selectedFriends(value:Array):void
		{
			
			this._selectedFriends = value;
		}
		
		public function get selectedFriends():Array
		{
			
			return _selectedFriends;
		}
		
		public function set childPage(childPage:MovieClip):void
		{
			this._childPage = childPage;
		}
		
		public function get childPage():MovieClip
		{
			return _childPage;
		}
		
		
		public function set selectedImage(selectedImage:PopupFriendItem):void
		{
			this._selectedImage = selectedImage;
		}
		
		public function get selectedImage():PopupFriendItem
		{
			return _selectedImage;
		}		
		
		public function set mb(value:MicroBlog):void
		{
			this._mb = value;

		}


		public function get mb():MicroBlog
		{
			return _mb;

		}
		public function set friends(value:Array):void
		{
			
			this._friends = value;
		}
		
		public function get friends():Array
		{
			return _friends;			
		}
		
		public function set profile(value:Object):void
		{
			
			this._profile = value;
		}
		
		public function get profile():Object
		{
			return _profile;			
		}		
		
		public function set uid(value:String):void
		{
			
			this._uid = value;
		}
		
		public function get uid():String
		{
			return _uid;			
		}	
		
		public function changePage(pageIdx:int):void
		{
			switch (pageIdx)
			{

				case 0 :
					this.gotoAndStop(1);
					break;
				case 1 :
					this.gotoAndStop(2);
					_currentPage = new SelectedPageOne(this,1);
					break;
				case 2 :
					this.gotoAndStop(3);
					_currentPage = new SelectedPageTwo(this,2);
					break;
				case 3 :
					this.gotoAndStop(4);
					_currentPage = new SelectedPageThree(this,3);
					break;
			}
		}
		//
		private function loginClickHandler(e:MouseEvent):void
		{
			//trace("======loginClickHandler========");
			//page0.btnLogin.removeEventListener(MouseEvent.CLICK,loginClickHandler);

			blogRegiter();

		}
		//blog register
		private function blogRegiter():void
		{
			//_mb.consumerKey = "1625362241";
			//_mb.consumerSecret = "b196f99718cc61baf9c0e4fed45ce0f1";
			//_mb.proxyURI = "http://1.secondone.sinaapp.com/proxy.php";
			
			_mb.consumerKey = "108044056";
			_mb.consumerSecret = "c95fe37a1a9c24e19440e51a7a143194";
			_mb.proxyURI = "http://1.idotashishui.sinaapp.com/proxy.php";
			
		
			
			
			trace("blogRegiter")
			_mb.addEventListener(MicroBlogEvent.LOGIN_RESULT, onLoginResult);
			_mb.login();
		}
		private function onLoginResult(e:MicroBlogEvent):void
		{
			_mb.removeEventListener(MicroBlogEvent.LOGIN_RESULT, onLoginResult);
			getUID();			
		}
		
		//callWeiboAPI第一个参数是接口uri，可以在open.weibo.com里面的API文档中查找你想要调用的API。
		private function getUID():void
		{

			_mb.addEventListener("getUIDResultEvent", onGetUIDResult);
			_mb.addEventListener("getUIDErrorEvent", onGetUIDError);
			_mb.callWeiboAPI("2/account/get_uid",null, "GET", "getUIDResultEvent", "getUIDErrorEvent");
		}

		//成功调用API，事件名称是你自定义的字符串，而最终结果e.result的结构按照线上文档对应。
		private function onGetUIDResult(e:MicroBlogEvent):void
		{
			_mb.removeEventListener("getUIDResultEvent", onGetUIDResult);

			var data:Object = e.result;
			//set the uid
			_uid = data.uid;
			//trace("_uid :" + _uid);

			// get profile
			getProfile();
			//get friends
			//getFriends();
		}

		private function onGetUIDError(e:MicroBlogErrorEvent):void
		{
			trace(e.message);
		}


		public function getProfile():void
		{
			
			var obj = new Object  ;
			obj.uid = _uid;

			_mb.addEventListener("getProfileResultEvent", onGetProfileResult);
			_mb.addEventListener("getProfileErrorEvent", onGetProfileError);
			_mb.callWeiboAPI("2/users/show",obj, "GET", "getProfileResultEvent", "getProfileErrorEvent");
			
		}

		private function onGetProfileResult(e:MicroBlogEvent):void
		{
			var data:Object = e.result;
			_profile = data as Object;
			
			trace("_profile:"+_profile);

			getFriends();
			
		}
		//new MicroBlogEvent
		private function onGetProfileError(e:MicroBlogErrorEvent):void
		{

		}
		
		
		//get friends
		public function getFriends():void
		{
			var obj = new Object  ;
			obj.uid = this._uid;
			obj.count=200;
			//obj.sort=1;
			_mb.addEventListener("getFriendsResultEvent", onGetFriendsResult);
			_mb.addEventListener("getFriendsErrorEvent", onGetFriendsError);
			_mb.callWeiboAPI("2/friendships/friends",obj, "GET", "getFriendsResultEvent", "getFriendsErrorEvent");
			//_mb.callWeiboAPI("2/friendships/friends/bilateral",obj, "GET", "getFriendsResultEvent", "getFriendsErrorEvent");
		}


		private function onGetFriendsResult(e:MicroBlogEvent):void
		{
			var data:Object = e.result;

			if(data.users !=undefined &&data.users !=null)
			{
				_friends = data.users as Array;
				
				if(_friends !=undefined &&_friends !=null)
				{
					//trace("_friends:"+_friends.length);

					var tempfriends:Array = new Array();
					for  (var i:int =0;i<friends.length;i++)
					{
						//trace("profile:"+_profile);
						//trace("profile.gender:"+_profile.gender);
						if ((friends[i].gender != _profile.gender)){
							tempfriends.push(friends[i]);
						}
					}
					_friends = tempfriends;
					//get friends then goto page 1
					trace("_friends.length :" + _friends.length);
					changePage(1);
					
					}
				}
			}
		
		private function onGetFriendsError(e:MicroBlogErrorEvent):void
		{

		}
	}
	
}
