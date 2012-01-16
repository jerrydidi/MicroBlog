
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
		//
		private var _checked:Boolean = false;

		private var _txtContent = "#超时空救兵#你带着他们成功穿越到唐朝，@XXXX 成为了满身尿不湿味道的大湿人，@YYYY 成为了美丽冻人不穿秋裤的林芝郡主、@ZZZZ 则成为了清蒸味美油焖不腻的唐朝大虾。他们再也不用为买船票发愁了。赶紧带着你的好友一起穿越到唐朝吧。";

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
				//randomNum
				var txt:String;
				txt = _txtContent.replace("XXXX",_mainPage.selectedFriends[0].screen_name);
				txt = txt.replace("YYYY",_mainPage.selectedFriends[1].screen_name);
				txt = txt.replace("ZZZZ",_mainPage.selectedFriends[2].screen_name);
				_mainPage.txtWish = txt + " http://weibo.com/u/2488135937";
				_distributPanel.init(_mainPage.selectedFriends, txt);
				_distributPanel.btnDistribute.addEventListener(MouseEvent.CLICK,distribute);
				_distributPanel.check.addEventListener(MouseEvent.CLICK,checkClick);
				(_distributPanel.check as MovieClip).buttonMode = true;
				
				



			}
			else
			{
				//trace("no button yet");
				
			}
			
		}
		
	    private function checkClick(e:MouseEvent):void
		{
			_checked = !_checked;
			if(_checked)
			{
				_distributPanel.check.gotoAndStop(2);
			}
			else
			{
				_distributPanel.check.gotoAndStop(1);
				
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
			if(_checked)
				focus();
			var url:URLRequest = new URLRequest("http://weibo.com/u/2488135937");  

			flash.net.navigateToURL(url,"_self");
			
			 

			

			
		}
		


		public function focus():void
		{
			var obj = new Object  ;
			obj.screen_name  = "超时空救兵";
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
