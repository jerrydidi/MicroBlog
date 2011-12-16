
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
		private var _selectedNum:int = 1;
		
		

		public function FriendsSelectedPanel(friends:Array)
		{
			// constructor code

			this._friends = friends;
			
			listSelectedFriends();
		}
		
		public function get friendsSelected():Array
		{
			
			return _friendsSelected;
		}

		public function listSelectedFriends():void
		{

			for  (var i:int =0;i<_selectedNum;i++)
			{

				//trace(":" +_friends[i].profile_image_url +"::" + i.toString());
				var friendItem:FriendItem = new FriendItem(_friends[i]);
				friendItem.x = i * 100;
				addChild(friendItem);
				_friendsSelected.push(friendItem);
				
				
			}
		}
		
		public function dragHandler(dragItem:FriendItem):void
		{
			
			for each(var friend:FriendItem in _friendsSelected )
			{


				replaceFriendItem(friend,dragItem);
					
					

			}
		}
		
		private function replaceFriendItem(oringin:FriendItem,place:FriendItem):void
		{
			var newItem:FriendItem = new FriendItem(place.friendData);
			newItem.x = oringin.x;
			newItem.y = oringin.y;
			var idx:int;
			idx =_friendsSelected.indexOf(oringin);
			_friendsSelected[idx]=newItem;
			
			//updateChildren();
			this.removeChild(oringin);
			this.addChild(newItem);
			
		}
		
		
	}
}
