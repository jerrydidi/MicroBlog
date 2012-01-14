package  widget{
	
	import flash.display.MovieClip;
	import flash.events.Event;

	public class DistributePanel extends MovieClip{

		private var _selectedFriends:Array;
		private var _selectedFriend1:SelectedItem;
		private var _selectedFriend2:SelectedItem;
		private var _selectedFriend3:SelectedItem;
		
		public function DistributePanel() {
			// constructor code
		}
		
		public function init(selectedFriends:Array,txt:String):void
		{
			this._selectedFriends = selectedFriends;
			_selectedFriend1 = new SelectedItem(_selectedFriends[0],50,false);
			_selectedFriend1.x = -190;
			_selectedFriend1.y = 2;
			addChild(_selectedFriend1);
			
			_selectedFriend2 = new SelectedItem(_selectedFriends[1],40,false);
			_selectedFriend2.x = -83;
			_selectedFriend2.y = -38;
			addChild(_selectedFriend2);
			
			_selectedFriend3 = new SelectedItem(_selectedFriends[2],50,false);
			_selectedFriend3.x = 79;
			_selectedFriend3.y = 2;
			addChild(_selectedFriend3);
			//
			this.txt.text = txt;
			//
		}
		

	}
	
}
