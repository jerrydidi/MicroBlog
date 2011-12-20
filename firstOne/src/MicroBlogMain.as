package 
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
		
		//set number,1,2,3,4
		private var _setNumber:int = Math.round(Math.random()*4);
		//private var _setNumber:int =0;

		public function MicroBlogMain()
		{
			// constructor code

			page1.btnLogin.addEventListener(MouseEvent.CLICK,blogClickHandler);
		}

		public function get setNumber():int
		{
			return _setNumber;
			
			
			
		}
		
		public function set setNumber(value:int):void
		{
			
			this._setNumber = value;
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
			_mb.consumerKey = "3697302915";
			_mb.consumerSecret = "1dc7e2abe67da2c3d8cf7f836de88d8c";
			_mb.proxyURI = "http://2.yinongdai.sinaapp.com/proxy.php";
			_mb.addEventListener(MicroBlogEvent.LOGIN_RESULT, onLoginResult);
			_mb.login();
			//_mb.login("wegood0001@sina.com","sina0002W");
		}
		private function onLoginResult(e:MicroBlogEvent):void
		{
			_mb.removeEventListener(MicroBlogEvent.LOGIN_RESULT, onLoginResult);
			changePage(1);
		}
	}

}