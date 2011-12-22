

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
	import com.core.microBlogs.qq.QQWeiboAPI;
	import com.core.microBlogs.qq.api.friends.DoFriends;
	import com.core.microBlogs.qq.api.broadcast.DoBroadcast;
	
	import flash.net.FileReference;
	public class SelectedPageTwo extends BaseSelectedPage {

		var _resultItem:ResultItem;
		//
		private var _bmd:BitmapData;		
		//
		private var _format:String = "json";
		//
		private var _QQWeibo:QQWeiboAPI = new QQWeiboAPI(dataHandler, errorHandler);
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
			_popup.btnClose.addEventListener(MouseEvent.CLICK,btnCloseClick);
			
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
		private function focusClick(e:MouseEvent):void
		{
			addIdol();			
		}
		
		private function btnCloseClick(e:MouseEvent):void
		{
			removePopup();
		}
		
		//get friends
		private function distributeClick(e:MouseEvent):void
		{
			
			uploadPic();
			//popupWindow();
		}
		
		private function uploadPic():void
		{
			var obj = new Object  ;
			obj.status  = ("@" +_mainPage.selectedFriends[0].friendData.name + this._comment.replace("replaced",_comments[_mainPage.resultNumber-1]));
			//trace("obj.status:"+obj.status);
			var coder:JPGEncoder = new JPGEncoder(100);
			// var tmpRect:Rectangle = _imageResult.getRect(_imageResult);
			_bmd = new BitmapData(_resultItem.width,_resultItem.height);
			_bmd.draw(_resultItem);
			var ary:ByteArray ;
			//ary = _bmd.getPixels(tmpRect);
			var ary:ByteArray = coder.encode(_bmd);
			//var _file:FileReference = new FileReference();
			//_file.save(ary,"test.jpg");
			var picURL:String = "http://www.riasun.com/microblog/qq/images/pic0"+ _mainPage.resultNumber.toString()+".jpg";
			//_QQWeibo.addPic(obj.status, ip, null, null,"images/pic01.jpg");
			var ip:String = "localhost";
			_QQWeibo.addPicURL(obj.status, ip,picURL, null, null,"json");
			
		}
		
		private function addIdol():void
		{
			
			var idolID:String = _mainPage.selectedFriends[0].friendData.tweet[0].id

			_QQWeibo.addIdol(idolID,_format);
		}
		
		//
		private function dataHandler(cmd:String, paras:Object):void{

			trace("cmd:"+cmd);
			switch(cmd)
			{
				case DoBroadcast.CMD_ADD_PIC_URL:
				{
					popupWindow();
					break;
				}
				case DoFriends.CMD_FRIENDS_ADD :
				{
					removePopup();
					break;
				}
				default:
				{
					break;
				}
			}
		}
		private function errorHandler(params:Object):void
		{
			trace("selected page two http response error:", params.data);
		}

		
	}
	
}
