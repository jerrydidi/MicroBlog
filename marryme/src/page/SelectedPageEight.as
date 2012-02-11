


package page
{
	import widget.*;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.sina.microblog.MicroBlog;

	

	public class SelectedPageEight extends BaseSelectedPage {

		private var _mb:MicroBlog;
		
		//
		private var answer:int = -1;
				//
		public function SelectedPageEight(mainPage:MainPage,pageNo:int) {
			// constructor code
			super(mainPage,pageNo);
			_mb = mainPage.mb;
		}
		
		override public function initComponents():void
		{	
			_mainPage.childPage = _mainPage.page8;
						
		}
		

		

		

		

	}
}
