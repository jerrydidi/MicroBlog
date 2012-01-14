package page {
	
	import flash.display.MovieClip;
	import com.sina.microblog.MicroBlog;
	import com.sina.microblog.events.*;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	
	public class MainPage extends MovieClip {
		//micro blog reference
		private var _mb:MicroBlog = new MicroBlog();
		//friends array
		private var _friends:Array = new Array();
		//selected friends array
		private var _selectedFriends:Array = new Array();
		//profile
		public var _profile:Object;
		//
		public var _uid:String;
		//
		private var _childPage:MovieClip;	
		//
		public var txtWish:String;
		public var resultNumber:int = 0;
		
		//public var resultNumber:int =6;
		
		//
		private var _currentPage:BaseSelectedPage;
		
		
		public function MainPage() {
			// constructor code
			page0.addEventListener(Event.ENTER_FRAME,enterPage);
			
		}
		
		private function enterPage(e:Event):void
		{
			//trace("enter page");

			if(page0.btnLogin)
			{
				page0.removeEventListener(Event.ENTER_FRAME,enterPage);
				page0.btnLogin.addEventListener(MouseEvent.CLICK,loginClickHandler);
				
			}
			
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
			page0.btnLogin.removeEventListener(MouseEvent.CLICK,loginClickHandler);

			blogRegiter();

		}
		//blog register
		private function blogRegiter():void
		{
			_mb.consumerKey = "4292556571";
			_mb.consumerSecret = "070b00ec95bdce16605f4147db3b83a6";
			_mb.proxyURI = "http://3.yinongdai.sinaapp.com/proxy.php";
			
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
			getFriends();
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
			//trace("getFriendProfile" +_profile.name) ;
			
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
			//friend number
			obj.count = 200;

			_mb.addEventListener("getFriendsResultEvent", onGetFriendsResult);
			_mb.addEventListener("getFriendsErrorEvent", onGetFriendsError);
			_mb.callWeiboAPI("2/friendships/friends",obj, "GET", "getFriendsResultEvent", "getFriendsErrorEvent");
			//_mb.callWeiboAPI("2/friendships/friends/bilateral",obj, "GET", "getFriendsResultEvent", "getFriendsErrorEvent");
		}


		private function onGetFriendsResult(e:MicroBlogEvent):void
		{
			var data:Object = e.result;

			_friends = data.users as Array;
			trace("_friends.length:"+_friends.length);

			//get friends then goto page 1
			changePage(1);
			

		}
		
		private function onGetFriendsError(e:MicroBlogErrorEvent):void
		{

		}
		
		
		
	}
	
}
