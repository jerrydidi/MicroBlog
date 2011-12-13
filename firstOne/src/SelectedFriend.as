package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.text.TextFormat;

	public class SelectedFriend extends MovieClip
	{


		private var _friendObj:Object;

		private var _txtFrom:TextField = new TextField();
		private var _txtTo:TextField = new TextField();

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
			_txtFrom.x = 100;
			_txtFrom.y = 15;
			_txtFrom.width = 400;
			_txtFrom.height = 30;
			_txtFrom.wordWrap = true;
			_txtFrom.text = Comments.getCommentByID(_friendObj.commentID);
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0xFF9100;
			txtFormat.size = 28;
			_txtFrom.setTextFormat(txtFormat);
			//this.addChild(_txtFrom);
			//show comment;
			_txtTo.x = 100;
			_txtTo.y = 50;
			_txtTo.width = 400;
			_txtTo.height = 40;
			_txtTo.wordWrap = true;
			_txtTo.text = Comments.getCommentByID(_friendObj.commentID);
			
			_txtTo.setTextFormat(txtFormat);

			this.addChild(_txtTo);


		}

	}

}