package  widget {
	
	import flash.display.MovieClip;
	import image.Image;
	import flash.text.TextField;
	import flash.text.TextFormat;
	public class ResultItem extends MovieClip{
		//
		private var _resultImage:Image;
		//
		private var _friendData:Object;
		private var _userlink:String;
		private var _friendlink:String;
		//
		private var _imgPath:String;
	
		var _user:MovieClip = new Avatar4();
		var _friend:MovieClip = new Avatar4();
		private var _userImage:Image;
		private var _friendImage:Image;
		private var _ido:MovieClip = new ido();		
		private var _weibophoto = new weibophoto();
		

		public function ResultItem(_userurl:String,_friendurl:String) {
			
			// constructor code
			
			this._userlink = _userurl;
			this._friendlink = _friendurl;
			//trace("_userurl:"+_userurl);
			//trace("_friendurl:"+_friendurl);
			loadImage();
			

		}
		
		private function loadImage():void
		{
			this.addChild(_weibophoto);
			_weibophoto.x=0;
			_weibophoto.y=0;
			
			_userImage = new Image(_userlink,103,0.9555);
			_user.addChild(_userImage);
			_weibophoto.addChild(_user);
			_userImage.loadImage();		
			_user.x=20;
			_user.y=260;
			_user.rotation=-10;

			
			_friendImage = new Image(_friendlink,103,0.9555);
			_friend.addChild(_friendImage);
			_weibophoto.addChild(_friend);
			_friendImage.loadImage();
			_friend.x=130;
			_friend.y=250;
			_friend.rotation=10;			
			
			_weibophoto.addChild(_ido);
			_ido.x=70;
			_ido.y=290;		



			
		}

	}
	
}
