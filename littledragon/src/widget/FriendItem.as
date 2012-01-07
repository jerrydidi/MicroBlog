package widget
{
	import flash.display.MovieClip;
	import image.Image;
	import event.ImageLoadEvent;
	import flash.events.MouseEvent;
	import event.ImageSelectedEvent;

	public class FriendItem extends MovieClip {

		private var _friendData:Object;
		
		private var _friendImage:Image;
		//
		private var _bg:MovieClip = new MovieClip();		
		//
		private var _check:MovieClip = new imageCheck();
		//
		private var _loading:MovieClip = new loading();
		//
		private var _selected:Boolean =false;
		//
		public function FriendItem(_data:Object) {
			// constructor code
			this._friendData = _data;
			//
			_bg.graphics.lineStyle(1,0x990000);
			_bg.graphics.beginFill(0xFF9800,0);
			_bg.graphics.drawRect(-3,-3,88,88);
			_bg.graphics.endFill();
			this.addChild(_bg);
			//
			_friendImage = new Image(_data.avatar_large,83);
			this.addChild(_friendImage);
			_friendImage.addEventListener(ImageLoadEvent.IMAGE_LOAD_EVENT,picLoadComplete);

			_friendImage.loadImage();
			//
			addChild(_loading);
			_loading.x = 50 - _loading.width/2;
			_loading.y = 50 - _loading.height/2;
			//
			_check.x = 67;
			
			_check.y = 67;
			addChild(_check);
			_check.addEventListener(MouseEvent.CLICK ,checkClick);
			
		}
		private function checkClick(e:MouseEvent):void
		{

			dispatchEvent(new ImageSelectedEvent(ImageSelectedEvent.IMAGE_SELECTED_EVENT,true));
		}
		
		public function get friendData():Object
		{
			return _friendData;
		}
		public function picLoadComplete(e:ImageLoadEvent):void
		{
			removeChild(_loading);
			
			
		}
		
		public function set selected(value:Boolean):void
		{
			_selected = value;
			if(_selected)
			{
				_check.gotoAndStop(2);
			}
			else
			{
				_check.gotoAndStop(1);
				
			}
			
		}		
		public function get selected():Boolean
		{
			return _selected;
			
		}
				
	}
	
}
