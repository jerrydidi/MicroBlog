
package widget
{
	import flash.display.MovieClip;
	import image.Image;
	import event.ImageLoadEvent;
	import flash.events.MouseEvent;

	public class AvatarItem extends MovieClip {

		 var _friendData:Object;
		
		private var _friendImage:Image;



		//
		private var _loading:MovieClip = new loading();

		//
		public function AvatarItem(_data:Object) {
			// constructor code
			this._friendData = _data;

			_friendImage = new Image(_data.avatar_large,106);
			this.addChild(_friendImage);
			_friendImage.addEventListener(ImageLoadEvent.IMAGE_LOAD_EVENT,picLoadComplete);

			_friendImage.loadImage();
			//
			addChild(_loading);
			_loading.x = 30 - _loading.width/2;
			_loading.y = 30 - _loading.height/2;

			//
			
		}
		
		public function get friendData():Object
		{
			return _friendData;
		}



		public function picLoadComplete(e:ImageLoadEvent):void
		{
			removeChild(_loading);
			_friendImage.removeEventListener(ImageLoadEvent.IMAGE_LOAD_EVENT,picLoadComplete);

			
		}

				
	}
	
}
