
package widget
{
	import flash.display.MovieClip;
	import image.Image;
	import event.ImageLoadEvent;
	import flash.events.MouseEvent;
	import event.ImageSelectedEvent;

	public class ResultAvatar extends MovieClip {

		private var _friendData:Object;
		
		private var _friendImage:Image;


		//
		private var _loading:MovieClip = new loading();

		//
		public function ResultAvatar(_data:Object) {
			// constructor code
			this._friendData = _data;

			//
			_friendImage = new Image(_data.avatar_large,55);
			this.addChild(_friendImage);
			_friendImage.addEventListener(ImageLoadEvent.IMAGE_LOAD_EVENT,picLoadComplete);

			_friendImage.loadImage();
			//
			addChild(_loading);
			_loading.x = 28 - _loading.width/2;
			_loading.y = 28 - _loading.height/2;

			
		}

		
		public function get friendData():Object
		{
			return _friendData;
		}
		public function picLoadComplete(e:ImageLoadEvent):void
		{
			removeChild(_loading);
			dispatchEvent(new ImageLoadEvent(ImageLoadEvent.IMAGE_LOAD_EVENT,true));
			
			
		}

				
	}
	
}
