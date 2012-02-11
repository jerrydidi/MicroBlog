package widget
{
	import flash.display.MovieClip;
	import image.Image;
	import event.ImageLoadEvent;
	import flash.events.MouseEvent;

	public class FriendItem extends MovieClip {

		 var _friendData:Object;
		
		private var _friendImage:Image;
		//
		private var _icon:MovieClip = new butterFly();


		//
		private var _loading:MovieClip = new loading();
		//
		private var _selected:Boolean = false;
		//
		public function FriendItem(_data:Object) {
			// constructor code
			this._friendData = _data;

			_friendImage = new Image(_data.avatar_large,57);
			this.addChild(_friendImage);
			_friendImage.addEventListener(ImageLoadEvent.IMAGE_LOAD_EVENT,picLoadComplete);
			this.addEventListener(MouseEvent.CLICK,selectedClick);

			_friendImage.loadImage();
			//
			addChild(_loading);
			_loading.x = 30 - _loading.width/2;
			_loading.y = 30 - _loading.height/2;

			this.addChild(_icon);
			_icon.visible = false;
			//
			
		}
		
		public function get friendData():Object
		{
			return _friendData;
		}
		
		private function selectedClick(e:MouseEvent):void
		{
			selected = !selected;
		}
		
		public function set selected(value:Boolean):void
		{
			this._selected = value;
			_icon.visible = _selected;
			
		}
		
		public function get selected():Boolean
		{
			return _selected;
		}

		

		public function picLoadComplete(e:ImageLoadEvent):void
		{
			removeChild(_loading);
			_friendImage.removeEventListener(ImageLoadEvent.IMAGE_LOAD_EVENT,picLoadComplete);

			
		}

				
	}
	
}
