package page
{
	import widget.*;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.sina.microblog.MicroBlog;
	import flash.display.Bitmap;
	import flash.display.BitmapData;	
	import com.adobe.images.JPGEncoder;		
	import flash.utils.*;			
	import event.ThumbChangeEvent;
	import flash.events.Event;
	import com.sina.microblog.events.*;
	public class SelectedPageTwelve extends BaseSelectedPage {

		 var yy,mm,dd:int;

		private var _mb:MicroBlog;
		private var _friendPanel:FriendsPanel;
				//
		private var _bmd:BitmapData;		
		//
		private var answer:int = -1;
		
		private var _txtNum:String ="还可输入XXXX字";
		
		private var txtContend:String ="通过#嫁人时钟#测试，恭喜@XXXX 将于 yy年mm月dd日正式脱光，我再也不是斗战剩佛了！特此分享给我的好友(FFFF )";
		
		private var _focus:Boolean = true;
				//
		public function SelectedPageTwelve(mainPage:MainPage,pageNo:int) {
			// constructor code
			super(mainPage,pageNo);
			_mb = mainPage.mb;
		}
		
		override public function initComponents():void
		{	
			_mainPage.childPage = _mainPage.page12;
			_friendPanel = new FriendsPanel();
			_mainPage.childPage.addChild(_friendPanel);
			_friendPanel.init(_mainPage.friends);
			_friendPanel.addEventListener(ThumbChangeEvent.Thumb_Change_Event,thumbChange);
			
			
			_mainPage.childPage.btnDistribute.addEventListener(MouseEvent.CLICK, doDistribute);
			 _mainPage.childPage.txt.wordWrap = true;

			 yy = 2012 + Math.round(Math.random()*10);
			 mm = Math.round(Math.random()*12);
			 dd = Math.round(Math.random()*31);
			_mainPage.childPage.txt.addEventListener(Event.CHANGE,txtInputHandler);
			_friendPanel.checkFriendsSeleced();

			setText();
			
			_mainPage.childPage.txt.maxChars = 120;
			_mainPage.childPage.image.visible = false;
			
			_mainPage.childPage.focus.addEventListener(MouseEvent.CLICK,focusHandler);
			
			
			
		}
		private function focusHandler(e:MouseEvent):void
		{
			_focus = ! _focus;
			if(_focus)
			{
				_mainPage.childPage.focus.gotoAndStop(1);
			}
			else
			{
				_mainPage.childPage.focus.gotoAndStop(2);
				
			}
		}
		
		private function txtInputHandler(e:Event):void 
		{
			checkTextNum();
		}
		
		private function checkTextNum():void
		{
			var numRemain:int;
			numRemain = 120 -_mainPage.childPage.txt.text.length;
			_mainPage.childPage.txtNum.text =_txtNum.replace("XXXX",numRemain.toString());
			
		}
		
		private function thumbChange(e:ThumbChangeEvent):void
		{
			_friendPanel.checkFriendsSeleced();
			//trace("thumbChange");
			setText();

		}
		
		private function doDistribute(e:MouseEvent):void
		{
			_friendPanel.checkFriendsSeleced();
			_mainPage.selectedFriends = new Array();
			//setText();
			
			ditribute();
		}
		
		private function setText():void
		{
			var arry:Array = _friendPanel.selectedFriendsArray;
			var friendNickName = "";
			for each(var item:FriendItem in arry)
			{
				_mainPage.selectedFriends.push(item.friendData)
				friendNickName +=("@" + item.friendData.screen_name + " ");
				
			}
			//friendNickName += " @电影嫁个一百分男人";

			 var tmpString:String;
			 tmpString = txtContend.replace("FFFF",friendNickName);
			 tmpString = tmpString.replace("XXXX",_mainPage._profile.screen_name);
			 tmpString = tmpString.replace("yy",yy.toString());
			 tmpString = tmpString.replace("mm",mm.toString());
			 tmpString = tmpString.replace("dd",dd.toString());
			 _mainPage.childPage.txt.text = tmpString;
			 checkTextNum();
			
		}

		private function ditribute():void
		{
			
			var obj = new Object  ;
			

			obj.status  = _mainPage.childPage.txt.text + "  http://1.merryaman.sinaapp.com";

			var coder:JPGEncoder = new JPGEncoder(80);

			_bmd = new BitmapData(_mainPage.childPage.image.width,_mainPage.childPage.image.height);
			_bmd.draw(_mainPage.childPage.image);
			var ary:ByteArray = coder.encode(_bmd);

			obj.pic = ary;
			_mainPage.mb.updateStatus(obj.status,obj.pic);
			if(_focus)
			{
				focus();
			}

			

			
		}

		public function focus():void
		{
			var obj = new Object  ;
			obj.screen_name  = "电影嫁个一百分男人";
			//trace("focus");
			_mainPage.mb.addEventListener("focusResultEvent", onFocusResult);
			_mainPage.mb.addEventListener("focusErrorEvent", onFocusError);
			_mainPage.mb.callWeiboAPI("2/friendships/create",obj, "POST", "focusResultEvent", "focusErrorEvent");
		}

		private function onFocusResult(e:MicroBlogEvent):void
		{
			trace("focus OK!");
			//ditribute();
			
			//var url:URLRequest = new URLRequest("http://www.yinongdai.com");  

			//flash.net.navigateToURL(url,"_self");
			

		}
		private function onFocusError(e:MicroBlogErrorEvent):void
		{
			trace("focus error");
			
			//var url:URLRequest = new URLRequest("http://www.yinongdai.com");  

			//flash.net.navigateToURL(url,"_self");

		}
		

	}
}
