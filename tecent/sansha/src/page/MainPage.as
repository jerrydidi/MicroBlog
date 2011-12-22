package page {
	
	import flash.display.MovieClip;
	import com.sina.microblog.MicroBlog;
	import com.sina.microblog.events.*;
	import flash.events.MouseEvent;
	import com.core.microBlogs.qq.QQWeiboAPI;
	import com.core.microBlogs.qq.api.friends.DoFriends;
	import com.core.microBlogs.qq.api.oauth.DoOauth;
	import com.core.microBlogs.qq.api.oauth.OauthKeyQQ;
	import com.core.microBlogs.standard.Oauth;	
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.events.TextEvent;
	import com.core.microBlogs.qq.api.oauth.*;
	import flash.events.Event;
	import com.util.OauthUrlUtil;	
	public class MainPage extends MovieClip {
		//micro blog reference
		private var _QQWeibo:QQWeiboAPI = new QQWeiboAPI(dataHandler, errorHandler);
		//friends array
		private var _friends:Array = new Array();
		//selected friends array
		private var _selectedFriends:Array = new Array();
		//profile
		private var _profile:Object;
		//
		private var _uid:String;
		//
		private var _childPage:MovieClip;	
		private var _format:String = "json";		
		//
		private var _txtAuto:TextField = new TextField();
		//
		public var resultNumber:int = Math.round(Math.random()*6)+1;

		var strOauth_token:String;			
		var strVerifier:String;			

		//public var resultNumber:int =6;
			
		//
		private var _currentPage:BaseSelectedPage;
		
		
		public function MainPage() {
			// constructor code
			page0.btnLogin.addEventListener(MouseEvent.CLICK,loginClickHandler);
			this.pop.visible = false;
			this.pop.btnClose.addEventListener(MouseEvent.CLICK,btnCloseClickHandler);
			this.pop.btnAuth.addEventListener(MouseEvent.CLICK,authClickHandler);
			


			
//			strOauth_token=stage.loaderInfo.parameters.oauth_token;			
//			strVerifier=stage.loaderInfo.parameters.oauth_verifier;			

			//if ge the token and verfigier then auth it directly
			//if(strOauth_token != null && strVerifier != null)
//			{
//
//				var key:OauthKeyQQ = new OauthKeyQQ();
//
//				key.customKey = "801081220";
//				key.customSecrect = "bd393829076def233f7f8f12a6b5e6f5";
//				//key.callbackUrl = OauthUrlUtil.executeString(null);
//			
//				Oauth.oauthingKey = key;
//			
//				//Oauth.oauthingKey.httpMethod = "GET";
//
//				Oauth.oauthingKey.tokenKey = "b77af24ddf364f3ba3dd8317a9cdbf84";
//				Oauth.oauthingKey.verify = "279923";
//				
//				Oauth.oauthingKey.tokenSecrect = "58611f3b59ea2ab08a5d19fe51ad5fa8";
//				//_QQWeibo.authRequestToken();
//				_QQWeibo.getAccessToken();
//				
//			}
			//else
//			{
				_QQWeibo.getRequestToken("801081220","bd393829076def233f7f8f12a6b5e6f5");
//				
//			}
			
		}

		
		private function loginClickHandler(e:MouseEvent):void
		{
			//page0.btnLogin.removeEventListener(MouseEvent.CLICK,loginClickHandler);
			this.pop.visible = true;
			_QQWeibo.authRequestToken();
			

		}
		
		private function btnCloseClickHandler(e:MouseEvent):void
		{
			this.pop.visible = false;
		}

		private function authClickHandler(event:MouseEvent):void
		{
			var verify:String = this.pop.txtAuth.text ;
			//remove the space char
			verify = verify.replace(/^\s*|\s*$/g,"").split(" ").join("");
			Oauth.oauthingKey.verify = verify;
			_QQWeibo.getAccessToken();
			this.pop.visible = false;
			


		}
		
		private function set QQWeibo(value:QQWeiboAPI):void
		{
			_QQWeibo = value;
		}
		
		private function get QQWeibo():QQWeiboAPI
		{
			return _QQWeibo;
		}
		
		public function set selectedFriends(value:Array):void
		{
			
			this._selectedFriends = value;
		}
		
		public function get selectedFriends():Array
		{
			
			return _selectedFriends;
		}
		
		public function set childPage(childPage:MovieClip):void
		{
			this._childPage = childPage;
		}
		
		public function get childPage():MovieClip
		{
			return _childPage;
		}
		

		public function set friends(value:Array):void
		{
			
			this._friends = value;
		}
		
		public function get friends():Array
		{
			return _friends;			
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
					
					_currentPage = new SelectedPageOne(this,1);
					break;
				case 2 :
					this.gotoAndStop(3);
					_currentPage = new SelectedPageTwo(this,2);
					break;
				case 3 :
					this.gotoAndStop(4);
					//_currentPage = new SelectedPageThree(this);
					break;
			}
		}
		//
		private function dataHandler(cmd:String, paras:Object):void{

			trace("cmd:"+cmd);
			switch(cmd)
			{
				case DoOauth.CMD_REQUEST_TOKEN:
				{

					//trace("paras.oauth_token:"+paras.oauth_token);
					//trace("paras.oauth_token_secret:"+paras.oauth_token_secret);
					//_QQWeibo.authRequestToken();

					break;
				}

				case DoOauth.CMD_ACCESS_TOKEN:
				{
					var mTokenKey:String = paras.oauth_token;
					var mTokenSecret:String = paras.oauth_token_secret;
					getFriends();						
					break;
				}

				case DoFriends.CMD_FRIENDS_IDOLLIST:
				{
					_friends = paras.data.info as Array;
					//trace("_friends:"+_friends.length);
					changePage(1);
					break;
				}

				default:
				{

					break;
				}
			}

		}

		private function errorHandler(params:Object):void
		{
			trace("http response error:", params.data);
		}
		
		//get friends
		public function getFriends():void
		{
			_QQWeibo.getIdolList(20, 1, _format);
		}
	}
	
}
