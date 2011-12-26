package widget
{
	import flash.display.MovieClip;
	import image.Image;

	public class PopupFriendItem extends MovieClip {

		private var _friendData:Object;
		
		private var _friendImage:Image;
		//
		private var _bg:MovieClip = new MovieClip();		
		
		
		private var _selectedLabel:MovieClip = new selectedLabel();
		public function PopupFriendItem(_data:Object) {
			trace("========PopupFriendItem============",_data);
			// constructor code
			this._friendData = _data;
			//
			_bg.graphics.lineStyle(1,0xFF0000);
			_bg.graphics.beginFill(0xFF0000,0);
			_bg.graphics.drawRect(-3,-3,90,90);
			_bg.graphics.endFill();
			this.addChild(_bg);
			//
			_friendImage = new Image(_data.avatar_large,85,0.2);
			this.addChild(_friendImage);
			_friendImage.loadImage();
			
			this.addChild(_selectedLabel);
			_selectedLabel.x = 70;
			_selectedLabel.y = 70;
			_selectedLabel.gotoAndStop(1);
		}
		
		public function get friendData():Object
		{
			return _friendData;
		}
	}
	
}
