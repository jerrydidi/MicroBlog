package page  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class BaseSelectedPage {
		//main page
		protected var _mainPage:MainPage;
		//page number
		private var _pageNo:int;
		
		public function BaseSelectedPage(mainPage:MainPage,pageNo:int) {
			// constructor code
			this._mainPage = mainPage;
			this._pageNo = pageNo;
			_mainPage.addEventListener(Event.ENTER_FRAME,enterPage);
			//initComponents();
			
			
		}
		//enter page
		private function enterPage(e:Event):void
		{

			//trace("enterPage" + _mainPage.childPage)
			switch(_pageNo)
			{
				case 1:
					if (_mainPage.page1 == null ||_mainPage.page1 == undefined)
					{
						return;
					}
					break;
				case 2:
					if (_mainPage.page2 == null ||_mainPage.page2 == undefined)
					{
						return;
					}
					break;
				
			}


				_mainPage.removeEventListener(Event.ENTER_FRAME,enterPage);
				//showFriendsPanel();
				initComponents();

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
