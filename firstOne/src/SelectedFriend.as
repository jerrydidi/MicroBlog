package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.text.TextFormat;

	public class SelectedFriend extends MovieClip
	{


		private var _friendObj:Object;

		private var _imageTxt:Image;
		private var _imagePic:Image;

		var friendResultImage:FriendResultImage;

		public function SelectedFriend(obj:Object)
		{
			// constructor code

			this._friendObj = obj;
			

			showInfo();

		}

		public function showInfo():void
		{
			//show image
			friendResultImage = new FriendResultImage();
			this.addChild(friendResultImage);
			friendResultImage.friendData = _friendObj;
			friendResultImage.loadImage();
			//show comment;
			_imageTxt = new Image(_friendObj.setNumber,2,_friendObj.picSeq)

			this.addChild(_imageTxt);
			_imageTxt.x = 100;
			_imageTxt.y = 45;
			_imageTxt.loadImage();
			//show comment;
			_imagePic = new Image(_friendObj.setNumber,0,_friendObj.picSeq)

			this.addChild(_imagePic);
			_imagePic.x = 450;
			_imagePic.y = -25;
			_imagePic.loadImage();


			


		}

	}

}