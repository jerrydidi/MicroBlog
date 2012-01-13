package widget
{
	import flash.display.MovieClip;
	import image.Image;
	import event.ImageLoadEvent;
	import flash.events.MouseEvent;

	public class FriendItem extends MovieClip {

		private var _friendData:Object;
		
		private var _friendImage:Image;
		//
		private var _bg:MovieClip;		

		//
		private var _loading:MovieClip = new loading();
		//

		//
		public function FriendItem(_data:Object) {
			// constructor code
			this._friendData = _data;
			//
			_bg = new imageBg();
			_bg.x = -5 ;
			_bg.y = -5 ;

			this.addChild(_bg);
			//
			_friendImage = new Image(_data.avatar_large,85);
			this.addChild(_friendImage);
			_friendImage.addEventListener(ImageLoadEvent.IMAGE_LOAD_EVENT,picLoadComplete);

			_friendImage.loadImage();
			//
			addChild(_loading);
			_loading.x = 45 - _loading.width/2;
			_loading.y = 45 - _loading.height/2;

			
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
