package page
{
	import widget.*;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.sina.microblog.MicroBlog;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import com.sina.microblog.events.*;
	import flash.events.Event;
	import event.NextPageEvent;
	import utils.Util;

	
	public class SelectedPageOne extends BaseSelectedPage {

		private var _friendsPanel:FriendsPanel;
		
		private var _mb:MicroBlog;
		

		
		public function SelectedPageOne(mainPage:MainPage,pageNo:int) {
			// constructor code
			super(mainPage,pageNo);
			_mb = mainPage.mb;
		}
		
		override public function initComponents():void
		{
			_mainPage.childPage = _mainPage.page1;
			_mainPage.childPage.addEventListener(Event.ENTER_FRAME,pageInit)
			
		
			if(_mainPage.friends.length >0)
			{
				_friendsPanel = new FriendsPanel();
				_friendsPanel.init(_mainPage.friends);
				_friendsPanel.x = 0;
				_friendsPanel.y = 0;
				_mainPage.addChild(_friendsPanel);
				_friendsPanel.addEventListener(NextPageEvent.NEXT_PAGE_EVENT,nextPage);
			}
			
			//
			
		}
		
		private function pageInit(e:Event):void
		{
			_mainPage.childPage.removeEventListener(Event.ENTER_FRAME,pageInit);

		}
		
		private function nextPage(e:NextPageEvent):void
		{
			trace("to page 3");
						
			var randomAry:Array =  Util.getRamdonListIndex(3,_mainPage.friends.length);
			var selectedFriends:Array = new Array();
			for(var i:int =0;i<3;i++)
			{
				selectedFriends.push(_mainPage.friends[randomAry[i]]);
			}
			_mainPage.selectedFriends = selectedFriends;
			_mainPage.removeChild(_friendsPanel);
	
			_mainPage.changePage(2);
			
		}
		

		

	}
	
}
