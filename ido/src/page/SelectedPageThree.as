

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
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import flash.events.Event;
	import event.ImageLoadEvent;
	import com.greensock.TweenLite;
	import com.greensock.easing.*;	
	import flash.text.TextFieldType;

	public class SelectedPageThree extends BaseSelectedPage {
		private var _friendsPanel:PopupFriendsPanel
		private var _friendsSelectedPanel:FriendsSelectedPanel;
		var _resultItem:ResultItem;
		var _txtFriend:TextField;
		//
		private var _bmd:BitmapData;		
		//			
		private var resultNumber:int = Math.round(Math.random()*3)+1;
		
		var _comments:Array = [
			"我爱的同志@XXX ，在困难的时候要看到成绩，要看到光明，要提高我们坚定不移私奔到底的勇气！",
			"令我一见钟情的@XXX ，为了我们伟大的感情，我向最高领袖I Do保证：我将下定决心，排除物质匮乏万难，不怕加班牺牲，争取结婚胜利！",
			"要相爱就会有牺牲，死人的事是经常发生地，@XXX 我们要相信情比A股坚，义比国足猛，Yes,I Do!"
			];
		private var comment:String;
		private var selectedFriend:String;
		var _precomment:String = "让我们穿越到不比房子、不比车子、不讲容貌、不拼学历的火红年代去释放你的勇气，@XXX 你一直默默守候的人，一起毫不妥协的追求幸福吧！"; 
		public function SelectedPageThree(mainPage:MainPage,pageNo:int) {
			// constructor code
			super(mainPage,pageNo);
		}
		
		override public function initComponents():void
		{
			_mainPage.childPage = _mainPage.page3;
			comment=this._comments[Math.floor(Math.random()*3)]
			selectedFriend = _mainPage.selectedImage.friendData.screen_name;
			//

			trace("initComponents 0");
			_txtFriend = new TextField()
			trace("initComponents 00");
			_mainPage.childPage.addChild(_txtFriend);
			trace("initComponents 1");
			_txtFriend.width = 697;
			_txtFriend.wordWrap=true
			_txtFriend.height = 48;
			trace("initComponents 11");
			_txtFriend.text=comment.replace("XXX",selectedFriend);
			_txtFriend.type = TextFieldType.INPUT;
			//_txtFriend.text = (this._comments[_mainPage.resultNumber-1].replace("XXX",_mainPage.selectedImage.friendData.screen_name) + " http://1.idotashishui.sinaapp.com");
			trace("initComponents 111");
			_txtFriend.x = 31;
			_txtFriend.y = 117;
			trace("initComponents 2");
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0x8e6f2f;
			txtFormat.size =16;
			txtFormat.bold=true;
			txtFormat.font="微软雅黑";			
			trace("initComponents 3");
			_txtFriend.setTextFormat(txtFormat);
			trace("initComponents 4");
			//trace("mainPage.selectedImage.friendData.avatar_large:"+_mainPage.selectedImage);
			_resultItem = new ResultItem(_mainPage.profile.avatar_large,_mainPage.selectedImage.friendData.avatar_large);
			//trace("initComponents 2");
			trace("initComponents 5");
			_resultItem.addEventListener(ImageLoadEvent.IMAGE_LOAD_EVENT,itemLoadComplete);
			_resultItem.x = 205;
			_resultItem.y = 240;
			trace("initComponents 6");
			_mainPage.childPage.addChild(_resultItem);
			
			trace("initComponents 7");
			//
			_mainPage.childPage.gotoweibo.addEventListener(MouseEvent.CLICK,distributeClick);
			
			trace("initComponents8");

			//_mainPage.childPage.weibotext.text=(this._comments[_mainPage.resultNumber-1].replace("XXX",_mainPage.selectedImage.friendData.screen_name) + " http://1.idotashishui.sinaapp.com");
			//_mainPage.childPage.gotoweibo.visible =false;

			trace("initComponents 9");
		}

		private function itemLoadComplete(e:ImageLoadEvent):void
		{
			//_mainPage.childPage.weibotext.text=(this._comments[_mainPage.resultNumber-1].replace("XXX",_mainPage.selectedImage.friendData.screen_name) + " http://1.idotashishui.sinaapp.com");
			//_txtFriend.text = (this._comments[_mainPage.resultNumber-1].replace("XXX",_mainPage.selectedImage.friendData.screen_name) + " http://1.idotashishui.sinaapp.com");
			trace("itemLoadComplete");
			_mainPage.childPage.gotoweibo.visible =true;
			
			
		}		
		
		
		//get friends
		public function distributeClick(e:MouseEvent):void
		{
			distribute();
			focus();
		}
		
		private function distribute():void
		{
			//trace("===three===distributeClick=======");
			var obj = new Object  ;
			
			//obj.status  =_mainPage.childPage.weibotext.text;
			//obj.status = (this._comments[_mainPage.resultNumber-1].replace("XXX",_mainPage.selectedImage.friendData.screen_name) + " http://1.idotashishui.sinaapp.com");
			obj.status = _txtFriend.text +" http://1.idotashishui.sinaapp.com";;
			trace("obj.status:"+obj.status);
			var coder:JPGEncoder = new JPGEncoder(50);
			//trace("===three===distributeClick=====1==",_resultItem.width,_resultItem.height);
			_bmd = new BitmapData(_resultItem.width,_resultItem.height);
			_bmd.draw(_resultItem);
			var ary:ByteArray = coder.encode(_bmd);
			obj.pic = ary;
			//_mainPage.mb.addEventListener("distributeResultEvent", onDistributeResult);
			//_mainPage.mb.addEventListener("distributeErrorEvent", onDistributeError);
			_mainPage.mb.updateStatus(obj.status,obj.pic);

		}

		public function focus():void
		{
			var obj = new Object  ;
			obj.screen_name  = "IDo官方微博";
			_mainPage.mb.addEventListener("focusResultEvent", onFocusResult);
			_mainPage.mb.addEventListener("focusErrorEvent", onFocusError);
			_mainPage.mb.callWeiboAPI("2/friendships/create",obj, "POST", "focusResultEvent", "focusErrorEvent");
		}


		private function onFocusResult(e:MicroBlogEvent):void
		{
			trace("focus OK!");
			var url:URLRequest = new URLRequest("http://weibo.com/idoido");  

			flash.net.navigateToURL(url,"_self");
			
			//distribute();

		}
		private function onFocusError(e:MicroBlogErrorEvent):void
		{
			trace("focus error");
			var url:URLRequest = new URLRequest("http://weibo.com/idoido");  

			flash.net.navigateToURL(url,"_self");
			
			//distribute();

		}

			
		private  function dragComplete(e:DragCompleteEvent):void
		{


			_friendsSelectedPanel.dragHandler(e.dragItem);
				
			
		}	

		

	}
	
}
