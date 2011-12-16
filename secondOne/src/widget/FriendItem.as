package widget
{
	import flash.display.MovieClip;
	import image.Image;

	public class FriendItem extends MovieClip {

		private var _friendData:Object;
		
		private var _friendImage:Image;
		
		public function FriendItem(_data:Object) {
			// constructor code
			this._friendData = _data;
			
			_friendImage = new Image(_data.profile_image_url);
			this.addChild(_friendImage);
			_friendImage.loadImage();
		}
	}
	
}
