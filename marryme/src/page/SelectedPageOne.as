package page
{

	import flash.events.MouseEvent;
	import com.sina.microblog.MicroBlog;
	import widget.AvatarItem;


	
	public class SelectedPageOne extends BaseSelectedPage {

		
		private var _mb:MicroBlog;
		
		//gender 0:maile 1:femail
		private var gender:int = -1;
		
		private var avatar:AvatarItem;
		

		
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
			//
			avatar = new AvatarItem(_mainPage._profile);
			avatar.x = 467;
			avatar.y = 226;
			
			_mainPage.childPage.addChild(avatar);
			//
			_mainPage.childPage.txtNickName.text = _mainPage._profile.screen_name;
			//
			//
			this.gender = _mainPage.gender;
			//trace("this.gender:"+this.gender);
			checkGender();
			//
			checkDate();
			
						
		}
		
		private function checkDate():void
		{
			_mainPage.childPage.txtYY.text = _mainPage.yy;
			_mainPage.childPage.txtMM.text = _mainPage.mm;
			_mainPage.childPage.txtDD.text= _mainPage.dd;
		}
		
		private function nextPage(e:MouseEvent):void
		{
			if(gender != -1)
			{
				_mainPage.changePage(2);
				_mainPage.yy = _mainPage.childPage.txtYY.text;
				_mainPage.mm = _mainPage.childPage.txtMM.text;
				_mainPage.dd = _mainPage.childPage.txtDD.text;
				_mainPage.gender = this.gender;
			}
		}
		
		private function femaleClick(e:MouseEvent):void
		{
			gender = 1;
			checkGender();
		}
		private function maleClick(e:MouseEvent):void
		{
			gender = 0;
			checkGender();
		}
		
		private function checkGender():void
		{
			if(gender == 0)
			{
				_mainPage.childPage.btnFemale.gotoAndStop(1);
				_mainPage.childPage.btnMale.gotoAndStop(2);
			}
			else if(gender == 1)
			{
				_mainPage.childPage.btnFemale.gotoAndStop(2);
				_mainPage.childPage.btnMale.gotoAndStop(1);

				
			}
		}
		

	}
	
}
