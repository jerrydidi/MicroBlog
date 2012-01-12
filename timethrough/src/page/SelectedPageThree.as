
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
		

		
		public function SelectedPageThree(mainPage:MainPage,pageNo:int) {
			// constructor code
			super(mainPage,pageNo);
			_mb = mainPage.mb;
			
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
		}
		

	}
	
}
