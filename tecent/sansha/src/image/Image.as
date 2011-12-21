package image
{
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.display.Bitmap;
	import flash.display.BlendMode;
	import com.greensock.TweenLite;
	import com.greensock.easing.*;


	public class Image extends MovieClip
	{
		var _loader:Loader = new Loader();

		var _imageURL:String;
		
		var _picSeq:int;
		
		var _scale:Number;
		
	
		private var _selected:Boolean = false;

		public function Image(imageURL:String,scale:Number =1)
		{
			// constructor code
			//trace("imageURL:"+imageURL)
			//this._imageURL = imageURL;
			this._imageURL = "images/pic01.jpg";
			this._scale = scale;
		}

		public function set imageURL(value:String):void
		{
			this._imageURL = value;
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
			
			//
			
			//var bitmap:Bitmap = _loader.content as Bitmap;
			if(_scale!= 1)
			{
				_loader.width = 100;
				_loader.height = 100;

			}
			else
			{
				
				_loader.width = 180;
				_loader.height = 180;

			
			}
			_loader.alpha = 0;
			//bitmap.alpha = 0;
			//bitmap.smoothing = true;
			TweenLite.to(_loader, 0.5, {alpha:1, ease:Back.easeIn});


		}

	}

}