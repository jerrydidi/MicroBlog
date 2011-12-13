package 
{
	import flash.display.MovieClip;
	import com.sina.microblog.MicroBlog;
	import flash.events.MouseEvent;

	public class FriendsPanel extends MovieClip
	{
		public var _seq:int = 0;

		public var _mb:MicroBlog;

		private var _microBlogMain:MicroBlogMain;

		private var _friends:Array;
		public var selectedImage:FriendImage;

		private var _friendNum:int;
		
		private var _currentSelectedFriend:FriendImage;
		var showFriends:Array = new Array();

		public function FriendsPanel(microBlogMain:MicroBlogMain,seq:int)
		{
			// constructor code
			this._microBlogMain = microBlogMain;
			this._mb = microBlogMain.mb;
			this._seq = seq;
			this._friends = _microBlogMain.friends;
			this._friendNum = _friends.length;
			listFriends();
		}


		public function listFriends():void
		{

			var i:int = 0;
			var showFriendsIdx:Array = new Array();
			//showFriendsIdx = getRamdonFriendListIndex(3);
			showFriendsIdx = Util.getRamdonListIndex(3,this._friendNum);
			//clear firstly
			for each (var showFriendItem:FriendImage in showFriends)
			{
				removeChild(showFriendItem);

			}
			showFriends = new Array();
			for each (var idx:int in showFriendsIdx)
			{

				//trace(friend.profile_image_url);
				var friendImage:FriendImage = new FriendImage();
				showFriends.push(friendImage);
				friendImage.x = i * 80;
				i++;
				addChild(friendImage);
				//friendImage._imageURL = friend.profile_image_url;
				friendImage.friendData = _friends[idx];
				friendImage.loadImage();

				friendImage.addEventListener(MouseEvent.CLICK, friendSelected);



			}
			//default select one is the first one
			_microBlogMain._selectedFriends[_seq] = (showFriends[0] as FriendImage)._friendData;
			_currentSelectedFriend =  showFriends[0] as FriendImage;
			_currentSelectedFriend.selected = true;
		}

		private function friendSelected(e:MouseEvent):void
		{

			selectedImage = e.currentTarget as FriendImage;
			_currentSelectedFriend.selected = false;
			_currentSelectedFriend = selectedImage;
			_currentSelectedFriend.selected = true;
			//selectedImage.y=20;
			_microBlogMain._selectedFriends[_seq] = _currentSelectedFriend._friendData;
		}



		//get random friend index
		private function getRamdonFriendListIndex(num:int):Array
		{

			var ary:Array = new Array();
			var sourceArray:Array = new Array();
			for(var i:int=0;i<_friendNum;i++)
			{
				sourceArray[i] = true;
			}

			var ramNum:int;
			var j:int = 0;
			while (j<num)
			{
				ramNum = Math.round(Math.random() * this._friendNum);
				if (sourceArray[ramNum])
				{
					ary.push(ramNum);
					sourceArray[ramNum] = false;
					j++;
				}
			}


			return ary;

		}
	}

}