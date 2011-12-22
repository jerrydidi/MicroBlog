package page
{
	import widget.*;
	import flash.display.MovieClip;
	import event.DragCompleteEvent;
	import flash.events.MouseEvent;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import com.sina.microblog.events.*;
	import com.adobe.images.JPGEncoder;
	import com.core.microBlogs.qq.QQWeiboAPI;

	
	public class SelectedPageOne extends BaseSelectedPage {

		private var _friendsPanel:FriendsPanel;
		private var _friendsSelectedPanel:FriendsSelectedPanel;
		
		
		
		
		public function SelectedPageOne(mainPage:MainPage,pageNo:int) {
			// constructor code
			super(mainPage,pageNo);

		}
		
		override public function initComponents():void
		{
			_mainPage.childPage = _mainPage.page1;
		
			//
			_friendsSelectedPanel = new FriendsSelectedPanel(_mainPage.friends);
			_friendsSelectedPanel.x = 145;
			_friendsSelectedPanel.y = 100;
			_mainPage.childPage.addChild(_friendsSelectedPanel);
			//


			_friendsPanel = new FriendsPanel(_mainPage.friends);
			_friendsPanel.x = 75;
			_friendsPanel.y = 360;
			_friendsPanel.addEventListener(DragCompleteEvent.DRAG_COMPLETE_EVENT,dragComplete)
			_mainPage.childPage.addChild(_friendsPanel);
					//

			//
			_mainPage.childPage.mcToPageThree.addEventListener(MouseEvent.CLICK,nextPage);
			//
			
		}
		
		private function nextPage(e:MouseEvent):void
		{
			_mainPage.selectedFriends = _friendsSelectedPanel.friendsSelected;
			//updateBlogWithImage();
			_mainPage.changePage(2);
			
		}
		


		
		
		private  function dragComplete(e:DragCompleteEvent):void
		{


			_friendsSelectedPanel.dragHandler(e.dragItem);
				
			
		}	
		

	}
	
}
