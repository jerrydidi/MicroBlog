
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
		
		private var _distributPanel:DistributePanel;
		//
		private var _bmd:BitmapData;				

		
		public function SelectedPageThree(mainPage:MainPage,pageNo:int) {
			// constructor code
			super(mainPage,pageNo);
			_mb = mainPage.mb;
			
		}
		
		override public function initComponents():void
		{
			_mainPage.childPage = _mainPage.page3;
			_distributPanel = new DistributePanel();
			_distributPanel.x = 408;
			_distributPanel.y = 370;
			_mainPage.addChild(_distributPanel);
			_distributPanel.addEventListener(Event.ENTER_FRAME,pageInit);
		}
		
		private function pageInit(e:Event):void
		{
			//trace("page init")
			if(_distributPanel.btnDistribute)
			{
				_distributPanel.removeEventListener(Event.ENTER_FRAME,pageInit);
				_distributPanel.init(_mainPage.selectedFriends, _mainPage.txtWish);
				_distributPanel.btnDistribute.addEventListener(MouseEvent.CLICK,distribute);



			}
			else
			{
				//trace("no button yet");
				
			}
			
		}

		private function distribute(e:MouseEvent):void
		{
			_distributPanel.nextFrame();
			
		
			//trace("distributeClick");
			var obj = new Object  ;

			obj.status  = _mainPage.txtWish;

			var coder:JPGEncoder = new JPGEncoder(80);

			//var mcContent:MovieClip;
			//mcContent = _result as MovieClip;
			var maxtrix:Matrix = new Matrix();
			maxtrix.translate(249,304);
			_bmd = new BitmapData(443,555);
			_bmd.draw(_distributPanel,maxtrix);
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
