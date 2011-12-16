package page
{
	import widget.*;
	import flash.display.MovieClip;
	
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
			_mainPage.childPage.addChild(_friendsSelectedPanel);
			//
			_friendsPanel = new FriendsPanel(_mainPage.friends);
			_friendsPanel.y = 100;
			_mainPage.childPage.addChild(_friendsPanel);
			//
			
		}
		

	}
	
}
