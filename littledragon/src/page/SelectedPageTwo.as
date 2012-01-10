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
		private var _imagesPanel :MovieClip ;
		
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
			_mainPage.childPage.addEventListener(Event.ENTER_FRAME,pageInit);
			//pageInit();
			
		}
		
		private function pageInit(e:Event):void
		{

			_mainPage.childPage.removeEventListener(Event.ENTER_FRAME,pageInit);
			
			//trace("page init")
			_imagesPanel = new imagePanel();
			_imagesPanel.x = 90;
			_imagesPanel.y = 150;
			//_imagesPanel.alpha = 0;
			
			//TweenLite.to(_imagesPanel, 0., {alpha:1, ease:Back.easeIn});
			
			//_mainPage.childPage.removeChild(_imagesPanel);
			_mainPage.addChild(_imagesPanel);
			//trace("_imagesPanel:" + _imagesPanel);
		

			_imagesPanel.mcToNextPage.addEventListener(MouseEvent.CLICK,nextPage);
			_imagesPanel.mcToPrevPage.addEventListener(MouseEvent.CLICK,prevPage);
			_imagesPanel.btnPrev.addEventListener(MouseEvent.CLICK,prevImage);
			_imagesPanel.btnNext.addEventListener(MouseEvent.CLICK,nextImage);
				
			//randomNum
			_imagesPanel.txt.text = ((_txtArray[randomNum] as String).replace("XXXX",_mainPage.selectedFriends[0].screen_name));
			_imagesPanel.txt.maxChars = 100;
			_imagesPanel.txt.addEventListener(Event.CHANGE,txtInputHandler);
			var numRemain:int;
			numRemain = 100 - _imagesPanel.txt.text.length;
			_imagesPanel.txtNum.text = _txtNum.replace("XXXX",numRemain.toString());
			
			

			
		}
		
		/**
		private function pageInit(e:Event):void
		{
			if(_mainPage.childPage.imagesPanel)
			{
				_mainPage.childPage.removeEventListener(Event.ENTER_FRAME,pageInit);
				_mainPage.childPage.imagesPanel.mcToNextPage.addEventListener(MouseEvent.CLICK,nextPage);
				_mainPage.childPage.imagesPanel.mcToPrevPage.addEventListener(MouseEvent.CLICK,prevPage);
				_mainPage.childPage.imagesPanel.btnPrev.addEventListener(MouseEvent.CLICK,prevImage);
				_mainPage.childPage.imagesPanel.btnNext.addEventListener(MouseEvent.CLICK,nextImage);
				
				//randomNum
				_mainPage.childPage.imagesPanel.txt.text = ((_txtArray[randomNum] as String).replace("XXXX",_mainPage.selectedFriends[0].screen_name));
				_mainPage.childPage.imagesPanel.txt.addEventListener(Event.CHANGE,txtInputHandler);
				var numRemain:int;
				numRemain = 100 - _mainPage.childPage.imagesPanel.txt.text.length;
				_mainPage.childPage.imagesPanel.txtNum.text = _txtNum.replace("XXXX",numRemain.toString());
				
			}
			else
			{
				trace("no page to 3")
				
			}
		}
		**/
		
		private function txtInputHandler(e:Event):void
		{
			var numRemain:int;
			numRemain = 100 -_imagesPanel.txt.text.length;
			_imagesPanel.txtNum.text =_txtNum.replace("XXXX",numRemain.toString());
		}
		
		private function prevPage(e:MouseEvent):void
		{
			_mainPage.removeChild(_imagesPanel);

			_mainPage.changePage(1);
		}
		private function nextPage(e:MouseEvent):void
		{
			_mainPage.txtWish = _imagesPanel.txt.text  + "http://3.yinongdai.sinaapp.com/index.html";
			_mainPage.removeChild(_imagesPanel);
			_mainPage.changePage(3);
			_mainPage.resultNumber = (_imageSeq + 1)
			
		}
		private function prevImage(e:MouseEvent):void
		{
			if(_imageSeq>0)
			{
				(_imagesPanel.imageSlide as  MovieClip).prevFrame();
				_imageSeq--;
			}
		}

		private function nextImage(e:MouseEvent):void
		{
			if(_imageSeq < (_imageNum-1))
			{
				(_imagesPanel.imageSlide as  MovieClip).nextFrame();
				_imageSeq++;
			}
			
		}
	}
}
