

package page
{
	import widget.*;
	import image.Image;
	import flash.display.*;
	import event.DragCompleteEvent;
	import flash.events.MouseEvent;
	import widget.*;
	import com.sina.microblog.events.*;	
	import flash.net.URLRequest;	
	import com.adobe.images.JPGEncoder;	
	import flash.utils.*;	
	
	
	import flash.events.Event;
	import event.ImageLoadEvent;
	import com.greensock.TweenLite;
	import com.greensock.easing.*;	
	public class SelectedPageThree extends BaseSelectedPage {
		private var _friendsPanel:PopupFriendsPanel
		private var _friendsSelectedPanel:FriendsSelectedPanel;
		var _resultItem:ResultItem;
		//
		private var _bmd:BitmapData;		
		//

	
		
		var _comments:Array = [
			"咱们一起勇敢爱吧~想知道谁是你命中注定最不应该错过的人么？ ",
			"咱们一起勇敢爱吧~想知道谁是你命中注定最不应该错过的人么 ？",
			"咱们一起勇敢爱吧~想知道谁是你命中注定最不应该错过的人么？  ",
			"咱们一起勇敢爱吧~想知道谁是你命中注定最不应该错过的人么  ？",
			"咱们一起勇敢爱吧~想知道谁是你命中注定最不应该错过的人么？   ",
			"咱们一起勇敢爱吧~想知道谁是你命中注定最不应该错过的人么   ？"
			]
		var _precomment:String = "曾经有多少次机会放在我们面前，但没有珍惜，现在我终于可以"; 
		var _comment:String = "，告诉你，“replaced“\r\n 请猛击http://1.idotashishui.sinaapp.com/index.html";		
		var _comment1:String = "，告诉你，“replaced“ 请猛击http://1.idotashishui.sinaapp.com/index.html";		

		
		public function SelectedPageThree(mainPage:MainPage,pageNo:int) {
			// constructor code
			trace("===three===SelectedPageThree=======");
			super(mainPage,pageNo);
		}
		
		override public function initComponents():void
		{
			

			_mainPage.childPage = _mainPage.page3;
			//

			

			_resultItem = new ResultItem(_mainPage.profile.avatar_large,_mainPage.selectedImage.friendData.avatar_large);
			_resultItem.addEventListener(ImageLoadEvent.IMAGE_LOAD_EVENT,itemLoadComplete);
			_resultItem.x = 200;
			_resultItem.y = 220;
			_mainPage.childPage.addChild(_resultItem);
			

			//
			_mainPage.childPage.gotoweibo.addEventListener(MouseEvent.CLICK,distributeClick);
			_mainPage.childPage.weibotext.text=(_precomment+"@" + _mainPage.selectedImage.friendData.screen_name + this._comment1.replace("replaced",_comments[_mainPage.resultNumber-1]));;
		
		}

		private function itemLoadComplete(e:ImageLoadEvent):void
		{
			
			trace("itemLoadComplete");
			
			
		}		
		
		
		//get friends
		public function distributeClick(e:MouseEvent):void
		{
			trace("===three===distributeClick=======");
			var obj = new Object  ;

			obj.status  =(_precomment+"@" + _mainPage.selectedImage.friendData.screen_name + this._comment.replace("replaced",_comments[_mainPage.resultNumber-1]));

			trace("obj.status:"+obj.status);
			var coder:JPGEncoder = new JPGEncoder(100);
			trace("===three===distributeClick=====1==",_resultItem.width,_resultItem.height);
			_bmd = new BitmapData(_resultItem.width,_resultItem.height);
			_bmd.draw(_resultItem);

			var ary:ByteArray = coder.encode(_bmd);

			obj.pic = ary;
			

			
		
			_mainPage.mb.addEventListener("distributeResultEvent", onDistributeResult);
			_mainPage.mb.addEventListener("distributeErrorEvent", onDistributeError);
			//_mainPage.mb.callWeiboAPI("2/statuses/update",obj, "POST", "distributeResultEvent", "distributeErrorEvent");
			_mainPage.mb.updateStatus(obj.status,obj.pic);
			


 			var url:URLRequest = new URLRequest("http://weibo.com/u/"+_mainPage.uid);  
			trace("=====three=================","http://weibo.com/u/"+_mainPage.uid);
			//var url:URLRequest = new URLRequest("http://weibo.com/u/2108175657");  
			flash.net.navigateToURL(url,"_self");
		}


		private function onDistributeResult(e:MicroBlogEvent):void
		{

			trace("distribute ok")
			

		}
		private function onDistributeError(e:MicroBlogErrorEvent):void
		{
			trace("distribute error");

		}
		
		public function focus():void
		{
			
			
			trace("===two===focus=======");
			var obj = new Object  ;
			//obj.uid  = "1404376560";
			obj.screen_name  = "三个傻瓜来贺岁";
			trace("focus");
			_mainPage.mb.addEventListener("focusResultEvent", onFocusResult);
			_mainPage.mb.addEventListener("focusErrorEvent", onFocusError);
			_mainPage.mb.callWeiboAPI("2/friendships/create",obj, "POST", "focusResultEvent", "focusErrorEvent");

			
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

			
		private  function dragComplete(e:DragCompleteEvent):void
		{


			_friendsSelectedPanel.dragHandler(e.dragItem);
				
			
		}	

		

	}
	
}
