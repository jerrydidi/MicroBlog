package page
{

	import flash.events.MouseEvent;
	import com.sina.microblog.MicroBlog;


	
	public class SelectedPageOne extends BaseSelectedPage {

		
		private var _mb:MicroBlog;
		
		//gender 0:maile 1:femail
		private var gender:int = -1;
		

		
		public function SelectedPageOne(mainPage:MainPage,pageNo:int) {
			// constructor code
			super(mainPage,pageNo);
			_mb = mainPage.mb;
		}
		
		override public function initComponents():void
		{	
			_mainPage.childPage = _mainPage.page1;

			

			_mainPage.childPage.btnFemale.buttonMode = true;
			_mainPage.childPage.btnFemale.addEventListener( MouseEvent.CLICK,femaleClick);
			_mainPage.childPage.btnMale.buttonMode = true;
			_mainPage.childPage.btnMale.addEventListener( MouseEvent.CLICK,maleClick);
			
			_mainPage.childPage.btnNextPage.addEventListener( MouseEvent.CLICK,nextPage);
						
		}
		
		private function nextPage(e:MouseEvent):void
		{
			_mainPage.changePage(2);
		}
		
		private function femaleClick(e:MouseEvent):void
		{
			gender =1;
			checkGender();
		}
		private function maleClick(e:MouseEvent):void
		{
			gender =0;
			checkGender();
		}
		
		private function checkGender():void
		{
			if(gender == 0)
			{
				_mainPage.childPage.btnFemale.gotoAndStop(1);
				_mainPage.childPage.btnMale.gotoAndStop(2);
			}
			else
			{
				_mainPage.childPage.btnFemale.gotoAndStop(2);
				_mainPage.childPage.btnMale.gotoAndStop(1);

				
			}
		}
		

	}
	
}
