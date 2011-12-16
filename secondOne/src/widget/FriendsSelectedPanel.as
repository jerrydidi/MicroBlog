
package widget 
{
	import flash.display.MovieClip;
	import flash.geom.Point;

	public class FriendsSelectedPanel extends MovieClip
	{
		var showFriends:Array = new Array();
		private var _friends:Array;
		
		//
		private var _friendsSelected:Array = new Array();
		private var _selectedNum:int = 3;
		
		

		public function FriendsSelectedPanel(friends:Array)
		{
			// constructor code

			this._friends = friends;
			
			listSelectedFriends();
		}

		public function listSelectedFriends():void
		{

			for  (var i:int =0;i<_selectedNum;i++)
			{

				//trace(":" +_friends[i].profile_image_url +"::" + i.toString());
				var friendItem:FriendItem = new FriendItem(_friends[i]);
				friendItem.x = i * 50;
				addChild(friendItem);
				_friendsSelected.push(friendItem);
				
				
			}
		}
		
		public function dragHandler(dragX:Number,dragY:Number):void
		{
			
			for each(var friend:FriendItem in _friendsSelected )
			{

				var localPoint:Point;
				var globalPoint:Point = new Point();
				globalPoint.x = dragX;
				globalPoint.y = dragY;
				localPoint = friend.globalToLocal(globalPoint);
				trace("localPoint.x:"+localPoint.x);
				if(friend.hitTestPoint(localPoint.x,localPoint.y))
				{
					trace("I am hit!")
					}
			}
		}
	}
}
