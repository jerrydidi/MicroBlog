

package page
{
	import widget.*;
	import flash.display.MovieClip;
	import event.DragCompleteEvent;
	import flash.events.MouseEvent;
	import widget.*;
	
	
	public class SelectedPageTwo extends BaseSelectedPage {

		var _resultItem:ResultItem;
		//
		var _popup:MovieClip = new popup();
		
		
		
		public function SelectedPageTwo(mainPage:MainPage,pageNo:int) {
			// constructor code
			super(mainPage,pageNo);
		}
		
		override public function initComponents():void
		{

			_mainPage.childPage = _mainPage.page2;
			//
			
			var selectedItem:FriendSelectedItem;
			selectedItem = _mainPage.selectedFriends[0];
			_resultItem = new ResultItem(_mainPage.resultNumber,selectedItem.friendData);
			_resultItem.x = 10;
			_resultItem.y = 10;
			
			_mainPage.childPage.addChildAt(_resultItem,0);
			
			//
			_mainPage.childPage.btnPopup.addEventListener(MouseEvent.CLICK,popupClick);
			_popup.x = 567;
			_popup.y = 390;
			
			
		}
		
		private function popupClick(e:MouseEvent):void
		{
			_mainPage.childPage.alpha = 0.5;
			_mainPage.addChild(_popup);
			_popup.btnClose.addEventListener(MouseEvent.CLICK,popupCloseClick);
			
		}
		
		private function popupCloseClick(e:MouseEvent):void
		{
			
			_mainPage.removeChild(_popup);
			_mainPage.childPage.alpha = 1;
			
		}
		

		

		

	}
	
}
