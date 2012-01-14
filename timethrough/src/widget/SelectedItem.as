package widget
{
	import flash.display.MovieClip;
	import image.Image;
	import event.ImageLoadEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class SelectedItem extends MovieClip {

		private var _friendData:Object;
		
		private var _friendImage:Image;
		
		private var _size:int;
		
		private var _txtNickName:TextField = new TextField();


		//
		private var _loading:MovieClip = new loading();
		//

		//
		public function SelectedItem(_data:Object,size:int,boName:Boolean = true) {
			// constructor code
			this._friendData = _data;
			
			this._size = size;


			//
			_friendImage = new Image(_data.avatar_large,_size);
			this.addChild(_friendImage);
			_friendImage.addEventListener(ImageLoadEvent.IMAGE_LOAD_EVENT,picLoadComplete);

			//
			addChild(_loading);
			_loading.x = _size/2 - _loading.width/2;
			_loading.y = _size/2 - _loading.height/2;
			_friendImage.loadImage();

			//
			if(boName)
			{
				_txtNickName.text = _data.screen_name;
				addChild(_txtNickName);
				var txtFormat:TextFormat = new TextFormat();
				txtFormat.color = 0xFFFFFF;
				txtFormat.size = 12;
			
				_txtNickName.y = _size + 3;
				_txtNickName.setTextFormat(txtFormat);
			}

			
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
