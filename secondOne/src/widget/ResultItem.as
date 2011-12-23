package  widget {
	
	import flash.display.MovieClip;
	import image.Image;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.Event;
	import event.DragCompleteEvent;

	public class ResultItem extends MovieClip{
		//
		private var _resultImage:Image;
		//
		private var _friendData:Object;
		//
		private var _imgPath:String;
		//ramdom seq
		private var _seq:int; 
		//
		private var _txtFriend:TextField = new TextField();
		//
		private var _txtXPos:Number = 80;
		private var _txtYPos:Number = 15;
		

		public function ResultItem(_seq:int,_data:Object) {
			
			// constructor code
			this._friendData = _data;
			this._seq = _seq;
			loadImage();
			

		}
		
		private function loadImage():void
		{
			
			switch(_seq)
			{
				case 1:
					_txtXPos = 80;
					_txtYPos = 75;
					break;
				case 2:
					_txtXPos = 80;
					_txtYPos = 15;
					break;
				case 3:
					_txtXPos = 140;
					_txtYPos = 25;
					break;
				case 4:
					_txtXPos = 80;
					_txtYPos = 300;
					break;
				case 5:
					_txtXPos = 80;
					_txtYPos = 11;
					break;
					
				case 6:
					_txtXPos = 80;
					_txtYPos = 22;
					break;
					
				
			}
			
			
			_imgPath = "images/pic0" + _seq.toString() + ".jpg";
			_resultImage = new Image(_imgPath);
			this.addChild(_resultImage);
			//_resultImage.addEventListener(Event.COMPLETE,loadComplete);
			_resultImage.loadImage();
			
			
			//
			this.addChild(_txtFriend);
			_txtFriend.width = 200;
			_txtFriend.text = "@" + _friendData.screen_name;
			_txtFriend.x = _txtXPos;
			_txtFriend.y = _txtYPos;
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0xCC0000;
			_txtFriend.setTextFormat(txtFormat);
			
			
		}
		
		private function loadComplete(e:Event):void
		{

			//this.dispatchEvent(new DragCompleteEvent(DragCompleteEvent.DRAG_COMPLETE_EVENT));
		}

	}
	
}
