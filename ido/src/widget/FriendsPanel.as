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
		
		//private var _left:MovieClip = new arrowleft(); 
		//private var _right:MovieClip = new arrowright();
		
		private var _friendsbg = new friendsbg();
		
		private var _drageItem:FriendItem;
		private var panel:MovieClip= new MovieClip();
	
		//pic number per row
		private var _rowNum:int = 5;
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
			
			//_left.x = -50;
			//_left.y = 229;
	

			//_right.x = 350;
			//_right.y = 229;
			
			//addChild(_left);
			//addChild(_right);
			
			//_left.addEventListener(MouseEvent.CLICK,prevPage);
			//_right.addEventListener(MouseEvent.CLICK,nextPage);
			_friendsbg.x=0;
			_friendsbg.y=0;
			//addChild(_friendsbg);
			listAllFriends();
		}
		
		public function prevPage(e:MouseEvent):void
		{
			if(_pageSeq >0)
			{
				var targetX:Number = panel.x + 600;
				TweenLite.to(panel, 0.2, {x:targetX});
				_pageSeq--;
			}

		}
		public function nextPage(e:MouseEvent):void
		{
			if(_pageSeq <(_pageNum -1 ))
			{

				var targetX:Number = panel.x - 600;
				TweenLite.to(panel, 0.2, {x:targetX});
				_pageSeq++;
			}

		}

		public function listAllFriends():void
		{
			var row:int = 0;
			var j:int = 0;
			panel.x = 0;
			panel.y = 30;
			this.addChild(panel);
			
			var mcMask:MovieClip = new MovieClip();
			mcMask.graphics.beginFill(0xFF9800,0);
			mcMask.graphics.drawRect(0,0,600,226);
			mcMask.graphics.endFill()
			mcMask.x = -3;
			mcMask.y = 25;
			this.addChild(mcMask);
			
			panel.mask = mcMask;
			
			_friendNum = _friends.length;
			_pageNum = Math.ceil((_friendNum/_rowNum)/2);
			for  (var i:int =0;i<_friendNum;i++)
			{

				//trace(":" +_friends[i].profile_image_url +"::" + i.toString());
				var friendItem:FriendItem = new FriendItem(_friends[i]);
				//friendItem.width = 100;
				//friendItem.height = 100;

				if (i%2==0){
					friendItem.x = i * 60 ;
					friendItem.y = 0;
				}else{
					friendItem.x = (i-1) * 60 ;
					friendItem.y = 110;
				}
				
				//friendItem.x = i * 120 ;
				//friendItem.y = row * 50;
				
				
				friendItem.addEventListener(MouseEvent.CLICK,place); 
				panel.addChild(friendItem);
				

			}
		}
		
//		//
//		private function pickup(e:MouseEvent):void
//		{
//			
//
//			var dragedItem:FriendItem;
//			var newItem:FriendItem;
//			dragedItem = e.currentTarget as FriendItem
//			dragedItem.removeEventListener(MouseEvent.MOUSE_DOWN,pickup); 
//			
//			newItem = new FriendItem(dragedItem.friendData);
//			newItem.x = dragedItem.x;
//			newItem.y = dragedItem.y;
//			newItem.addEventListener(MouseEvent.MOUSE_DOWN,pickup); 
//			
//			//dragedItem.x= 25;
//			//dragedItem.y= 25;
//			
//			//_drageItem.scaleX = 0.5;
//			//_drageItem.scaleY = 0.5;
//			
//			
//			addChild(newItem);
//			this.swapChildren(newItem,dragedItem);
//				
//			
//			_drageItem = dragedItem;
//			
//			_drageItem.addEventListener(MouseEvent.MOUSE_UP,place); 
//			_drageItem.alpha = 0.5;
//
//			_drageItem.startDrag();
//			
//		}
//		
		//
		private function place(e:MouseEvent):void
		{
			trace("place");

			_drageItem = e.currentTarget as FriendItem;


			//_drageItem.removeEventListener(MouseEvent.MOUSE_UP,place); 

			//_drageItem.stopDrag();

			//var dragCompleteEvent :DragCompleteEvent= new  DragCompleteEvent(DragCompleteEvent.DRAG_COMPLETE_EVENT);
			//dragCompleteEvent.dragX = e.stageX;
			//dragCompleteEvent.dragY = e.stageY;
			//dragCompleteEvent.dragItem = _drageItem;
			//this.dispatchEvent(dragCompleteEvent);
			
			//TweenLite.to(_drageItem, 0.5, {alpha:0,onComplete:fadeOutComplete});
		}
		
		private function fadeOutComplete():void
		{
			
			this.removeChild(_drageItem);
		}
		
		//
		
	}
}