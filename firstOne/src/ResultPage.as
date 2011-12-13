package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class ResultPage 
	{
		public var _mainPage:MicroBlogMain;
		private var selectedFriends:Array = new Array();;


		public function ResultPage(mainPage:MicroBlogMain):void
		{
			this._mainPage = mainPage;
			_mainPage.addEventListener(Event.ENTER_FRAME,enterPage);

			//showResult();
		}

		private function enterPage(e:Event):void
		{

			if (_mainPage.page3 == undefined)
			{
				return;
			}
			else
			{
				_mainPage.removeEventListener(Event.ENTER_FRAME,enterPage);
				_mainPage.page3.mcSendToBlog.addEventListener(MouseEvent.CLICK, sendToBlog);				
				showResult();
			}
			

		}

		private function sendToBlog(e:MouseEvent):void
		{
			_mainPage.page3.mcSendToBlog.removeEventListener(MouseEvent.CLICK, sendToBlog);

			//for each (var selectedFriend:SelectedFriend in selectedFriends)
			//{
				//_mainPage.page3.removeChild(selectedFriend);
			//}
			//selectedFriends = new Array();
			_mainPage.changePage(3);

		}

		//show result
		public function showResult():void
		{
			//removeEventListener(Event.ENTER_FRAME,showResult);
			//get the random comment;
			//get 3 random number from 12
			_mainPage.comments = Util.getRamdonListIndex(3,12);

			//show selected friend
			for(var i:int =0;i<3;i++)
			{
				//add comment id to friend object to pass to selected friend
				var obj:Object = _mainPage._selectedFriends[i];
				obj.commentID = _mainPage.comments[i];
				var selectedFriend:SelectedFriend = new SelectedFriend(obj);

				selectedFriend.y = -220 + i * 147;
				selectedFriend.x = -295;
				_mainPage.page3.addChild(selectedFriend);
				selectedFriends.push(selectedFriend);

			}
		}
	}

}