
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
		private var _loading:MovieClip = new loading();
		public function FriendSelectedItem(_data:Object) {
			// constructor code
			this._friendData = _data;
			//
			_bg.graphics.lineStyle(1,0x333333);
			
			_bg.graphics.beginFill(0xFF9800,0);
			_bg.graphics.drawRect(-3,-3,185,185);
			_bg.graphics.endFill();
			//this.addChild(_bg);
			

			//
			_friendImage = new Image(_data.avatar_large,140,0.5);
			
			_friendImage.addEventListener(ImageLoadEvent.IMAGE_LOAD_EVENT,picLoadComplete);
			this.addChild(_friendImage);
			_friendImage.loadImage();
			addChild(_loading);
			_loading.x = (140 - _loading.width)/2;
			_loading.y = (140 - _loading.height)/2;			
			
			//
			_txtName.text = "@" + _data.screen_name;
			_txtName.width = 300;
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0xFF0000;
			txtFormat.bold = true;
			txtFormat.size = 18;
			_txtName.setTextFormat(txtFormat);
			_txtName.x = -35;
			_txtName.y = -170;
			this.addChild(_txtName);
			
		}
		
		public function get friendData():Object
		{
			return _friendData;
		}
		public function picLoadComplete(e:ImageLoadEvent):void
		{
			removeChild(_loading);
			
			
		}
	}
	
}
