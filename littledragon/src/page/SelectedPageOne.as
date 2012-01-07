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
				_friendsPanel = new FriendsPanel(_mainPage.friends);
				_friendsPanel.x = 0;
				_friendsPanel.y = 0;
				_mainPage.childPage.addChild(_friendsPanel);
			}
			
			//
			
		}
		
		private function pageInit(e:Event):void
		{
			if(_mainPage.childPage.friendsPanel.mcToPageThree)
			{
				_mainPage.childPage.removeEventListener(Event.ENTER_FRAME,pageInit);
				_mainPage.childPage.friendsPanel.mcToPageThree.addEventListener(MouseEvent.CLICK,nextPage);

				
			}
			else
			{
				trace("no page to 3");
				
			}
		}
		
		private function nextPage(e:MouseEvent):void
		{
			//trace("to page 3");
			_mainPage.selectedFriends.push(_friendsPanel.selectedItem.friendData);
			_mainPage.changePage(2);
			
		}
		

		

	}
	
}
