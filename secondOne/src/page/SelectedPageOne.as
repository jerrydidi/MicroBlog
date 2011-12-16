package page
{
	import widget.*;
	import flash.display.MovieClip;
	import event.DragCompleteEvent;
	
	public class SelectedPageOne extends BaseSelectedPage {

		private var _friendsPanel:FriendsPanel;
		private var _friendsSelectedPanel:FriendsSelectedPanel;
		
		
		
		public function SelectedPageOne(mainPage:MainPage) {
			// constructor code
			super(mainPage);
			_mainPage.childPage = _mainPage.page1;
		}
		
		override public function initComponents():void
		{
			_friendsSelectedPanel = new FriendsSelectedPanel(_mainPage.friends);
			_friendsSelectedPanel.y = 20;
			_mainPage.childPage.addChild(_friendsSelectedPanel);
			//
			_friendsPanel = new FriendsPanel(_mainPage.friends);
			_friendsPanel.y = 100;
			_friendsPanel.addEventListener(DragCompleteEvent.DRAG_COMPLETE_EVENT,dragComplete)
			_mainPage.childPage.addChild(_friendsPanel);
			//
			
		}
		
		private  function dragComplete(e:DragCompleteEvent):void
		{


				_friendsSelectedPanel.dragHandler(e.dragX,e.dragY);
				
			
		}
		

	}
	
}
