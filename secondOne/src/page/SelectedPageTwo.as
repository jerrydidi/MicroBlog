

package page
{
	import widget.*;
	import flash.display.*;
	import event.DragCompleteEvent;
	import flash.events.MouseEvent;
	import widget.*;
	import com.sina.microblog.events.*;	
	import flash.net.URLRequest;	
	import com.adobe.images.JPGEncoder;	
	import flash.utils.*;	
	public class SelectedPageTwo extends BaseSelectedPage {

		var _resultItem:ResultItem;
		//
		private var _bmd:BitmapData;		
		//
		var _popup:MovieClip = new popup();
		
		var _comments:Array = [
			"害怕明天，怎么能过好今天？",
			"让激情转变成职业，然后工作就会变成游戏",
			"只需要一点点勇气，就可以让人生逆转。",
			"死记硬背也许能让你通过大学4年，但会毁掉你接下来的40年。", 	
			"让激情转变成职业，然后工作就会变成游戏",			
			"心很脆弱，你得学会去哄它。不管遇到多大困难，告诉你的心：一切安好。"


							  
							  ]
		var _comment:String = "对我说：“replaced。“\r\n我把这句话与大家共勉！http://1.secondone.sinaapp.com/index.html";
		
		
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
			_mainPage.childPage.btnPopup.addEventListener(MouseEvent.CLICK,distributeClick);
			_popup.x = 567;
			_popup.y = 390;
			
		
		}
		
		private function popupWindow():void
		{
			_mainPage.childPage.alpha = 0.5;
			_mainPage.addChild(_popup);
			_popup.mcFocus.addEventListener(MouseEvent.CLICK,focusClick);

			
		}
		
		private function popupCloseClick(e:MouseEvent):void
		{
			
			removePopup();
		}
		
		private function removePopup():void
		{
			_mainPage.removeChild(_popup);
			_mainPage.childPage.alpha = 1;
			
		}
		
		
		//get friends
		public function distributeClick(e:MouseEvent):void
		{
			var obj = new Object  ;

			obj.status  =("@" + _mainPage.selectedFriends[0].friendData.screen_name + "  " +this._comment.replace("replaced",_comments[_mainPage.resultNumber-1]));

			trace("obj.status:"+obj.status);
			var coder:JPGEncoder = new JPGEncoder(100);
			// var tmpRect:Rectangle = _imageResult.getRect(_imageResult);
			_bmd = new BitmapData(_resultItem.width,_resultItem.height);
			_bmd.draw(_resultItem);
			var ary:ByteArray ;
			//ary = _bmd.getPixels(tmpRect);
			var ary:ByteArray = coder.encode(_bmd);

			obj.pic = ary;
			

			
		
			_mainPage.mb.addEventListener("distributeResultEvent", onDistributeResult);
			_mainPage.mb.addEventListener("distributeErrorEvent", onDistributeError);
			//_mainPage.mb.callWeiboAPI("2/statuses/update",obj, "POST", "distributeResultEvent", "distributeErrorEvent");
			_mainPage.mb.updateStatus(obj.status,obj.pic);
			popupWindow();

			//focus();

 
		}


		private function onDistributeResult(e:MicroBlogEvent):void
		{

			trace("distribute ok")
			popupWindow();

		}
		private function onDistributeError(e:MicroBlogErrorEvent):void
		{
			trace("distribute error");

		}
		
		
		
		
		private function focusClick(e:MouseEvent):void
		{
			focus();
		}
		
		
		
		public function focus():void
		{
			var obj = new Object  ;
			//obj.uid  = "1404376560";
			obj.screen_name  = "三个傻瓜来贺岁";
			trace("focus");
			_mainPage.mb.addEventListener("focusResultEvent", onFocusResult);
			_mainPage.mb.addEventListener("focusErrorEvent", onFocusError);
			_mainPage.mb.callWeiboAPI("2/friendships/create",obj, "POST", "focusResultEvent", "focusErrorEvent");

			removePopup();
			var url:URLRequest = new URLRequest("http://weibo.com/u/2108175657");  

			flash.net.navigateToURL(url,"_self");


 
		}


		private function onFocusResult(e:MicroBlogEvent):void
		{
			trace("focus OK!");

		}
		private function onFocusError(e:MicroBlogErrorEvent):void
		{
			trace("focus error");

		}

		

		

	}
	
}
