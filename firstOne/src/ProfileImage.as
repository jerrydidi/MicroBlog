package 
{
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import com.greensock.TweenLite;
	import flash.display.Bitmap;
	import com.greensock.easing.*;	
	public class ProfileImage extends MovieClip
	{
		var _loader:Loader = new Loader();

		var _imageURL:String;

		var _profileData:Object;


		public function ProfileImage(_data:Object)
		{
			// constructor code
			this.profileData = _data;
		}
		


		public function set imageURL(value:String):void
		{
			this._imageURL = value;
		}

		public function set profileData(value:Object):void
		{

			this._profileData = value;
			this._imageURL = value.avatar_large;
			trace();
		}

		public function loadImage():void
		{
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadImageComplete);
			_loader.x = 0;
			_loader.y = 0;
			this.addChild(_loader);
			_loader.load(new URLRequest(_imageURL));

		}


		private function loadImageComplete(e:Event):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadImageComplete);
			_loader.width = 90;
			_loader.height = 90;

			//
			var bitmap:Bitmap = _loader.content as Bitmap;
			bitmap.alpha = 0;
			bitmap.smoothing = true;
			TweenLite.to(bitmap, 0.5, {alpha:1, ease:Back.easeIn});


		}



	}

}