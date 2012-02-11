package widget 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	import flash.text.TextField;
	import flash.display.SimpleButton;
	import event.ImageSelectedEvent;
	import flash.events.Event;
	import event.NextPageEvent;

	public class FriendsPanel extends MovieClip
	{
		private var friendsArray:Array = new Array();
		public var selectedFriendsArray:Array = new Array();
		private var _friends:Array;
		private var _friendNum:int;
		
		private var _friendSelectedMaxNum:int = 3;
		private var _friendSelectedNum:int = 0;
		

		
		private var _selectedItem:FriendItem;
		private var panel:MovieClip= new MovieClip();
		//
		private var _up:MovieClip = new arrow();
	
		//
		private var _down:MovieClip = new arrow();
	
		//pic number per row
		private var _rowNum:int = 4;
		//pic number per row
		private var _lineNum:int = 2;
		//
		private var _pageNum:int = 0 ;
		
		//
		private var _pageSeq:int =0;

		//
		public var _seq:int = 0;
		//
		
		

		public function FriendsPanel()
		{
			// constructor code
			

		}
		
		public function init(friends:Array):void
		{
			//trace("friends:"+friends);
			this._friends = friends;
			this._friendNum = _friends.length;
			_up.buttonMode = true;
			_up.x = 615;
			_up.y = 166;
			_down.buttonMode = true;

			_down.x = 633;
			_down.y = 228; 
			_down.rotation = 180;
			this.addChild(_up);
			this.addChild(_down);
			
			_up.addEventListener(MouseEvent.CLICK,prevPage);
			_down.addEventListener(MouseEvent.CLICK,nextPage);
			listAllFriends();
			
		}


		
		private function prevPage(e:MouseEvent):void
		{
			if(_pageSeq >0)
			{
				var targetY:Number = panel.y + 120;
				TweenLite.to(panel, 0.2, {y:targetY});
				_pageSeq--;
			}

		}
		private function nextPage(e:MouseEvent):void
		{
			if(_pageSeq <(_pageNum - 1) )
			{

				var targetY:Number = panel.y - 120;
				TweenLite.to(panel, 0.2, {y:targetY});
				_pageSeq++;
			}

		}

		public function listAllFriends():void
		{
			panel.x = 374;
			panel.y = 133;
			this.addChild(panel);
			
			var mcMask:MovieClip = new MovieClip();
			mcMask.graphics.beginFill(0xFF9800,0.5);
			mcMask.graphics.drawRect(-10,0,250,120);
			mcMask.graphics.endFill()
			mcMask.x = 374;
			mcMask.y = 133;
			this.addChild(mcMask);
			
			panel.mask = mcMask;
			
			_friendNum = _friends.length;
			var perPageNum:int;
			perPageNum = _rowNum*_lineNum;
			_pageNum = Math.ceil(_friendNum/perPageNum);
			
			var row,line:int;

			for  (var i:int =0;i<_friendNum;i++)
			{
				var friendItem:FriendItem = new FriendItem(_friends[i]);

				row = i % _rowNum;
				line = Math.floor(i/_rowNum);

				friendItem.x = row * 60;

				friendItem.y = line * 60;

				panel.addChild(friendItem);
				friendItem.addEventListener(MouseEvent.CLICK,clickController,true);
				friendsArray.push(friendItem);

			}
		}
		//
		private function clickController(e:MouseEvent):void
		{
			var numSelected:int =0;
			var clickedItem:FriendItem;
			clickedItem = e.currentTarget as FriendItem;
			if(clickedItem.selected)
			{
				return;
			}
			else 
			{
				checkFriendsSeleced();
		
				if(_friendSelectedNum>=_friendSelectedMaxNum)
				{
				
					e.stopPropagation();
				}
			}
			
		}
		
		public function checkFriendsSeleced():void
		{
			
			selectedFriendsArray = new Array();
			_friendSelectedNum = 0;
			for each(var friendItem:FriendItem in friendsArray)
			{
				if(friendItem.selected)
				{
					_friendSelectedNum ++;
					selectedFriendsArray.push(friendItem);
				}
				
			}
			
		}


	}
}