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
	import flash.events.TextEvent;
	import flash.text.TextField;
	import com.greensock.TweenLite;
	import com.greensock.easing.*;	
	

	public class SelectedPageTwo extends BaseSelectedPage {


		
		private var _mb:MicroBlog;
		
		private var _imageSeq:int =0;
		
		private var _imageNum:int = 8;
		private var _count:int = 0;
		private var _selectedPanel:SelectedPanel ;
		
		private var _txtContent = "他们跟着你穿越到唐朝，成功的不用买票啦！@XXXX 成为了唐朝大湿人李白，@YYYY 成为了林芝郡主、@ZZZZ 则成为了唐朝的大虾。";
		
		private var _txtNum:String ="还可输入XXXX字";
		
		private var randomNum:int = Math.floor(Math.random() * 3);

		//
		public function SelectedPageTwo(mainPage:MainPage,pageNo:int) {
			// constructor code
			super(mainPage,pageNo);
			_mb = mainPage.mb;
		}
		
		override public function initComponents():void
		{
			_mainPage.childPage = _mainPage.page2;
			_selectedPanel = new SelectedPanel();
			_mainPage.addChild(_selectedPanel);
			_selectedPanel.addEventListener(Event.ENTER_FRAME,pageInit);

			
			//pageInit();
			
		}
		
		private function pageInit(e:Event):void
		{

			if(_selectedPanel.txt)
			{
				_selectedPanel.removeEventListener(Event.ENTER_FRAME,pageInit);
				_selectedPanel.init(_mainPage.selectedFriends);
				_selectedPanel.backToPageOne.addEventListener(MouseEvent.CLICK,backToPageOne);
			
				_selectedPanel.btnNextPage.addEventListener(MouseEvent.CLICK,nextPage);
			

				//randomNum
				var txt:String;
				txt = _txtContent.replace("XXXX",_mainPage.selectedFriends[0].screen_name);
				txt = txt.replace("YYYY",_mainPage.selectedFriends[1].screen_name);
				txt = txt.replace("ZZZZ",_mainPage.selectedFriends[2].screen_name);
				_selectedPanel.txt.text = txt ;
				//_selectedPanel.txt.maxChars = 100;
				//_selectedPanel.txt.addEventListener(Event.CHANGE,txtInputHandler);
				//var numRemain:int;
				//numRemain = 100 - _selectedPanel.txt.text.length;
				//_selectedPanel.txtNum.text = _txtNum.replace("XXXX",numRemain.toString());



			}
			else
			{
				//trace("no text yet");
				
			}
			
			
		}
		



		private function backToPageOne(e:MouseEvent):void
		{
			_mainPage.removeChild(_selectedPanel);
			_mainPage.changePage(1);
			
		}
		
		
		private function nextPage(e:MouseEvent):void
		{
			_mainPage.removeChild(_selectedPanel);
			_mainPage.txtWish = _selectedPanel.txt.text;
			_mainPage.changePage(3);
			
		}
		

	}
}
