
package widget
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import image.Image;
	import flash.text.TextFormat;
	import event.ImageLoadEvent;

	public class FriendSelectedItem extends MovieClip {

		private var _friendData:Object;
		
		private var _friendImage:Image;
		//
		private var _bg:MovieClip = new MovieClip();
		//
		private var _txtName:TextField = new TextField();
		//
		private var _loading:MovieClip = new loading();
		
		public function FriendSelectedItem(_data:Object) {
			// constructor code
			this._friendData = _data;
			//
			_bg.graphics.lineStyle(1,0x333333);
			
			_bg.graphics.beginFill(0xFF9800,0);
			_bg.graphics.drawRect(-3,-3,185,185);
			_bg.graphics.endFill();
			this.addChild(_bg);
			

			//
			_friendImage = new Image(_data.avatar_large);
			this.addChild(_friendImage);
			_friendImage.addEventListener(ImageLoadEvent.IMAGE_LOAD_EVENT,picLoadComplete);
			_friendImage.loadImage();
			//
			_txtName.text = "@" + _data.screen_name;
			_txtName.width = 200;
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0x0084D6;
			txtFormat.size = 18;
			_txtName.setTextFormat(txtFormat);
			_txtName.y = 190;
			this.addChild(_txtName);
			//
			addChild(_loading);
			_loading.x = 90 - _loading.width/2;
			_loading.y = 90 - _loading.height/2;
			
			
			
		}
		
		public function picLoadComplete(e:ImageLoadEvent):void
		{
			removeChild(_loading);
			
			
		}
		
		public function get friendData():Object
		{
			return _friendData;
		}
	}
	
}
