package  {
	
	import flash.display.MovieClip;
	import flashx.textLayout.formats.BaselineOffset;
	
	
	public class MainPage extends MovieClip {
		//micro blog reference
		private var _mb:MicroBlog = new MicroBlog();
		//friends array
		private var _friends:Array = new Array();
		
		//
		private var _currentPage:BaseSelectedPage;
		
		
		public function MainPage() {
			// constructor code
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
					//_currentPage = new SelectPageOne(this);
					break;
				case 2 :
					this.gotoAndStop(3);
					//_currentPage = new SelectPageTwo(this);
					break;
				case 3 :
					this.gotoAndStop(4);
					//_currentPage = new SelectPageThree(this);
					break;
			}
		}
		
		
		
		
	}
	
}
