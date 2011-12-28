package widget
{
	import flash.display.MovieClip;
	import image.Image;
	import event.ImageLoadEvent;
	public class PopupFriendItem extends MovieClip {

		private var _friendData:Object;
		
		private var _friendImage:Image;
		//
		private var _bg:MovieClip = new MovieClip();		
		
		private var _loading:MovieClip = new loading();
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
			_friendImage.addEventListener(ImageLoadEvent.IMAGE_LOAD_EVENT,picLoadComplete);
			this.addChild(_friendImage);
			_friendImage.loadImage();
			addChild(_loading);
			_loading.x = (85 - _loading.width)/2;
			_loading.y = (85 - _loading.height)/2;
			this.addChild(_selectedLabel);
			_selectedLabel.x = 70;
			_selectedLabel.y = 70;
			_selectedLabel.gotoAndStop(1);
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
