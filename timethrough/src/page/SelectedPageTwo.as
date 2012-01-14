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
		
		private var _txtArray =[
								    "什么时候回家啊？不要等到妈妈的电话再去犹豫回家，@XXXX,让我们宜起回家，享受这份世间最浓的感情。",
      "我们可以等到有出息了、有钱了，让父母过上好日子，但是父母不能等，也等不了，父母需要的，只是子女回家时的笑脸，@XXXX，让我们宜起回家。",
      "家是一本书，一本写下彼此对爱的理解爱的承诺的书，一本好书不需要太多华丽的辞藻，不需要太多波折的剧情，需要的，只是作者淳朴又纯真的感情，@XXXX，让我们宜起书写最质朴的家书。"								
								];
		
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
				_selectedPanel.txt.text = ((_txtArray[randomNum] as String).replace("XXXX",_mainPage.selectedFriends[0].screen_name));
				_selectedPanel.txt.maxChars = 100;
				_selectedPanel.txt.addEventListener(Event.CHANGE,txtInputHandler);
				var numRemain:int;
				numRemain = 100 - _selectedPanel.txt.text.length;
				_selectedPanel.txtNum.text = _txtNum.replace("XXXX",numRemain.toString());



			}
			else
			{
				//trace("no text yet");
				
			}
			
			
		}
		
		private function txtInputHandler(e:Event):void
		{
			var numRemain:int;
			numRemain = 100 -_selectedPanel.txt.text.length;
			_selectedPanel.txtNum.text =_txtNum.replace("XXXX",numRemain.toString());
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
