package widget 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	import event.DragCompleteEvent;

	public class FriendsPanel extends MovieClip
	{
		var showFriends:Array = new Array();
		private var _friends:Array;
		private var _friendNum:int;
		
		//pic number per row
		private var _rowNum:int = 6;
		
		public var _seq:int = 0;
		

		public function FriendsPanel(friends:Array)
		{
			// constructor code

			this._friends = friends;
			this._friendNum = _friends.length;
			
			listAllFriends();
		}

		public function listAllFriends():void
		{
			var row:int = 0;
			var j:int = 0;
			for  (var i:int =0;i<_friends.length;i++)
			{

				//trace(":" +_friends[i].profile_image_url +"::" + i.toString());
				var friendItem:FriendItem = new FriendItem(_friends[i]);
				friendItem.x = j * 50;
				friendItem.y = row * 50;
				
				friendItem.oringinX = friendItem.x;
				friendItem.oringinY = friendItem.y;
				friendItem.addEventListener(MouseEvent.MOUSE_DOWN,pickup); 
				friendItem.addEventListener(MouseEvent.MOUSE_UP,place); 
				addChild(friendItem);
				
				if(j<_rowNum)
				{
					j++;
				}
				else
				{
					j = 0;
					row ++;
				}
				
			}
		}
		
		//
		private function pickup(e:MouseEvent):void
		{
			(e.currentTarget as FriendItem).startDrag();
		}
		
		//
		private function place(e:MouseEvent):void
		{
			var dragImage:FriendItem;
			dragImage = e.currentTarget as FriendItem;
			dragImage.stopDrag();
			var dragCompleteEvent :DragCompleteEvent= new  DragCompleteEvent(DragCompleteEvent.DRAG_COMPLETE_EVENT);
			dragCompleteEvent.dragX = e.stageX;
			dragCompleteEvent.dragY = e.stageY;
			this.dispatchEvent(dragCompleteEvent);
			
			TweenLite.to(dragImage, 0.5, {x:dragImage.oringinX ,y:dragImage.oringinY });
		}
		
		//
		
	}
}