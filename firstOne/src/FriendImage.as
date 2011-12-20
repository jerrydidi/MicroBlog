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
	public class FriendImage extends MovieClip
	{
		var _loader:Loader = new Loader();

		var _imageURL:String;

		var _friendData:Object;

		var _nickName:TextField = new TextField();
		
		var _selectIcon:MovieClip;
		
		private var _selected:Boolean = false;

		public function FriendImage()
		{
			// constructor code
			_selectIcon = new selectIcon();
			_selectIcon.visible = false;
			_selectIcon.x = 45;
			_selectIcon.y = 45;
			
			this.addChild(_selectIcon);
		}
		
		public function set selected(value:Boolean):void
		{
			this._selected = value;
			_selectIcon.visible = value;

		}
		
		public function get selected():Boolean
		{
			return _selected;
		}


		public function set imageURL(value:String):void
		{
			this._imageURL = value;
		}

		public function set friendData(value:Object):void
		{

			this._friendData = value;
			this._imageURL = value.profile_image_url;
		}

		public function loadImage():void
		{
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadImageComplete);
			_loader.x = 6;
			_loader.y = 6;
			this.addChild(_loader);
			this.swapChildren(_loader,_selectIcon);
			_loader.load(new URLRequest(_imageURL));

		}


		private function loadImageComplete(e:Event):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadImageComplete);

			//
			//var bitmap:Bitmap = _loader.content as Bitmap;
			_loader.alpha = 0;
			//bitmap.smoothing = true;
			TweenLite.to(_loader, 0.5, {alpha:1, ease:Back.easeIn});

			_nickName.htmlText = Util.getBlogLinkString(_friendData.screen_name,_friendData.url);
			_nickName.y = 65;
			_nickName.width = 70;
			_nickName.height = 20;
			_nickName.wordWrap = true;
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0x0084D6;
			_nickName.setTextFormat(txtFormat);
			this.addChild(_nickName);
			
			//


		}

	}

}