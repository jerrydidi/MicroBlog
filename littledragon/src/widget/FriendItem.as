package widget
{
	import flash.display.MovieClip;
	import image.Image;
	import event.ImageLoadEvent;
	public class FriendItem extends MovieClip {

		private var _friendData:Object;
		
		private var _friendImage:Image;
		//
		private var _bg:MovieClip = new MovieClip();		
		//
		private var _loading:MovieClip = new loading();
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
			_friendImage.addEventListener(ImageLoadEvent.IMAGE_LOAD_EVENT,picLoadComplete);

			_friendImage.loadImage();
			//
			addChild(_loading);
			_loading.x = 50 - _loading.width/2;
			_loading.y = 50 - _loading.height/2;
			
		}
		
		public function get friendData():Object
		{
			return _friendData;
		}
		public function picLoadComplete(e:ImageLoadEvent):void
		{
			removeChild(_loading);
			
			
		}
				
	}
	
}
