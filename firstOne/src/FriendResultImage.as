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
	public class FriendResultImage extends MovieClip
	{
		var _loader:Loader = new Loader();

		var _imageURL:String;

		var _friendData:Object;

		var _nickName:TextField = new TextField();

		public function FriendResultImage()
		{
			// constructor code
		}


		public function set imageURL(value:String):void
		{
			this._imageURL = value;
		}

		public function set friendData(value:Object):void
		{

			this._friendData = value;
			//this._imageURL = value.profile_image_url;
			this._imageURL = value.avatar_large;
			
		}

		public function loadImage():void
		{
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadImageComplete);
			_loader.x = -17;
			_loader.y = -17;
			this.addChild(_loader);
			_loader.load(new URLRequest(_imageURL));

		}


		private function loadImageComplete(e:Event):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadImageComplete);
			_loader.width = 98;
			_loader.height = 98;
			//
			var bitmap:Bitmap = _loader.content as Bitmap;
			bitmap.alpha = 0;
			bitmap.smoothing = true;
			TweenLite.to(bitmap, 0.5, {alpha:1, ease:Back.easeIn});

			
			_nickName.htmlText = Util.getBlogLinkString(_friendData.screen_name,_friendData.url);
			_nickName.x = 100;
			_nickName.y = -10;
			_nickName.width = 200;
			_nickName.height = 30;
			_nickName.wordWrap = true;
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0x0084D6;
			txtFormat.size = 18;
			_nickName.setTextFormat(txtFormat);
			this.addChild(_nickName);

		}

	}

}