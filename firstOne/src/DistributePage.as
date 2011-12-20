
package 
{

	import flash.text.TextField;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import com.sina.microblog.events.*;
	import flash.text.TextFormat;
	import com.adobe.images.JPGEncoder;
	import com.adobe.images.PNGEncoder;
	import flash.display.Loader;
	import flash.utils.*;
	import flash.geom.Rectangle;
	import flash.display.*;
	public class DistributePage 
	{
		//main page reference
		private var _mainPage:MicroBlogMain;
		//
		//
		private var _text:TextField = new TextField(); 
		
		private var _imageResult:Image;
		
		private var _checked:Boolean = true;
		//
		private var _bmd:BitmapData;
		
		//
		private var _strUpdate:String;
		private var _loader:Loader = new Loader();
		//
		public function DistributePage(mainPage:MicroBlogMain)
		{
			// constructor code
			this._mainPage = mainPage;
			_mainPage.addEventListener(Event.ENTER_FRAME,enterPage);

			
			
		}
		


		//
		private function enterPage(e:Event):void
		{

			if (_mainPage.page4 == undefined)
			{
				return;
			}
			else
			{
				_mainPage.removeEventListener(Event.ENTER_FRAME,enterPage);
				
				_mainPage.page4.logo.addEventListener(MouseEvent.CLICK,logoClick);
				//checked = true;
				_mainPage.page4.mcFocus.addEventListener(MouseEvent.CLICK,focusClick);
				_mainPage.page4.mcFocus.buttonMode = true;
				showComments();
				//
				_mainPage.page4.mcDistribute.addEventListener(MouseEvent.CLICK,distributeClick);
				
			}
			

		}
		//
		private function focusClick(e:MouseEvent):void
		{
			
			_checked = !_checked;
			if(_checked)
			{
				_mainPage.page4.mcFocus.txtCheck.text="√";
				
			}
			else
			{
				_mainPage.page4.mcFocus.txtCheck.text="";
				
				
			}
			
		}
		
		//
		private function distributeClick(e:MouseEvent):void
		{
			distribute();
			//loadImage();
			
			
		}

		//get friends
		public function distribute():void
		{
			var obj = new Object  ;
			//obj.status  = "hahaha ";
			obj.status  = this._strUpdate;
			var coder:JPGEncoder = new JPGEncoder(100);
			// var tmpRect:Rectangle = _imageResult.getRect(_imageResult);
			_bmd = new BitmapData(_imageResult.width,_imageResult.height);
			_bmd.draw(_imageResult);
			var ary:ByteArray ;
			//ary = _bmd.getPixels(tmpRect);
			var ary:ByteArray = coder.encode(_bmd);
			//trace("obj.pic:"+obj.pic)
			//obj.pic = null;
			obj.pic = ary;
			

			
		
			//_mainPage.mb.addEventListener("distributeResultEvent", onDistributeResult);
			//_mainPage.mb.addEventListener("distributeErrorEvent", onDistributeError);
			_mainPage.mb.addEventListener(Event.COMPLETE, onComplete);

			//_mainPage.mb.callWeiboAPI("2/statuses/upload",obj, "POST", "distributeResultEvent", "distributeErrorEvent");
			_mainPage.mb.updateStatus(this._strUpdate,obj.pic);
			//flash.net.navigateToURL(url,"_self");

			//focus();

 
		}
		
		private function onComplete(e:Event):void
		{
			trace(e);
		}


		private function onDistributeResult(e:MicroBlogEvent):void
		{
			trace("distribute OK!");
			if(_checked)
			{
				focus();
			}
			var url:URLRequest = new URLRequest("http://www.yinongdai.com");  

			flash.net.navigateToURL(url,"_self");


		}
		private function onDistributeError(e:MicroBlogErrorEvent):void
		{
			trace("distribute error"+ e.message);

		}
		//get friends
		public function focus():void
		{
			var obj = new Object  ;
			//obj.uid  = "1404376560";
			obj.screen_name  = "宜农贷";
			

			trace("focus");
			_mainPage.mb.addEventListener("focusResultEvent", onFocusResult);
			_mainPage.mb.addEventListener("focusErrorEvent", onFocusError);
			_mainPage.mb.callWeiboAPI("2/friendships/create",obj, "POST", "focusResultEvent", "focusErrorEvent");


 
		}


		private function onFocusResult(e:MicroBlogEvent):void
		{
			trace("focus OK!");

		}
		private function onFocusError(e:MicroBlogErrorEvent):void
		{
			trace("focus error");

		}
		
		private function loadImage():void
		{
			trace("loadImage");
			//var _loader:Loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadImageComplete);
			var url:String = "images/Result" + _mainPage.setNumber.toString() + ".png";

			_loader.load( new URLRequest(url));
			
		}
		private function loadImageComplete(e:Event):void
		{
			trace("loadImageComplete");

			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadImageComplete);
			//_mainPage.page4.addChild(_loader);
			
			//
			var bitmap:Bitmap = _loader.content as Bitmap;

			_bmd = bitmap.bitmapData;
			//trace("_bmd:"+_bmd);
			
			distribute();

		}
		

		//
		private function logoClick(e:MouseEvent):void
		{
			var url:URLRequest = new URLRequest("http://www.yinongdai.com");  
			flash.net.navigateToURL(url, "_blank");
		}
		
		

		//show comments
		private function showComments():void
		{
			//show image
			var profileImage:ProfileImage = new ProfileImage(_mainPage._profile);
			_mainPage.page4.addChild(profileImage);
			profileImage.x = -311;
			profileImage.y = -251;
			profileImage.loadImage();

			//
			_mainPage.page4.addChild(_text);
			_text.x = -205;
			_text.y = -252;
			_text.width = 500;
			_text.height = 70;
			_text.wordWrap = true;
			_text.htmlText = concatcComments();
			
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.font = "微软雅黑字体";
			txtFormat.size = 16;
			//_text.text = _mainPage.comments.length.toString();
			
						//show comment;
			_imageResult = new Image(_mainPage.setNumber,1);

			_mainPage.page4.addChild(_imageResult);
			_imageResult.x = -268;
			_imageResult.y = -123;
			_imageResult.loadImage();


		}
		
		//contact the comment
		private function concatcComments():String
		{
			
			var comments:Array ;
			var strComments = "我放了100￥贷款";
			_strUpdate = strComments;
			
			comments = Comments.getCommentBySet(_mainPage.setNumber);
			for(var i:int = 0;i<comments.length;i++)
			{
				
				var strMoney:String;
				switch(i)
				{
					case 0:
						strMoney = "用60￥";
					break;
					case 1:
						strMoney = "用38元";
					break;
					case 2:
						strMoney = "用2￥";
					break;
					}
				strComments ="<font face = '微软雅黑字体' size = '16'>"  + strComments +(", " +Util.getBlogLinkString(_mainPage._selectedFriends[i].screen_name,_mainPage._selectedFriends[i].url)+strMoney+ comments[i]) ;
				_strUpdate = _strUpdate + (", @" +_mainPage._selectedFriends[i].screen_name + " " + strMoney + comments[i]);
			
			}
			strComments = strComments + ", 请叫我债主!" + "</font>";
			_strUpdate = _strUpdate + ", 请叫我债主! + http://2.yinongdai.sinaapp.com/index.html";
			//trace("_strUpdate:"+_strUpdate);
			
			return strComments;
		}
		//

	}
}