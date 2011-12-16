package page  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class BaseSelectedPage {
		//main page
		protected var _mainPage:MainPage;
		//page number
		private var _pageNo:int;
		
		public function BaseSelectedPage(mainPage:MainPage) {
			// constructor code
			this._mainPage = mainPage;
			_mainPage.addEventListener(Event.ENTER_FRAME,enterPage);
			//initComponents();
			
			
		}
		//enter page
		private function enterPage(e:Event):void
		{

			if (_mainPage.childPage == undefined)
			{
				return;
			}
			else
			{
				_mainPage.removeEventListener(Event.ENTER_FRAME,enterPage);
				//showFriendsPanel();
				initComponents();
			}
		}
		
		
		public function initComponents():void
		{
			
		}
		
		public function set pageNo(value:int):void
		{
			this._pageNo = value;
		}
		
		public function get pageNo():int
		{
			return this._pageNo;
		}
		
		
		

	}
	
}
