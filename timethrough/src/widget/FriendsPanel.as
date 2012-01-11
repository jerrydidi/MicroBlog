package widget 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	import flash.text.TextField;
	import flash.display.SimpleButton;
	import event.ImageSelectedEvent;

	public class FriendsPanel extends MovieClip
	{
		var showFriends:Array = new Array();
		private var _friends:Array;
		private var _friendNum:int;
		
		private var _left:SimpleButton = new btnImage(); 
		private var _right:SimpleButton = new btnImage();
		
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
		

		public function FriendsPanel(friends:Array)
		{
			// constructor code
			

			this._friends = friends;
			this._friendNum = _friends.length;
			
			_left.x = -120;
			_left.y = 168;
	

			_right.x = 130;
			_right.y = 193;
			_right.rotation = 180;
			addChild(_left);
			addChild(_right);
			_left.addEventListener(MouseEvent.CLICK,prevPage);
			_right.addEventListener(MouseEvent.CLICK,nextPage);
			listAllFriends();
		}
		
		private function prevPage(e:MouseEvent):void
		{
			if(_pageSeq >0)
			{
				var targetX:Number = panel.x + 424;
				TweenLite.to(panel, 0.2, {x:targetX});
				_pageSeq--;
			}

		}
		private function nextPage(e:MouseEvent):void
		{
			if(_pageSeq <(_pageNum - 1) )
			{

				var targetX:Number = panel.x - 424;
				TweenLite.to(panel, 0.2, {x:targetX});
				_pageSeq++;
			}

		}

		public function listAllFriends():void
		{
			panel.x = -202;
			panel.y = -36;
			this.addChild(panel);
			
			var mcMask:MovieClip = new MovieClip();
			mcMask.graphics.beginFill(0xFF9800,0.5);
			mcMask.graphics.drawRect(0,0,420,220);
			mcMask.graphics.endFill()
			mcMask.x = -210;
			mcMask.y = -48;
			this.addChild(mcMask);
			
			panel.mask = mcMask;
			
			_friendNum = _friends.length;
			var perPageNum:int;
			perPageNum = _rowNum*_lineNum;
			_pageNum = Math.ceil(_friendNum/perPageNum);
			var row,line,pageIdx,pageSeq:int;

			for  (var i:int =0;i<_friendNum;i++)
			{

				//trace(":" +_friends[i].profile_image_url +"::" + i.toString());
				var friendItem:FriendItem = new FriendItem(_friends[i]);
				pageIdx = Math.floor(i / perPageNum);
				pageSeq = i % perPageNum;
				row = pageSeq % _rowNum;
				line = Math.floor(pageSeq/_rowNum);
				//trace("row:"+row);
				//trace("line:"+line);
				//trace("pageSeq:"+pageSeq);
				//trace("pageIdx:"+pageIdx);
				friendItem.x = row * 106 + 106*_rowNum*pageIdx;
				friendItem.y = line * 100;

				panel.addChild(friendItem);
				if(i ==0)
				{
					
					_selectedItem = friendItem;
					_selectedItem.selected = true;
					
				}
				

			}
			panel.addEventListener(ImageSelectedEvent.IMAGE_SELECTED_EVENT,imageSelected)
		}
		//
		private function imageSelected(e:ImageSelectedEvent):void
		{
			var imageSelected:FriendItem;
			imageSelected = e.target as FriendItem;
			_selectedItem.selected = false;
			_selectedItem = imageSelected;
			_selectedItem.selected = true;
			
		}
		///
		public function get selectedItem():FriendItem
		{
			return this._selectedItem;
			
		}
		
	}
}