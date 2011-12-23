package 
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


	public class Image extends MovieClip
	{
		var _loader:Loader = new Loader();

		var _imageURL:String;
		
		var _setNumber:int;
		var _picSeq:int;
		
		//image type 0:pic 1:result 2:txt
		var _imageType:int;


		
		private var _selected:Boolean = false;

		public function Image(setNumber:int,type:int,seq:int =0)
		{
			// constructor code

			this._setNumber = setNumber+1;
			this._imageType = type;
			this._picSeq = seq+1;
			createImageURL();
			
		}

		private function createImageURL():void
		{
			var prefix:String;
			switch(_imageType)
			{
				case 0:
					prefix = "images/pic";
					imageURL = prefix + _setNumber.toString() +"-"+ _picSeq.toString() + ".png";
					
					break;
				case 1:
					prefix = "images/Result";
					imageURL = prefix + _setNumber.toString() + ".png";

					break;
				case 2:
					prefix = "images/txt";
					imageURL = prefix + _setNumber.toString() +"-"+ _picSeq.toString() + ".png";

					break;
				
			}
			
			//imageURL = "images/txt1-1.png"
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

			this.dispatchEvent(new ImageLoadEvent(ImageLoadEvent.IMAGE_LOAD_EVENT,true));
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadImageComplete);
			
			//
			//var bitmap:Bitmap = _loader.content as Bitmap;
			_loader.alpha = 0;
			//bitmap.smoothing = true;
			TweenLite.to(_loader, 0.5, {alpha:1, ease:Back.easeIn});
			
			//bitmap.blendMode =  BlendMode.OVERLAY;

		}

	}

}