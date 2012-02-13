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

	public class SelectedPageSeven extends BaseSelectedPage {

		 var yy,mm,dd:int;

		private var _mb:MicroBlog;
		private var _friendPanel:FriendsPanel;
				//
		private var _bmd:BitmapData;		
		//
		private var answer:int = -1;
		
		private var txtContend:String ="通过#嫁人时钟#测试@XXXX 将于 yy年mm月dd日正式出嫁，姐再也不是斗战剩佛了！特此分享给我的好友（FFFF） http://1.merryaman.sinaapp.com";
				//
		public function SelectedPageSeven(mainPage:MainPage,pageNo:int) {
			// constructor code
			super(mainPage,pageNo);
			_mb = mainPage.mb;
		}
		
		override public function initComponents():void
		{	
			_mainPage.childPage = _mainPage.page7;
			_friendPanel = new FriendsPanel();
			_mainPage.childPage.addChild(_friendPanel);
			_friendPanel.init(_mainPage.friends);
			_friendPanel.addEventListener(ThumbChangeEvent.Thumb_Change_Event,thumbChange);
			
			
			_mainPage.childPage.btnDistribute.addEventListener(MouseEvent.CLICK, doDistribute);
			 _mainPage.childPage.txt.wordWrap = true;

			 yy = 2011 + Math.round(Math.random()*10);
			 mm = Math.round(Math.random()*12);
			 dd = Math.round(Math.random()*31);

			setText();
						
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

			 var tmpString:String;
			 tmpString = txtContend.replace("FFFF",friendNickName);
			 tmpString = tmpString.replace("XXXX",_mainPage._profile.screen_name);
			 tmpString = tmpString.replace("yy",yy.toString());
			 tmpString = tmpString.replace("mm",mm.toString());
			 tmpString = tmpString.replace("dd",dd.toString());
			 _mainPage.childPage.txt.text = tmpString;
			
		}

		private function ditribute():void
		{
			
			var obj = new Object  ;
			

			obj.status  = _mainPage.childPage.txt.text;

			var coder:JPGEncoder = new JPGEncoder(80);

			_bmd = new BitmapData(_mainPage.childPage.image.width,_mainPage.childPage.image.height);
			_bmd.draw(_mainPage.childPage.image);
			var ary:ByteArray = coder.encode(_bmd);

			obj.pic = ary;
			_mainPage.mb.updateStatus(obj.status,obj.pic);

			

			
		}

		

	}
}
