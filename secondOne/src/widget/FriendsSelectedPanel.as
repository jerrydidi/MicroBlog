
package widget 
{
	import flash.display.MovieClip;
	public class FriendsSelectedPanel extends MovieClip
	{
		var showFriends:Array = new Array();
		private var _friends:Array;
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
				
				
			}
		}
	}
}
