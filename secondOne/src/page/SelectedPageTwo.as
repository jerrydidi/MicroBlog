

package page
{
	import widget.*;
	import flash.display.MovieClip;
	import event.DragCompleteEvent;
	import flash.events.MouseEvent;
	
	public class SelectedPageTwo extends BaseSelectedPage {


		
		
		
		public function SelectedPageTwo(mainPage:MainPage) {
			// constructor code
			super(mainPage);
			_mainPage.childPage = _mainPage.page1;
		}
		
		override public function initComponents():void
		{
			
		}
		

		

		

	}
	
}
