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
	import flash.events.DataEvent;
	import flash.events.IOErrorEvent;
	import event.ImageLoadEvent;


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
			this._imageURL = imageURL;
			//this._imageURL = "images/pic01.jpg";
			this._scale = scale;
		}

		public function set imageURL(value:String):void
		{
			this._imageURL = value;
		}

		public function loadImage():void
		{
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadImageComplete);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadImageErrorComplete);
			_loader.x = 0;
			_loader.y = 0;
			this.addChild(_loader);


			_loader.load(new URLRequest(_imageURL));

		}

		private function loadImageErrorComplete(e:IOErrorEvent):void
		{
			trace("io error");
			this.dispatchEvent(new ImageLoadEvent(ImageLoadEvent.IMAGE_LOAD_EVENT,true));
			
		}
		
		private function loadImageComplete(e:Event):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadImageComplete);
			//dispatch load complete event
			this.dispatchEvent(new ImageLoadEvent(ImageLoadEvent.IMAGE_LOAD_EVENT,true));
			//
			
			//var bitmap:Bitmap = _loader.content as Bitmap;
			if(_scale!= 1)
			{
				_loader.width = 100;
				_loader.height = 100;

			}
			else
			{
				

			
			}
			_loader.alpha = 0;
			TweenLite.to(_loader, 0.5, {alpha:1, ease:Back.easeIn});


		}

	}

}