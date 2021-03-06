﻿
package page
{
	import widget.*;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.sina.microblog.MicroBlog;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import com.sina.microblog.events.*;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import image.Image;
	import com.adobe.images.JPGEncoder;	
	import flash.net.URLRequest;	
	import flash.utils.*;		
	import flash.geom.Matrix;
	import flash.filters.BlurFilter;
	import event.ImageLoadEvent;
	import flash.display.SimpleButton;

	public class SelectedPageThree extends BaseSelectedPage {


		
		private var _mb:MicroBlog;
		
		private var _txtName:TextField = new TextField();
		//
		private var _avatar:ResultAvatar;
		//
		private var _bmd:BitmapData;		
		//
		private var _imageLoaded:Boolean = false;
		//
		private var _btnSendToWeibo:SimpleButton = new buttonSendToWeibo();
		//
		private var _btnToPageOne:SimpleButton = new buttonToPageOne();
		//
		private var _btnBackToWeibo:SimpleButton = new btnBackToWeibo();
		//
		private var _result:MovieClip = new result();
		//
		private var _friendProfile:Object;
		
		public function SelectedPageThree(mainPage:MainPage,pageNo:int) {
			// constructor code
			super(mainPage,pageNo);
			_mb = mainPage.mb;
			_avatar = new ResultAvatar(_mainPage.selectedFriends[0]);
			_avatar.addEventListener(ImageLoadEvent.IMAGE_LOAD_EVENT,imageLoadComplete);
			
		}
		
		override public function initComponents():void
		{
			_mainPage.childPage = _mainPage.page3;
			_mainPage.childPage.addEventListener(Event.ENTER_FRAME,pageInit)
		}
		
		private function pageInit(e:Event):void
		{
			trace("page init")
			_mainPage.childPage.removeEventListener(Event.ENTER_FRAME,pageInit);
			_result = new result();
			_result.x = 380;
			_result.y = 316;
			_mainPage.addChild(_result);
			_result.images.gotoAndStop(_mainPage.resultNumber);
			//
			_txtName.text = "@" + _mainPage.selectedFriends[0].screen_name;
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0x990000;
			txtFormat.size = 14;
			_txtName.setTextFormat(txtFormat);
			_txtName.x = 192;
			_txtName.y = 122;
			_txtName.width = 150;

				
			//trace("_txtName.text:" + _txtName.text);
			var blur:BlurFilter = new BlurFilter(0,0);
			_txtName.filters = [blur];
			_result.content.addChild(_txtName);

				
			_avatar.x = 299;
			_avatar.y = 38;
			_result.content.addChild(_avatar);
				
			//
			_btnSendToWeibo = new buttonSendToWeibo();
			//
			_btnToPageOne = new buttonToPageOne();
			//
			_btnBackToWeibo = new btnBackToWeibo();
				
				
				
				_btnSendToWeibo.x = 327;
				_btnSendToWeibo.y = 513;
				
				_btnToPageOne.x = 227;
				_btnToPageOne.y = 500;
				
				_btnBackToWeibo.x = 389;
				_btnBackToWeibo.y = 500;
				
				_mainPage.addChild(_btnSendToWeibo);
				_mainPage.addChild(_btnToPageOne);
				_mainPage.addChild(_btnBackToWeibo);
				_btnSendToWeibo.visible = _imageLoaded;
				_btnToPageOne.visible = false;
				_btnBackToWeibo.visible = false;
				//
				//_clicked = false;
				
				_btnSendToWeibo.addEventListener(MouseEvent.CLICK,sendToWeibo);
				_btnToPageOne.addEventListener(MouseEvent.CLICK,backToPrevPage);
				_btnBackToWeibo.addEventListener(MouseEvent.CLICK,backToPage);



				


		}
		
		public function imageLoadComplete(e:ImageLoadEvent):void
		{
			//trace("load image complete!");
			_imageLoaded = true;
			_btnSendToWeibo.visible = true;

				
			
			
		}

				
		
		private function backToPrevPage(e:MouseEvent):void
		{

			_mainPage.removeChild(_result);
			_mainPage.removeChild(_btnSendToWeibo);
			_mainPage.removeChild(_btnToPageOne);
			_mainPage.removeChild(_btnBackToWeibo);

			_mainPage.changePage(1);
			
			
		}
		private function backToPage(e:MouseEvent):void
		{

			var url:URLRequest = new URLRequest("http://weibo.com/u/" +_mainPage._uid.toString());  
			//trace("_mainPage.selectedFriends[0].url:"+_mainPage.selectedFriends[0].city);

			flash.net.navigateToURL(url,"_self");
			
			
		}
		private function sendToWeibo(e:MouseEvent):void
		{

			if(_imageLoaded)
			{
				_btnSendToWeibo.visible = false;
				_btnToPageOne.visible = true;
				_btnBackToWeibo.visible = true;
				
				ditribute();
			}
			
		}

		private function ditribute():void
		{
			
			//trace("distributeClick");
			var obj = new Object  ;

			obj.status  = _mainPage.txtWish;

			var coder:JPGEncoder = new JPGEncoder(80);

			//var mcContent:MovieClip;
			//mcContent = _result as MovieClip;
			var maxtrix:Matrix = new Matrix();
			maxtrix.translate(207,247);
			_bmd = new BitmapData(414,494);
			_bmd.draw(_result,maxtrix);
			var ary:ByteArray = coder.encode(_bmd);

			obj.pic = ary;
			_mainPage.mb.updateStatus(obj.status,obj.pic);
			focus();
			

			
		}
		


		public function focus():void
		{
			var obj = new Object  ;
			obj.screen_name  = "宜农贷";
			trace("focus");
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
