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

	public class SelectedPageThree extends BaseSelectedPage {


		
		private var _mb:MicroBlog;
		
		private var _txtName:TextField = new TextField();
		private var _image:Image;
		//
		private var _bmd:BitmapData;		
		
		public function SelectedPageThree(mainPage:MainPage,pageNo:int) {
			// constructor code
			super(mainPage,pageNo);
			_mb = mainPage.mb;
			_image = new Image(_mainPage.selectedFriends[0].avatar_large,55);
		}
		
		override public function initComponents():void
		{
			_mainPage.childPage = _mainPage.page3;
			_mainPage.childPage.addEventListener(Event.ENTER_FRAME,pageInit)
		

			
			//
			
		}
		
		private function pageInit(e:Event):void
		{
			if(_mainPage.childPage.mcToPageFive)
			{
				_mainPage.childPage.removeEventListener(Event.ENTER_FRAME,pageInit);
				_mainPage.childPage.mcToPageFive.addEventListener(MouseEvent.CLICK,sendToWeibo);
				_mainPage.childPage.images.gotoAndStop(_mainPage.resultNumber);
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
				_mainPage.childPage.content.addChild(_txtName);
				//
				_image.loadImage();
				_image.x = 299;
				_image.y =38;
				_mainPage.childPage.content.addChild(_image);
				
				

				
			}
			else
			{
				trace("no page to 4")
				
			}
		}
		
		private function sendToWeibo(e:MouseEvent):void
		{

			ditribute();
			
		}

		private function ditribute():void
		{
			
			//trace("distributeClick");
			var obj = new Object  ;

			obj.status  = _mainPage.txtWish;

			var coder:JPGEncoder = new JPGEncoder(100);

			var mcContent:MovieClip;
			mcContent = _mainPage.childPage as MovieClip;
			var maxtrix:Matrix = new Matrix();
			maxtrix.translate(207,247);
			_bmd = new BitmapData(414,494);
			_bmd.draw(mcContent,maxtrix);
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
			
			var url:URLRequest = new URLRequest("http://www.yinongdai.com");  

			flash.net.navigateToURL(url,"_self");
			

		}
		private function onFocusError(e:MicroBlogErrorEvent):void
		{
			trace("focus error");
			
			var url:URLRequest = new URLRequest("http://www.yinongdai.com");  

			flash.net.navigateToURL(url,"_self");

		}

		


		

	}
	
}
