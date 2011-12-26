

package page
{
	import widget.*;
	import flash.display.*;
	import event.DragCompleteEvent;
	import flash.events.MouseEvent;
	import widget.*;
	import com.sina.microblog.events.*;	
	import flash.net.URLRequest;	
	import com.adobe.images.JPGEncoder;	
	import flash.utils.*;	
	
	
	
	public class SelectedPageTwo extends BaseSelectedPage {
		private var _friendsPanel:PopupFriendsPanel
		private var _friendsSelectedPanel:FriendsSelectedPanel;
		var _resultItem:ResultItem;
		//
		private var _bmd:BitmapData;		
		//
		var _popup:MovieClip = new popup();
		
		var _comments:Array = [
			"害怕明天，怎么能过好今天？",
			"让激情转变成职业，然后工作就会变成游戏",
			"只需要一点点勇气，就可以让人生逆转。",
			"死记硬背也许能让你通过大学4年，但会毁掉你接下来的40年。", 	
			"让激情转变成职业，然后工作就会变成游戏",			
			"心很脆弱，你得学会去哄它。不管遇到多大困难，告诉你的心：一切安好。"


							  
							  ]
		var _comment:String = "对我说：“replaced。“\r\n我把这句话与大家共勉！http://1.secondone.sinaapp.com/index.html";
		
		
		public function SelectedPageTwo(mainPage:MainPage,pageNo:int) {
			// constructor code
			trace("===two===SelectedPageTwo=======");
			super(mainPage,pageNo);
		}
		
		override public function initComponents():void
		{
			trace("===two===initComponents===0====");

			_mainPage.childPage = _mainPage.page2;
			//

			
			//var selectedItem:FriendSelectedItem;
			//selectedItem = _mainPage.selectedFriends[0];
			//_resultItem = new ResultItem(_mainPage.resultNumber,selectedItem.friendData);
			//_resultItem.x = 10;
			//_resultItem.y = 10;

			
			//_mainPage.childPage.addChildAt(_resultItem,0);
			

			//
			_mainPage.childPage.btnPopup.addEventListener(MouseEvent.CLICK,distributeClick);
			_mainPage.childPage.btnNext.addEventListener(MouseEvent.CLICK,nextpage);

			_friendsPanel = new PopupFriendsPanel(_mainPage.friends);
			_friendsPanel.x = 125;
			_friendsPanel.y = 200;
			_friendsPanel.addEventListener(DragCompleteEvent.DRAG_COMPLETE_EVENT,dragComplete)
	
			
			_popup.addChild(_friendsPanel);
			_popup.x = 0;
			_popup.y = 0;

			
			_friendsSelectedPanel = new FriendsSelectedPanel(_mainPage.friends);
			_friendsSelectedPanel.x = 300;
			_friendsSelectedPanel.y = 295;
			_mainPage.childPage.addChild(_friendsSelectedPanel);		
			trace("===two===initComponents===1====",_mainPage.friends.length,"-----",_mainPage.selectedFriends.length);
			var randomNumber:int = Math.round(Math.random()*(_mainPage.friends.length))+1;
			trace("===two===initComponents===2====",randomNumber);
			var selectedItem:PopupFriendItem;
			selectedItem = new PopupFriendItem(_mainPage.friends[randomNumber]);			
			_friendsSelectedPanel.dragHandler(selectedItem);
			_mainPage.selectedImage = selectedItem;
		}
		
		private function popupWindow():void
		{
			trace("===two===popupWindow=======");
			_mainPage.childPage.alpha = 0.5;
			_mainPage.addChild(_popup);
			_popup.mcFocus.addEventListener(MouseEvent.CLICK,focusClick);
			_popup.btnClose.addEventListener(MouseEvent.CLICK,popupCloseClick);
			_popup.btnleft.addEventListener(MouseEvent.CLICK,leftPage);
			_popup.btnright.addEventListener(MouseEvent.CLICK,rightPage);					
			
		}
		
		
		
		private function leftPage(e:MouseEvent):void
		{
			trace("========leftPage=========================");
			_friendsPanel.prevPage(e);
			
		}
		
		
		private function rightPage(e:MouseEvent):void
		{
			trace("========rightPage=========================");
			_friendsPanel.nextPage(e);
		}			
		
		private function popupCloseClick(e:MouseEvent):void
		{
			
			removePopup();
		}
		
		private function removePopup():void
		{
			_mainPage.removeChild(_popup);
			_mainPage.childPage.alpha = 1;
			
		}
		
		public function nextpage(e:MouseEvent):void
		{
			_mainPage.changePage(3);
		}
		
		//get friends
		public function distributeClick(e:MouseEvent):void
		{
			trace("===two===distributeClick=======");
			var obj = new Object  ;

			obj.status  =("@" + _mainPage.selectedFriends[0].friendData.screen_name + this._comment.replace("replaced",_comments[_mainPage.resultNumber-1]));

			trace("obj.status:"+obj.status);
			//var coder:JPGEncoder = new JPGEncoder(100);
			
			//_bmd = new BitmapData(_resultItem.width,_resultItem.height);
			//_bmd.draw(_resultItem);
			//var ary:ByteArray ;
			//var ary:ByteArray = coder.encode(_bmd);

			//obj.pic = ary;
			

			
		
			_mainPage.mb.addEventListener("distributeResultEvent", onDistributeResult);
			_mainPage.mb.addEventListener("distributeErrorEvent", onDistributeError);
			//_mainPage.mb.callWeiboAPI("2/statuses/update",obj, "POST", "distributeResultEvent", "distributeErrorEvent");
			//_mainPage.mb.updateStatus(obj.status,obj.pic);
			popupWindow();

			//focus();

 

		}


		private function onDistributeResult(e:MicroBlogEvent):void
		{

			trace("distribute ok")
			popupWindow();

		}
		private function onDistributeError(e:MicroBlogErrorEvent):void
		{
			trace("distribute error");

		}
		
		
		
		
		private function focusClick(e:MouseEvent):void
		{
			trace("===two===focusClick=======",_mainPage.selectedImage.friendData.id);
			_mainPage.removeChild(_popup);
			_mainPage.childPage.alpha = 1;			
			
			
		}
		
			
		private  function dragComplete(e:DragCompleteEvent):void
		{


			_friendsSelectedPanel.dragHandler(e.dragItem);
				
			trace("------index-----0-----",e.dragItem.friendData.avatar_large );
			_mainPage.selectedImage = e.dragItem;
			trace("------index-----1-----",_mainPage.selectedImage.friendData.avatar_large );
			
			
		}	

		

	}
	
}
