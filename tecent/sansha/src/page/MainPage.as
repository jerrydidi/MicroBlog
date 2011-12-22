﻿package page {
	
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
			//page0.addEventListener(Event.ENTER_FRAME,enterPage);
			

			_txtAuto.text = "auth verfier here";
			_txtAuto.type =  TextFieldType.INPUT; 
			page0.mcAuth.addEventListener(MouseEvent.CLICK,authClickHandler);
			page0.addChild(_txtAuto);
			_QQWeibo.getRequestToken("801081220","bd393829076def233f7f8f12a6b5e6f5");
			
		}
		
		private function enterPage(e:Event):void
		{
					page0.removeEventListener(Event.ENTER_FRAME,enterPage);


					strOauth_token=stage.loaderInfo.parameters.oauth_token;			
					strVerifier=stage.loaderInfo.parameters.oauth_verifier;			

					//if ge the token and verfigier then auth it directly
					if(strOauth_token != null && strVerifier != null)
					{
				
						var key:OauthKeyQQ = new OauthKeyQQ();
						key.customKey = "801081220";
						key.customSecrect = "bd393829076def233f7f8f12a6b5e6f5";
						Oauth.oauthingKey = key;

						Oauth.oauthingKey.verify = strVerifier;
						Oauth.oauthingKey.tokenKey =strOauth_token;
						//Oauth.oauthingKey.tokenSecrect = "98b3d9dfeef535c59b80f4670dc0786a";
						_QQWeibo.getAccessToken();
									

					}
					else
					{
						_QQWeibo.getRequestToken("801081220","bd393829076def233f7f8f12a6b5e6f5","http://www.riasun.com/microblog/qq/index.swf");
					}

						
				
			
		}
		private function authClickHandler(event:MouseEvent):void
		{
			var verify:String = _txtAuto.text ;
			Oauth.oauthingKey.verify = verify;
			_QQWeibo.getAccessToken();


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

					_QQWeibo.authRequestToken();

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
		
		private function loginClickHandler(e:MouseEvent):void
		{
			page0.btnLogin.removeEventListener(MouseEvent.CLICK,loginClickHandler);

			//blogRegiter();

		}
		//get friends
		public function getFriends():void
		{
			_QQWeibo.getIdolList(20, 1, _format);
		}
	}
	
}