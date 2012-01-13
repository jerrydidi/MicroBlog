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
		var showFriends:Array = new Array();
		private var _friends:Array;
		private var _friendNum:int;
		
		//private var _left:SimpleButton ; 
		//private var _right:SimpleButton ;
		
		private var _selectedItem:FriendItem;
		private var panel:MovieClip= new MovieClip();
	
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
		

		public function FriendsPanel()
		{
			// constructor code
			

		}
		
		public function init(friends:Array):void
		{
			//trace("friends:"+friends);
			this._friends = friends;
			this._friendNum = _friends.length;
			this.addEventListener(Event.ENTER_FRAME,enterPage)
			
			
			
		}
		private function enterPage(e:Event):void
		{
			
			if(this.btnToPageThree)
			{
				this.removeEventListener(Event.ENTER_FRAME,enterPage)
				_left.addEventListener(MouseEvent.CLICK,prevPage);
				_right.addEventListener(MouseEvent.CLICK,nextPage);
				btnToPageThree.addEventListener(MouseEvent.CLICK,toPageThree);
				listAllFriends();

			}
			else
			{
				//trace("no left");
			}
		}
		private function toPageThree(e:MouseEvent):void
		{
			this.dispatchEvent(new NextPageEvent(NextPageEvent.NEXT_PAGE_EVENT));
		}
		
		private function prevPage(e:MouseEvent):void
		{
			if(_pageSeq >0)
			{
				var targetX:Number = panel.x + 400;
				TweenLite.to(panel, 0.2, {x:targetX});
				_pageSeq--;
			}

		}
		private function nextPage(e:MouseEvent):void
		{
			if(_pageSeq <(_pageNum - 1) )
			{

				var targetX:Number = panel.x - 400;
				TweenLite.to(panel, 0.2, {x:targetX});
				_pageSeq++;
			}

		}

		public function listAllFriends():void
		{
			panel.x = 180;
			panel.y = 197;
			this.addChild(panel);
			
			var mcMask:MovieClip = new MovieClip();
			mcMask.graphics.beginFill(0xFF9800,0.5);
			mcMask.graphics.drawRect(-10,0,400,105);
			mcMask.graphics.endFill()
			mcMask.graphics.beginFill(0xFF9800,0.5);
			mcMask.graphics.drawRect(10,100,400,105);
			mcMask.graphics.endFill()
			mcMask.x = 175;
			mcMask.y = 190;
			this.addChild(mcMask);
			
			panel.mask = mcMask;
			
			_friendNum = _friends.length;
			var perPageNum:int;
			perPageNum = _rowNum*_lineNum;
			_pageNum = Math.ceil(_friendNum/perPageNum);
			var row,line,pageIdx,pageSeq:int;

			for  (var i:int =0;i<_friendNum;i++)
			{
				var friendItem:FriendItem = new FriendItem(_friends[i]);
				pageIdx = Math.floor(i / perPageNum);
				pageSeq = i % perPageNum;
				row = pageSeq % _rowNum;
				line = Math.floor(pageSeq/_rowNum);
				if(line == 0)
				{
					friendItem.x = row * 100 + 100*_rowNum*pageIdx - 10;
				}
				else if(line == 1)
				{
					friendItem.x = row * 100 + 100*_rowNum*pageIdx + 10;
					
					
				}
				friendItem.y = line * 100;

				panel.addChild(friendItem);

			}
		}
		//

		///
		public function get selectedItem():FriendItem
		{
			return this._selectedItem;
			
		}
	}
}