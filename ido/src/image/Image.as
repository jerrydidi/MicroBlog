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
	import event.DragCompleteEvent;
	import event.ImageLoadEvent;
	import flash.events.IOErrorEvent;
	import flash.system.LoaderContext;


	public class Image extends MovieClip
	{
		var _loader:Loader = new Loader();

		var _imageURL:String;
		
		var _picSeq:int;
		
		var _scale:Number;
		
		var _size:int;
		private var _selected:Boolean = false;
		var _loading:MovieClip = new loading();
		public function Image(imageURL:String,size:int,scale:Number =1)
		{
			// constructor code
			this._imageURL = imageURL;
			this._scale = scale;
			this._size=size;
		}

		public function set imageURL(value:String):void
		{
			this._imageURL = value;
		}

		public function loadImage():void
		{
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadImageComplete);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadImageIOError);
			_loader.x = 0;
			_loader.y = 0;
			this.addChild(_loader);
			var loaderContext:LoaderContext = new LoaderContext();
			loaderContext.checkPolicyFile = true;
			_loader.load(new URLRequest(_imageURL),loaderContext);
			//this.addChild(_loading);
			//_loading.x = (_size-_loading.width)/2
			//_loading.y = (_size-_loading.height)/2			

		}


		private function loadImageIOError(e:IOErrorEvent):void
		{
			trace("load pic io error");		
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
			

			this.width=_size;
			this.height=_size;
			trace("****Image*******1****",this.width,this.height);
			
			_loader.alpha = 0;
			//this.removeChild(_loading);

			this.dispatchEvent(new ImageLoadEvent(ImageLoadEvent.IMAGE_LOAD_EVENT,true));
			//bitmap.alpha = 0;
			//bitmap.smoothing = true;
			TweenLite.to(_loader, 0.5, {alpha:1, ease:Back.easeIn});


		}

	}

}