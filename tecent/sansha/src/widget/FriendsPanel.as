package widget 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	import event.DragCompleteEvent;
	import flash.text.TextField;

	public class FriendsPanel extends MovieClip
	{
		var showFriends:Array = new Array();
		private var _friends:Array;
		private var _friendNum:int;
		
		private var _left:MovieClip = new mcPrevPage(); 
		private var _right:MovieClip = new mcNextPage();
		
		private var _drageItem:FriendItem;
		private var panel:MovieClip= new MovieClip();
	
		//pic number per row
		private var _rowNum:int = 3;
		//
		private var _pageNum:int = 0 ;
		
		//
		private var _pageSeq:int =0;
		//
		
		public var _seq:int = 0;
		

		public function FriendsPanel(friends:Array)
		{
			// constructor code

			this._friends = friends;
			this._friendNum = _friends.length;
			
			_left.x = -50;
			_left.y = 29;
	

			_right.x = 350;
			_right.y = 29;
			addChild(_left);
			addChild(_right);
			_left.addEventListener(MouseEvent.CLICK,prevPage);
			_right.addEventListener(MouseEvent.CLICK,nextPage);
			listAllFriends();
		}
		
		private function prevPage(e:MouseEvent):void
		{
			if(_pageSeq >0)
			{
				var targetX:Number = panel.x + 330;
				TweenLite.to(panel, 0.2, {x:targetX});
				_pageSeq--;
			}

		}
		private function nextPage(e:MouseEvent):void
		{
			if(_pageSeq <(_pageNum -1 ))
			{

				var targetX:Number = panel.x - 330;
				TweenLite.to(panel, 0.2, {x:targetX});
				_pageSeq++;
			}

		}

		public function listAllFriends():void
		{
			var row:int = 0;
			var j:int = 0;
			panel.x = 0;
			this.addChild(panel);
			
			var mcMask:MovieClip = new MovieClip();
			mcMask.graphics.beginFill(0xFF9800,0);
			mcMask.graphics.drawRect(0,0,330,108);
			mcMask.graphics.endFill()
			mcMask.x = -3;
			mcMask.y = -5;
			this.addChild(mcMask);
			
			panel.mask = mcMask;
			
			_friendNum = _friends.length;
			_pageNum = Math.ceil(_friendNum/_rowNum);
			for  (var i:int =0;i<_friendNum;i++)
			{

				//trace("name is:" +_friends[i].tweet[0].name);
				//trace("id is:" +_friends[i].tweet[0].id);
				var friendItem:FriendItem = new FriendItem(_friends[i]);
				//friendItem.width = 100;
				//friendItem.height = 100;
				//trace("i:"+i)
				friendItem.x = i * 110 ;
				//friendItem.y = row * 50;
				
				
				friendItem.addEventListener(MouseEvent.CLICK,place); 
				panel.addChild(friendItem);
				

			}
		}
		
		//
		private function place(e:MouseEvent):void
		{
			//trace("place");

			_drageItem = e.currentTarget as FriendItem;
			var dragCompleteEvent :DragCompleteEvent= new  DragCompleteEvent(DragCompleteEvent.DRAG_COMPLETE_EVENT);
			dragCompleteEvent.dragItem = _drageItem;
			this.dispatchEvent(dragCompleteEvent);
			//TweenLite.to(_drageItem, 0.5, {alpha:0,onComplete:fadeOutComplete});
		}
		
		private function fadeOutComplete():void
		{
			
			this.removeChild(_drageItem);
		}
		
		//
		
	}
}