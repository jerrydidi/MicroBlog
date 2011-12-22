package 
{
	import com.sina.microblog.MicroBlog;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import com.sina.microblog.events.*;
	public class SelectPage
	{
		private var _mainPage:MicroBlogMain;

		//private var _frindsPanel1:FriendsPanel;
		//private var _frindsPanel2:FriendsPanel;
		//private var _frindsPanel3:FriendsPanel;
		private var _mb :MicroBlog;
		private var _panels:Array = new Array();
		var count:int =0;
		public function SelectPage(mainPage:MicroBlogMain)
		{
			// constructor code
			this._mainPage = mainPage;
			this._mb = _mainPage.mb;
			_mainPage.addEventListener(Event.ENTER_FRAME,enterPage);
			


		}

		private function enterPage(e:Event):void
		{

			if (_mainPage.page2 == undefined)
			{
				return;
			}
			else
			{
				_mainPage.removeEventListener(Event.ENTER_FRAME,enterPage);
				//showFriendsPanel();
				getUID();
			}
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
			_mainPage._uid = data.uid;
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
			obj.uid = _mainPage._uid;

			_mb.addEventListener("getProfileResultEvent", onGetProfileResult);
			_mb.addEventListener("getProfileErrorEvent", onGetProfileError);
			_mb.callWeiboAPI("2/users/show",obj, "GET", "getProfileResultEvent", "getProfileErrorEvent");
			
		}

		private function onGetProfileResult(e:MicroBlogEvent):void
		{
			var data:Object = e.result;

			_mainPage._profile = data as Object;
			
			//trace("profile:"+data.avatar_large);
			

		}
		//new MicroBlogEvent
		private function onGetProfileError(e:MicroBlogErrorEvent):void
		{

		}
		
		
		//get friends
		public function getFriends():void
		{
			var obj = new Object  ;
			obj.uid = _mainPage._uid;

			_mb.addEventListener("getFriendsResultEvent", onGetFriendsResult);
			_mb.addEventListener("getFriendsErrorEvent", onGetFriendsError);
			_mb.callWeiboAPI("2/friendships/friends/bilateral",obj, "GET", "getFriendsResultEvent", "getFriendsErrorEvent");
			//_mb.callWeiboAPI("2/friendships/friends",obj, "GET", "getFriendsResultEvent", "getFriendsErrorEvent");

 
		}


		private function onGetFriendsResult(e:MicroBlogEvent):void
		{
			//trace("get friends");

			var data:Object = e.result;

			_mainPage.friends = data.users as Array;

			showFriendsPanel();

		}
		private function onGetFriendsError(e:MicroBlogErrorEvent):void
		{
			trace("get friends error");
		}
		
		public function showFriendsPanel():void
		{
			
			
			for(var i:int= 0;i<3;i++)
			{
				
				var friendPanle:FriendsPanel = new FriendsPanel(_mainPage,i);

				friendPanle.x = -30;
				friendPanle.y = -100 +100 * i;
				_mainPage.page2.addChild(friendPanle);
				_panels.push(friendPanle);

				
			}
			

			_mainPage.page2.chooseOne.addEventListener(MouseEvent.CLICK,choose1Click);
			
			//panel 2;

			_mainPage.page2.chooseTwo.addEventListener(MouseEvent.CLICK,choose2Click);
			//panel 3;

			_mainPage.page2.chooseThree.addEventListener(MouseEvent.CLICK,choose3Click);
			//next page;
			_mainPage.page2.mcNextPage.addEventListener(MouseEvent.CLICK,nextPageClick);
		}

		private function choose1Click(e:MouseEvent):void
		{
			var friendPanle:FriendsPanel;
			friendPanle = _panels[0] as FriendsPanel;
			friendPanle.listFriends();

		}
		private function choose2Click(e:MouseEvent):void
		{
			var friendPanle:FriendsPanel;
			friendPanle = _panels[1] as FriendsPanel;
			friendPanle.listFriends();

		}
		private function choose3Click(e:MouseEvent):void
		{
			var friendPanle:FriendsPanel;
			friendPanle = _panels[2] as FriendsPanel;
			friendPanle.listFriends();

		}



		private function nextPageClick(e:MouseEvent):void
		{
			_mainPage.changePage(2);

		}

	}

}