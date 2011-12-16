package widget 
{
	import flash.display.MovieClip;
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
	}
}