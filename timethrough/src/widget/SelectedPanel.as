package  widget{
	
	import flash.display.MovieClip;
	import flash.events.Event;

	public class SelectedPanel extends MovieClip{

		private var _selectedFriends:Array;
		private var _selectedFriend1:SelectedItem;
		private var _selectedFriend2:SelectedItem;
		private var _selectedFriend3:SelectedItem;
		
		public function SelectedPanel() {
			// constructor code
		}
		
		public function init(selectedFriends:Array):void
		{
			this._selectedFriends = selectedFriends;
			_selectedFriend1 = new SelectedItem(_selectedFriends[0],64);
			_selectedFriend1.x = 60;
			_selectedFriend1.y = 346;
			addChild(_selectedFriend1);
			
			_selectedFriend2 = new SelectedItem(_selectedFriends[1],80);
			_selectedFriend2.x = 295;
			_selectedFriend2.y = 357;
			addChild(_selectedFriend2);
			
			_selectedFriend3 = new SelectedItem(_selectedFriends[2],64);
			_selectedFriend3.x = 532;
			_selectedFriend3.y = 346;
			addChild(_selectedFriend3);
			//
		}
		

	}
	
}
