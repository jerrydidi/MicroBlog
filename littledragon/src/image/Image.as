﻿package image
{
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.display.Bitmap;
	import flash.display.BlendMode;
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	import event.ImageLoadEvent;
	import flash.system.LoaderContext;


	public class Image extends MovieClip
	{
		var _loader:Loader = new Loader();

		var _imageURL:String;
		
		var _picSeq:int;
		
		var _size:Number;
		
	
		private var _selected:Boolean = false;

		public function Image(imageURL:String,size:Number =1)
		{
			// constructor code
			this._imageURL = imageURL;
			this._size = size;
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
			var loaderContext:LoaderContext = new LoaderContext();
			loaderContext.checkPolicyFile = true;
			_loader.load(new URLRequest(_imageURL),loaderContext);

		}


		private function loadImageComplete(e:Event):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadImageComplete);
			
			//
			
			//var bitmap:Bitmap = _loader.content as Bitmap;
			if(_size!= 1)
			{
				_loader.width = _size;
				_loader.height =_size;

			}
			_loader.alpha = 0;
			this.dispatchEvent(new ImageLoadEvent(ImageLoadEvent.IMAGE_LOAD_EVENT,true));

			TweenLite.to(_loader, 0.5, {alpha:1, ease:Back.easeIn});


		}

	}

}