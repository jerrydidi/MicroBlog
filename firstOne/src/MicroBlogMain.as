﻿package 
{
	import flash.text.TextField;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.sina.microblog.MicroBlog;
	import com.sina.microblog.events.MicroBlogEvent;

	public class MicroBlogMain extends MovieClip
	{

		//micro blog reference
		private var _mb:MicroBlog = new MicroBlog();

		//uid 
		public var _uid:String;
		//current page
		public var _currentPage:MovieClip;

		//selected friends array
		public var _selectedFriends:Array = new Array();
		
		//profile myself
		public var _profile:Object;
		//friends array
		private var _friends:Array = new Array();;

		//selected comment
		private var _comments:Array = new Array();

		public function MicroBlogMain()
		{
			// constructor code

			page1.btnLogin.addEventListener(MouseEvent.CLICK,blogClickHandler);
		}

		public function set friends(value:Array):void
		{
			
			this._friends = value;
		}
		
		public function get friends():Array
		{
			return _friends;			
		}
		
		
		public function set mb(value:MicroBlog):void
		{
			this._mb = value;

		}


		public function get mb():MicroBlog
		{
			return _mb;

		}

		public function get comments():Array
		{
			return _comments;
		}


		public function set comments(value:Array):void
		{

			this._comments = value;
		}

		public function changePage(pageIdx:int):void
		{
			switch (pageIdx)
			{

				case 0 :
					this.gotoAndStop(1);
					break;
				case 1 :
					this.gotoAndStop(2);
					var selectPage:SelectPage = new SelectPage(this);
					break;
				case 2 :
					this.gotoAndStop(3);
					var resultPage:ResultPage = new ResultPage(this);
					break;
				case 3 :
					this.gotoAndStop(4);
					var distributePage:DistributePage = new DistributePage(this);
					break;
			}
		}

		//
		private function blogClickHandler(e:MouseEvent):void
		{
			blogRegiter();

		}
		//blog register
		private function blogRegiter():void
		{
			_mb.consumerKey = "4027475663";
			_mb.consumerSecret = "8e57a27c1f33dad08ef5d3635d6f7d4c";
			_mb.addEventListener(MicroBlogEvent.LOGIN_RESULT, onLoginResult);
			_mb.login();
		}
		private function onLoginResult(e:MicroBlogEvent):void
		{
			_mb.removeEventListener(MicroBlogEvent.LOGIN_RESULT, onLoginResult);
			changePage(1);
		}
	}

}