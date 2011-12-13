
package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;

	public class DistributePage 
	{
		//main page reference
		private var _mainPage:MicroBlogMain;
		//
		//
		private var _text:TextField = new TextField(); 
		
		private var _imageResult:Image;

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
				_mainPage.removeEventListener(Event.ENTER_FRAME,init);
				showComments();
			}
			

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
			_text.height = 56;
			_text.wordWrap = true;
			_text.htmlText = concatcComments();
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
				strComments = strComments +(", " +Util.getBlogLinkString(_mainPage._selectedFriends[i].screen_name,_mainPage._selectedFriends[i].url)+strMoney+ comments[i]);
				
			
			}
			strComments = strComments + ", 请叫我债主!";
			
			return strComments;
		}
		//

	}
}