package widget
{
	import flash.display.MovieClip;
	import image.Image;

	public class FriendItem extends MovieClip {

		private var _friendData:Object;
		
		private var _friendImage:Image;
		//
		private var _bg:MovieClip = new MovieClip();		
		public function FriendItem(_data:Object) {
			// constructor code
			this._friendData = _data;
			//
			_bg.graphics.lineStyle(1,0x333333);
			_bg.graphics.beginFill(0xFF9800,0);
			_bg.graphics.drawRect(-3,-3,105,105);
			_bg.graphics.endFill();
			this.addChild(_bg);
			//
			_friendImage = new Image(_data.avatar_large,0.5556);
			this.addChild(_friendImage);
			_friendImage.loadImage();
		}
		
		public function get friendData():Object
		{
			return _friendData;
		}
	}
	
}
